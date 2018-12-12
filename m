From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 3/5] leds: trigger: pattern: Add pattern initialization from Device Tree
Date: Wed, 12 Dec 2018 12:16:44 +0100
Message-ID: <1544613406-27026-4-git-send-email-krzk@kernel.org>
References: <1544613406-27026-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544613406-27026-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Allow initialization of pattern used in pattern trigger from Device Tree
property.

This is especially useful for embedded systems where the pattern trigger
would be used to indicate the process of boot status in a nice,
user-friendly blinking way.  This initialization pattern will be used
till user-space is brought up and sets its own pattern, indicating the
boot status is for example finished.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/trigger/ledtrig-pattern.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index 1870cf87afe1..5be7bbe13a2c 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -331,6 +331,22 @@ static const struct attribute_group *pattern_trig_groups[] = {
 	NULL,
 };
 
+static void pattern_init(struct led_classdev *led_cdev)
+{
+	const char *pattern;
+	int err;
+
+	pattern = led_classdev_get_default_pattern(led_cdev);
+	if (!pattern)
+		return;
+
+	err = pattern_trig_store_patterns(led_cdev, pattern, strlen(pattern),
+					  false);
+	if (err)
+		dev_warn(led_cdev->dev,
+			 "Pattern initialization failed with error %d\n", err);
+}
+
 static int pattern_trig_activate(struct led_classdev *led_cdev)
 {
 	struct pattern_trig_data *data;
@@ -354,6 +370,15 @@ static int pattern_trig_activate(struct led_classdev *led_cdev)
 	timer_setup(&data->timer, pattern_trig_timer_function, 0);
 	led_cdev->activated = true;
 
+	if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER) {
+		pattern_init(led_cdev);
+		/*
+		 * Mark as initialized even on pattern_init() error because
+		 * any consecutive call to it would produce the same error.
+		 */
+		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
+	}
+
 	return 0;
 }
 
-- 
2.7.4
