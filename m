From: Jiri Prchal <jiri.prchal@aksignal.cz>
Subject: [PATCH v2] leds: triggers: add invert to heartbeat
Date: Thu,  8 Oct 2015 10:32:26 +0200
Message-ID: <f72b41d0cf24fa74ea74799fea87b05ff727e621.1444292878.git.jiri.prchal@aksignal.cz>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, Jiri Prchal <jiri.prchal@aksignal.cz>
List-Id: linux-leds@vger.kernel.org

This patcht adds possibility to invert heartbeat blinking. The inverted LED
is more time ON then OFF.
It's because it looks better when the heartbeat LED is next to other LED
which is most time ON.
The invert value is exported same way via sysfs in file invert like
oneshot. I get inspiration from this trigger.

Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
---
v2:
- Removed led_set_brightness in heartbeat_trig_deactivate.
- Reformated message.
---
 drivers/leds/trigger/ledtrig-heartbeat.c | 47 ++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
index fea6871..8622ce6 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -27,6 +27,7 @@ struct heartbeat_trig_data {
 	unsigned int phase;
 	unsigned int period;
 	struct timer_list timer;
+	unsigned int invert;
 };

 static void led_heartbeat_function(unsigned long data)
@@ -56,21 +57,27 @@ static void led_heartbeat_function(unsigned long data)
 			msecs_to_jiffies(heartbeat_data->period);
 		delay = msecs_to_jiffies(70);
 		heartbeat_data->phase++;
-		brightness = led_cdev->max_brightness;
+		if (!heartbeat_data->invert)
+			brightness = led_cdev->max_brightness;
 		break;
 	case 1:
 		delay = heartbeat_data->period / 4 - msecs_to_jiffies(70);
 		heartbeat_data->phase++;
+		if (heartbeat_data->invert)
+			brightness = led_cdev->max_brightness;
 		break;
 	case 2:
 		delay = msecs_to_jiffies(70);
 		heartbeat_data->phase++;
-		brightness = led_cdev->max_brightness;
+		if (!heartbeat_data->invert)
+			brightness = led_cdev->max_brightness;
 		break;
 	default:
 		delay = heartbeat_data->period - heartbeat_data->period / 4 -
 			msecs_to_jiffies(70);
 		heartbeat_data->phase = 0;
+		if (heartbeat_data->invert)
+			brightness = led_cdev->max_brightness;
 		break;
 	}

@@ -78,15 +85,50 @@ static void led_heartbeat_function(unsigned long data)
 	mod_timer(&heartbeat_data->timer, jiffies + delay);
 }

+static ssize_t led_invert_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct heartbeat_trig_data *heartbeat_data = led_cdev->trigger_data;
+
+	return sprintf(buf, "%u\n", heartbeat_data->invert);
+}
+
+static ssize_t led_invert_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct heartbeat_trig_data *heartbeat_data = led_cdev->trigger_data;
+	unsigned long state;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &state);
+	if (ret)
+		return ret;
+
+	heartbeat_data->invert = !!state;
+
+	return size;
+}
+
+static DEVICE_ATTR(invert, 0644, led_invert_show, led_invert_store);
+
 static void heartbeat_trig_activate(struct led_classdev *led_cdev)
 {
 	struct heartbeat_trig_data *heartbeat_data;
+	int rc;

 	heartbeat_data = kzalloc(sizeof(*heartbeat_data), GFP_KERNEL);
 	if (!heartbeat_data)
 		return;

 	led_cdev->trigger_data = heartbeat_data;
+	rc = device_create_file(led_cdev->dev, &dev_attr_invert);
+	if (rc) {
+		kfree(led_cdev->trigger_data);
+		return;
+	}
+
 	setup_timer(&heartbeat_data->timer,
 		    led_heartbeat_function, (unsigned long) led_cdev);
 	heartbeat_data->phase = 0;
@@ -100,6 +142,7 @@ static void heartbeat_trig_deactivate(struct led_classdev *led_cdev)

 	if (led_cdev->activated) {
 		del_timer_sync(&heartbeat_data->timer);
+		device_remove_file(led_cdev->dev, &dev_attr_invert);
 		kfree(heartbeat_data);
 		led_cdev->activated = false;
 	}
--
1.9.1
