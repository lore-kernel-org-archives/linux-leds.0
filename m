From: "David Rivshin (Allworx)" <drivshin.allworx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/4] leds: Add driver for the ISSI IS31FL32xx family of LED controllers
Date: Mon,  7 Mar 2016 19:57:15 -0500
Message-ID: <1457398636-6485-4-git-send-email-drivshin.allworx@gmail.com>
References: <1457398636-6485-1-git-send-email-drivshin.allworx@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457398636-6485-1-git-send-email-drivshin.allworx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

From: David Rivshin <drivshin-5fOYsn7Fw8lBDgjK7y7TUQ@public.gmane.org>

The IS31FL32xx family of LED controllers are I2C devices with multiple
constant-current channels, each with independent 256-level PWM control.

Datasheets: http://www.issi.com/US/product-analog-fxled-driver.shtml

This has been tested on the IS31FL3236 and IS31FL3216, on an ARM
(TI am335x) platform.

The programming paradigm of these devices is similar in the following
ways:
 - All registers are 8 bit
 - All LED control registers are write-only
 - Each LED channel has a PWM register (0-255)
 - PWM register writes are shadowed until an Update register is poked
 - All have a concept of Software Shutdown, which disables output

However, there are some differences in devices:
 - 3236/3235 have a separate Control register for each LED,
   (3218/3216 pack the enable bits into fewer registers)
 - 3236/3235 have a per-channel current divisor setting
 - 3236/3235 have a Global Control register that can turn off all LEDs
 - 3216 is unique in a number of ways
    - OUT9-OUT16 can be configured as GPIOs instead of LED controls
    - LEDs can be programmed with an 8-frame animation, with
      programmable delay between frames
    - LEDs can be modulated by an input audio signal
    - Max output current can be adjusted from 1/4 to 2x globally
    - Has a Configuration register instead of a Shutdown register

This driver currently only supports the base PWM control function
of these devices. The following features of these devices are not
implemented, although it should be possible to add them in the future:
 - All devices are capable of going into a lower-power "software
   shutdown" mode.
 - The is31fl3236 and is31fl3235 can reduce the max output current
   per-channel with a divisor of 1, 2, 3, or 4.
 - The is31fl3216 can use some LED channels as GPIOs instead.
 - The is31fl3216 can animate LEDs in hardware.
 - The is31fl3216 can modulate LEDs according to an audio input.
 - The is31fl3216 can reduce/increase max output current globally.

Signed-off-by: David Rivshin <drivshin-5fOYsn7Fw8lBDgjK7y7TUQ@public.gmane.org>
---

You may see two instances of this warning:
  "passing argument 1 of 'of_property_read_string' discards 'const'
   qualifier from pointer target type"
That is a result of of_property_read_string() taking a non-const
struct device_node pointer parameter. A fix for this [1] is already
in linux-next.

Changes from v1:
 - removed line stating filename from file header comment of is31fl32xx.c
 - dropped #includes for err.h and of_platform.h
 - added #includes for device.h, of.h, and of_device.h

Changes from RFC:
 - Removed max-brightness DT property.
 - Refer to these devices as "LED controllers" in Kconfig.
 - Removed redundant last sentence from Kconfig entry
 - Removed unnecessary debug code.
 - Do not set led_classdev.brightness to 0 explicitly, as it is
   already initialized to 0 by devm_kzalloc().
 - Used of_property_read_string() instead of of_get_property().
 - Fail immediately on DT parsing error in a child node, rather than
   continuing on with the non-faulty ones.
 - Added additional comments for some things that might be non-obvious.
 - Added constants for the location of the SSD bit in the SHUTDOWN
   register, and the 3216's CONFIG register.
 - Added special sw_shutdown_func for the 3216 device, as that bit
   is in a different register, at a different position, and has reverse
   polarity compared to all the other devices.
 - Refactored is31fl32xx_init_regs() to separate out some logic into
   is31fl32xx_reset_regs() and is31fl32xx_software_shutdown().

[1] https://lkml.org/lkml/2016/3/2/746

 drivers/leds/Kconfig           |   8 +
 drivers/leds/Makefile          |   1 +
 drivers/leds/leds-is31fl32xx.c | 504 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 513 insertions(+)
 create mode 100644 drivers/leds/leds-is31fl32xx.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 7f940c2..08a5743 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -568,6 +568,14 @@ config LEDS_SEAD3
 	  This driver can also be built as a module. If so the module
 	  will be called leds-sead3.
 
+config LEDS_IS31FL32XX
+	tristate "LED support for ISSI IS31FL32XX I2C LED controller family"
+	depends on LEDS_CLASS && I2C && OF
+	help
+	  Say Y here to include support for ISSI IS31FL32XX LED controllers.
+	  They are I2C devices with multiple constant-current channels, each
+	  with independent 256-level PWM control.
+
 comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
 
 config LEDS_BLINKM
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index e9d53092..cb2013d 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
 obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
+obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
new file mode 100644
index 0000000..9a67856
--- /dev/null
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -0,0 +1,504 @@
+/*
+ * Driver for ISSI IS31FL32xx family of I2C LED controllers
+ *
+ * Copyright 2015 Allworx Corp.
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Datasheets: http://www.issi.com/US/product-analog-fxled-driver.shtml
+ */
+
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+
+/* Used to indicate a device has no such register */
+#define IS31FL32XX_REG_NONE 0xFF
+
+/* Software Shutdown bit in Shutdown Register */
+#define IS31FL32XX_SHUTDOWN_SSD_ENABLE  0
+#define IS31FL32XX_SHUTDOWN_SSD_DISABLE BIT(0)
+
+/* IS31FL3216 has a number of unique registers */
+#define IS31FL3216_CONFIG_REG 0x00
+#define IS31FL3216_LIGHTING_EFFECT_REG 0x03
+#define IS31FL3216_CHANNEL_CONFIG_REG 0x04
+
+/* Software Shutdown bit in 3216 Config Register */
+#define IS31FL3216_CONFIG_SSD_ENABLE  BIT(7)
+#define IS31FL3216_CONFIG_SSD_DISABLE 0
+
+struct is31fl32xx_priv;
+struct is31fl32xx_led_data {
+	struct led_classdev cdev;
+	u8 channel; /* 1-based, max priv->cdef->channels */
+	struct is31fl32xx_priv *priv;
+};
+
+struct is31fl32xx_priv {
+	const struct is31fl32xx_chipdef *cdef;
+	struct i2c_client *client;
+	unsigned int num_leds;
+	struct is31fl32xx_led_data leds[0];
+};
+
+/**
+ * struct is31fl32xx_chipdef - chip-specific attributes
+ * @channels            : Number of LED channels
+ * @shutdown_reg        : address of Shutdown register (optional)
+ * @pwm_update_reg      : address of PWM Update register
+ * @global_control_reg  : address of Global Control register (optional)
+ * @reset_reg           : address of Reset register (optional)
+ * @pwm_register_base   : address of first PWM register
+ * @pwm_registers_reversed: : true if PWM registers count down instead of up
+ * @led_control_register_base : address of first LED control register (optional)
+ * @enable_bits_per_led_control_register: number of LEDs enable bits in each
+ * @reset_func:         : pointer to reset function
+ *
+ * For all optional register addresses, the sentinel value %IS31FL32XX_REG_NONE
+ * indicates that this chip has no such register.
+ *
+ * If non-NULL, @reset_func will be called during probing to set all
+ * necessary registers to a known initialization state. This is needed
+ * for chips that do not have a @reset_reg.
+ *
+ * @enable_bits_per_led_control_register must be >=1 if
+ * @led_control_register_base != %IS31FL32XX_REG_NONE.
+ */
+struct is31fl32xx_chipdef {
+	u8	channels;
+	u8	shutdown_reg;
+	u8	pwm_update_reg;
+	u8	global_control_reg;
+	u8	reset_reg;
+	u8	pwm_register_base;
+	bool	pwm_registers_reversed;
+	u8	led_control_register_base;
+	u8	enable_bits_per_led_control_register;
+	int (*reset_func)(struct is31fl32xx_priv *priv);
+	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
+};
+
+static const struct is31fl32xx_chipdef is31fl3236_cdef = {
+	.channels				= 36,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x25,
+	.global_control_reg			= 0x4a,
+	.reset_reg				= 0x4f,
+	.pwm_register_base			= 0x01,
+	.led_control_register_base		= 0x26,
+	.enable_bits_per_led_control_register	= 1,
+};
+
+static const struct is31fl32xx_chipdef is31fl3235_cdef = {
+	.channels				= 28,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x25,
+	.global_control_reg			= 0x4a,
+	.reset_reg				= 0x4f,
+	.pwm_register_base			= 0x05,
+	.led_control_register_base		= 0x2a,
+	.enable_bits_per_led_control_register	= 1,
+};
+
+static const struct is31fl32xx_chipdef is31fl3218_cdef = {
+	.channels				= 18,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x16,
+	.global_control_reg			= IS31FL32XX_REG_NONE,
+	.reset_reg				= 0x17,
+	.pwm_register_base			= 0x01,
+	.led_control_register_base		= 0x13,
+	.enable_bits_per_led_control_register	= 6,
+};
+
+static int is31fl3216_reset(struct is31fl32xx_priv *priv);
+static int is31fl3216_software_shutdown(struct is31fl32xx_priv *priv,
+					bool enable);
+static const struct is31fl32xx_chipdef is31fl3216_cdef = {
+	.channels				= 16,
+	.shutdown_reg				= IS31FL32XX_REG_NONE,
+	.pwm_update_reg				= 0xB0,
+	.global_control_reg			= IS31FL32XX_REG_NONE,
+	.reset_reg				= IS31FL32XX_REG_NONE,
+	.pwm_register_base			= 0x10,
+	.pwm_registers_reversed			= true,
+	.led_control_register_base		= 0x01,
+	.enable_bits_per_led_control_register	= 8,
+	.reset_func				= is31fl3216_reset,
+	.sw_shutdown_func			= is31fl3216_software_shutdown,
+};
+
+static int is31fl32xx_write(struct is31fl32xx_priv *priv, u8 reg, u8 val)
+{
+	int ret;
+
+	dev_dbg(&priv->client->dev, "writing register 0x%02X=0x%02X", reg, val);
+
+	ret =  i2c_smbus_write_byte_data(priv->client, reg, val);
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"register write to 0x%02X failed (error %d)",
+			reg, ret);
+	}
+	return ret;
+}
+
+/*
+ * Custom reset function for IS31FL3216 because it does not have a RESET
+ * register the way that the other IS31FL32xx chips do. We don't bother
+ * writing the GPIO and animation registers, because the registers we
+ * do write ensure those will have no effect.
+ */
+static int is31fl3216_reset(struct is31fl32xx_priv *priv)
+{
+	unsigned int i;
+	int ret;
+
+	ret = is31fl32xx_write(priv, IS31FL3216_CONFIG_REG,
+			       IS31FL3216_CONFIG_SSD_ENABLE);
+	if (ret)
+		return ret;
+	for (i = 0; i < priv->cdef->channels; i++) {
+		ret = is31fl32xx_write(priv, priv->cdef->pwm_register_base+i,
+				       0x00);
+		if (ret)
+			return ret;
+	}
+	ret = is31fl32xx_write(priv, priv->cdef->pwm_update_reg, 0);
+	if (ret)
+		return ret;
+	ret = is31fl32xx_write(priv, IS31FL3216_LIGHTING_EFFECT_REG, 0x00);
+	if (ret)
+		return ret;
+	ret = is31fl32xx_write(priv, IS31FL3216_CHANNEL_CONFIG_REG, 0x00);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Custom Software-Shutdown function for IS31FL3216 because it does not have
+ * a SHUTDOWN register the way that the other IS31FL32xx chips do.
+ * We don't bother doing a read/modify/write on the CONFIG register because
+ * we only ever use a value of '0' for the other fields in that register.
+ */
+static int is31fl3216_software_shutdown(struct is31fl32xx_priv *priv,
+					bool enable)
+{
+	u8 value = enable ? IS31FL3216_CONFIG_SSD_ENABLE :
+			    IS31FL3216_CONFIG_SSD_DISABLE;
+
+	return is31fl32xx_write(priv, IS31FL3216_CONFIG_REG, value);
+}
+
+/*
+ * NOTE: A mutex is not needed in this function because:
+ * - All referenced data is read-only after probe()
+ * - The I2C core has a mutex on to protect the bus
+ * - There are no read/modify/write operations
+ * - Intervening operations between the write of the PWM register
+ *   and the Update register are harmless.
+ *
+ * Example:
+ *	PWM_REG_1 write 16
+ *	UPDATE_REG write 0
+ *	PWM_REG_2 write 128
+ *	UPDATE_REG write 0
+ *   vs:
+ *	PWM_REG_1 write 16
+ *	PWM_REG_2 write 128
+ *	UPDATE_REG write 0
+ *	UPDATE_REG write 0
+ * are equivalent. Poking the Update register merely applies all PWM
+ * register writes up to that point.
+ */
+static int is31fl32xx_brightness_set(struct led_classdev *led_cdev,
+				     enum led_brightness brightness)
+{
+	const struct is31fl32xx_led_data *led_data =
+		container_of(led_cdev, struct is31fl32xx_led_data, cdev);
+	const struct is31fl32xx_chipdef *cdef = led_data->priv->cdef;
+	u8 pwm_register_offset;
+	int ret;
+
+	dev_dbg(led_cdev->dev, "%s: %d\n", __func__, brightness);
+
+	/* NOTE: led_data->channel is 1-based */
+	if (cdef->pwm_registers_reversed)
+		pwm_register_offset = cdef->channels - led_data->channel;
+	else
+		pwm_register_offset = led_data->channel - 1;
+
+	ret = is31fl32xx_write(led_data->priv,
+			       cdef->pwm_register_base + pwm_register_offset,
+			       brightness);
+	if (ret)
+		return ret;
+
+	return is31fl32xx_write(led_data->priv, cdef->pwm_update_reg, 0);
+}
+
+static int is31fl32xx_reset_regs(struct is31fl32xx_priv *priv)
+{
+	const struct is31fl32xx_chipdef *cdef = priv->cdef;
+	int ret;
+
+	if (cdef->reset_reg != IS31FL32XX_REG_NONE) {
+		ret = is31fl32xx_write(priv, cdef->reset_reg, 0);
+		if (ret)
+			return ret;
+	}
+
+	if (cdef->reset_func)
+		return cdef->reset_func(priv);
+
+	return 0;
+}
+
+static int is31fl32xx_software_shutdown(struct is31fl32xx_priv *priv,
+					bool enable)
+{
+	const struct is31fl32xx_chipdef *cdef = priv->cdef;
+	int ret;
+
+	if (cdef->shutdown_reg != IS31FL32XX_REG_NONE) {
+		u8 value = enable ? IS31FL32XX_SHUTDOWN_SSD_ENABLE :
+				    IS31FL32XX_SHUTDOWN_SSD_DISABLE;
+		ret = is31fl32xx_write(priv, cdef->shutdown_reg, value);
+		if (ret)
+			return ret;
+	}
+
+	if (cdef->sw_shutdown_func)
+		return cdef->sw_shutdown_func(priv, enable);
+
+	return 0;
+}
+
+static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
+{
+	const struct is31fl32xx_chipdef *cdef = priv->cdef;
+	int ret;
+
+	ret = is31fl32xx_reset_regs(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * Set enable bit for all channels.
+	 * We will control state with PWM registers alone.
+	 */
+	if (cdef->led_control_register_base != IS31FL32XX_REG_NONE) {
+		u8 value =
+		    GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
+		u8 num_regs = cdef->channels /
+				cdef->enable_bits_per_led_control_register;
+		int i;
+
+		for (i = 0; i < num_regs; i++) {
+			ret = is31fl32xx_write(priv,
+					       cdef->led_control_register_base+i,
+					       value);
+			if (ret)
+				return ret;
+		}
+	}
+
+	ret = is31fl32xx_software_shutdown(priv, false);
+	if (ret)
+		return ret;
+
+	if (cdef->global_control_reg != IS31FL32XX_REG_NONE) {
+		ret = is31fl32xx_write(priv, cdef->global_control_reg, 0x00);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static inline size_t sizeof_is31fl32xx_priv(int num_leds)
+{
+	return sizeof(struct is31fl32xx_priv) +
+		      (sizeof(struct is31fl32xx_led_data) * num_leds);
+}
+
+static int is31fl32xx_parse_child_dt(const struct device *dev,
+				     const struct device_node *child,
+				     struct is31fl32xx_led_data *led_data)
+{
+	struct led_classdev *cdev = &led_data->cdev;
+	int ret = 0;
+	u32 reg;
+
+	if (of_property_read_string(child, "label", &cdev->name))
+		cdev->name = child->name;
+
+	ret = of_property_read_u32(child, "reg", &reg);
+	if (ret || reg < 1 || reg > led_data->priv->cdef->channels) {
+		dev_err(dev,
+			"Child node %s does not have a valid reg property\n",
+			child->full_name);
+		return -EINVAL;
+	}
+	led_data->channel = reg;
+
+	of_property_read_string(child, "linux,default-trigger",
+				&cdev->default_trigger);
+
+	cdev->brightness_set_blocking = is31fl32xx_brightness_set;
+
+	return 0;
+}
+
+static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
+					struct is31fl32xx_priv *priv,
+					u8 channel)
+{
+	size_t i;
+
+	for (i = 0; i < priv->num_leds; i++) {
+		if (priv->leds[i].channel == channel)
+			return &priv->leds[i];
+	}
+
+	return NULL;
+}
+
+static int is31fl32xx_parse_dt(struct device *dev,
+			       struct is31fl32xx_priv *priv)
+{
+	struct device_node *child;
+	int ret = 0;
+
+	for_each_child_of_node(dev->of_node, child) {
+		struct is31fl32xx_led_data *led_data =
+			&priv->leds[priv->num_leds];
+		const struct is31fl32xx_led_data *other_led_data;
+
+		led_data->priv = priv;
+
+		ret = is31fl32xx_parse_child_dt(dev, child, led_data);
+		if (ret)
+			goto err;
+
+		/* Detect if channel is already in use by another child */
+		other_led_data = is31fl32xx_find_led_data(priv,
+							  led_data->channel);
+		if (other_led_data) {
+			dev_err(dev,
+				"%s and %s both attempting to use channel %d\n",
+				led_data->cdev.name,
+				other_led_data->cdev.name,
+				led_data->channel);
+			goto err;
+		}
+
+		ret = devm_led_classdev_register(dev, &led_data->cdev);
+		if (ret) {
+			dev_err(dev, "failed to register PWM led for %s: %d\n",
+				led_data->cdev.name, ret);
+			goto err;
+		}
+
+		priv->num_leds++;
+	}
+
+	return 0;
+
+err:
+	of_node_put(child);
+	return ret;
+}
+
+static const struct of_device_id of_is31fl31xx_match[] = {
+	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
+	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
+	{ .compatible = "issi,is31fl3218", .data = &is31fl3218_cdef, },
+	{ .compatible = "issi,is31fl3216", .data = &is31fl3216_cdef, },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, of_is31fl31xx_match);
+
+static int is31fl32xx_probe(struct i2c_client *client,
+			    const struct i2c_device_id *id)
+{
+	const struct is31fl32xx_chipdef *cdef;
+	const struct of_device_id *of_dev_id;
+	struct device *dev = &client->dev;
+	struct is31fl32xx_priv *priv;
+	int count;
+	int ret = 0;
+
+	of_dev_id = of_match_device(of_is31fl31xx_match, dev);
+	if (!of_dev_id)
+		return -EINVAL;
+
+	cdef = of_dev_id->data;
+
+	count = of_get_child_count(dev->of_node);
+	if (!count)
+		return -EINVAL;
+
+	priv = devm_kzalloc(dev, sizeof_is31fl32xx_priv(count),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+	priv->cdef = cdef;
+	i2c_set_clientdata(client, priv);
+
+	ret = is31fl32xx_init_regs(priv);
+	if (ret)
+		return ret;
+
+	ret = is31fl32xx_parse_dt(dev, priv);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int is31fl32xx_remove(struct i2c_client *client)
+{
+	struct is31fl32xx_priv *priv = i2c_get_clientdata(client);
+
+	return is31fl32xx_reset_regs(priv);
+}
+
+/*
+ * i2c-core requires that id_table be non-NULL, even though
+ * it is not used for DeviceTree based instantiation.
+ */
+static const struct i2c_device_id is31fl31xx_id[] = {
+	{},
+};
+
+MODULE_DEVICE_TABLE(i2c, is31fl31xx_id);
+
+static struct i2c_driver is31fl32xx_driver = {
+	.driver = {
+		.name	= "is31fl32xx",
+		.of_match_table = of_is31fl31xx_match,
+	},
+	.probe		= is31fl32xx_probe,
+	.remove		= is31fl32xx_remove,
+	.id_table	= is31fl31xx_id,
+};
+
+module_i2c_driver(is31fl32xx_driver);
+
+MODULE_AUTHOR("David Rivshin <drivshin-5fOYsn7Fw8lBDgjK7y7TUQ@public.gmane.org>");
+MODULE_DESCRIPTION("ISSI IS31FL32xx LED driver");
+MODULE_LICENSE("GPL v2");
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
