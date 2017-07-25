From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 1/1] leds: add driver for support Mellanox regmap LEDs for BMC
Date: Tue, 25 Jul 2017 16:54:23 +0000
Message-ID: <1501001663-22209-2-git-send-email-vadimp@mellanox.com>
References: <1501001663-22209-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:44112 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752366AbdGYO53 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jul 2017 10:57:29 -0400
In-Reply-To: <1501001663-22209-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: j.anaszewski@samsung.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, lee.jones@linaro.org, robh+dt@kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

Driver obtains LED devices according to system configuration, provided
through the platform data, like mlxreg:status:green or mlxreg:status:amber
and creates devices in form: "devicename:colour:function".
The full path is to be:
/sys/class/leds/mlxreg\:status\:amber/brightness
After timer trigger activation:
echo timer > /sys/class/leds/mlxreg\:status\:amber/trigger
Attributes for LED blinking will appaer in sysfs infrastructure:
/sys/class/leds/mlxreg\:status\:amber/delay_off
/sys/class/leds/mlxreg\:status\:amber/delay_on

LED setting is controlled through the on-board programmable devices,
which exports its register map. This device could be attached to any
bus type, for which register mapping is supported.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 MAINTAINERS                |   1 +
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-mlxreg.c | 345 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 347 insertions(+)
 create mode 100644 drivers/leds/leds-mlxreg.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 205d397..ac6b0d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8566,6 +8566,7 @@ M:	Vadim Pasternak <vadimp@mellanox.com>
 L:	linux-leds@vger.kernel.org
 S:	Supported
 F:	drivers/leds/leds-mlxcpld.c
+F:	drivers/leds/leds-mlxreg.c
 F:	Documentation/leds/leds-mlxcpld.txt
 
 MELLANOX PLATFORM DRIVER
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 909dae6..3eb76e5 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
 obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
 obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
+obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
 obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
 obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
 
diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
new file mode 100644
index 0000000..bc1a6c3
--- /dev/null
+++ b/drivers/leds/leds-mlxreg.c
@@ -0,0 +1,345 @@
+/*
+ * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. Neither the names of the copyright holders nor the names of its
+ *    contributors may be used to endorse or promote products derived from
+ *    this software without specific prior written permission.
+ *
+ * Alternatively, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") version 2 as published by the Free
+ * Software Foundation.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ * POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/of_device.h>
+#include <linux/platform_data/mlxreg.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+#define MLXREG_LED_NAME "mlxreg"
+
+/* Codes for LEDs. */
+#define MLXREG_LED_OFFSET_HALF	0x01 /* Offset from solid: 3Hz blink */
+#define MLXREG_LED_OFFSET_FULL	0x02 /* Offset from solid: 6Hz blink */
+#define MLXREG_LED_IS_OFF	0x00 /* Off */
+#define MLXREG_LED_RED_SOLID	0x05 /* Solid red */
+#define MLXREG_LED_GREEN_SOLID	0x0D /* Solid green */
+#define MLXREG_LED_AMBER_SOLID	0x09 /* Solid amber */
+#define MLXREG_LED_BLINK_3HZ	167 /* ~167 msec off/on - HW support */
+#define MLXREG_LED_BLINK_6HZ	83 /* ~83 msec off/on - HW support */
+#define MLXREG_LED_MAX_DEFERRED	32 /* Max deferred operations for LED set */
+
+#define cdev_to_priv(c) container_of(c, struct mlxreg_core_led_data, led_cdev)
+
+/**
+ * struct mlxreg_led_priv_data - platform private data:
+ *
+ * @pdev: platform device;
+ * @pdata: platform data;
+ * @access_lock: mutex for attribute IO access;
+ */
+struct mlxreg_led_priv_data {
+	struct platform_device *pdev;
+	struct mlxreg_core_led_platform_data *pdata;
+	struct mutex access_lock; /* protect IO operations */
+};
+
+#define MLXREG_MAP	priv->pdata->regmap
+
+static int
+mlxreg_led_store_hw(struct mlxreg_core_led_data *led_pdata, u8 vset)
+{
+	struct mlxreg_led_priv_data *priv = led_pdata->data_parent;
+	u32 regval;
+	u32 nib;
+	int ret;
+
+	/*
+	 * Each LED is controlled through low or high nibble of the relevant
+	 * register byte. Register offset is specified by off parameter.
+	 * Parameter vset provides color code: 0x0 for off, 0x5 for solid red,
+	 * 0x6 for 3Hz blink red, 0xd for solid green, 0xe for 3Hz blink
+	 * green.
+	 * Parameter mask specifies which nibble is used for specific LED: mask
+	 * 0xf0 - lower nibble is to be used (bits from 0 to 3), mask 0x0f -
+	 * higher nibble (bits from 4 to 7).
+	 */
+	mutex_lock(&priv->access_lock);
+
+	ret = regmap_read(MLXREG_MAP, led_pdata->led->reg, &regval);
+	if (ret)
+		goto access_error;
+
+	nib = (ror32(led_pdata->led->mask, led_pdata->led->bit) == 0xf0) ?
+	      rol32(vset, led_pdata->led->bit) :
+	      rol32(vset, led_pdata->led->bit + 4);
+	regval = (regval & led_pdata->led->mask) | nib;
+
+	ret = regmap_write(MLXREG_MAP, led_pdata->led->reg, regval);
+
+access_error:
+	mutex_unlock(&priv->access_lock);
+
+	return ret;
+}
+
+static enum led_brightness
+mlxreg_led_get_hw(struct mlxreg_core_led_data *led_pdata)
+{
+	struct mlxreg_led_priv_data *priv = led_pdata->data_parent;
+	u32 regval;
+	int ret;
+
+	/*
+	 * Each LED is controlled through low or high nibble of the relevant
+	 * register byte. Register offset is specified by off parameter.
+	 * Parameter vset provides color code: 0x0 for off, 0x5 for solid red,
+	 * 0x6 for 3Hz blink red, 0xd for solid green, 0xe for 3Hz blink
+	 * green.
+	 * Parameter mask specifies which nibble is used for specific LED: mask
+	 * 0xf0 - lower nibble is to be used (bits from 0 to 3), mask 0x0f -
+	 * higher nibble (bits from 4 to 7).
+	 */
+	ret = regmap_read(MLXREG_MAP, led_pdata->led->reg, &regval);
+	if (ret < 0) {
+		dev_warn(led_pdata->led_cdev.dev, "Failed to get current brightness, error: %d\n",
+			 ret);
+		/* Assume the LED is OFF */
+		ret = LED_OFF;
+		goto access_error;
+	}
+
+	regval = regval & ~led_pdata->led->mask;
+	regval = (ror32(led_pdata->led->mask, led_pdata->led->bit) == 0xf0) ?
+		  ror32(regval, led_pdata->led->bit) :
+		  ror32(regval, led_pdata->led->bit + 4);
+	if (regval >= led_pdata->base_color &&
+	    regval <= (led_pdata->base_color + MLXREG_LED_OFFSET_FULL))
+		ret = LED_FULL;
+	else
+		ret = LED_OFF;
+
+access_error:
+
+	return ret;
+}
+
+static void
+mlxreg_led_brightness_set(struct led_classdev *cled, enum led_brightness value)
+{
+	struct mlxreg_core_led_data *led_pdata = cdev_to_priv(cled);
+
+	if (in_interrupt()) {
+		/*
+		 * Handle hw access to LED in workqueue to avoid I2C locking in
+		 * interrupt mode. Skip if deferred operations counter is at
+		 * maximum value.
+		 */
+		if (led_pdata->set_count == MLXREG_LED_MAX_DEFERRED - 1)
+			return;
+
+		if (!!value)
+			led_pdata->bitset |= BIT(led_pdata->set_count);
+		led_pdata->set_count++;
+
+		schedule_delayed_work(&led_pdata->dwork_led, 0);
+
+		return;
+	}
+
+	if (value)
+		mlxreg_led_store_hw(led_pdata, led_pdata->base_color);
+	else
+		mlxreg_led_store_hw(led_pdata, MLXREG_LED_IS_OFF);
+}
+
+static enum led_brightness
+mlxreg_led_brightness_get(struct led_classdev *cled)
+{
+	struct mlxreg_core_led_data *led_pdata = cdev_to_priv(cled);
+
+	return mlxreg_led_get_hw(led_pdata);
+}
+
+static int
+mlxreg_led_blink_set(struct led_classdev *cled, unsigned long *delay_on,
+		     unsigned long *delay_off)
+{
+	struct mlxreg_core_led_data *led_pdata = cdev_to_priv(cled);
+	int err;
+
+	/*
+	 * HW supports two types of blinking: full (6Hz) and half (3Hz).
+	 * For delay on/off zero LED is setting to solid color. For others
+	 * combination blinking is to be controlled by the software timer.
+	 */
+	if (!(*delay_on == 0 && *delay_off == 0) &&
+	    !(*delay_on == MLXREG_LED_BLINK_3HZ &&
+	      *delay_off == MLXREG_LED_BLINK_3HZ) &&
+	    !(*delay_on == MLXREG_LED_BLINK_6HZ &&
+	      *delay_off == MLXREG_LED_BLINK_6HZ))
+		return -EINVAL;
+
+	if (*delay_on == MLXREG_LED_BLINK_6HZ)
+		err = mlxreg_led_store_hw(led_pdata, led_pdata->base_color +
+					  MLXREG_LED_OFFSET_FULL);
+	else if (*delay_on == MLXREG_LED_BLINK_3HZ)
+		err = mlxreg_led_store_hw(led_pdata, led_pdata->base_color +
+					  MLXREG_LED_OFFSET_HALF);
+	else
+		err = mlxreg_led_store_hw(led_pdata, led_pdata->base_color);
+
+	return err;
+}
+
+static void mlxreg_led_handler(struct work_struct *work)
+{
+	struct mlxreg_core_led_data *led_pdata = container_of(work,
+			struct mlxreg_core_led_data, dwork_led.work);
+
+	if (led_pdata->bitset & BIT(0))
+		mlxreg_led_store_hw(led_pdata, led_pdata->base_color);
+	else
+		mlxreg_led_store_hw(led_pdata, MLXREG_LED_IS_OFF);
+
+	led_pdata->bitset >>= 1;
+	led_pdata->set_count--;
+}
+
+#define MLXREG_CDEV(i)	pdata->data[i].led_cdev
+
+static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
+{
+	struct mlxreg_core_led_platform_data *pdata = priv->pdata;
+	struct mlxreg_core_data *data = pdata->data->led;
+	int brightness;
+	int i;
+	int err;
+
+	for (i = 0; i < pdata->counter; i++, data++) {
+		pdata->data[i].data_parent = priv;
+		if (strstr(data->label, "red")) {
+			brightness = LED_OFF;
+			pdata->data[i].base_color = MLXREG_LED_RED_SOLID;
+		} else if (strstr(data->label, "amber")) {
+			brightness = LED_OFF;
+			pdata->data[i].base_color = MLXREG_LED_AMBER_SOLID;
+		} else {
+			brightness = LED_OFF;
+			pdata->data[i].base_color = MLXREG_LED_GREEN_SOLID;
+		}
+		sprintf(pdata->data[i].led_cdev_name, "%s:%s",
+			MLXREG_LED_NAME, data->label);
+		MLXREG_CDEV(i).name = pdata->data[i].led_cdev_name;
+		MLXREG_CDEV(i).brightness = brightness;
+		MLXREG_CDEV(i).max_brightness = 1;
+		MLXREG_CDEV(i).brightness_set = mlxreg_led_brightness_set;
+		MLXREG_CDEV(i).brightness_get = mlxreg_led_brightness_get;
+		MLXREG_CDEV(i).blink_set = mlxreg_led_blink_set;
+		MLXREG_CDEV(i).flags = LED_CORE_SUSPENDRESUME;
+		pdata->data[i].led = data;
+		err = devm_led_classdev_register(&priv->pdev->dev,
+						 &MLXREG_CDEV(i));
+		if (err)
+			return err;
+
+		if (MLXREG_CDEV(i).brightness)
+			mlxreg_led_brightness_set(
+				&MLXREG_CDEV(i),
+				MLXREG_CDEV(i).brightness);
+		dev_info(MLXREG_CDEV(i).dev,
+			 "label: %s, mask: 0x%02x, offset:0x%02x\n",
+			 data->label, data->mask, data->reg);
+
+		INIT_DELAYED_WORK(&pdata->data[i].dwork_led,
+				  mlxreg_led_handler);
+	}
+
+	return 0;
+}
+
+static int mlxreg_led_probe(struct platform_device *pdev)
+{
+	struct mlxreg_core_led_platform_data *pdata;
+	struct mlxreg_led_priv_data *priv;
+
+	pdata = dev_get_platdata(&pdev->dev);
+	if (!pdata) {
+		dev_err(&pdev->dev, "Failed to get platform data.\n");
+		return -EINVAL;
+	}
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->access_lock);
+	priv->pdev = pdev;
+	priv->pdata = pdata;
+
+	return mlxreg_led_config(priv);
+}
+
+static int mlxreg_led_remove(struct platform_device *pdev)
+{
+	struct mlxreg_led_priv_data *priv = dev_get_drvdata(&pdev->dev);
+	struct mlxreg_core_led_platform_data *pdata = priv->pdata;
+	int i;
+
+	for (i = 0; i < pdata->counter; i++)
+		cancel_delayed_work(&pdata->data[i].dwork_led);
+
+	mutex_unlock(&priv->access_lock);
+
+	return 0;
+}
+
+static const struct of_device_id mlxreg_led_dt_match[] = {
+	{ .compatible = "mellanox,leds-mlxreg" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mlxreg_dt_match);
+
+static struct platform_driver mlxreg_led_driver = {
+	.driver = {
+	    .name = "leds-mlxreg",
+	    .of_match_table = of_match_ptr(mlxreg_led_dt_match),
+	},
+	.probe = mlxreg_led_probe,
+	.remove = mlxreg_led_remove,
+};
+
+module_platform_driver(mlxreg_led_driver);
+
+MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
+MODULE_DESCRIPTION("Mellanox LED regmap driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:leds-mlxreg");
-- 
2.1.4
