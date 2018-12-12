From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 4/5] leds: trigger: oneshot: Add initialization from Device Tree
Date: Wed, 12 Dec 2018 12:16:45 +0100
Message-ID: <1544613406-27026-5-git-send-email-krzk@kernel.org>
References: <1544613406-27026-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544613406-27026-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Allow initialization of delays used in oneshot trigger from Device
Tree property.

This is especially useful for embedded systems where the trigger might
be used early, before bringing up user-space.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---

New patch in the series
---
 drivers/leds/trigger/ledtrig-oneshot.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
index 95c9be4b6e7e..4e73a1c17a40 100644
--- a/drivers/leds/trigger/ledtrig-oneshot.c
+++ b/drivers/leds/trigger/ledtrig-oneshot.c
@@ -130,6 +130,27 @@ static struct attribute *oneshot_trig_attrs[] = {
 };
 ATTRIBUTE_GROUPS(oneshot_trig);
 
+static void pattern_init(struct led_classdev *led_cdev)
+{
+	const char *pattern;
+	unsigned long delay_on, delay_off;
+
+	pattern = led_classdev_get_default_pattern(led_cdev);
+	if (!pattern) {
+		led_cdev->blink_delay_on = DEFAULT_DELAY;
+		led_cdev->blink_delay_off = DEFAULT_DELAY;
+		return;
+	}
+
+	if (sscanf(pattern, "%lu %lu", &delay_on, &delay_off) == 2) {
+		led_cdev->blink_delay_on = delay_on;
+		led_cdev->blink_delay_off = delay_off;
+	} else {
+		dev_warn(led_cdev->dev,
+			 "Invalid value for delays pattern\n");
+	}
+}
+
 static int oneshot_trig_activate(struct led_classdev *led_cdev)
 {
 	struct oneshot_trig_data *oneshot_data;
@@ -140,8 +161,14 @@ static int oneshot_trig_activate(struct led_classdev *led_cdev)
 
 	led_set_trigger_data(led_cdev, oneshot_data);
 
-	led_cdev->blink_delay_on = DEFAULT_DELAY;
-	led_cdev->blink_delay_off = DEFAULT_DELAY;
+	if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER) {
+		pattern_init(led_cdev);
+		/*
+		 * Mark as initialized even on pattern_init() error because
+		 * any consecutive call to it would produce the same error.
+		 */
+		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
+	}
 
 	return 0;
 }
-- 
2.7.4
