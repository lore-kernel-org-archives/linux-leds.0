From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v2] leds: Introduce devres helper for led_classdev_register
Date: Mon, 23 Feb 2015 16:11:41 -0800
Message-ID: <1424736701-3496-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-doc@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-leds@vger.kernel.org

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
Changes since v1:
- updating devres.txt
- unregister function

 Documentation/driver-model/devres.txt |  3 ++
 drivers/leds/led-class.c              | 57 +++++++++++++++++++++++++++++++++++
 include/linux/leds.h                  |  4 +++
 3 files changed, 64 insertions(+)

diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
index b5ab416..2ae041c 100644
--- a/Documentation/driver-model/devres.txt
+++ b/Documentation/driver-model/devres.txt
@@ -287,6 +287,9 @@ IRQ
   devm_request_irq()
   devm_request_threaded_irq()
 
+LED
+  devm_led_classdev_register()
+
 MDIO
   devm_mdiobus_alloc()
   devm_mdiobus_alloc_size()
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index dbeebac..d467969 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -285,6 +285,63 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_classdev_unregister);
 
+static void devm_led_classdev_release(struct device *dev, void *res)
+{
+	led_classdev_unregister(*(struct led_classdev **)res);
+}
+
+/**
+ * devm_led_classdev_register - resource managed led_classdev_register()
+ * @parent: The device to register.
+ * @led_cdev: the led_classdev structure for this device.
+ */
+int devm_led_classdev_register(struct device *parent,
+			       struct led_classdev *led_cdev)
+{
+	struct led_classdev **dr;
+	int rc;
+
+	dr = devres_alloc(devm_led_classdev_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	rc = led_classdev_register(parent, led_cdev);
+	if (rc) {
+		devres_free(dr);
+		return rc;
+	}
+
+	*dr = led_cdev;
+	devres_add(parent, dr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_led_classdev_register);
+
+static int devm_led_classdev_match(struct device *dev, void *res, void *data)
+{
+	struct led_cdev **p = res;
+
+	if (WARN_ON(!p || !*p))
+		return 0;
+
+	return *p == data;
+}
+
+/**
+ * devm_led_classdev_unregister() - resource managed led_classdev_unregister()
+ * @parent: The device to unregister.
+ * @led_cdev: the led_classdev structure for this device.
+ */
+void devm_led_classdev_unregister(struct device *dev,
+				  struct led_classdev *led_cdev)
+{
+	WARN_ON(devres_release(dev,
+			       devm_led_classdev_release,
+			       devm_led_classdev_match, led_cdev));
+}
+EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
+
 static int __init leds_init(void)
 {
 	leds_class = class_create(THIS_MODULE, "leds");
diff --git a/include/linux/leds.h b/include/linux/leds.h
index cfceef3..6fae676 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -102,7 +102,11 @@ struct led_classdev {
 
 extern int led_classdev_register(struct device *parent,
 				 struct led_classdev *led_cdev);
+extern int devm_led_classdev_register(struct device *parent,
+				      struct led_classdev *led_cdev);
 extern void led_classdev_unregister(struct led_classdev *led_cdev);
+extern void devm_led_classdev_unregister(struct device *parent,
+					 struct led_classdev *led_cdev);
 extern void led_classdev_suspend(struct led_classdev *led_cdev);
 extern void led_classdev_resume(struct led_classdev *led_cdev);
 
-- 
1.9.1
