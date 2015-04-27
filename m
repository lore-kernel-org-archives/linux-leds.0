From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 2/3] ledtrig-timer: add blink delay_unit control
Date: Mon, 27 Apr 2015 20:12:41 +0300
Message-ID: <553E6E09.3060801@list.ru>
References: <553E6CF5.4030601@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <553E6CF5.4030601@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski81@gmail.com>
List-Id: linux-leds@vger.kernel.org


Add delay_unit device attr to specify the timer delay unit.
Implement the following delay units to led trigger timer:
'nsec' for nanosecond delay_unit
'usec' for microsecond delay_unit
'msec' for millisecond delay_unit
The default is 'msec' for backward compatibility.

echo usec > /sys/class/leds/<led>/delay_unit
will specify microsecond delay unit.
Similarly you can do
echo u > /sys/class/leds/<led>/delay_unit
for a shorter notation.

This functionality is needed for things like PWM for software
brightness control, because the default mS resolution is not enough
for that tasks.

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski81@gmail.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-class.c             |   18 +++++++-
 drivers/leds/trigger/ledtrig-timer.c |   77 ++++++++++++++++++++++++++++++++++
 include/linux/leds.h                 |    7 ++++
 3 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index f95ce912..602d823 100644
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

+	switch (led_cdev->delay_unit) {
+	case LED_BLINK_DU_MS:
+		k_delay = ms_to_ktime(delay);
+		break;
+	case LED_BLINK_DU_US:
+		k_delay = ns_to_ktime(delay * 1000);
+		break;
+	case LED_BLINK_DU_NS:
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
index 8d09327..2838178 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -68,8 +68,73 @@ static ssize_t led_delay_off_store(struct device *dev,
 	return size;
 }

+#ifdef CONFIG_HIGH_RES_TIMERS
+static ssize_t led_dunit_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	static const char * const delay_units[] = {
+		[LED_BLINK_DU_MS] = "msec",
+		[LED_BLINK_DU_US] = "usec",
+		[LED_BLINK_DU_NS] = "nsec",
+	};
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	int ret = 0;
+	int i, max;
+
+	max = hrtimer_is_hres_active(&led_cdev->blink_timer) ?
+		LED_BLINK_DU_NS : LED_BLINK_DU_MS;
+	for (i = 0; i <= max; i++) {
+		char fmt[16];
+
+		if (led_cdev->delay_unit == i)
+			strcpy(fmt, "[%s]");
+		else
+			strcpy(fmt, "%s");
+		if (i < max)
+			strcat(fmt, " ");
+		else
+			strcat(fmt, "\n");
+		ret += sprintf(buf + ret, fmt, delay_units[i]);
+	}
+	return ret;
+}
+
+static ssize_t led_dunit_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	int ret = strlen(buf);
+
+	/* char and \n */
+	if (ret < 2)
+		return -EINVAL;
+
+	switch (buf[0]) {
+	case 'm':
+		led_cdev->delay_unit = LED_BLINK_DU_MS;
+		break;
+	case 'u':
+		led_cdev->delay_unit = LED_BLINK_DU_US;
+		break;
+	case 'n':
+		led_cdev->delay_unit = LED_BLINK_DU_NS;
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
+#endif
+
 static DEVICE_ATTR(delay_on, 0644, led_delay_on_show, led_delay_on_store);
 static DEVICE_ATTR(delay_off, 0644, led_delay_off_show, led_delay_off_store);
+#ifdef CONFIG_HIGH_RES_TIMERS
+static DEVICE_ATTR(delay_unit, 0644, led_dunit_show, led_dunit_store);
+#endif

 static void timer_trig_activate(struct led_classdev *led_cdev)
 {
@@ -83,6 +148,11 @@ static void timer_trig_activate(struct led_classdev *led_cdev)
 	rc = device_create_file(led_cdev->dev, &dev_attr_delay_off);
 	if (rc)
 		goto err_out_delayon;
+#ifdef CONFIG_HIGH_RES_TIMERS
+	rc = device_create_file(led_cdev->dev, &dev_attr_delay_unit);
+	if (rc)
+		goto err_out_delayoff;
+#endif

 	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
 		      &led_cdev->blink_delay_off);
@@ -90,6 +160,10 @@ static void timer_trig_activate(struct led_classdev *led_cdev)

 	return;

+#ifdef CONFIG_HIGH_RES_TIMERS
+err_out_delayoff:
+	device_remove_file(led_cdev->dev, &dev_attr_delay_off);
+#endif
 err_out_delayon:
 	device_remove_file(led_cdev->dev, &dev_attr_delay_on);
 }
@@ -99,6 +173,9 @@ static void timer_trig_deactivate(struct led_classdev *led_cdev)
 	if (led_cdev->activated) {
 		device_remove_file(led_cdev->dev, &dev_attr_delay_on);
 		device_remove_file(led_cdev->dev, &dev_attr_delay_off);
+#ifdef CONFIG_HIGH_RES_TIMERS
+		device_remove_file(led_cdev->dev, &dev_attr_delay_unit);
+#endif
 		led_cdev->activated = false;
 	}

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 68f5a23..d6bc30f 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -30,6 +30,12 @@ enum led_brightness {
 	LED_FULL	= 255,
 };

+enum led_blink_delay_unit {
+	LED_BLINK_DU_MS,
+	LED_BLINK_DU_US,
+	LED_BLINK_DU_NS,
+};
+
 struct led_classdev {
 	const char		*name;
 	enum led_brightness	 brightness;
@@ -82,6 +88,7 @@ struct led_classdev {

 	unsigned long		 blink_delay_on, blink_delay_off;
 	struct hrtimer		 blink_timer;
+	enum led_blink_delay_unit delay_unit;
 	int			 blink_brightness;
 	void			(*flash_resume)(struct led_classdev *led_cdev);

-- 
1.7.9.5
