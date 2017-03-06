From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2 1/2] leds: core: add OF variants of LED registering functions
Date: Mon,  6 Mar 2017 06:19:44 +0100
Message-ID: <20170306051945.14857-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36287 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752844AbdCFFT5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Mar 2017 00:19:57 -0500
Received: by mail-lf0-f67.google.com with SMTP id g70so10995192lfh.3
        for <linux-leds@vger.kernel.org>; Sun, 05 Mar 2017 21:19:55 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

These new functions allow passing an additional device_node argument
that will be internally set for created LED device. Thanks to this LED
core code and triggers will be able to access DT node for reading extra
info.

The easiest solution for achieving this was reworking old functions to
more generic ones & adding simple defines for API compatibility.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Use new functions instead of adding property to the struct led_classdev.
---
 drivers/leds/led-class.c | 26 ++++++++++++++++----------
 include/linux/leds.h     | 14 ++++++++++----
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 95d971aa2440..349d334d2e98 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -182,11 +182,14 @@ static int led_classdev_next_name(const char *init_name, char *name,
 }
 
 /**
- * led_classdev_register - register a new object of led_classdev class.
- * @parent: The device to register.
+ * of_led_classdev_register - register a new object of led_classdev class.
+ *
+ * @parent: parent of LED device
  * @led_cdev: the led_classdev structure for this device.
+ * @np: DT node describing this LED
  */
-int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
+int of_led_classdev_register(struct device *parent, struct device_node *np,
+			    struct led_classdev *led_cdev)
 {
 	char name[LED_MAX_NAME_SIZE];
 	int ret;
@@ -199,6 +202,7 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 				led_cdev, led_cdev->groups, "%s", name);
 	if (IS_ERR(led_cdev->dev))
 		return PTR_ERR(led_cdev->dev);
+	led_cdev->dev->of_node = np;
 
 	if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
@@ -234,7 +238,7 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(led_classdev_register);
+EXPORT_SYMBOL_GPL(of_led_classdev_register);
 
 /**
  * led_classdev_unregister - unregisters a object of led_properties class.
@@ -276,12 +280,14 @@ static void devm_led_classdev_release(struct device *dev, void *res)
 }
 
 /**
- * devm_led_classdev_register - resource managed led_classdev_register()
- * @parent: The device to register.
+ * devm_of_led_classdev_register - resource managed led_classdev_register()
+ *
+ * @parent: parent of LED device
  * @led_cdev: the led_classdev structure for this device.
  */
-int devm_led_classdev_register(struct device *parent,
-			       struct led_classdev *led_cdev)
+int devm_of_led_classdev_register(struct device *parent,
+				  struct device_node *np,
+				  struct led_classdev *led_cdev)
 {
 	struct led_classdev **dr;
 	int rc;
@@ -290,7 +296,7 @@ int devm_led_classdev_register(struct device *parent,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = led_classdev_register(parent, led_cdev);
+	rc = of_led_classdev_register(parent, np, led_cdev);
 	if (rc) {
 		devres_free(dr);
 		return rc;
@@ -301,7 +307,7 @@ int devm_led_classdev_register(struct device *parent,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(devm_led_classdev_register);
+EXPORT_SYMBOL_GPL(devm_of_led_classdev_register);
 
 static int devm_led_classdev_match(struct device *dev, void *res, void *data)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 0518903778b6..00dcb9f8293b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -114,10 +114,16 @@ struct led_classdev {
 	struct mutex		led_access;
 };
 
-extern int led_classdev_register(struct device *parent,
-				 struct led_classdev *led_cdev);
-extern int devm_led_classdev_register(struct device *parent,
-				      struct led_classdev *led_cdev);
+extern int of_led_classdev_register(struct device *parent,
+				    struct device_node *np,
+				    struct led_classdev *led_cdev);
+#define led_classdev_register(parent, led_cdev)				\
+	of_led_classdev_register(parent, NULL, led_cdev)
+extern int devm_of_led_classdev_register(struct device *parent,
+					 struct device_node *np,
+					 struct led_classdev *led_cdev);
+#define devm_led_classdev_register(parent, led_cdev)			\
+	devm_of_led_classdev_register(parent, NULL, led_cdev)
 extern void led_classdev_unregister(struct led_classdev *led_cdev);
 extern void devm_led_classdev_unregister(struct device *parent,
 					 struct led_classdev *led_cdev);
-- 
2.11.0
