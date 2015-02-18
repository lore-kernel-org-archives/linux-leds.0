From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH] leds: Introduce devres helper for led_classdev_register
Date: Tue, 17 Feb 2015 18:14:05 -0800
Message-ID: <1424225645-13996-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([212.209.106.2]:18107 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751511AbbBRCOB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Tue, 17 Feb 2015 21:14:01 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 drivers/leds/led-class.c | 28 ++++++++++++++++++++++++++++
 include/linux/leds.h     |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index dbeebac..7233f30 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -285,6 +285,34 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_classdev_unregister);
 
+static void devm_led_classdev_release(struct device *dev, void *res)
+{
+	led_classdev_unregister(*(struct led_classdev **)res);
+}
+
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
 static int __init leds_init(void)
 {
 	leds_class = class_create(THIS_MODULE, "leds");
diff --git a/include/linux/leds.h b/include/linux/leds.h
index cfceef3..9ed7dec 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -102,6 +102,8 @@ struct led_classdev {
 
 extern int led_classdev_register(struct device *parent,
 				 struct led_classdev *led_cdev);
+extern int devm_led_classdev_register(struct device *parent,
+				      struct led_classdev *led_cdev);
 extern void led_classdev_unregister(struct led_classdev *led_cdev);
 extern void led_classdev_suspend(struct led_classdev *led_cdev);
 extern void led_classdev_resume(struct led_classdev *led_cdev);
-- 
1.9.1
