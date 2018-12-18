From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 5/5] leds: trigger: timer: Add initialization from Device Tree
Date: Tue, 18 Dec 2018 16:27:32 +0100
Message-ID: <1545146852-32207-6-git-send-email-krzk@kernel.org>
References: <1545146852-32207-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545146852-32207-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Raphael Teysseyre <rteysseyre@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Allow initialization of delays used in timer trigger from Device
Tree property.

This is especially useful for embedded systems where the trigger might
be used early, before bringing up user-space.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/trigger/ledtrig-timer.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index 7c14983781ee..3c253241cfa6 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -15,6 +15,7 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/ctype.h>
+#include <linux/slab.h>
 #include <linux/leds.h>
 
 static ssize_t led_delay_on_show(struct device *dev,
@@ -77,8 +78,41 @@ static struct attribute *timer_trig_attrs[] = {
 };
 ATTRIBUTE_GROUPS(timer_trig);
 
+static void pattern_init(struct led_classdev *led_cdev)
+{
+	u32 *pattern;
+	unsigned int size = 0;
+
+	pattern = led_classdev_get_default_pattern(led_cdev, &size);
+	if (!pattern)
+		return;
+
+	if (size != 2) {
+		dev_warn(led_cdev->dev,
+			 "Expected 2 but got %u values for delays pattern\n",
+			 size);
+		goto out;
+	}
+
+	led_cdev->blink_delay_on = pattern[0];
+	led_cdev->blink_delay_off = pattern[1];
+	/* led_blink_set() called by caller */
+
+out:
+	kfree(pattern);
+}
+
 static int timer_trig_activate(struct led_classdev *led_cdev)
 {
+	if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER) {
+		pattern_init(led_cdev);
+		/*
+		 * Mark as initialized even on pattern_init() error because
+		 * any consecutive call to it would produce the same error.
+		 */
+		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
+	}
+
 	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
 		      &led_cdev->blink_delay_off);
 
-- 
2.7.4
