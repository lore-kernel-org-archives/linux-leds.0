From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 1/2] drivers: led: is31fl319x: 1/3/6/9-channel light effect led driver
Date: Wed, 13 Jul 2016 08:09:21 +0200
Message-ID: <55F90A44-0B60-4342-8143-56F85EA24772@goldelico.com>
References: <cover.1468007377.git.hns@goldelico.com> <524f16ecba240bacf57924f43ec38404cfdcde8f.1468007377.git.hns@goldelico.com> <57854FB0.1080605@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57854FB0.1080605@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,
Andrey already has worked in your comments but there is one topic
for discussion (see below) before we submit v4.

> Am 12.07.2016 um 22:14 schrieb Jacek Anaszewski <jacek.anaszewski@gmail.com>:
> 
> Hi Nikolaus,
> 
> Thanks for the update.
> 
> On 07/08/2016 09:49 PM, H. Nikolaus Schaller wrote:
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
>> Signed-off-by: Andrey Utkin <andrey_utkin@fastmail.com>
>> ---
>>  drivers/leds/Kconfig           |  12 ++
>>  drivers/leds/Makefile          |   1 +
>>  drivers/leds/leds-is31fl319x.c | 405 +++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 418 insertions(+)
>>  create mode 100644 drivers/leds/leds-is31fl319x.c
>> 
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 5ae2834..6439a7d 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -570,6 +570,18 @@ config LEDS_SEAD3
>>  	  This driver can also be built as a module. If so the module
>>  	  will be called leds-sead3.
>> 
>> +config LEDS_IS31FL319X
>> +	tristate "LED Support for ISSI IS31FL319x I2C LED controller family"
>> +	depends on LEDS_CLASS && I2C && OF
>> +	select REGMAP_I2C
>> +	help
>> +	  This option enables support for LEDs connected to ISSI IS31FL319x
>> +	  fancy LED driver chips accessed via the I2C bus.
>> +	  Driver supports individual PWM brightness control for each channel.
>> +
>> +	  This driver can also be built as a module. If so the module will be
>> +	  called leds-is31fl319x.
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
>> index 0000000..7fc5c6ab
>> --- /dev/null
>> +++ b/drivers/leds/leds-is31fl319x.c
>> @@ -0,0 +1,405 @@
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
>> + * LED driver for the IS31FL319{0,1,3,6,9} to drive 1, 3, 6 or 9 light
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
>> +#define IS31FL319X_SHUTDOWN     0x00
>> +#define IS31FL319X_CTRL1        0x01
>> +#define IS31FL319X_CTRL2        0x02
>> +#define IS31FL319X_CONFIG1      0x03
>> +#define IS31FL319X_CONFIG2      0x04
>> +#define IS31FL319X_RAMP_MODE    0x05
>> +#define IS31FL319X_BREATH_MASK  0x06
>> +#define IS31FL319X_PWM(channel) (0x07 + channel)
>> +#define IS31FL319X_DATA_UPDATE  0x10
>> +#define IS31FL319X_T0(channel)  (0x11 + channel)
>> +#define IS31FL319X_T123_1       0x1a
>> +#define IS31FL319X_T123_2       0x1b
>> +#define IS31FL319X_T123_3       0x1c
>> +#define IS31FL319X_T4(channel)  (0x1d + channel)
>> +#define IS31FL319X_TIME_UPDATE  0x26
>> +#define IS31FL319X_RESET        0xff
>> +
>> +#define IS31FL319X_REG_CNT      (IS31FL319X_RESET + 1)
>> +
>> +#define NUM_LEDS 9 /* max for 3199 chip */
> 
> Add namespacing prefix also to this macro.
> 
>> +
>> +#define LED_MAX_MICROAMP_UPPER_LIMIT ((u32) 40000)
>> +#define LED_MAX_MICROAMP_LOWER_LIMIT ((u32) 5000)
>> +#define LED_MAX_MICROAMP_DEFAULT ((u32) 20000)
>> +#define LED_MAX_MICROAMP_STEP ((u32) 5000)
> 
> Ditto.
> 
>> +
>> +#define AUDIO_GAIN_DB_MAX ((u32) 21)
> 
> Ditto.
> 
>> +
>> +/*
>> + * regmap is used as a cache of chip's register space,
>> + * to avoid reading back brightness values from chip,
>> + * which is known to hang.
>> + */
>> +struct is31fl319x_chip {
>> +	struct i2c_client       *client;
>> +	struct regmap           *regmap;
>> +	struct mutex            lock;
>> +	u32                     audio_gain_db;
>> +
>> +	struct is31fl319x_led {
>> +		struct is31fl319x_chip  *chip;
>> +		struct led_classdev     cdev;
>> +		u32                     max_microamp;
>> +		bool                    configured;
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
> 
> This is redundant - you have this info in of_is31fl319x_leds_match,
> and you can obtain it with of_match_device().
> Please compare drivers/leds/leds-is31fl32xx.c.

Ah, I see. We now have a DT only driver.

> 
>> +static int is31fl319x_brightness_set(struct led_classdev *cdev,
>> +				   enum led_brightness brightness)
>> +{
>> +	struct is31fl319x_led *led = container_of(cdev, struct is31fl319x_led,
>> +						  cdev);
>> +	struct is31fl319x_chip *is31 = led->chip;
>> +	int chan = led - is31->leds;
>> +	int ret;
>> +	int i;
>> +	u8 ctrl1 = 0, ctrl2 = 0;
>> +
>> +	dev_dbg(&is31->client->dev, "%s %d: %d\n", __func__, chan, brightness);
> 
> It would be more useful after mutex IMO.
> 
>> +
>> +	mutex_lock(&is31->lock);
>> +
>> +	/* update PWM register */
>> +	ret = regmap_write(is31->regmap, IS31FL319X_PWM(chan), brightness);
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	/* read current brightness of all PWM channels */
>> +	for (i = 0; i < NUM_LEDS; i++) {
>> +		unsigned int pwm_value;
>> +		bool on;
>> +
>> +		/*
>> +		 * since neither cdev nor the chip can provide
>> +		 * the current setting, we read from the regmap cache
>> +		 */
>> +
>> +		ret = regmap_read(is31->regmap, IS31FL319X_PWM(i), &pwm_value);
>> +		dev_dbg(&is31->client->dev, "%s read %d: ret=%d: %d\n",
>> +			__func__, i, ret, pwm_value);
>> +		on = ret >= 0 && pwm_value > LED_OFF;
>> +
>> +		if (i < 3)
>> +			ctrl1 |= on << i;     /* 0..2 => bit 0..2 */
>> +		else if (i < 6)
>> +			ctrl1 |= on << (i+1); /* 3..5 => bit 4..6 */
>> +		else
>> +			ctrl2 |= on << (i-6); /* 6..8 => bit 0..2 */
>> +	}
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
>> +
>> +out:
>> +	mutex_unlock(&is31->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int is31fl319x_parse_child_dt(const struct device *dev,
>> +				     const struct device_node *child,
>> +				     struct is31fl319x_led *led)
>> +{
>> +	struct led_classdev *cdev = &led->cdev;
>> +	int ret;
>> +
>> +	if (of_property_read_string(child, "label", &cdev->name))
>> +		cdev->name = child->name;
>> +
>> +	cdev->default_trigger = NULL;
> 
> It was already zeroed by devm_kzalloc.
> 
>> +	ret = of_property_read_string(child, "linux,default-trigger",
>> +		&cdev->default_trigger);
>> +	if (ret < 0 && ret != -EINVAL) /* is optional */
>> +		return ret;
>> +
>> +	led->max_microamp = LED_MAX_MICROAMP_DEFAULT;
>> +	ret = of_property_read_u32(child, "led-max-microamp",
>> +				   &led->max_microamp);
>> +	if (!ret) {
>> +		led->max_microamp = clamp(led->max_microamp,
>> +					  LED_MAX_MICROAMP_LOWER_LIMIT,
>> +					  LED_MAX_MICROAMP_UPPER_LIMIT);
>> +		led->max_microamp -= led->max_microamp % LED_MAX_MICROAMP_STEP;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int is31fl319x_parse_dt(struct device *dev,
>> +			       struct is31fl319x_chip *is31)
>> +{
>> +	struct device_node *np = dev->of_node, *child;
>> +	struct led_info *is31_leds;
> 
> You don't need it anymore.
> 
>> +	int count;
>> +	int ret;
>> +
>> +	if (!np)
>> +		return -ENODEV;
>> +
>> +	count = of_get_child_count(np);
> 
> count is not used anywhere.
> 
>> +
>> +	dev_dbg(dev, "child count %d\n", count);
>> +	if (!count || count > NUM_LEDS)
>> +		return -ENODEV;
>> +
>> +	is31_leds = devm_kzalloc(dev, sizeof(struct led_info) * NUM_LEDS,
>> +				 GFP_KERNEL);
>> +	if (!is31_leds)
>> +		return -ENOMEM;
> 
> is31_leds is not used anywhere.
> 
>> +
>> +	for_each_child_of_node(np, child) {
>> +		struct is31fl319x_led *led;
>> +		u32 reg;
>> +
>> +		ret = of_property_read_u32(child, "reg", &reg);
>> +		if (ret)
>> +			break;
>> +
>> +		if (reg < 1 || reg > NUM_LEDS) {
>> +			dev_err(dev, "invalid led reg %u\n", reg);
>> +			ret = -EINVAL;
> 
> You need to call of_node_put(child) when interrupting this loop.
> Please add err label at the end:
> 
> err:
>        of_node_put(child);
>        return ret;
> 
> and goto err from here.
> 
> 
>> +			break;
>> +		}
>> +
>> +		led = &is31->leds[reg - 1];
>> +
>> +		if (led->configured) {
>> +			dev_err(dev, "led %u is already configured\n", reg);
>> +			ret = -EINVAL;
> 
> Ditto.
> 
>> +			break;
>> +		}
>> +
>> +		ret = is31fl319x_parse_child_dt(dev, child, led);
>> +		if (ret) {
>> +			dev_err(dev, "led %u DT parsing failed\n", reg);
> 
> Ditto.
> 
>> +			break;
>> +		}
>> +
>> +		led->configured = true;
>> +	}
>> +	if (ret) {
>> +		dev_err(dev, "DT child nodes parsing failed, error %d\n", ret);
>> +		return ret;
>> +	}
> 
> This will be redundant then.
> 
>> +	is31->audio_gain_db = 0;
>> +	ret = of_property_read_u32(np, "audio-gain-db", &is31->audio_gain_db);
>> +	if (!ret) {
>> +		is31->audio_gain_db = min(is31->audio_gain_db,
>> +					  AUDIO_GAIN_DB_MAX);
>> +		is31->audio_gain_db -= is31->audio_gain_db % 3;
>> +	}
>> +
>> +	return 0;
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
>> +		return true; /* always write-through */
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static const struct reg_default is31fl319x_reg_defaults[] = {
>> +	{ IS31FL319X_CONFIG1, 0x00},
>> +	{ IS31FL319X_CONFIG2, 0x00},
>> +	{ IS31FL319X_PWM(0), 0x00},
>> +	{ IS31FL319X_PWM(1), 0x00},
>> +	{ IS31FL319X_PWM(2), 0x00},
>> +	{ IS31FL319X_PWM(3), 0x00},
>> +	{ IS31FL319X_PWM(4), 0x00},
>> +	{ IS31FL319X_PWM(5), 0x00},
>> +	{ IS31FL319X_PWM(6), 0x00},
>> +	{ IS31FL319X_PWM(7), 0x00},
>> +	{ IS31FL319X_PWM(8), 0x00},
>> +};
>> +
>> +static struct regmap_config regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.max_register = IS31FL319X_REG_CNT,
>> +	.cache_type = REGCACHE_FLAT,
>> +	.readable_reg = is31fl319x_readable_reg,
>> +	.volatile_reg = is31fl319x_volatile_reg,
>> +	.reg_defaults = is31fl319x_reg_defaults,
>> +	.num_reg_defaults = ARRAY_SIZE(is31fl319x_reg_defaults),
>> +};
>> +
>> +static int is31fl319x_microamp_to_cs(u32 microamp)
>> +{
>> +	switch (microamp) {
>> +	default:
>> +		WARN(1, "Invalid microamp setting");
> 
> Please move "default" case to the bottom of the switch,
> and replace WARN with dev_warn.
> 
>> +	case 20000: return 0;
>> +	case 15000: return 1;
>> +	case 10000: return 2;
>> +	case 5000:  return 3;
>> +	case 40000: return 4;
>> +	case 35000: return 5;
>> +	case 30000: return 6;
>> +	case 25000: return 7;
>> +	}
>> +}
>> +
>> +static int is31fl319x_probe(struct i2c_client *client,
>> +		const struct i2c_device_id *id)
>> +{
>> +	struct is31fl319x_chip *is31;
>> +	struct i2c_adapter *adapter;
>> +	int err;
>> +	int i = 0;
>> +	u32 aggregated_led_microamp = LED_MAX_MICROAMP_UPPER_LIMIT;
>> +
>> +	adapter = to_i2c_adapter(client->dev.parent);
>> +
>> +	dev_dbg(&client->dev, "probe IS31FL319x for num_leds = %d\n",
>> +		(int) id->driver_data);
>> +
>> +	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
>> +		return -EIO;
>> +
>> +	is31 = devm_kzalloc(&client->dev, sizeof(*is31), GFP_KERNEL);
>> +	if (!is31)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&is31->lock);
> 
> You will have to bring back "remove" op now to call mutex_destroy on
> remove.
> 
>> +
>> +	err = is31fl319x_parse_dt(&client->dev, is31);
>> +	if (err) {
>> +		dev_err(&client->dev, "DT parsing error %d\n", err);
> 
> You have similar logging in is31fl319x_parse_dt().
> 
>> +		return err;
>> +	}
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
>> +	if (err < 0) {
>> +		dev_err(&client->dev, "no response from chip write: err = %d\n",
>> +			err);
>> +		return -EIO; /* does not answer */
>> +	}
>> +
>> +	/*
>> +	 * Kernel conventions require per-LED led-max-microamp property.
>> +	 * But the chip does not allow to limit individual LEDs.
>> +	 * So we take minimum from all subnodes.
> 
> Why minimum? Choose maximum and reduce max_brightness properties
> of the sub-LEDs with lesser led-max-microamp.

Hm. Is this really the correct way to handle it?

Assume you connect an LED which is specified with 10mA peak current.
And another with 20mA peak current.

So you define led-max-microamp in the DT as 10 mA and 20 mA.

Firstly a user can set the brightness only to 50% of LED_FULL since it is limited
by a reduced max_brightness. And heshe finds that not all LEDs have the same
max_brightness. The first LED will have 127 and the second one 255 for reasons
not directly understandable.

This entangles "brightness" with "max-current" - which are IMHO two independent
things.

Next, this will set the hardware limit to 20 mA. So there will be current peaks
of 20 mA for an LED where the DT developer thinks to have specified a led-max-microamp
of 10 mA. So you run the LED outside of its specs although the DT seems to
tell that it is inside and user-space thinks it is ok. This will reduce lifetime of LEDs.

So either "led-max-microamp" is the wrong name for this property (could better
be "led-max-average-microamp") or the whole logic is broken.

This is why we hesitate to hide (or even disable because you can't set the limit
to 10mA by DT) the current limiting chip feature by such a difficult to understand
automatic feature.

Using the minimum of all led-max-microamp keeps everything on the safe
side, running some LEDs with less current than specified. But never outside
of the spec. And all LEDs have the same max_brightness which is IMHO
more intuitive for the user.

Our original proposal was to define led-max-microamp for the whole chip
instead of individual LEDs, which is IMHO much easier to understand,
because it corresponds one-to-one with the data sheet.

> 
>> +	 */
>> +	for (i = 0; i < NUM_LEDS; i++)
>> +		if (is31->leds[i].configured &&
>> +		    is31->leds[i].max_microamp < aggregated_led_microamp)
>> +			aggregated_led_microamp = is31->leds[i].max_microamp;
>> +
>> +	regmap_write(is31->regmap, IS31FL319X_CONFIG2,
>> +		     is31fl319x_microamp_to_cs(aggregated_led_microamp) << 4 |
> 
> Please add *SHIFT* macro definition for 4.
> 
>> +		     is31->audio_gain_db / 3);
>> +
>> +	for (i = 0; i < NUM_LEDS; i++) {
>> +		struct is31fl319x_led *led = &is31->leds[i];
>> +
>> +		if (!led->configured)
>> +			continue;
>> +
>> +		led->chip = is31;
>> +		led->cdev.brightness_set_blocking = is31fl319x_brightness_set;
>> +
>> +		err = devm_led_classdev_register(&client->dev, &led->cdev);
>> +		if (err < 0)
>> +			return err;
>> +	}
>> +
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
>> +MODULE_AUTHOR("Andrey Utkin <andrey_utkin@fastmail.com>");
>> +MODULE_DESCRIPTION("IS31FL319X LED driver");
>> +MODULE_LICENSE("GPL v2");
>> 
> 
> -- 
> Best regards,
> Jacek Anaszewski

BR and thanks,
Nikolaus
