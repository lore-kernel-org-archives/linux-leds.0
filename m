From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 1/2] drivers: led: is31fl319x: 1/3/6/9-channel light effect led driver
Date: Thu, 7 Jul 2016 11:03:36 +0200
Message-ID: <94545BFC-2A15-4F89-9F32-7CFC10E0AFE1@goldelico.com>
References: <cover.1467799364.git.hns@goldelico.com> <089f8597f3424ac64a6b6283d9fa0eb15b29e8c8.1467799364.git.hns@goldelico.com> <577E170B.6060702@samsung.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <577E170B.6060702@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

> Am 07.07.2016 um 10:47 schrieb Jacek Anaszewski <j.anaszewski@samsung.com>:
> 
> Hi Nikolaus,
> 
> Thanks for the updated version. Some comments below.
> 
> On 07/06/2016 12:02 PM, H. Nikolaus Schaller wrote:
>> This is a driver for the Integrated Silicon Solution Inc. LED driver
>> chips series IS31FL319x. They can drive 1, 3, 6  or up to 9
>> LEDs.
>> 
>> Each LED is individually controllable in brightness (through pwm)
>> in 256 steps so that RGB LEDs can show any of ca. 16 Mio colors.
>> 
>> The maximum current of the LEDs can be programmed and limited to
>> 5 .. 40mA through a device tree property.
>> 
>> The chip is connected through I2C and can have one of 4 addresses
>> in the range 0x64 .. 0x67 depending on how the AD pin is connected. The
>> address is defined by the reg property as usual.
>> 
>> The chip also has a shutdown input which could be connected to a GPIO,
>> but this driver uses software shutdown if all LEDs are inactivated.
>> 
>> The chip also has breathing and audio features which are not fully
>> supported by this driver.
>> 
>> Tested-on: OMAP5 based Pyra handheld prototype.
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  drivers/leds/Kconfig           |   8 +
>>  drivers/leds/Makefile          |   1 +
>>  drivers/leds/leds-is31fl319x.c | 354 +++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 363 insertions(+)
>>  create mode 100644 drivers/leds/leds-is31fl319x.c
>> 
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 5ae2834..65b1045 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -570,6 +570,14 @@ config LEDS_SEAD3
>>  	  This driver can also be built as a module. If so the module
>>  	  will be called leds-sead3.
>> 
>> +config LEDS_IS31FL319X
>> +	tristate "LED Support for ISSI IS31FL319x I2C LED controller family"
>> +	depends on LEDS_CLASS && I2C && OF
>> +	help
>> +	  This option enables support for LEDs connected to ISSI IS31FL319x
>> +	  fancy LED driver chips accessed via the I2C bus.
>> +	  Driver supports individual PWM brightness control for each channel.
>> +
>>  config LEDS_IS31FL32XX
>>  	tristate "LED support for ISSI IS31FL32XX I2C LED controller family"
>>  	depends on LEDS_CLASS && I2C && OF
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index cb2013d..b6ce9f9 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -66,6 +66,7 @@ obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
>>  obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
>>  obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
>>  obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
>> +obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
>>  obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
>> 
>>  # LED SPI Drivers
>> diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
>> new file mode 100644
>> index 0000000..bbf8850
>> --- /dev/null
>> +++ b/drivers/leds/leds-is31fl319x.c
>> @@ -0,0 +1,354 @@
>> +/*
>> + * Copyright 2015-16 Golden Delicious Computers
>> + *
>> + * Author: Nikolaus Schaller <hns@goldelico.com>
>> + *
>> + * Based on leds-tca6507.c
>> + *
>> + * This file is subject to the terms and conditions of version 2 of
>> + * the GNU General Public License.  See the file COPYING in the main
>> + * directory of this archive for more details.
>> + *
>> + * LED driver for the IS31FL3191/3/6/99 to drive 1, 3, 6 or 9 light
>> + * effect LEDs.
>> + *
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +
>> +/* register numbers */
>> +#define IS31FL319X_SHUTDOWN	0x00
>> +#define IS31FL319X_CTRL1	0x01
>> +#define IS31FL319X_CTRL2	0x02
>> +#define IS31FL319X_CONFIG1	0x03
>> +#define IS31FL319X_CONFIG2	0x04
>> +#define IS31FL319X_RAMP_MODE	0x05
>> +#define IS31FL319X_BREATH_MASK	0x06
>> +#define IS31FL319X_PWM1		0x07
>> +#define IS31FL319X_PWM2		0x08
>> +#define IS31FL319X_PWM3		0x09
>> +#define IS31FL319X_PWM4		0x0a
>> +#define IS31FL319X_PWM5		0x0b
>> +#define IS31FL319X_PWM6		0x0c
>> +#define IS31FL319X_PWM7		0x0d
>> +#define IS31FL319X_PWM8		0x0e
>> +#define IS31FL319X_PWM9		0x0f
>> +#define IS31FL319X_DATA_UPDATE	0x10
>> +#define IS31FL319X_T0_1		0x11
>> +#define IS31FL319X_T0_2		0x12
>> +#define IS31FL319X_T0_3		0x13
>> +#define IS31FL319X_T0_4		0x14
>> +#define IS31FL319X_T0_5		0x15
>> +#define IS31FL319X_T0_6		0x16
>> +#define IS31FL319X_T0_7		0x17
>> +#define IS31FL319X_T0_8		0x18
>> +#define IS31FL319X_T0_9		0x19
>> +#define IS31FL319X_T123_1	0x1a
>> +#define IS31FL319X_T123_2	0x1b
>> +#define IS31FL319X_T123_3	0x1c
>> +#define IS31FL319X_T4_1		0x1d
>> +#define IS31FL319X_T4_2		0x1e
>> +#define IS31FL319X_T4_3		0x1f
>> +#define IS31FL319X_T4_4		0x20
>> +#define IS31FL319X_T4_5		0x21
>> +#define IS31FL319X_T4_6		0x22
>> +#define IS31FL319X_T4_7		0x23
>> +#define IS31FL319X_T4_8		0x24
>> +#define IS31FL319X_T4_9		0x25
>> +#define IS31FL319X_TIME_UPDATE	0x26
>> +#define IS31FL319X_RESET	0xff
>> +
>> +#define IS31FL319X_REG_CNT	(IS31FL319X_RESET + 1)
>> +
>> +#define NUM_LEDS 9	/* max for 3199 chip */
>> +
>> +struct is31fl319x_chip {
>> +	struct i2c_client	*client;
>> +	struct regmap		*regmap;
>> +
>> +	struct is31fl319x_led {
>> +		struct is31fl319x_chip	*chip;
>> +		struct led_classdev	led_cdev;
>> +	} leds[NUM_LEDS];
>> +};
>> +
>> +static const struct i2c_device_id is31fl319x_id[] = {
>> +	{ "is31fl3190", 1 },
>> +	{ "is31fl3191", 1 },
>> +	{ "is31fl3193", 3 },
>> +	{ "is31fl3196", 6 },
>> +	{ "is31fl3199", 9 },
>> +	{ "sn3199", 9 },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, is31fl319x_id);
>> +
>> +static int is31fl319x_brightness_set(struct led_classdev *led_cdev,
>> +				   enum led_brightness brightness)
>> +{
>> +	struct is31fl319x_led *led = container_of(led_cdev,
>> +						  struct is31fl319x_led,
>> +						  led_cdev);
>> +	struct is31fl319x_chip *is31 = led->chip;
>> +	int ret;
>> +
>> +	int i;
>> +	u8 ctrl1, ctrl2;
> 
> You can initialize these variables here.

Ok.

> 
>> +
>> +	dev_dbg(&is31->client->dev, "%s %d: %d\n", __func__, (led - is31->leds),
>> +		brightness);
>> +
>> +	/* update PWM register */
>> +	ret = regmap_write(is31->regmap, IS31FL319X_PWM1 + (led - is31->leds),
>> +			   brightness);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ctrl1 = 0;
>> +	ctrl2 = 0;
> 
> And remove above two lines.
> 
>> +
>> +	/* read current brightness of all PWM channels */
>> +	for (i = 0; i < NUM_LEDS; i++) {
>> +		unsigned int pwm_value;
>> +		bool on;
>> +
>> +		/*
>> +		 * since neither led_cdev nor the chip can provide
>> +		 * the current setting, we read from the regmap cache
>> +		 */
>> +
>> +		ret = regmap_read(is31->regmap, IS31FL319X_PWM1 + i,
>> +				  &pwm_value);
> > +
>> +		dev_dbg(&is31->client->dev, "%s read %d: ret=%d: %d\n",
>> +			__func__, i, ret, pwm_value);
>> +		on = ret >= 0 && pwm_value > LED_OFF;
>> +
>> +		if (i < 3)
>> +			ctrl1 |= on << i;	/* 0..2 => bit 0..2 */
>> +		else if (i < 6)
>> +			ctrl1 |= on << (i+1);	/* 3..5 => bit 4..6 */
>> +		else
>> +			ctrl2 |= on << (i-6);	/* 6..8 => bit 0..2 */
>> +	}
> > +
>> +
>> +	if (ctrl1 > 0 || ctrl2 > 0) {
>> +		dev_dbg(&is31->client->dev, "power up %02x %02x\n",
>> +			ctrl1, ctrl2);
>> +		regmap_write(is31->regmap, IS31FL319X_CTRL1, ctrl1);
>> +		regmap_write(is31->regmap, IS31FL319X_CTRL2, ctrl2);
>> +		/* update PWMs */
>> +		regmap_write(is31->regmap, IS31FL319X_DATA_UPDATE, 0x00);
>> +		/* enable chip from shut down */
>> +		ret = regmap_write(is31->regmap, IS31FL319X_SHUTDOWN, 0x01);
>> +	} else {
>> +		dev_dbg(&is31->client->dev, "power down\n");
>> +		/* shut down (no need to clear CTRL1/2) */
>> +		ret = regmap_write(is31->regmap, IS31FL319X_SHUTDOWN, 0x00);
>> +	}
> 
> You need a mutex protection in this function, so as to prevent other
> processes from jumping in in the middle of setting up a brightness,
> which requires writing several registers.

Uh?
I thought that registering is31fl319x_brightness_set as 
led_cdev.brightness_set_blocking
does the trick that we don't need a private mutex here because it
can be called only once anyways. At least that was suggested during v1 review.

> 
>> +	return ret;
>> +}
>> +
>> +static struct led_info *
>> +is31fl319x_parse_dt(struct i2c_client *client, int num_leds)
>> +{
>> +	struct device_node *np = client->dev.of_node, *child;
>> +	struct led_info *is31_leds;
>> +	int count;
>> +
>> +	if (!np)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	count = of_get_child_count(np);
>> +	dev_dbg(&client->dev, "child count %d\n", count);
>> +	if (!count || count > NUM_LEDS)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	is31_leds = devm_kzalloc(&client->dev,
>> +			sizeof(struct led_info) * NUM_LEDS, GFP_KERNEL);
>> +	if (!is31_leds)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	for_each_child_of_node(np, child) {
>> +		struct led_info led;
> 
> Using this local variable adds too much noise here.
> I suggest avoiding the use of struct led_info. It is semantically
> inconsistent in the context of DT parsing, since you don't have
> any flags to parse.
> 
>> +		u32 reg;
>> +		int ret;
>> +
>> +		led.name = NULL;
>> +		ret = of_property_read_string(child, "label", &led.name);
>> +		if (ret < 0 && ret != -EINVAL)	/* is optional */
>> +			return ERR_PTR(ret);
> 
> You could assign the name directly to related struct led_classdev
> property. Moreover, if label is not present the child node name
> should be used for LED class device name. Please refer to the other
> drivers and common LED bindings.

Ok.

> 
>> +		led.default_trigger = NULL;
>> +		ret = of_property_read_string(child, "linux,default-trigger",
>> +			&led.default_trigger);
> 
> Here also please assign the trigger directly to struct led_classdev.

Ok.

> 
>> +		if (ret < 0 && ret != -EINVAL)	/* is optional */
>> +			return ERR_PTR(ret);
>> +		led.flags = 0;
>> +		ret = of_property_read_u32(child, "reg", &reg);
>> +		dev_dbg(&client->dev, "name = %s reg = %d\n", led.name, reg);
>> +		reg -= 1;	/* index 0 is at reg = 1 */
>> +		if (ret != 0 || reg < 0 || reg >= num_leds)
>> +			continue;
>> +
>> +		if (is31_leds[reg].name)
>> +			dev_err(&client->dev, "duplicate led line %d for %s -> %s\n",
>> +				reg, is31_leds[reg].name, led.name);
>> +		is31_leds[reg] = led;
>> +	}
>> +
>> +	return is31_leds;
>> +}
>> +
>> +static const struct of_device_id of_is31fl319x_leds_match[] = {
>> +	{ .compatible = "issi,is31fl3190", (void *) 1 },
>> +	{ .compatible = "issi,is31fl3191", (void *) 1 },
>> +	{ .compatible = "issi,is31fl3193", (void *) 3 },
>> +	{ .compatible = "issi,is31fl3196", (void *) 6 },
>> +	{ .compatible = "issi,is31fl3199", (void *) 9 },
>> +	{ .compatible = "si-en,sn3199", (void *) 9 },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, of_is31fl319x_leds_match);
>> +
>> +static bool is31fl319x_readable_reg(struct device *dev, unsigned int reg)
>> +{ /* we have no readable registers */
>> +	return false;
>> +}
>> +
>> +static bool is31fl319x_volatile_reg(struct device *dev, unsigned int reg)
>> +{ /* volatile registers are not cached */
>> +	switch (reg) {
>> +	case IS31FL319X_DATA_UPDATE:
>> +	case IS31FL319X_TIME_UPDATE:
>> +	case IS31FL319X_RESET:
>> +		return true;	/* always write-through */
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +struct regmap_config regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.max_register = IS31FL319X_REG_CNT,
>> +	.cache_type = REGCACHE_FLAT,
>> +	.readable_reg = is31fl319x_readable_reg,
>> +	.volatile_reg = is31fl319x_volatile_reg,
>> +};
>> +
>> +static int is31fl319x_probe(struct i2c_client *client,
>> +		const struct i2c_device_id *id)
>> +{
>> +	struct is31fl319x_chip *is31;
>> +	struct i2c_adapter *adapter;
>> +	struct led_info *leds;
>> +	int err;
>> +	int i = 0;
>> +
>> +	adapter = to_i2c_adapter(client->dev.parent);
>> +
>> +	dev_dbg(&client->dev, "probe IS31FL319x for num_leds = %d\n",
>> +		(int) id->driver_data);
>> +
>> +	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
>> +		return -EIO;
>> +
>> +	leds = is31fl319x_parse_dt(client, (int) id->driver_data);
>> +	if (IS_ERR(leds)) {
>> +		dev_err(&client->dev, "DT parsing error %d\n",
>> +			(int) PTR_ERR(leds));
>> +		return PTR_ERR(leds);
>> +	}
>> +
>> +	is31 = devm_kzalloc(&client->dev, sizeof(*is31), GFP_KERNEL);
>> +	if (!is31)
>> +		return -ENOMEM;
>> +
>> +	is31->client = client;
>> +	is31->regmap = devm_regmap_init_i2c(client, &regmap_config);
>> +	if (IS_ERR(is31->regmap)) {
>> +		dev_err(&client->dev, "failed to allocate register map\n");
>> +		return PTR_ERR(is31->regmap);
>> +	}
>> +
>> +	i2c_set_clientdata(client, is31);
>> +
>> +	/* check for write-reply from chip (we can't read any registers) */
>> +	err = regmap_write(is31->regmap, IS31FL319X_RESET, 0x00);
> 
> Doesn't powering the device up result in loading registers with default
> values?

Yes, but not a reboot.

And we have to write *some* register anyways here to be able to detect
if the chip is present or does not respond.

So what would writing a different register change?

> 
>> +	if (err < 0) {
>> +		dev_err(&client->dev, "no response from chip write: err = %d\n",
>> +			err);
>> +		return -EIO;	/* does not answer */
>> +	}
>> +
>> +	/* initialize chip and regmap so that we never try to read from i2c */
> 
> You can initialize default register values without writing them,
> by using regmap's reg_defaults property.

Hm,

> 
>> +	regmap_write(is31->regmap, IS31FL319X_CTRL1, 0x00);
>> +	regmap_write(is31->regmap, IS31FL319X_CTRL2, 0x00);
>> +	for (i = 0; i < NUM_LEDS; i++)
>> +		regmap_write(is31->regmap, IS31FL319X_PWM1 + i, 0x00);

would replace a small loop with a bigger table. But if you prefer this I can change.

>> +
>> +	if (client->dev.of_node) {
>> +		u32 val;
>> +		u8 config2 = 0;
>> +
>> +		if (of_property_read_u32(client->dev.of_node,
>> +					 "led-max-microamp", &val)) {
> 
> of_property_read_u32 returns 0 on success.

Ok.

> 
> led-max-microamp needs to be defined per each sub-LED (child node).
> The greatest value should be used for setting CS bit field of CTRL2
> register, and max_brightness values of the LEDs with lower max microamp
> value should be limited accordingly.

Hm. The chip does not allow to limit individual LEDs. So we should take the
*minimum* of all subnodes.

> 
> Moreover, this is still DT parsing and should find its place in
> is31fl319x_parse_dt().
> 
>> +			if (val > 40000)
>> +				val = 40000;
>> +			if (val < 5000)
>> +				val = 5000;
>> +			config2 |= (((64000 - val) / 5000) & 0x7) << 4; /* CS */
>> +		}
>> +		if (of_property_read_u32(client->dev.of_node, "audio-gain-db",
>> +					 &val)) {
> 
> Please move this to is31fl319x_parse_dt().

Well, the main reason is that this needs to introduce another temporary struct
to pass values from parse_dt to probe and copy values there.

Would it be acceptable to inline all DT parsing?

> 
>> +			if (val > 21)
>> +				val = 21;
>> +			config2 |= val / 3; /* AGS */
>> +		}
>> +		regmap_write(is31->regmap, IS31FL319X_CONFIG2, config2);
>> +	}
>> +
>> +	for (i = 0; i < NUM_LEDS; i++) {
>> +		struct is31fl319x_led *l = is31->leds + i;
>> +
>> +		l->chip = is31;
>> +		if (leds[i].name && !leds[i].flags) {
>> +			l->led_cdev.name = leds[i].name;
>> +			l->led_cdev.default_trigger
>> +				= leds[i].default_trigger;
>> +			l->led_cdev.brightness_set_blocking
>> +				= is31fl319x_brightness_set;
>> +			/* NOTE: is31fl319x_brightness_set will be called
>> +			 * immediately after register() before we return
>> +			 */
> 
> Who will call it? I believe that this is true only if default-on
> trigger is registered.

Yes, as soon as anyone can call it we must be aware.

> 
>> +			err = devm_led_classdev_register(&client->dev,
>> +						    &l->led_cdev);
>> +			if (err < 0)
>> +				return err;
>> +		}
>> +	}
>> +
>> +	dev_dbg(&client->dev, "probed\n");
> 
> Please remove this debug log. You can verify it by checking presence of
> the device in the sysfs.

Ok.

> 
>> +	return 0;
>> +}
>> +
>> +static struct i2c_driver is31fl319x_driver = {
>> +	.driver   = {
>> +		.name    = "leds-is31fl319x",
>> +		.of_match_table = of_match_ptr(of_is31fl319x_leds_match),
>> +	},
>> +	.probe    = is31fl319x_probe,
>> +	.id_table = is31fl319x_id,
>> +};
>> +
>> +module_i2c_driver(is31fl319x_driver);
>> +
>> +MODULE_AUTHOR("H. Nikolaus Schaller <hns@goldelico.com>");
>> +MODULE_DESCRIPTION("IS31FL319X LED driver");
>> +MODULE_LICENSE("GPL v2");
>> 
> 
> 
> -- 
> Best regards,
> Jacek Anaszewski

Will fix asap.

Thanks and BR,
Nikolaus Schaller
