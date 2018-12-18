From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 4/5] leds: trigger: oneshot: Add initialization from Device Tree
Date: Tue, 18 Dec 2018 16:27:31 +0100
Message-ID: <1545146852-32207-5-git-send-email-krzk@kernel.org>
References: <1545146852-32207-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545146852-32207-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Raphael Teysseyre <rteysseyre@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Allow initialization of delays used in oneshot trigger from Device
Tree property.

This is especially useful for embedded systems where the trigger might
be used early, before bringing up user-space.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/trigger/ledtrig-oneshot.c | 38 ++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
index 95c9be4b6e7e..71baccc00f06 100644
--- a/drivers/leds/trigger/ledtrig-oneshot.c
+++ b/drivers/leds/trigger/ledtrig-oneshot.c
@@ -130,6 +130,34 @@ static struct attribute *oneshot_trig_attrs[] = {
 };
 ATTRIBUTE_GROUPS(oneshot_trig);
 
+static void pattern_init(struct led_classdev *led_cdev)
+{
+	u32 *pattern;
+	unsigned int size = 0;
+
+	pattern = led_classdev_get_default_pattern(led_cdev, &size);
+	if (!pattern)
+		goto out_default;
+
+	if (size != 2) {
+		dev_warn(led_cdev->dev,
+			 "Expected 2 but got %u values for delays pattern\n",
+			 size);
+		goto out_default;
+	}
+
+	led_cdev->blink_delay_on = pattern[0];
+	led_cdev->blink_delay_off = pattern[1];
+	kfree(pattern);
+
+	return;
+
+out_default:
+	kfree(pattern);
+	led_cdev->blink_delay_on = DEFAULT_DELAY;
+	led_cdev->blink_delay_off = DEFAULT_DELAY;
+}
+
 static int oneshot_trig_activate(struct led_classdev *led_cdev)
 {
 	struct oneshot_trig_data *oneshot_data;
@@ -140,8 +168,14 @@ static int oneshot_trig_activate(struct led_classdev *led_cdev)
 
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
