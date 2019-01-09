From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v7 3/5] leds: trigger: pattern: Add pattern initialization from Device Tree
Date: Wed,  9 Jan 2019 15:44:47 +0100
Message-ID: <1547045089-19128-4-git-send-email-krzk@kernel.org>
References: <1547045089-19128-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547045089-19128-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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
 drivers/leds/trigger/ledtrig-pattern.c | 99 +++++++++++++++++++++++++++-------
 1 file changed, 80 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index 1870cf87afe1..718729c89440 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -220,22 +220,10 @@ static ssize_t pattern_trig_show_patterns(struct pattern_trig_data *data,
 	return count;
 }
 
-static ssize_t pattern_trig_store_patterns(struct led_classdev *led_cdev,
-					   const char *buf, size_t count,
-					   bool hw_pattern)
+static int pattern_trig_store_patterns_string(struct pattern_trig_data *data,
+					      const char *buf, size_t count)
 {
-	struct pattern_trig_data *data = led_cdev->trigger_data;
-	int ccount, cr, offset = 0, err = 0;
-
-	mutex_lock(&data->lock);
-
-	del_timer_sync(&data->timer);
-
-	if (data->is_hw_pattern)
-		led_cdev->pattern_clear(led_cdev);
-
-	data->is_hw_pattern = hw_pattern;
-	data->npatterns = 0;
+	int ccount, cr, offset = 0;
 
 	while (offset < count - 1 && data->npatterns < MAX_PATTERNS) {
 		cr = 0;
@@ -244,14 +232,54 @@ static ssize_t pattern_trig_store_patterns(struct led_classdev *led_cdev,
 				&data->patterns[data->npatterns].delta_t, &cr);
 		if (ccount != 2) {
 			data->npatterns = 0;
-			err = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 
 		offset += cr;
 		data->npatterns++;
 	}
 
+	return 0;
+}
+
+static int pattern_trig_store_patterns_int(struct pattern_trig_data *data,
+					   const u32 *buf, size_t count)
+{
+	unsigned int i;
+
+	for (i = 0; i < count; i += 2) {
+		data->patterns[data->npatterns].brightness = buf[i];
+		data->patterns[data->npatterns].delta_t = buf[i + 1];
+		data->npatterns++;
+	}
+
+	return 0;
+}
+
+static ssize_t pattern_trig_store_patterns(struct led_classdev *led_cdev,
+					   const char *buf, const u32 *buf_int,
+					   size_t count, bool hw_pattern)
+{
+	struct pattern_trig_data *data = led_cdev->trigger_data;
+	int err = 0;
+
+	mutex_lock(&data->lock);
+
+	del_timer_sync(&data->timer);
+
+	if (data->is_hw_pattern)
+		led_cdev->pattern_clear(led_cdev);
+
+	data->is_hw_pattern = hw_pattern;
+	data->npatterns = 0;
+
+	if (buf)
+		err = pattern_trig_store_patterns_string(data, buf, count);
+	else
+		err = pattern_trig_store_patterns_int(data, buf_int, count);
+	if (err)
+		goto out;
+
 	err = pattern_trig_start_pattern(led_cdev);
 	if (err)
 		data->npatterns = 0;
@@ -275,7 +303,7 @@ static ssize_t pattern_store(struct device *dev, struct device_attribute *attr,
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 
-	return pattern_trig_store_patterns(led_cdev, buf, count, false);
+	return pattern_trig_store_patterns(led_cdev, buf, NULL, count, false);
 }
 
 static DEVICE_ATTR_RW(pattern);
@@ -295,7 +323,7 @@ static ssize_t hw_pattern_store(struct device *dev,
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 
-	return pattern_trig_store_patterns(led_cdev, buf, count, true);
+	return pattern_trig_store_patterns(led_cdev, buf, NULL, count, true);
 }
 
 static DEVICE_ATTR_RW(hw_pattern);
@@ -331,6 +359,30 @@ static const struct attribute_group *pattern_trig_groups[] = {
 	NULL,
 };
 
+static void pattern_init(struct led_classdev *led_cdev)
+{
+	unsigned int size = 0;
+	u32 *pattern;
+	int err;
+
+	pattern = led_get_default_pattern(led_cdev, &size);
+	if (!pattern)
+		return;
+
+	if (size % 2) {
+		dev_warn(led_cdev->dev, "Expected pattern of tuples\n");
+		goto out;
+	}
+
+	err = pattern_trig_store_patterns(led_cdev, NULL, pattern, size, false);
+	if (err < 0)
+		dev_warn(led_cdev->dev,
+			 "Pattern initialization failed with error %d\n", err);
+
+out:
+	kfree(pattern);
+}
+
 static int pattern_trig_activate(struct led_classdev *led_cdev)
 {
 	struct pattern_trig_data *data;
@@ -354,6 +406,15 @@ static int pattern_trig_activate(struct led_classdev *led_cdev)
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
