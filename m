From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 4/4] leds: Replace dedicated SN3218 driver with IS31FL32XX
 driver
Date: Sat, 5 Mar 2016 12:37:52 +0100
Message-ID: <56DAC510.1090709@gmail.com>
References: <1456974095-1867-1-git-send-email-drivshin.allworx@gmail.com>
 <1456974095-1867-5-git-send-email-drivshin.allworx@gmail.com>
 <56D84F78.2050901@samsung.com>
 <20160305003429.12e08aa5.drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36278 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755015AbcCELiV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 5 Mar 2016 06:38:21 -0500
In-Reply-To: <20160305003429.12e08aa5.drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org

On 03/05/2016 06:34 AM, David Rivshin (Allworx) wrote:
> On Thu, 03 Mar 2016 15:51:36 +0100
> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>
>> Hi David,
>>
>> I'll wait for Tested-by from Stefan before applying this patch.
>> If Stefan will have managed to test your driver with his hardware
>> by the end of this cycle, it will suffice for this patch to contain
>> only leds-is31fl32xx extension part.
>>
>> leds-sn3218 hasn't been merged to mainline yet, so I'd rather
>> remove it when I get Tested-by from Stefan.
>>
>> Otherwise, I will send leds-sn3218 to Linus, and this patch
>> will be applied after being tested, during 4.7 cycle.
>
> Since Stefan has given his Tested-by, do I understand correctly
> that you would prefer to:
>   - revert sn3218 patches 2 and 3 yourself
>   - have me provide v2 patches that would apply ontop of that

Correct.

> If so, should I do as Rob suggests and fold the sn3216/3218 bits into
> the earlier patches, or leave it as a 4th patch? I'd probably prefer
> the former as being an easier workflow (less "rebase -i"ing).

I think that it would be more striking if leds-sn3218 specific
compatible would be added both to the driver and the documentation
as separate patches. Separate commit description would highlight
the reasons for which the same driver supports compatibles with
different vendor prefixes.

> And should I base off v4.5-rc6 at that point, or your for-next minus
> those patches?

I like the latter option. I'll do the same - will drop leds-sn3218
patches and apply yours.

> The only difference should be a 1-line offset in the
> vendor-prefixes.txt hunk. Either way is equally easy for me.
>
>>
>> Thanks,
>> Jacek Anaszewski
>>
>> On 03/03/2016 04:01 AM, David Rivshin (Allworx) wrote:
>>> From: David Rivshin <drivshin@allworx.com>
>>>
>>> Si-En Technology was acquired by ISSI in 2011, and it appears that
>>> the IS31FL3218/IS31FL3216 are just rebranded SN3218/SN3216 devices.
>>> As the IS31FL32XX driver already handles the *3218 devices, there
>>> is no longer a need for the dedicated SN3218 driver.
>>>
>>> Add the "sn,sn3218" and "sn,sn3216" compatible strings into the
>>> IS31FL32XX driver and binding documentation, and remove the
>>> leds-sn3218 driver.
>>>
>>> Datasheets:
>>>       IS31FL3218: http://www.issi.com/WW/pdf/31FL3218.pdf
>>>       SN3218:     http://www.si-en.com/uploadpdf/s2011517171720.pdf
>>>
>>>       IS31FL3216: http://www.issi.com/WW/pdf/31FL3216.pdf
>>>       SN3216;     http://www.si-en.com/uploadpdf/SN3216201152410148.pdf
>>>
>>> Signed-off-by: David Rivshin <drivshin@allworx.com>
>>> ---
>>>
>>> Note that the leds-sn3218 binding use a 0-based 'reg' property, while
>>> the leds-is31fl32xx binding uses a 1-based 'reg' property. This seemed
>>> to be the preferred binding based on [1]. Since leds-sn3216 has not been
>>> in a released kernel, there is are no backwards-compatibility concerns.
>>>
>>> Changes from RFC:
>>>    new
>>>
>>> [1] http://www.spinics.net/lists/linux-leds/msg05589.html
>>>
>>>    .../devicetree/bindings/leds/leds-is31fl32xx.txt   |   9 +-
>>>    .../devicetree/bindings/leds/leds-sn3218.txt       |  41 ---
>>>    drivers/leds/Kconfig                               |  18 +-
>>>    drivers/leds/Makefile                              |   1 -
>>>    drivers/leds/leds-is31fl32xx.c                     |   6 +-
>>>    drivers/leds/leds-sn3218.c                         | 306 ---------------------
>>>    6 files changed, 14 insertions(+), 367 deletions(-)
>>>    delete mode 100644 Documentation/devicetree/bindings/leds/leds-sn3218.txt
>>>    delete mode 100644 drivers/leds/leds-sn3218.c
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
>>> index 539df2e..c59eb1a 100644
>>> --- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
>>> +++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
>>> @@ -1,6 +1,6 @@
>>> -Binding for ISSI IS31FL32xx LED Drivers
>>> +Binding for ISSI IS31FL32xx and Si-En SN32xx LED Drivers
>>>
>>> -The IS31FL32xx family of LED drivers are I2C devices with multiple
>>> +The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
>>>    constant-current channels, each with independent 256-level PWM control.
>>>    Each LED is represented as a sub-node of the device.
>>>
>>> @@ -10,6 +10,8 @@ Required properties:
>>>    	issi,is31fl3235
>>>    	issi,is31fl3218
>>>    	issi,is31fl3216
>>> +	si-en,sn3218
>>> +	si-en,sn3216
>>>    - reg: I2C slave address
>>>    - address-cells : must be 1
>>>    - size-cells : must be 0
>>> @@ -45,5 +47,6 @@ leds: is31fl3236@3c {
>>>    	};
>>>    };
>>>
>>> -For more product information please see the link below:
>>> +For more product information please see the links below:
>>>    http://www.issi.com/US/product-analog-fxled-driver.shtml
>>> +http://www.si-en.com/product.asp?parentid=890
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-sn3218.txt b/Documentation/devicetree/bindings/leds/leds-sn3218.txt
>>> deleted file mode 100644
>>> index 19cbf57..0000000
>>> --- a/Documentation/devicetree/bindings/leds/leds-sn3218.txt
>>> +++ /dev/null
>>> @@ -1,41 +0,0 @@
>>> -* Si-En Technology - SN3218 18-Channel LED Driver
>>> -
>>> -Required properties:
>>> -- compatible :
>>> -	"si-en,sn3218"
>>> -- address-cells : must be 1
>>> -- size-cells : must be 0
>>> -- reg : I2C slave address, typically 0x54
>>> -
>>> -There must be at least 1 LED which is represented as a sub-node
>>> -of the sn3218 device.
>>> -
>>> -LED sub-node properties:
>>> -- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
>>> -- reg : number of LED line (could be from 0 to 17)
>>> -- linux,default-trigger : (optional)
>>> -   see Documentation/devicetree/bindings/leds/common.txt
>>> -
>>> -Example:
>>> -
>>> -sn3218: led-controller@54 {
>>> -	compatible = "si-en,sn3218";
>>> -	#address-cells = <1>;
>>> -	#size-cells = <0>;
>>> -	reg = <0x54>;
>>> -
>>> -	led@0 {
>>> -		label = "led1";
>>> -		reg = <0x0>;
>>> -	};
>>> -
>>> -	led@1 {
>>> -		label = "led2";
>>> -		reg = <0x1>;
>>> -	};
>>> -
>>> -	led@2 {
>>> -		label = "led3";
>>> -		reg = <0x2>;
>>> -	};
>>> -};
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 9c63ba4..1f64151 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -568,25 +568,13 @@ config LEDS_SEAD3
>>>    	  This driver can also be built as a module. If so the module
>>>    	  will be called leds-sead3.
>>>
>>> -config LEDS_SN3218
>>> -	tristate "LED support for Si-En SN3218 I2C chip"
>>> -	depends on LEDS_CLASS && I2C
>>> -	depends on OF
>>> -	select REGMAP_I2C
>>> -	help
>>> -	  This option enables support for the Si-EN SN3218 LED driver
>>> -	  connected through I2C. Say Y to enable support for the SN3218 LED.
>>> -
>>> -	  This driver can also be built as a module. If so the module
>>> -	  will be called leds-sn3218.
>>> -
>>>    config LEDS_IS31FL32XX
>>>    	tristate "LED support for ISSI IS31FL32XX I2C LED controller family"
>>>    	depends on LEDS_CLASS && I2C && OF
>>>    	help
>>> -	  Say Y here to include support for ISSI IS31FL32XX LED controllers.
>>> -	  They are I2C devices with multiple constant-current channels, each
>>> -	  with independent 256-level PWM control.
>>> +	  Say Y here to include support for ISSI IS31FL32XX and Si-En SN32xx
>>> +	  LED controllers. They are I2C devices with multiple constant-current
>>> +	  channels, each with independent 256-level PWM control.
>>>
>>>    comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
>>>
>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>> index 3fdf313..cb2013d 100644
>>> --- a/drivers/leds/Makefile
>>> +++ b/drivers/leds/Makefile
>>> @@ -66,7 +66,6 @@ obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
>>>    obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
>>>    obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
>>>    obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
>>> -obj-$(CONFIG_LEDS_SN3218)		+= leds-sn3218.o
>>>    obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
>>>
>>>    # LED SPI Drivers
>>> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
>>> index 49818f0..ec3f541 100644
>>> --- a/drivers/leds/leds-is31fl32xx.c
>>> +++ b/drivers/leds/leds-is31fl32xx.c
>>> @@ -10,7 +10,9 @@
>>>     * it under the terms of the GNU General Public License version 2 as
>>>     * published by the Free Software Foundation.
>>>     *
>>> - * Datasheets: http://www.issi.com/US/product-analog-fxled-driver.shtml
>>> + * Datasheets:
>>> + *   http://www.issi.com/US/product-analog-fxled-driver.shtml
>>> + *   http://www.si-en.com/product.asp?parentid=890
>>>     */
>>>
>>>    #include <linux/err.h>
>>> @@ -425,7 +427,9 @@ static const struct of_device_id of_is31fl31xx_match[] = {
>>>    	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
>>>    	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
>>>    	{ .compatible = "issi,is31fl3218", .data = &is31fl3218_cdef, },
>>> +	{ .compatible = "si-en,sn3218",    .data = &is31fl3218_cdef, },
>>>    	{ .compatible = "issi,is31fl3216", .data = &is31fl3216_cdef, },
>>> +	{ .compatible = "si-en,sn3216",    .data = &is31fl3216_cdef, },
>>>    	{},
>>>    };
>>>
>>> diff --git a/drivers/leds/leds-sn3218.c b/drivers/leds/leds-sn3218.c
>>> deleted file mode 100644
>>> index dcc2581..0000000
>>> --- a/drivers/leds/leds-sn3218.c
>>> +++ /dev/null
>>> @@ -1,306 +0,0 @@
>>> -/*
>>> - * Si-En SN3218 18 Channel LED Driver
>>> - *
>>> - * Copyright (C) 2016 Stefan Wahren <stefan.wahren@i2se.com>
>>> - *
>>> - * Based on leds-pca963x.c
>>> - *
>>> - * This program is free software; you can redistribute it and/or
>>> - * modify it under the terms of the GNU General Public License
>>> - * version 2 as published by the Free Software Foundation.
>>> - *
>>> - * Datasheet: http://www.si-en.com/uploadpdf/s2011517171720.pdf
>>> - *
>>> - */
>>> -
>>> -#include <linux/err.h>
>>> -#include <linux/i2c.h>
>>> -#include <linux/leds.h>
>>> -#include <linux/module.h>
>>> -#include <linux/of.h>
>>> -#include <linux/regmap.h>
>>> -#include <linux/slab.h>
>>> -
>>> -#define SN3218_MODE		0x00
>>> -#define SN3218_PWM_1		0x01
>>> -#define SN3218_PWM_2		0x02
>>> -#define SN3218_PWM_3		0x03
>>> -#define SN3218_PWM_4		0x04
>>> -#define SN3218_PWM_5		0x05
>>> -#define SN3218_PWM_6		0x06
>>> -#define SN3218_PWM_7		0x07
>>> -#define SN3218_PWM_8		0x08
>>> -#define SN3218_PWM_9		0x09
>>> -#define SN3218_PWM_10		0x0a
>>> -#define SN3218_PWM_11		0x0b
>>> -#define SN3218_PWM_12		0x0c
>>> -#define SN3218_PWM_13		0x0d
>>> -#define SN3218_PWM_14		0x0e
>>> -#define SN3218_PWM_15		0x0f
>>> -#define SN3218_PWM_16		0x10
>>> -#define SN3218_PWM_17		0x11
>>> -#define SN3218_PWM_18		0x12
>>> -#define SN3218_LED_1_6		0x13
>>> -#define SN3218_LED_7_12		0x14
>>> -#define SN3218_LED_13_18	0x15
>>> -#define SN3218_UPDATE		0x16	/* applies to reg 0x01 .. 0x15 */
>>> -#define SN3218_RESET		0x17
>>> -
>>> -#define SN3218_LED_MASK		0x3f
>>> -#define SN3218_LED_ON		0x01
>>> -#define SN3218_LED_OFF		0x00
>>> -
>>> -#define SN3218_MODE_SHUTDOWN	0x00
>>> -#define SN3218_MODE_NORMAL	0x01
>>> -
>>> -#define NUM_LEDS		18
>>> -
>>> -struct sn3218_led;
>>> -
>>> -/**
>>> - * struct sn3218 -
>>> - * @client - Pointer to the I2C client
>>> - * @leds - Pointer to the individual LEDs
>>> - * @num_leds - Actual number of LEDs
>>> -**/
>>> -struct sn3218 {
>>> -	struct i2c_client *client;
>>> -	struct regmap *regmap;
>>> -	struct sn3218_led *leds;
>>> -	int num_leds;
>>> -};
>>> -
>>> -/**
>>> - * struct sn3218_led -
>>> - * @chip - Pointer to the container
>>> - * @led_cdev - led class device pointer
>>> - * @led_num - LED index ( 0 .. 17 )
>>> -**/
>>> -struct sn3218_led {
>>> -	struct sn3218 *chip;
>>> -	struct led_classdev led_cdev;
>>> -	int led_num;
>>> -};
>>> -
>>> -static int sn3218_led_set(struct led_classdev *led_cdev,
>>> -			  enum led_brightness brightness)
>>> -{
>>> -	struct sn3218_led *led =
>>> -			container_of(led_cdev, struct sn3218_led, led_cdev);
>>> -	struct regmap *regmap = led->chip->regmap;
>>> -	u8 bank = led->led_num / 6;
>>> -	u8 mask = 0x1 << (led->led_num % 6);
>>> -	u8 val;
>>> -	int ret;
>>> -
>>> -	if (brightness == LED_OFF)
>>> -		val = 0;
>>> -	else
>>> -		val = mask;
>>> -
>>> -	ret = regmap_update_bits(regmap, SN3218_LED_1_6 + bank, mask, val);
>>> -	if (ret < 0)
>>> -		return ret;
>>> -
>>> -	if (brightness > LED_OFF) {
>>> -		ret = regmap_write(regmap, SN3218_PWM_1 + led->led_num,
>>> -				   brightness);
>>> -		if (ret < 0)
>>> -			return ret;
>>> -	}
>>> -
>>> -	ret = regmap_write(regmap, SN3218_UPDATE, 0xff);
>>> -
>>> -	return ret;
>>> -}
>>> -
>>> -static void sn3218_led_init(struct sn3218 *sn3218, struct device_node *node,
>>> -			    u32 reg)
>>> -{
>>> -	struct sn3218_led *leds = sn3218->leds;
>>> -	struct led_classdev *cdev = &leds[reg].led_cdev;
>>> -
>>> -	leds[reg].led_num = reg;
>>> -	leds[reg].chip = sn3218;
>>> -
>>> -	if (of_property_read_string(node, "label", &cdev->name))
>>> -		cdev->name = node->name;
>>> -
>>> -	of_property_read_string(node, "linux,default-trigger",
>>> -				&cdev->default_trigger);
>>> -
>>> -	cdev->brightness_set_blocking = sn3218_led_set;
>>> -}
>>> -
>>> -static const struct reg_default sn3218_reg_defs[] = {
>>> -	{ SN3218_MODE, 0x00},
>>> -	{ SN3218_PWM_1, 0x00},
>>> -	{ SN3218_PWM_2, 0x00},
>>> -	{ SN3218_PWM_3, 0x00},
>>> -	{ SN3218_PWM_4, 0x00},
>>> -	{ SN3218_PWM_5, 0x00},
>>> -	{ SN3218_PWM_6, 0x00},
>>> -	{ SN3218_PWM_7, 0x00},
>>> -	{ SN3218_PWM_8, 0x00},
>>> -	{ SN3218_PWM_9, 0x00},
>>> -	{ SN3218_PWM_10, 0x00},
>>> -	{ SN3218_PWM_11, 0x00},
>>> -	{ SN3218_PWM_12, 0x00},
>>> -	{ SN3218_PWM_13, 0x00},
>>> -	{ SN3218_PWM_14, 0x00},
>>> -	{ SN3218_PWM_15, 0x00},
>>> -	{ SN3218_PWM_16, 0x00},
>>> -	{ SN3218_PWM_17, 0x00},
>>> -	{ SN3218_PWM_18, 0x00},
>>> -	{ SN3218_LED_1_6, 0x00},
>>> -	{ SN3218_LED_7_12, 0x00},
>>> -	{ SN3218_LED_13_18, 0x00},
>>> -	{ SN3218_UPDATE, 0x00},
>>> -	{ SN3218_RESET, 0x00},
>>> -};
>>> -
>>> -static const struct regmap_config sn3218_regmap_config = {
>>> -	.reg_bits = 8,
>>> -	.val_bits = 8,
>>> -
>>> -	.max_register = SN3218_RESET,
>>> -	.reg_defaults = sn3218_reg_defs,
>>> -	.num_reg_defaults = ARRAY_SIZE(sn3218_reg_defs),
>>> -	.cache_type = REGCACHE_RBTREE,
>>> -};
>>> -
>>> -static int sn3218_init(struct i2c_client *client, struct sn3218 *sn3218)
>>> -{
>>> -	struct device_node *np = client->dev.of_node, *child;
>>> -	struct sn3218_led *leds;
>>> -	int ret, count;
>>> -
>>> -	count = of_get_child_count(np);
>>> -	if (!count)
>>> -		return -ENODEV;
>>> -
>>> -	if (count > NUM_LEDS) {
>>> -		dev_err(&client->dev, "Invalid LED count %d\n", count);
>>> -		return -EINVAL;
>>> -	}
>>> -
>>> -	leds = devm_kzalloc(&client->dev, count * sizeof(*leds), GFP_KERNEL);
>>> -	if (!leds)
>>> -		return -ENOMEM;
>>> -
>>> -	sn3218->leds = leds;
>>> -	sn3218->num_leds = count;
>>> -	sn3218->client = client;
>>> -
>>> -	sn3218->regmap = devm_regmap_init_i2c(client, &sn3218_regmap_config);
>>> -	if (IS_ERR(sn3218->regmap)) {
>>> -		ret = PTR_ERR(sn3218->regmap);
>>> -		dev_err(&client->dev, "Failed to allocate register map: %d\n",
>>> -			ret);
>>> -		return ret;
>>> -	}
>>> -
>>> -	for_each_child_of_node(np, child) {
>>> -		u32 reg;
>>> -
>>> -		ret = of_property_read_u32(child, "reg", &reg);
>>> -		if (ret)
>>> -			goto fail;
>>> -
>>> -		if (reg >= count) {
>>> -			dev_err(&client->dev, "Invalid LED (%u >= %d)\n", reg,
>>> -				count);
>>> -			ret = -EINVAL;
>>> -			goto fail;
>>> -		}
>>> -
>>> -		sn3218_led_init(sn3218, child, reg);
>>> -	}
>>> -
>>> -	return 0;
>>> -
>>> -fail:
>>> -	of_node_put(child);
>>> -	return ret;
>>> -}
>>> -
>>> -static int sn3218_probe(struct i2c_client *client,
>>> -			const struct i2c_device_id *id)
>>> -{
>>> -	struct sn3218 *sn3218;
>>> -	struct sn3218_led *leds;
>>> -	struct device *dev = &client->dev;
>>> -	int i, ret;
>>> -
>>> -	sn3218 = devm_kzalloc(dev, sizeof(*sn3218), GFP_KERNEL);
>>> -	if (!sn3218)
>>> -		return -ENOMEM;
>>> -
>>> -	ret = sn3218_init(client, sn3218);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>> -	i2c_set_clientdata(client, sn3218);
>>> -	leds = sn3218->leds;
>>> -
>>> -	/*
>>> -	 * Since the chip is write-only we need to reset him into
>>> -	 * a defined state (all LEDs off).
>>> -	 */
>>> -	ret = regmap_write(sn3218->regmap, SN3218_RESET, 0xff);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>> -	for (i = 0; i < sn3218->num_leds; i++) {
>>> -		ret = devm_led_classdev_register(dev, &leds[i].led_cdev);
>>> -		if (ret < 0)
>>> -			return ret;
>>> -	}
>>> -
>>> -	return regmap_write(sn3218->regmap, SN3218_MODE, SN3218_MODE_NORMAL);
>>> -}
>>> -
>>> -static int sn3218_remove(struct i2c_client *client)
>>> -{
>>> -	struct sn3218 *sn3218 = i2c_get_clientdata(client);
>>> -
>>> -	regmap_write(sn3218->regmap, SN3218_MODE, SN3218_MODE_SHUTDOWN);
>>> -
>>> -	return 0;
>>> -}
>>> -
>>> -static void sn3218_shutdown(struct i2c_client *client)
>>> -{
>>> -	struct sn3218 *sn3218 = i2c_get_clientdata(client);
>>> -
>>> -	regmap_write(sn3218->regmap, SN3218_MODE, SN3218_MODE_SHUTDOWN);
>>> -}
>>> -
>>> -static const struct i2c_device_id sn3218_id[] = {
>>> -	{ "sn3218", 0 },
>>> -	{ }
>>> -};
>>> -MODULE_DEVICE_TABLE(i2c, sn3218_id);
>>> -
>>> -static const struct of_device_id of_sn3218_match[] = {
>>> -	{ .compatible = "si-en,sn3218", },
>>> -	{},
>>> -};
>>> -MODULE_DEVICE_TABLE(of, of_sn3218_match);
>>> -
>>> -static struct i2c_driver sn3218_driver = {
>>> -	.driver = {
>>> -		.name	= "leds-sn3218",
>>> -		.of_match_table = of_match_ptr(of_sn3218_match),
>>> -	},
>>> -	.probe	= sn3218_probe,
>>> -	.remove	= sn3218_remove,
>>> -	.shutdown = sn3218_shutdown,
>>> -	.id_table = sn3218_id,
>>> -};
>>> -
>>> -module_i2c_driver(sn3218_driver);
>>> -
>>> -MODULE_DESCRIPTION("Si-En SN3218 LED Driver");
>>> -MODULE_AUTHOR("Stefan Wahren <stefan.wahren@i2se.com>");
>>> -MODULE_LICENSE("GPL v2");
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Best Regards,
Jacek Anaszewski
