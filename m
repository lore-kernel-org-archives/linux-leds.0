From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH RFC 3/3] leds: Add driver for the ISSI IS31FL32xx family of
 LED drivers
Date: Thu, 25 Feb 2016 11:55:58 +0100
Message-ID: <56CEDDBE.2080601@samsung.com>
References: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
 <1456251445-23970-4-git-send-email-drivshin.allworx@gmail.com>
 <56CDD4AA.5030801@samsung.com>
 <20160224212450.195330ed.drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:54756 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759127AbcBYK4E (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 25 Feb 2016 05:56:04 -0500
In-reply-to: <20160224212450.195330ed.drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>

On 02/25/2016 03:24 AM, David Rivshin (Allworx) wrote:
> On Wed, 24 Feb 2016 17:04:58 +0100
> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>
>> Hi David,
>>
>> Thanks for the patch. Very nice driver. I have few comments
>> below.
>
> Thanks Jacek, I have responded the comments inline. I also wanted to
> double check whether you noticed some questions I had in the cover
> letter [1]. As I mentioned in another email to Rob, in hindsight I'm
> guessing I should have included them in the patch comments as well (or
> instead of).

I saw them. I assumed that the review itself will address those
questions.

> Your review comments here effectively answered some of the questions, but
> the big one I'm still unsure of is whether it actually makes sense to
> have all 4 of these devices supported by a single driver.

It's perfectly fine. Many drivers implement this pattern.

> I won't
> clutter this email with a duplicate of the details (it's somewhat long),
> but if you could check the cover letter and give some guidance, I would
> appreciate it.
>
> [1] http://www.spinics.net/lists/linux-leds/msg05564.html
>      http://thread.gmane.org/gmane.linux.leds/4530
>
>>
>> On 02/23/2016 07:17 PM, David Rivshin (Allworx) wrote:
>>> From: David Rivshin <drivshin@allworx.com>
>>>
>>> The IS31FL32xx family of LED drivers are I2C devices with multiple
>>> constant-current channels, each with independent 256-level PWM control.
>>>
>>> HW Docs: http://www.issi.com/US/product-analog-fxled-driver.shtml
>>>
>>> This has been tested on the IS31FL3236 and IS31FL3216 on an ARM
>>> (TI am335x) platform.
>>>
>>> The programming paradigm of these devices is similar in the following
>>> ways:
>>>    - All registers are 8 bit
>>>    - All LED control registers are write-only
>>>    - Each LED channel has a PWM register (0-255)
>>>    - PWM register writes are shadowed until an Update register is poked
>>>    - All have a concept of Software Shutdown, which disables output
>>>
>>> However, there are some differences in devices:
>>>    - 3236/3235 have a separate Control register for each LED,
>>>      (3218/3216 pack the enable bits into fewer registers)
>>>    - 3236/3235 have a per-channel current divisor setting
>>>    - 3236/3235 have a Global Control register that can turn off all LEDs
>>>    - 3216 is unique in a number of ways
>>>       - OUT9-OUT16 can be configured as GPIOs instead of LED controls
>>>       - LEDs can be programmed with an 8-frame animation, with
>>>         programmable delay between frames
>>>       - LEDs can be modulated by an input audio signal
>>>       - Max output current can be adjusted from 1/4 to 2x globally
>>>       - Has a Configuration register instead of a Shutdown register
>>>
>>> This driver currently only supports the base PWM control function
>>> of these devices. The following features of these devices are not
>>> implemented, although it should be possible to add them in the future:
>>>    - All devices are capable of going into a lower-power "software
>>>      shutdown" mode.
>>>    - The is31fl3236 and is31fl3235 can reduce the max output current
>>>      per-channel with a divisor of 1, 2, 3, or 4.
>>>    - The is31fl3216 can use some LED channels as GPIOs instead.
>>>    - The is31fl3216 can animate LEDs in hardware.
>>>    - The is31fl3216 can modulate LEDs according to an audio input.
>>>    - The is31fl3216 can reduce/increase max output current globally.
>>>
>>> Signed-off-by: David Rivshin <drivshin@allworx.com>
>>> ---
>>>    drivers/leds/Kconfig           |   9 +
>>>    drivers/leds/Makefile          |   1 +
>>>    drivers/leds/leds-is31fl32xx.c | 442 +++++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 452 insertions(+)
>>>    create mode 100644 drivers/leds/leds-is31fl32xx.c
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 1034696..8f6c46f 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -580,6 +580,15 @@ config LEDS_SN3218
>>>    	  This driver can also be built as a module. If so the module
>>>    	  will be called leds-sn3218.
>>>
>>> +config LEDS_IS31FL32XX
>>> +	tristate "Driver for ISSI IS31FL32XX I2C LED driver chip family"
>>
>> 2 x "[Dd]river".
>>
>> How about:
>>
>> "LED Support for ISSI IS31FL32XX I2C LED chip family" ?
>
> Yes, I found that awkward as well. HW folks (and the datasheets) seem
> always refer to devices of this type as "LED Driver"s (which can lead
> to some interesting confusions). Taking a cue from the LP5521/23/62
> entries, how about:
>   "LED Support for the ISSI IS31FL32XX I2C LED driver chip family" ?

"LED Support" means "LED class driver". Driver is a software support
for hardware chip. What discrepancy do you see in the description
I proposed?

> Perhaps that's the best of both worlds?
>
>>> +	depends on LEDS_CLASS && I2C && OF
>>> +	help
>>> +	  Say Y here to include support for the ISSI 31FL32XX LED driver family.
>>
>> s/driver/chip/
>>
>>> +	  They are I2C devices with multiple constant-current channels, each
>>> +	  with independent 256-level PWM control. This will only work with
>>> +	  device tree enabled devices.
>>
>> We can skip the last sentence I think.
>
> OK. FYI, I think I got that verbiage from LEDS_SYSCON.

Having "depends on OF" is self-explanatory here.

>>> +
>>>    comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
>>>
>>>    config LEDS_BLINKM
>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>> index 89c9b6f..3fdf313 100644
>>> --- a/drivers/leds/Makefile
>>> +++ b/drivers/leds/Makefile
>>> @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
>>>    obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
>>>    obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
>>>    obj-$(CONFIG_LEDS_SN3218)		+= leds-sn3218.o
>>> +obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
>>>
>>>    # LED SPI Drivers
>>>    obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
>>> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
>>> new file mode 100644
>>> index 0000000..8dea518
>>> --- /dev/null
>>> +++ b/drivers/leds/leds-is31fl32xx.c
>>> @@ -0,0 +1,442 @@
>>> +/*
>>> + * linux/drivers/leds-is31fl32xx.c
>>> + *
>>> + * Driver for ISSI IS31FL32xx family of I2C LED controllers
>>> + *
>>> + * Copyright 2015 Allworx Corp.
>>> + *
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> + *
>>> + * HW Docs: http://www.issi.com/US/product-analog-fxled-driver.shtml
>>> + */
>>> +
>>> +#include <linux/err.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/leds.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of_platform.h>
>>> +
>>> +#ifdef DEBUG
>>> + #undef dev_dbg
>>> + #define dev_dbg dev_info
>>> +#endif
>>
>> What's the benefit of the above?
>
> It gave me a way to easily see debug output from the driver while it
> was parsing the DT (especially if the driver was built-in). Early on
> there were other things within that #ifdef as well.
> Regardless, passing ddebug_query on the kernel commandline is a more
> appropriate way of accomplishing that; I'll remove for the next version.

Thanks.

>>> +/* Used to indicate a device has no such register */
>>> +#define IS31FL32XX_REG_NONE 0xFF
>>> +
>>> +#define IS31FL3216_CONFIG_REG 0x00
>>> +#define IS31FL3216_LIGHTING_EFFECT_REG 0x03
>>> +#define IS31FL3216_CHANNEL_CONFIG_REG 0x04
>>> +
>>> +struct is31fl32xx_priv;
>>> +struct is31fl32xx_led_data {
>>> +	struct led_classdev cdev;
>>> +	u8 channel; /* 1-based, max priv->cdef->channels */
>>> +	struct is31fl32xx_priv *priv;
>>> +};
>>> +
>>> +struct is31fl32xx_priv {
>>> +	const struct is31fl32xx_chipdef *cdef;
>>> +	struct i2c_client *client;
>>> +	unsigned int num_leds;
>>> +	struct is31fl32xx_led_data leds[0];
>>
>> Is there any specific reason for not having *leds here instead?
>
> I followed a pattern from leds-pwm where it did a single allocation
> for both priv and priv->leds[]. See sizeof_is31fl32xx_priv(), and
> its use, below. I saw the benefit as one fewer small allocation, so
> slightly more kind to the allocator (and devres). If you'd prefer to
> do it as two allocations, I'll make the change.

OK, I had to look at this one more time. I like the idea.

>>> +};
>>> +
>>> +/**
>>> + * struct is31fl32xx_chipdef - chip-specific attributes
>>> + * @channels            : Number of LED channels
>>> + * @shutdown_reg        : address of Shutdown register (optional)
>>> + * @pwm_update_reg      : address of PWM Update register
>>> + * @global_control_reg	: address of Global Control register (optional)
>>> + * @reset_reg           : address of Reset register (optional)
>>> + * @pwm_register_base	: address of first PWM register
>>> + * @pwm_registers_reversed: : true if PWM registers count down instead of up
>>> + * @led_control_register_base : address of first LED control register (optional)
>>> + * @enable_bits_per_led_control_register: number of LEDs enable bits in each
>>> + * @reset_func:         : pointer to reset function
>>> + *
>>> + * For all optional register addresses, the sentinel value %IS31FL32XX_REG_NONE
>>> + * indicates that this chip has no such register.
>>> + *
>>> + * If non-NULL, @reset_func will be called during probing to set all
>>> + * necessary registers to a known initialization state. This is needed
>>> + * for chips that do not have a @reset_reg.
>>> + *
>>> + * @enable_bits_per_led_control_register must be >=1 if
>>> + * @led_control_register_base != %IS31FL32XX_REG_NONE.
>>> + */
>>> +struct is31fl32xx_chipdef {
>>> +	u8	channels;
>>> +	u8	shutdown_reg;
>>> +	u8	pwm_update_reg;
>>> +	u8	global_control_reg;
>>> +	u8	reset_reg;
>>> +	u8	pwm_register_base;
>>> +	bool	pwm_registers_reversed;
>>> +	u8	led_control_register_base;
>>> +	u8	enable_bits_per_led_control_register;
>>> +	int (*reset_func)(struct is31fl32xx_priv *priv);
>>> +};
>>> +
>>> +static const struct is31fl32xx_chipdef is31fl3236_cdef = {
>>> +	.channels				= 36,
>>> +	.shutdown_reg				= 0x00,
>>> +	.pwm_update_reg				= 0x25,
>>> +	.global_control_reg			= 0x4a,
>>> +	.reset_reg				= 0x4f,
>>> +	.pwm_register_base			= 0x01,
>>> +	.led_control_register_base		= 0x26,
>>> +	.enable_bits_per_led_control_register	= 1,
>>> +};
>>> +
>>> +static const struct is31fl32xx_chipdef is31fl3235_cdef = {
>>> +	.channels				= 28,
>>> +	.shutdown_reg				= 0x00,
>>> +	.pwm_update_reg				= 0x25,
>>> +	.global_control_reg			= 0x4a,
>>> +	.reset_reg				= 0x4f,
>>> +	.pwm_register_base			= 0x05,
>>> +	.led_control_register_base		= 0x2a,
>>> +	.enable_bits_per_led_control_register	= 1,
>>> +};
>>> +
>>> +static const struct is31fl32xx_chipdef is31fl3218_cdef = {
>>> +	.channels				= 18,
>>> +	.shutdown_reg				= 0x00,
>>> +	.pwm_update_reg				= 0x16,
>>> +	.global_control_reg			= IS31FL32XX_REG_NONE,
>>> +	.reset_reg				= 0x17,
>>> +	.pwm_register_base			= 0x01,
>>> +	.led_control_register_base		= 0x13,
>>> +	.enable_bits_per_led_control_register	= 6,
>>> +};
>>> +
>>> +static int is31fl3216_reset(struct is31fl32xx_priv *priv);
>>> +static const struct is31fl32xx_chipdef is31fl3216_cdef = {
>>> +	.channels				= 16,
>>> +	.shutdown_reg				= IS31FL32XX_REG_NONE,
>>> +	.pwm_update_reg				= 0xB0,
>>> +	.global_control_reg			= IS31FL32XX_REG_NONE,
>>> +	.reset_reg				= IS31FL32XX_REG_NONE,
>>> +	.pwm_register_base			= 0x10,
>>> +	.pwm_registers_reversed			= true,
>>> +	.led_control_register_base		= 0x01,
>>> +	.enable_bits_per_led_control_register	= 8,
>>> +	.reset_func				= is31fl3216_reset,
>>> +};
>>> +
>>> +static int is31fl32xx_write(struct is31fl32xx_priv *priv, u8 reg, u8 val)
>>> +{
>>> +	int ret;
>>> +
>>> +	dev_dbg(&priv->client->dev, "writing register 0x%02X=0x%02X", reg, val);
>>> +
>>> +	ret =  i2c_smbus_write_byte_data(priv->client, reg, val);
>>> +	if (ret) {
>>> +		dev_err(&priv->client->dev,
>>> +			"register write to 0x%02X failed (error %d)",
>>> +			reg, ret);
>>> +	}
>>> +	return ret;
>>> +}
>>> +
>>> +/*
>>> + * Custom reset function for IS31FL3216 because it does not have a RESET
>>> + * register the way that the other IS31FL32xx chips do. We don't bother
>>> + * writing the GPIO and animation registers, because the registers we
>>> + * do write ensure those will have no effect.
>>> + */
>>> +static int is31fl3216_reset(struct is31fl32xx_priv *priv)
>>> +{
>>> +	unsigned int i;
>>> +	int ret;
>>> +
>>> +	for (i = 0; i < priv->cdef->channels; i++) {
>>> +		ret = is31fl32xx_write(priv, priv->cdef->pwm_register_base+i,
>>> +				       0x00);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +	ret = is31fl32xx_write(priv, priv->cdef->pwm_update_reg, 0);
>>> +	if (ret)
>>> +		return ret;
>>> +	ret = is31fl32xx_write(priv, IS31FL3216_LIGHTING_EFFECT_REG, 0x00);
>>> +	if (ret)
>>> +		return ret;
>>> +	ret = is31fl32xx_write(priv, IS31FL3216_CHANNEL_CONFIG_REG, 0x00);
>>> +	if (ret)
>>> +		return ret;
>>> +	ret = is31fl32xx_write(priv, IS31FL3216_CONFIG_REG, 0x00);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +
>>> +static int is31fl32xx_brightness_set(struct led_classdev *led_cdev,
>>> +				     enum led_brightness brightness)
>>> +{
>>> +	const struct is31fl32xx_led_data *led_data =
>>> +		container_of(led_cdev, struct is31fl32xx_led_data, cdev);
>>> +	const struct is31fl32xx_chipdef *cdef = led_data->priv->cdef;
>>> +	u8 pwm_register_offset;
>>> +	int ret;
>>> +
>>> +	dev_dbg(led_cdev->dev, "%s: %d\n", __func__, brightness);
>>> +
>>> +	/* NOTE: led_data->channel is 1-based */
>>> +	if (cdef->pwm_registers_reversed)
>>> +		pwm_register_offset = cdef->channels - led_data->channel;
>>> +	else
>>> +		pwm_register_offset = led_data->channel - 1;
>>> +
>>> +	ret = is31fl32xx_write(led_data->priv,
>>> +			       cdef->pwm_register_base + pwm_register_offset,
>>> +			       brightness);
>>> +	if (ret)
>>> +		return ret;
>>
>> I infer that nothing wrong happens in case current process is preempted
>> here by the call originating from the other sub-LED?
>
> I do not believe so. All the driver-specific data used here is read-only
> after probing. chipdefs are entirely const, and the only thing in priv
> that's referenced is the chipdef pointer which logically could not change
> post-probe. Actually nothing else in priv is modified post-probe either.
>
> The I2C core code has a mutex on the bus, so two writes cannot happen at
> once.
>
> In all these devices there is a unique PWM duty-cycle register for each
> LED channel (which is what is being written here), so no register writes
> for one LED channel effect any others.
>
> I believe the worst that could happen is that the device would see:
> 	PWM_REG_A write X
> 	PWM_REG_B write Y
> 	UPDATE_REG write 0
> 	UPDATE_REG write 0
> instead of
> 	PWM_REG_A write X
> 	UPDATE_REG write 0
> 	PWM_REG_B write Y
> 	UPDATE_REG write 0
> but that makes no difference to the functionality. Poking the update
> register merely applies all PWM register writes up to that point (I'm
> assuming to allow atomically changing the state of multiple LEDs at
> once).

Thanks for this comprehensive explanation.

> I should note here (as mentioned in cover letter), I made a choice to
> always leave the per-LED "enable" bits on, and let the PWM just get set
> to 0 naturally to turn an LED off. This differs from the existing SN3218
> driver, which used regmap_update_bits, and is then protected by a per-
> regmap mutex.

ack.

>>> +	return is31fl32xx_write(led_data->priv, cdef->pwm_update_reg, 0);
>>> +
>>> +}
>>> +
>>> +static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
>>> +{
>>> +	const struct is31fl32xx_chipdef *cdef = priv->cdef;
>>> +	int ret;
>>> +
>>> +	if (cdef->reset_reg != IS31FL32XX_REG_NONE) {
>>> +		ret = is31fl32xx_write(priv, cdef->reset_reg, 0);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +	if (cdef->reset_func) {
>>> +		ret = cdef->reset_func(priv);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +	if (cdef->led_control_register_base != IS31FL32XX_REG_NONE) {
>>> +		u8 value =
>>> +		    GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
>>> +		u8 num_regs = cdef->channels /
>>> +				cdef->enable_bits_per_led_control_register;
>>> +		int i;
>>> +
>>> +		for (i = 0; i < num_regs; i++) {
>>> +			ret = is31fl32xx_write(priv,
>>> +					       cdef->led_control_register_base+i,
>>> +					       value);
>>> +			if (ret)
>>> +				return ret;
>>> +		}
>>> +	}
>>> +	if (cdef->shutdown_reg != IS31FL32XX_REG_NONE) {
>>> +		ret = is31fl32xx_write(priv, cdef->shutdown_reg, BIT(0));
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +	if (cdef->global_control_reg != IS31FL32XX_REG_NONE) {
>>> +		ret = is31fl32xx_write(priv, cdef->global_control_reg, 0x00);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static inline size_t sizeof_is31fl32xx_priv(int num_leds)
>>> +{
>>> +	return sizeof(struct is31fl32xx_priv) +
>>> +		      (sizeof(struct is31fl32xx_led_data) * num_leds);
>>> +}
>>> +
>>> +static int is31fl32xx_parse_child_dt(const struct device *dev,
>>> +				     const struct device_node *child,
>>> +				     struct is31fl32xx_led_data *led_data)
>>> +{
>>> +	struct led_classdev *cdev = &led_data->cdev;
>>> +	int ret = 0;
>>> +	u32 reg;
>>> +
>>> +	cdev->name = of_get_property(child, "label", NULL) ? : child->name;
>>> +
>>> +	ret = of_property_read_u32(child, "reg", &reg);
>>> +	if (ret || reg < 1 || reg > led_data->priv->cdef->channels) {
>>> +		dev_err(dev,
>>> +			"Child node %s does not have a valid reg property\n",
>>> +			child->name);
>>> +		return -EINVAL;
>>> +	}
>>> +	led_data->channel = reg;
>>> +
>>> +	cdev->default_trigger = of_get_property(child, "linux,default-trigger",
>>> +						NULL);
>>> +	cdev->brightness = LED_OFF;
>>
>> devm_kzalloc secures that.
>
> OK, I will remove.
>
>>> +	ret = of_property_read_u32(child, "max-brightness",
>>> +				   &cdev->max_brightness);
>>> +	if (ret == -EINVAL) {
>>> +		cdev->max_brightness = 255;
>>
>> s/255/LED_FULL/
>
> Noted, although (from the patch 2 discussion) max-brightness property is
> removed/replaced, this would go away anyways.
>
>>> +	} else if (ret) {
>>> +		dev_dbg(dev,
>>> +			"Child node %s has an invalid max-brightness property\n",
>>> +			child->name);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	cdev->brightness_set_blocking = is31fl32xx_brightness_set;
>>
>> Please add empty line here.
>
> Done.
>
>>> +	return 0;
>>> +}
>>> +
>>> +static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
>>> +					struct is31fl32xx_priv *priv,
>>> +					u8 channel)
>>> +{
>>> +	size_t i;
>>> +
>>> +	for (i = 0; i < priv->num_leds; i++) {
>>> +		if (priv->leds[i].channel == channel)
>>> +			return &priv->leds[i];
>>> +	}
>>
>> Ditto.
>
> Done.
>
>>> +	return NULL;
>>> +}
>>> +
>>> +static int is31fl32xx_parse_dt(struct device *dev,
>>> +			       struct is31fl32xx_priv *priv)
>>> +{
>>> +	struct device_node *child;
>>> +
>>> +	for_each_child_of_node(dev->of_node, child) {
>>> +		struct is31fl32xx_led_data *led_data =
>>> +			&priv->leds[priv->num_leds];
>>> +		int ret = 0;
>>> +		const struct is31fl32xx_led_data *other_led_data;
>>> +
>>> +		led_data->priv = priv;
>>> +
>>> +		ret = is31fl32xx_parse_child_dt(dev, child, led_data);
>>> +		if (ret)
>>> +			continue;
>>
>> I prefer failing in such cases,
>
> OK, I will change to an 'goto err' which will have an 'of_node_put()'
> and 'return ret'.
>
> I will say, however, that while testing the error-detection in the
> parsing logic, it was very convenient to construct a single devicetree
> with a variety of errors. Then a single boot would test multiple
> cases at once.

Good idea for testing, but in case some failure occurs during DT child
node parsing in the release environment you're left with unused
allocated memory.

>>> +
>>> +		/* Detect if channel is already in use by another child */
>>> +		other_led_data = is31fl32xx_find_led_data(priv,
>>> +							  led_data->channel);
>>> +		if (other_led_data) {
>>> +			dev_err(dev,
>>> +				"%s ignored: channel %d already used by %s",
>>> +				led_data->cdev.name,
>>> +				led_data->channel,
>>> +				other_led_data->cdev.name);
>>> +			continue;
>>
>> Ditto.
>
> OK.
>
>>> +		}
>>> +
>>> +		ret = devm_led_classdev_register(dev, &led_data->cdev);
>>> +		if (ret == 0) {
>>> +			priv->num_leds++;
>>> +		} else {
>>> +			dev_err(dev, "failed to register PWM led for %s: %d\n",
>>> +				led_data->cdev.name, ret);
>
> Should I also fail here, then? Right now it will continue trying to
> register future LED devices if a classdev_register fails for some
> reason, and will successfully load even if all of them fail.

Please fail here too. If we can't setup the sub-LED that is advertised
in a DT child node, then it means that something went wrong.
This is clear error case.

>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct of_device_id of_is31fl31xx_match[] = {
>>> +	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
>>> +	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
>>> +	{ .compatible = "issi,is31fl3218", .data = &is31fl3218_cdef, },
>>> +	{ .compatible = "issi,is31fl3216", .data = &is31fl3216_cdef, },
>>> +	{},
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(of, of_is31fl31xx_match);
>>> +
>>> +static int is31fl32xx_probe(struct i2c_client *client,
>>> +				  const struct i2c_device_id *id)
>>> +{
>>> +	const struct is31fl32xx_chipdef *cdef;
>>> +	const struct of_device_id *of_dev_id;
>>> +	struct device *dev = &client->dev;
>>> +	struct is31fl32xx_priv *priv;
>>> +	int count;
>>> +	int ret = 0;
>>> +
>>> +	of_dev_id = of_match_device(of_is31fl31xx_match, dev);
>>> +	if (!of_dev_id)
>>> +		return -EINVAL;
>>> +
>>> +	cdef = of_dev_id->data;
>>> +
>>> +	count = of_get_child_count(dev->of_node);
>>> +	if (!count)
>>> +		return -EINVAL;
>>> +
>>> +	priv = devm_kzalloc(dev, sizeof_is31fl32xx_priv(count),
>>> +			    GFP_KERNEL);
>>> +	if (!priv)
>>> +		return -ENOMEM;
>>> +
>>> +	priv->client = client;
>>> +	priv->cdef = cdef;
>>> +	i2c_set_clientdata(client, priv);
>>> +
>>> +	ret = is31fl32xx_init_regs(priv);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = is31fl32xx_parse_dt(dev, priv);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int is31fl32xx_remove(struct i2c_client *client)
>>> +{
>>> +	struct is31fl32xx_priv *priv = i2c_get_clientdata(client);
>>> +
>>> +	/* If there is a reset reg, then it does everything we need */
>>> +	if (priv->cdef->reset_reg != IS31FL32XX_REG_NONE)
>>> +		return is31fl32xx_write(priv, priv->cdef->reset_reg, 0);
>>> +
>>> +	/* If there is a reset func, then it does everything we need */
>>> +	if (priv->cdef->reset_func)
>>> +		return priv->cdef->reset_func(priv);
>>> +
>>> +	/* If we can't reset, then try just using software-shutdown mode */
>>> +	if (priv->cdef->shutdown_reg != IS31FL32XX_REG_NONE)
>>> +		return is31fl32xx_write(priv, priv->cdef->shutdown_reg, 0x00);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * i2c-core requires that id_table be non-NULL, even though
>>> + * it is not used for DeviceTree based instantiation.
>>> + */
>>> +static const struct i2c_device_id is31fl31xx_id[] = {
>>> +	{},
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(i2c, is31fl31xx_id);
>>> +
>>> +static struct i2c_driver is31fl32xx_driver = {
>>> +	.driver = {
>>> +		.name	= "is31fl32xx",
>>> +		.of_match_table = of_is31fl31xx_match,
>>> +	},
>>> +	.probe		= is31fl32xx_probe,
>>> +	.remove		= is31fl32xx_remove,
>>> +	.id_table	= is31fl31xx_id,
>>> +};
>>> +
>>> +module_i2c_driver(is31fl32xx_driver);
>>> +
>>> +MODULE_AUTHOR("David Rivshin <drivshin@allworx.com>");
>>> +MODULE_DESCRIPTION("ISSI IS31FL32xx LED driver");
>>> +MODULE_LICENSE("GPL v2");
>>>
>
>
>


-- 
Best regards,
Jacek Anaszewski
