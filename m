From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 09/10] hwmon: Add driver for Fan Tray on Juniper I2CS FGPA
Date: Fri,  7 Oct 2016 18:21:08 +0300
Message-ID: <1475853669-22480-10-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Avirup Banerjee <abanerjee@juniper.net>

Add a hwmon driver for Fan Trays using Juniper's I2CS FPGA.

Signed-off-by: Avirup Banerjee <abanerjee@juniper.net>
Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
Signed-off-by: Guenter Roeck <groeck@juniper.net>
Signed-off-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/hwmon/Kconfig                      |  11 +
 drivers/hwmon/Makefile                     |   1 +
 drivers/hwmon/jnx-fan.c                    | 471 +++++++++++++++++++++++++++++
 include/linux/platform_data/jnx-i2cs-fan.h |  13 +
 4 files changed, 496 insertions(+)
 create mode 100644 drivers/hwmon/jnx-fan.c
 create mode 100644 include/linux/platform_data/jnx-i2cs-fan.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 45cef3d..b9348d2 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -663,6 +663,17 @@ config SENSORS_JC42
 	  This driver can also be built as a module.  If so, the module
 	  will be called jc42.
 
+config SENSORS_JNX_FAN
+	tristate "Juniper Fan Tray driver"
+	depends on I2C && MFD_JUNIPER_I2CS
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for the Juniper Networks
+	  Fan Tray Driver.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called jnx-fan.
+
 config SENSORS_POWR1220
 	tristate "Lattice POWR1220 Power Monitoring"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index aecf4ba..eea631e 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_SENSORS_INA2XX)	+= ina2xx.o
 obj-$(CONFIG_SENSORS_INA3221)	+= ina3221.o
 obj-$(CONFIG_SENSORS_IT87)	+= it87.o
 obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
+obj-$(CONFIG_SENSORS_JNX_FAN)   += jnx-fan.o
 obj-$(CONFIG_SENSORS_JZ4740)	+= jz4740-hwmon.o
 obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
 obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
diff --git a/drivers/hwmon/jnx-fan.c b/drivers/hwmon/jnx-fan.c
new file mode 100644
index 0000000..d04e3ce
--- /dev/null
+++ b/drivers/hwmon/jnx-fan.c
@@ -0,0 +1,471 @@
+/*
+ * hwmon: Driver for Juniper Fan Tray Controller
+ *
+ * Copyright (c) 2014 Juniper Networks. All rights reserved.
+ * Author: Avirup Banerjee <abanerjee@juniper.net>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon-vid.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_data/jnx-i2cs-fan.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define DRIVER_NAME "i2cs_fan_hwmon"
+
+/*
+ * Fan fpga register offsets
+ */
+
+#define I2CS_FAN_ADEC_VER                   0x01
+#define I2CS_FAN_SELECT                     0x40
+#define I2CS_FAN_SPEED_CTRL                 0x41
+#define I2CS_FAN_MAX_TACH                   0x42
+#define I2CS_FAN_MIN_TACH                   0x43
+#define I2CS_FAN_TACH                       0x44
+#define I2CS_FAN_INT_SRC                    0x45
+#define I2CS_FAN_INT_MASK                   0x46
+#define I2CS_FAN_INT_1_7                    0x47
+#define I2CS_FAN_INT_8_14                   0x48
+#define I2CS_FAN_SPARE_FAN_INT_15_22        0x49
+#define I2CS_FAN_MODE_AND_TEST              0x4A
+#define I2CS_FAN_HW_DEBUG_1                 0x4B
+#define I2CS_FAN_HW_DEBUG_2                 0x4C
+#define I2CS_FAN_SW_FAN_POWER_SPEED_FAIL    0x4D
+#define I2CS_FAN_ADEC_MASK_WAIT_SECOND      0x4F
+#define I2CS_FAN_RESET_WAIT_CONTROL         0x50
+#define I2CS_FAN_BOARD_STAT_1               0x51
+#define I2CS_FAN_BOARD_STAT_2               0x52
+#define I2CS_FAN_OK_THRESHOLD               0x53
+#define I2CS_FAN_SPARE                      0x54
+#define I2CS_FAN_SPARE_OE                   0x55
+
+#define FAN_TACH_FACTOR                     120
+#define NUM_FANS_PER_TRAY                   14
+
+struct jnx_fan_data {
+	struct regmap *regmap;
+	struct device *hwmon_dev;
+	struct mutex update_lock;
+	int fan_index;
+	int num_fans;
+	int factor;
+};
+
+static int jnx_fan_select(struct jnx_fan_data *data, int index)
+{
+	/* Return if fan has already been selected */
+	if (data->fan_index == index)
+		return 0;
+
+	data->fan_index = index;
+
+	return regmap_write(data->regmap, I2CS_FAN_SELECT, index);
+}
+
+static int jnx_fan_read_reg(struct jnx_fan_data *data, u8 reg, int index)
+{
+	unsigned int value;
+	int ret;
+
+	mutex_lock(&data->update_lock);
+
+	ret = jnx_fan_select(data, index);
+	if (ret < 0)
+		goto done;
+
+	ret = regmap_read(data->regmap, reg, &value);
+	if (ret < 0)
+		goto done;
+	ret = value;
+
+done:
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
+static int jnx_fan_write_reg(struct jnx_fan_data *data, u8 reg,
+			     unsigned int value, int index)
+{
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	ret = jnx_fan_select(data, index);
+	if (ret < 0)
+		goto done;
+
+	ret = regmap_write(data->regmap, reg, value);
+
+done:
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
+static ssize_t jnx_fan_set_pwm(struct device *dev,
+			       struct device_attribute *da,
+			       const char *buf, size_t count)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct jnx_fan_data *data = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	if (kstrtoul(buf, 10, &val) < 0)
+		return -EINVAL;
+	if (val > 255)
+		return -EINVAL;
+
+	ret = jnx_fan_write_reg(data, I2CS_FAN_SPEED_CTRL, val, attr->index);
+	return ret ? ret : count;
+}
+
+static ssize_t jnx_fan_show_pwm(struct device *dev,
+				struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct jnx_fan_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = jnx_fan_read_reg(data, I2CS_FAN_SPEED_CTRL, attr->index);
+	if (ret < 0)
+		return ret;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", ret);
+}
+
+static ssize_t jnx_fan_show(struct device *dev, struct device_attribute *da,
+			    char *buf)
+{
+	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(da);
+	struct jnx_fan_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = jnx_fan_read_reg(data, attr->nr, attr->index);
+	if (ret < 0)
+		return ret;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", ret * data->factor);
+}
+
+static ssize_t jnx_fan_set(struct device *dev, struct device_attribute *da,
+			   const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(da);
+	struct jnx_fan_data *data = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	if (kstrtoul(buf, 10, &val) < 0)
+		return -EINVAL;
+
+	DIV_ROUND_CLOSEST(val, data->factor);
+	clamp_val(val, 0, 255);
+
+	ret = jnx_fan_write_reg(data, attr->nr, val, attr->index);
+	return ret ? ret : count;
+}
+
+static umode_t jnx_fan_is_visible(struct kobject *kobj, struct attribute *a,
+				  int n)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct jnx_fan_data *data = dev_get_drvdata(dev);
+	unsigned int index = n % 14;
+
+	if (index < data->num_fans)
+		return a->mode;
+
+	return 0;
+}
+
+static struct regmap_config jnx_fan_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = I2CS_FAN_SPARE_OE,
+};
+
+/* Fan speed */
+static SENSOR_DEVICE_ATTR_2(fan1_input,  S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 1);
+static SENSOR_DEVICE_ATTR_2(fan2_input,  S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 2);
+static SENSOR_DEVICE_ATTR_2(fan3_input,  S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 3);
+static SENSOR_DEVICE_ATTR_2(fan4_input,  S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 4);
+static SENSOR_DEVICE_ATTR_2(fan5_input,  S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 5);
+static SENSOR_DEVICE_ATTR_2(fan6_input,  S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 6);
+static SENSOR_DEVICE_ATTR_2(fan7_input,  S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 7);
+static SENSOR_DEVICE_ATTR_2(fan8_input,  S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 8);
+static SENSOR_DEVICE_ATTR_2(fan9_input,  S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 9);
+static SENSOR_DEVICE_ATTR_2(fan10_input, S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 10);
+static SENSOR_DEVICE_ATTR_2(fan11_input, S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 11);
+static SENSOR_DEVICE_ATTR_2(fan12_input, S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 12);
+static SENSOR_DEVICE_ATTR_2(fan13_input, S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 13);
+static SENSOR_DEVICE_ATTR_2(fan14_input, S_IRUGO, jnx_fan_show, NULL,
+			    I2CS_FAN_TACH, 14);
+
+/* PWM values */
+static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 1);
+static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 2);
+static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 3);
+static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 4);
+static SENSOR_DEVICE_ATTR(pwm5, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 5);
+static SENSOR_DEVICE_ATTR(pwm6, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 6);
+static SENSOR_DEVICE_ATTR(pwm7, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 7);
+static SENSOR_DEVICE_ATTR(pwm8, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 8);
+static SENSOR_DEVICE_ATTR(pwm9, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 9);
+static SENSOR_DEVICE_ATTR(pwm10, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 10);
+static SENSOR_DEVICE_ATTR(pwm11, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 11);
+static SENSOR_DEVICE_ATTR(pwm12, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 12);
+static SENSOR_DEVICE_ATTR(pwm13, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 13);
+static SENSOR_DEVICE_ATTR(pwm14, S_IWUSR | S_IRUGO, jnx_fan_show_pwm,
+			  jnx_fan_set_pwm, 14);
+
+/* Fan Thresholds */
+
+/* Min */
+static SENSOR_DEVICE_ATTR_2(fan1_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 1);
+static SENSOR_DEVICE_ATTR_2(fan2_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 2);
+static SENSOR_DEVICE_ATTR_2(fan3_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 3);
+static SENSOR_DEVICE_ATTR_2(fan4_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 4);
+static SENSOR_DEVICE_ATTR_2(fan5_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 5);
+static SENSOR_DEVICE_ATTR_2(fan6_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 6);
+static SENSOR_DEVICE_ATTR_2(fan7_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 7);
+static SENSOR_DEVICE_ATTR_2(fan8_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 8);
+static SENSOR_DEVICE_ATTR_2(fan9_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 9);
+static SENSOR_DEVICE_ATTR_2(fan10_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 10);
+static SENSOR_DEVICE_ATTR_2(fan11_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 11);
+static SENSOR_DEVICE_ATTR_2(fan12_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 12);
+static SENSOR_DEVICE_ATTR_2(fan13_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 13);
+static SENSOR_DEVICE_ATTR_2(fan14_min, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MIN_TACH, 14);
+/* Max */
+static SENSOR_DEVICE_ATTR_2(fan1_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 1);
+static SENSOR_DEVICE_ATTR_2(fan2_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 2);
+static SENSOR_DEVICE_ATTR_2(fan3_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 3);
+static SENSOR_DEVICE_ATTR_2(fan4_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 4);
+static SENSOR_DEVICE_ATTR_2(fan5_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 5);
+static SENSOR_DEVICE_ATTR_2(fan6_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 6);
+static SENSOR_DEVICE_ATTR_2(fan7_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 7);
+static SENSOR_DEVICE_ATTR_2(fan8_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 8);
+static SENSOR_DEVICE_ATTR_2(fan9_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 9);
+static SENSOR_DEVICE_ATTR_2(fan10_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 10);
+static SENSOR_DEVICE_ATTR_2(fan11_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 11);
+static SENSOR_DEVICE_ATTR_2(fan12_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 12);
+static SENSOR_DEVICE_ATTR_2(fan13_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 13);
+static SENSOR_DEVICE_ATTR_2(fan14_max, S_IWUSR | S_IRUGO, jnx_fan_show,
+			    jnx_fan_set, I2CS_FAN_MAX_TACH, 14);
+
+static struct attribute *jnx_fan_attrs[] = {
+	&sensor_dev_attr_fan1_input.dev_attr.attr,
+	&sensor_dev_attr_fan2_input.dev_attr.attr,
+	&sensor_dev_attr_fan3_input.dev_attr.attr,
+	&sensor_dev_attr_fan4_input.dev_attr.attr,
+	&sensor_dev_attr_fan5_input.dev_attr.attr,
+	&sensor_dev_attr_fan6_input.dev_attr.attr,
+	&sensor_dev_attr_fan7_input.dev_attr.attr,
+	&sensor_dev_attr_fan8_input.dev_attr.attr,
+	&sensor_dev_attr_fan9_input.dev_attr.attr,
+	&sensor_dev_attr_fan10_input.dev_attr.attr,
+	&sensor_dev_attr_fan11_input.dev_attr.attr,
+	&sensor_dev_attr_fan12_input.dev_attr.attr,
+	&sensor_dev_attr_fan13_input.dev_attr.attr,
+	&sensor_dev_attr_fan14_input.dev_attr.attr,
+	&sensor_dev_attr_pwm1.dev_attr.attr,
+	&sensor_dev_attr_pwm2.dev_attr.attr,
+	&sensor_dev_attr_pwm3.dev_attr.attr,
+	&sensor_dev_attr_pwm4.dev_attr.attr,
+	&sensor_dev_attr_pwm5.dev_attr.attr,
+	&sensor_dev_attr_pwm6.dev_attr.attr,
+	&sensor_dev_attr_pwm7.dev_attr.attr,
+	&sensor_dev_attr_pwm8.dev_attr.attr,
+	&sensor_dev_attr_pwm9.dev_attr.attr,
+	&sensor_dev_attr_pwm10.dev_attr.attr,
+	&sensor_dev_attr_pwm11.dev_attr.attr,
+	&sensor_dev_attr_pwm12.dev_attr.attr,
+	&sensor_dev_attr_pwm13.dev_attr.attr,
+	&sensor_dev_attr_pwm14.dev_attr.attr,
+	&sensor_dev_attr_fan1_min.dev_attr.attr,
+	&sensor_dev_attr_fan2_min.dev_attr.attr,
+	&sensor_dev_attr_fan3_min.dev_attr.attr,
+	&sensor_dev_attr_fan4_min.dev_attr.attr,
+	&sensor_dev_attr_fan5_min.dev_attr.attr,
+	&sensor_dev_attr_fan6_min.dev_attr.attr,
+	&sensor_dev_attr_fan7_min.dev_attr.attr,
+	&sensor_dev_attr_fan8_min.dev_attr.attr,
+	&sensor_dev_attr_fan9_min.dev_attr.attr,
+	&sensor_dev_attr_fan10_min.dev_attr.attr,
+	&sensor_dev_attr_fan11_min.dev_attr.attr,
+	&sensor_dev_attr_fan12_min.dev_attr.attr,
+	&sensor_dev_attr_fan13_min.dev_attr.attr,
+	&sensor_dev_attr_fan14_min.dev_attr.attr,
+	&sensor_dev_attr_fan1_max.dev_attr.attr,
+	&sensor_dev_attr_fan2_max.dev_attr.attr,
+	&sensor_dev_attr_fan3_max.dev_attr.attr,
+	&sensor_dev_attr_fan4_max.dev_attr.attr,
+	&sensor_dev_attr_fan5_max.dev_attr.attr,
+	&sensor_dev_attr_fan6_max.dev_attr.attr,
+	&sensor_dev_attr_fan7_max.dev_attr.attr,
+	&sensor_dev_attr_fan8_max.dev_attr.attr,
+	&sensor_dev_attr_fan9_max.dev_attr.attr,
+	&sensor_dev_attr_fan10_max.dev_attr.attr,
+	&sensor_dev_attr_fan11_max.dev_attr.attr,
+	&sensor_dev_attr_fan12_max.dev_attr.attr,
+	&sensor_dev_attr_fan13_max.dev_attr.attr,
+	&sensor_dev_attr_fan14_max.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group jnx_fan_group = {
+	.attrs = jnx_fan_attrs,
+	.is_visible = jnx_fan_is_visible,
+};
+__ATTRIBUTE_GROUPS(jnx_fan);
+
+static int jnx_fan_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct i2cs_fan_platform_data *pdata = dev_get_platdata(dev);
+	struct i2c_client *client;
+	struct jnx_fan_data *data;
+
+	if (!dev->parent)
+		return -ENODEV;
+
+	client = i2c_verify_client(dev->parent);
+	if (!client)
+		return -ENODEV;
+
+	data = devm_kzalloc(dev, sizeof(struct jnx_fan_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = devm_regmap_init_i2c(client, &jnx_fan_regmap_config);
+	if (IS_ERR(data->regmap)) {
+		dev_err(dev, "failed to allocate register map\n");
+		return PTR_ERR(data->regmap);
+	}
+
+	if (pdata) {
+		data->num_fans = pdata->num_fans;
+		data->factor = pdata->factor;
+	} else {
+		data->num_fans = NUM_FANS_PER_TRAY;
+		data->factor = FAN_TACH_FACTOR;
+	}
+
+	if (dev->of_node) {
+		of_property_read_u32(dev->of_node,
+				     "num-fans", &data->num_fans);
+		of_property_read_u32(dev->of_node,
+				     "tach-factor", &data->factor);
+	}
+
+	data->fan_index = -1;
+	mutex_init(&data->update_lock);
+
+	platform_set_drvdata(pdev, data);
+
+	data->hwmon_dev = hwmon_device_register_with_groups(dev->parent,
+							    "i2cs_fan", data,
+							    jnx_fan_groups);
+	return PTR_ERR_OR_ZERO(data->hwmon_dev);
+}
+
+static int jnx_fan_remove(struct platform_device *pdev)
+{
+	struct jnx_fan_data *data = platform_get_drvdata(pdev);
+
+	hwmon_device_unregister(data->hwmon_dev);
+
+	return 0;
+}
+
+static const struct of_device_id jnx_fan_of_match[] = {
+	{ .compatible = "jnx,i2cs-fan-hwmon", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, jnx_fan_of_match);
+
+static struct platform_driver jnx_fan_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = of_match_ptr(jnx_fan_of_match),
+	},
+	.probe = jnx_fan_probe,
+	.remove = jnx_fan_remove,
+};
+
+module_platform_driver(jnx_fan_driver);
+
+MODULE_AUTHOR("Avirup Banerjee <abanerjee@juniper.net>");
+MODULE_DESCRIPTION("JNPR FAN driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRIVER_NAME);
diff --git a/include/linux/platform_data/jnx-i2cs-fan.h b/include/linux/platform_data/jnx-i2cs-fan.h
new file mode 100644
index 0000000..b3fc8c2
--- /dev/null
+++ b/include/linux/platform_data/jnx-i2cs-fan.h
@@ -0,0 +1,13 @@
+/*
+ * i2cs-fan.h
+ */
+
+#ifndef I2CS_FAN_H
+#define I2CS_FAN_H
+
+struct i2cs_fan_platform_data {
+	int num_fans;	/* Number of fans in tray		*/
+	int factor;	/* fan speed multiplication factor	*/
+};
+
+#endif /* I2CS_FAN_H */
-- 
1.9.1

