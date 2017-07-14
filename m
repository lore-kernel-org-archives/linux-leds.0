From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 1/3] leds: core: Introduce generic pattern interface
Date: Fri, 14 Jul 2017 15:45:18 -0700
Message-ID: <20170714224520.467-2-bjorn.andersson@linaro.org>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170714224520.467-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

Some LED controllers have support for autonomously controlling
brightness over time, according to some preprogrammed pattern or
function.

This adds a new optional operator that LED class drivers can implement
if they support such functionality as well as a new device attribute to
configure the pattern for a given LED.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch, based on discussions following v1

 Documentation/ABI/testing/sysfs-class-led |  20 ++++
 drivers/leds/led-class.c                  | 150 ++++++++++++++++++++++++++++++
 include/linux/leds.h                      |  21 +++++
 3 files changed, 191 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 5f67f7ab277b..74a7f5b1f89b 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -61,3 +61,23 @@ Description:
 		gpio and backlight triggers. In case of the backlight trigger,
 		it is useful when driving a LED which is intended to indicate
 		a device in a standby like state.
+
+What:		/sys/class/leds/<led>/pattern
+Date:		July 2017
+KernelVersion:	4.14
+Description:
+		Specify a pattern for the LED, for LED hardware that support
+		altering the brightness as a function of time.
+
+		The pattern is given by a series of tuples, of brightness and
+		duration (ms). The LED is expected to traverse the series and
+		each brightness value for the specified duration.
+
+		Additionally a repeat marker ":|" can be appended to the
+		series, which should cause the pattern to be repeated
+		endlessly.
+
+		As LED hardware might have different capabilities and precision
+		the requested pattern might be slighly adjusted by the driver
+		and the resulting pattern of such operation should be returned
+		when this file is read.
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index b0e2d55acbd6..bd630e2ae967 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -74,6 +74,154 @@ static ssize_t max_brightness_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(max_brightness);
 
+static ssize_t pattern_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct led_pattern *pattern;
+	size_t offset = 0;
+	size_t count;
+	bool repeat;
+	size_t i;
+	int n;
+
+	if (!led_cdev->pattern_get)
+		return -EOPNOTSUPP;
+
+	pattern = led_cdev->pattern_get(led_cdev, &count, &repeat);
+	if (IS_ERR_OR_NULL(pattern))
+		return PTR_ERR(pattern);
+
+	for (i = 0; i < count; i++) {
+		n = snprintf(buf + offset, PAGE_SIZE - offset, "%d %d",
+			     pattern[i].brightness, pattern[i].delta_t);
+
+		if (offset + n >= PAGE_SIZE)
+			goto err_nospc;
+
+		offset += n;
+
+		if (i < count - 1)
+			buf[offset++] = ' ';
+	}
+
+	if (repeat) {
+		if (offset + 4 >= PAGE_SIZE)
+			goto err_nospc;
+
+		memcpy(buf + offset, " :|", 3);
+		offset += 3;
+	}
+
+	if (offset + 1 >= PAGE_SIZE)
+		goto err_nospc;
+
+	buf[offset++] = '\n';
+
+	kfree(pattern);
+	return offset;
+
+err_nospc:
+	kfree(pattern);
+	return -ENOSPC;
+}
+
+static ssize_t pattern_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct led_pattern *pattern = NULL;
+	unsigned long val;
+	char *sbegin;
+	char *elem;
+	char *s;
+	int len = 0;
+	int ret = 0;
+	bool odd = true;
+	bool repeat = false;
+
+	s = sbegin = kstrndup(buf, size, GFP_KERNEL);
+	if (!s)
+		return -ENOMEM;
+
+	/* Trim trailing newline */
+	s[strcspn(s, "\n")] = '\0';
+
+	/* If the remaining string is empty, clear the pattern */
+	if (!s[0]) {
+		ret = led_cdev->pattern_clear(led_cdev);
+		goto out;
+	}
+
+	pattern = kcalloc(size, sizeof(*pattern), GFP_KERNEL);
+	if (!pattern) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* Parse out the brightness & delta_t touples and check for repeat */
+	while ((elem = strsep(&s, " ")) != NULL) {
+		if (!strcmp(elem, ":|")) {
+			repeat = true;
+			break;
+		}
+
+		ret = kstrtoul(elem, 10, &val);
+		if (ret)
+			goto out;
+
+		if (odd) {
+			pattern[len].brightness = val;
+		} else {
+			/* Ensure we don't have any delta_t == 0 */
+			if (!val) {
+				ret = -EINVAL;
+				goto out;
+			}
+
+			pattern[len].delta_t = val;
+			len++;
+		}
+
+		odd = !odd;
+	}
+
+	/*
+	 * Fail if we didn't find any data points or last data point was partial
+	 */
+	if (!len || !odd) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = led_cdev->pattern_set(led_cdev, pattern, len, repeat);
+
+out:
+	kfree(pattern);
+	kfree(sbegin);
+	return ret < 0 ? ret : size;
+}
+
+static DEVICE_ATTR_RW(pattern);
+
+static umode_t led_class_attrs_mode(struct kobject *kobj,
+				    struct attribute *attr,
+				    int index)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+
+	if (attr == &dev_attr_brightness.attr)
+		return attr->mode;
+	if (attr == &dev_attr_max_brightness.attr)
+		return attr->mode;
+	if (attr == &dev_attr_pattern.attr && led_cdev->pattern_set)
+		return attr->mode;
+
+	return 0;
+}
+
 #ifdef CONFIG_LEDS_TRIGGERS
 static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_store);
 static struct attribute *led_trigger_attrs[] = {
@@ -88,11 +236,13 @@ static const struct attribute_group led_trigger_group = {
 static struct attribute *led_class_attrs[] = {
 	&dev_attr_brightness.attr,
 	&dev_attr_max_brightness.attr,
+	&dev_attr_pattern.attr,
 	NULL,
 };
 
 static const struct attribute_group led_group = {
 	.attrs = led_class_attrs,
+	.is_visible = led_class_attrs_mode,
 };
 
 static const struct attribute_group *led_groups[] = {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 64c56d454f7d..0ffbc86c36d5 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -33,6 +33,8 @@ enum led_brightness {
 	LED_FULL	= 255,
 };
 
+struct led_pattern;
+
 struct led_classdev {
 	const char		*name;
 	enum led_brightness	 brightness;
@@ -87,6 +89,15 @@ struct led_classdev {
 				     unsigned long *delay_on,
 				     unsigned long *delay_off);
 
+	int		(*pattern_set)(struct led_classdev *led_cdev,
+				       struct led_pattern *pattern, int len,
+				       bool repeat);
+
+	int		(*pattern_clear)(struct led_classdev *led_cdev);
+
+	struct led_pattern *(*pattern_get)(struct led_classdev *led_cdev,
+					   size_t *len, bool *repeat);
+
 	struct device		*dev;
 	const struct attribute_group	**groups;
 
@@ -444,4 +455,14 @@ static inline void led_classdev_notify_brightness_hw_changed(
 	struct led_classdev *led_cdev, enum led_brightness brightness) { }
 #endif
 
+/**
+ * struct led_pattern - brigheness value in a pattern
+ * @delta_t:	delay until next entry, in milliseconds
+ * @brightness:	brightness at time = 0
+ */
+struct led_pattern {
+	int delta_t;
+	int brightness;
+};
+
 #endif		/* __LINUX_LEDS_H_INCLUDED */
-- 
2.12.0
