From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 5/5] leds: trigger: timer: Add initialization from Device Tree
Date: Wed, 12 Dec 2018 12:16:46 +0100
Message-ID: <1544613406-27026-6-git-send-email-krzk@kernel.org>
References: <1544613406-27026-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544613406-27026-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Allow initialization of delays used in timer trigger from Device
Tree property.

This is especially useful for embedded systems where the trigger might
be used early, before bringing up user-space.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---

New patch in the series
---
 drivers/leds/trigger/ledtrig-timer.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index 7c14983781ee..85a4b9fc3de0 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -77,8 +77,36 @@ static struct attribute *timer_trig_attrs[] = {
 };
 ATTRIBUTE_GROUPS(timer_trig);
 
+static void pattern_init(struct led_classdev *led_cdev)
+{
+	const char *pattern;
+	unsigned long delay_on, delay_off;
+
+	pattern = led_classdev_get_default_pattern(led_cdev);
+	if (!pattern)
+		return;
+
+	if (sscanf(pattern, "%lu %lu", &delay_on, &delay_off) == 2) {
+		led_blink_set(led_cdev, &delay_on, &delay_off);
+		led_cdev->blink_delay_on = delay_on;
+		led_cdev->blink_delay_off = delay_off;
+	} else {
+		dev_warn(led_cdev->dev,
+			 "Invalid value for delays pattern\n");
+	}
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
