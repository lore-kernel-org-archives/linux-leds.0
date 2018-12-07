From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 4/4] leds: trigger: Add pattern initialization from Device Tree
Date: Fri,  7 Dec 2018 13:32:54 +0100
Message-ID: <1544185974-5932-4-git-send-email-krzk@kernel.org>
References: <1544185974-5932-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544185974-5932-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Raphael Teysseyre <rteysseyre@gmail.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
 drivers/leds/trigger/ledtrig-pattern.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index 1870cf87afe1..96309d3bc43c 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -11,6 +11,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/timer.h>
 
@@ -331,6 +332,21 @@ static const struct attribute_group *pattern_trig_groups[] = {
 	NULL,
 };
 
+static void pattern_init(struct led_classdev *led_cdev)
+{
+	struct device_node *np = dev_of_node(led_cdev->dev);
+	const char *pattern;
+
+	if (!np)
+		return;
+
+	if (!of_property_read_string(np, "linux,trigger-pattern", &pattern)) {
+		if (strlen(pattern))
+			pattern_trig_store_patterns(led_cdev, pattern,
+						    strlen(pattern), false);
+	}
+}
+
 static int pattern_trig_activate(struct led_classdev *led_cdev)
 {
 	struct pattern_trig_data *data;
@@ -354,6 +370,8 @@ static int pattern_trig_activate(struct led_classdev *led_cdev)
 	timer_setup(&data->timer, pattern_trig_timer_function, 0);
 	led_cdev->activated = true;
 
+	pattern_init(led_cdev);
+
 	return 0;
 }
 
-- 
2.7.4
