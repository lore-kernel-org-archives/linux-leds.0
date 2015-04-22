From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 2/2] ledtrig-timer: add blink resolution control
Date: Wed, 22 Apr 2015 20:06:11 +0300
Message-ID: <5537D503.4050607@list.ru>
References: <5537D423.1040909@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5537D423.1040909@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
List-Id: linux-leds@vger.kernel.org


Add the following resolutions to led trigger timer:
'n' for nanosecond resolution
'u' for microsecond resolution
'm' for millisecond resolution
The default is 'm' for backward compatibility.

This functionality is needed for things like PWM for software
brightness control, because the default mS resolution is not enough
for that tasks.

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-class.c             |   18 +++++++++++--
 drivers/leds/trigger/ledtrig-timer.c |   49 ++++++++++++++++++++++++++++++++++
 include/linux/leds.h                 |    7 +++++
 3 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index f95ce912..2cfbb9d 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -108,6 +108,7 @@ static enum hrtimer_restart led_timer_function(struct hrtimer *timer)
 			     struct led_classdev, blink_timer);
 	unsigned long brightness;
 	unsigned long delay;
+	ktime_t k_delay;

 	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
 		led_set_brightness_async(led_cdev, LED_OFF);
@@ -149,9 +150,22 @@ static enum hrtimer_restart led_timer_function(struct hrtimer *timer)
 		}
 	}

+	switch (led_cdev->resolution) {
+	case LED_BLINK_MS:
+		k_delay = ms_to_ktime(delay);
+		break;
+	case LED_BLINK_US:
+		k_delay = ns_to_ktime(delay * 1000);
+		break;
+	case LED_BLINK_NS:
+		k_delay = ns_to_ktime(delay);
+		break;
+	default:
+		/* should not happen */
+		return HRTIMER_NORESTART;
+	}
 	hrtimer_forward(&led_cdev->blink_timer,
-			hrtimer_get_expires(&led_cdev->blink_timer),
-			ms_to_ktime(delay));
+			hrtimer_get_expires(&led_cdev->blink_timer), k_delay);
 	return HRTIMER_RESTART;
 }

diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index 8d09327..222c755 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -68,8 +68,51 @@ static ssize_t led_delay_off_store(struct device *dev,
 	return size;
 }

+static ssize_t led_res_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	const char res_suffix[] = {
+		[LED_BLINK_MS] = 'm',
+		[LED_BLINK_US] = 'u',
+		[LED_BLINK_NS] = 'n',
+	};
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%c\n", res_suffix[led_cdev->resolution]);
+}
+
+static ssize_t led_res_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	int ret = strlen(buf);
+	/* char and \n */
+	if (ret != 2)
+		return -EINVAL;
+
+	switch (buf[0]) {
+	case 'm':
+		led_cdev->resolution = LED_BLINK_MS;
+		break;
+	case 'u':
+		led_cdev->resolution = LED_BLINK_US;
+		break;
+	case 'n':
+		led_cdev->resolution = LED_BLINK_NS;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
+		      &led_cdev->blink_delay_off);
+
+	return ret;
+}
+
 static DEVICE_ATTR(delay_on, 0644, led_delay_on_show, led_delay_on_store);
 static DEVICE_ATTR(delay_off, 0644, led_delay_off_show, led_delay_off_store);
+static DEVICE_ATTR(resolution, 0644, led_res_show, led_res_store);

 static void timer_trig_activate(struct led_classdev *led_cdev)
 {
@@ -83,6 +126,9 @@ static void timer_trig_activate(struct led_classdev *led_cdev)
 	rc = device_create_file(led_cdev->dev, &dev_attr_delay_off);
 	if (rc)
 		goto err_out_delayon;
+	rc = device_create_file(led_cdev->dev, &dev_attr_resolution);
+	if (rc)
+		goto err_out_delayoff;

 	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
 		      &led_cdev->blink_delay_off);
@@ -90,6 +136,8 @@ static void timer_trig_activate(struct led_classdev *led_cdev)

 	return;

+err_out_delayoff:
+	device_remove_file(led_cdev->dev, &dev_attr_delay_off);
 err_out_delayon:
 	device_remove_file(led_cdev->dev, &dev_attr_delay_on);
 }
@@ -99,6 +147,7 @@ static void timer_trig_deactivate(struct led_classdev *led_cdev)
 	if (led_cdev->activated) {
 		device_remove_file(led_cdev->dev, &dev_attr_delay_on);
 		device_remove_file(led_cdev->dev, &dev_attr_delay_off);
+		device_remove_file(led_cdev->dev, &dev_attr_resolution);
 		led_cdev->activated = false;
 	}

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 68f5a23..5e6fe26 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -30,10 +30,17 @@ enum led_brightness {
 	LED_FULL	= 255,
 };

+enum led_blink_resolution {
+	LED_BLINK_MS,
+	LED_BLINK_US,
+	LED_BLINK_NS,
+};
+
 struct led_classdev {
 	const char		*name;
 	enum led_brightness	 brightness;
 	enum led_brightness	 max_brightness;
+	enum led_blink_resolution resolution;
 	int			 flags;

 	/* Lower 16 bits reflect status */
-- 
1.7.9.5
