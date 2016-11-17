From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v5 3/6] leds: triggers: Add support for read-only triggers
Date: Thu, 17 Nov 2016 23:24:38 +0100
Message-ID: <20161117222441.31464-3-hdegoede@redhat.com>
References: <20161117222441.31464-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60098 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752190AbcKQWYu (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Nov 2016 17:24:50 -0500
In-Reply-To: <20161117222441.31464-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

In some cases an LED is controlled through a hardwired (taken care of
in firmware outside of the kernels control) trigger.

Add an LED_TRIGGER_READ_ONLY flag for this and disallow user-space
changing the trigger when this flag is set.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v5:
-This is a new patch in v5 of this patch-set
---
 drivers/leds/led-class.c    | 2 +-
 drivers/leds/led-triggers.c | 5 +++++
 include/linux/leds.h        | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 326ee6e..56f32cc 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -54,7 +54,7 @@ static ssize_t brightness_store(struct device *dev,
 	if (ret)
 		goto unlock;
 
-	if (state == LED_OFF)
+	if (state == LED_OFF && !(led_cdev->flags & LED_TRIGGER_READ_ONLY))
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index d2ed9c2..9669104 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -37,6 +37,11 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 	struct led_trigger *trig;
 	int ret = count;
 
+	if (led_cdev->flags & LED_TRIGGER_READ_ONLY) {
+		dev_err(led_cdev->dev, "Error this led triggers is hardwired and cannot be changed\n");
+		return -EINVAL;
+	}
+
 	mutex_lock(&led_cdev->led_access);
 
 	if (led_sysfs_is_disabled(led_cdev)) {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 870b8c2..e076b74 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -47,6 +47,7 @@ struct led_classdev {
 #define LED_DEV_CAP_FLASH	(1 << 18)
 #define LED_HW_PLUGGABLE	(1 << 19)
 #define LED_PANIC_INDICATOR	(1 << 20)
+#define LED_TRIGGER_READ_ONLY   (1 << 21)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
-- 
2.9.3
