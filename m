From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: Re: [PATCH 3/4] leds: Add driver for the ISSI IS31FL32xx family of
 LED controllers
Date: Fri, 4 Mar 2016 14:02:45 -0500
Message-ID: <20160304140245.6cd419c8.drivshin.allworx@gmail.com>
References: <1456974095-1867-1-git-send-email-drivshin.allworx@gmail.com>
	<1456974095-1867-4-git-send-email-drivshin.allworx@gmail.com>
	<56D84F74.3070903@samsung.com>
	<20160303194531.316d7918.drivshin.allworx@gmail.com>
	<56D93F1A.6030305@samsung.com>
	<20160304100500.568e9624.drivshin.allworx@gmail.com>
	<56D9B170.9010006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:36362 "EHLO
	mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759517AbcCDTCu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Mar 2016 14:02:50 -0500
In-Reply-To: <56D9B170.9010006@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org

On Fri, 04 Mar 2016 17:01:52 +0100
Jacek Anaszewski <j.anaszewski@samsung.com> wrote:

> On 03/04/2016 04:05 PM, David Rivshin (Allworx) wrote:
> > On Fri, 04 Mar 2016 08:54:02 +0100
> > Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
> >  
> >> On 03/04/2016 01:45 AM, David Rivshin (Allworx) wrote:  
> >>> On Thu, 03 Mar 2016 15:51:32 +0100
> >>> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
> >>>  
> >>>> Hi David,
> >>>>
> >>>> Thanks for the update. Two remarks in the code.
> >>>>
> >>>> On 03/03/2016 04:01 AM, David Rivshin (Allworx) wrote:  
> >>>>> From: David Rivshin <drivshin@allworx.com>
> >>>>>
> >>>>> The IS31FL32xx family of LED controllers are I2C devices with multiple
> >>>>> constant-current channels, each with independent 256-level PWM control.
> >>>>>
> >>>>> Datasheets: http://www.issi.com/US/product-analog-fxled-driver.shtml
> >>>>>
> >>>>> This has been tested on the IS31FL3236 and IS31FL3216, on an ARM
> >>>>> (TI am335x) platform.
> >>>>>
> >>>>> The programming paradigm of these devices is similar in the following
> >>>>> ways:
> >>>>>     - All registers are 8 bit
> >>>>>     - All LED control registers are write-only
> >>>>>     - Each LED channel has a PWM register (0-255)
> >>>>>     - PWM register writes are shadowed until an Update register is poked
> >>>>>     - All have a concept of Software Shutdown, which disables output
> >>>>>
> >>>>> However, there are some differences in devices:
> >>>>>     - 3236/3235 have a separate Control register for each LED,
> >>>>>       (3218/3216 pack the enable bits into fewer registers)
> >>>>>     - 3236/3235 have a per-channel current divisor setting
> >>>>>     - 3236/3235 have a Global Control register that can turn off all LEDs
> >>>>>     - 3216 is unique in a number of ways
> >>>>>        - OUT9-OUT16 can be configured as GPIOs instead of LED controls
> >>>>>        - LEDs can be programmed with an 8-frame animation, with
> >>>>>          programmable delay between frames
> >>>>>        - LEDs can be modulated by an input audio signal
> >>>>>        - Max output current can be adjusted from 1/4 to 2x globally
> >>>>>        - Has a Configuration register instead of a Shutdown register
> >>>>>
> >>>>> This driver currently only supports the base PWM control function
> >>>>> of these devices. The following features of these devices are not
> >>>>> implemented, although it should be possible to add them in the future:
> >>>>>     - All devices are capable of going into a lower-power "software
> >>>>>       shutdown" mode.
> >>>>>     - The is31fl3236 and is31fl3235 can reduce the max output current
> >>>>>       per-channel with a divisor of 1, 2, 3, or 4.
> >>>>>     - The is31fl3216 can use some LED channels as GPIOs instead.
> >>>>>     - The is31fl3216 can animate LEDs in hardware.
> >>>>>     - The is31fl3216 can modulate LEDs according to an audio input.
> >>>>>     - The is31fl3216 can reduce/increase max output current globally.
> >>>>>
> >>>>> Signed-off-by: David Rivshin <drivshin@allworx.com>
> >>>>> ---
> >>>>>
> >>>>> You may see two instances of this warning:
> >>>>>      "passing argument 1 of 'of_property_read_string' discards 'const'
> >>>>>       qualifier from pointer target type"
> >>>>> That is a result of of_property_read_string() taking a non-const
> >>>>> struct device_node pointer parameter. I have separately submitted a
> >>>>> patch to fix that [1], and a few related functions which had the same
> >>>>> issue. I'm hoping that will get into linux-next before this does, so
> >>>>> that the warnings never show up there.  
> >>>>
> >>>> Please adjust the patch so that it compiles without warnings on
> >>>> current linux-next. Your patch for DT API hasn't been reviewed yet
> >>>> AFICS, and I can imagine that there will be some resistance against.  
> >>>
> >>> Since the DT API patch was just accepted by Rob [1], would it be OK
> >>> to wait for the results of Stefan's testing (and any other reviews)
> >>> before making a decision on this? From Stefan's note, it won't be
> >>> until this weekend that he will have a chance to test, and I'm
> >>> guessing the DT API patch will make its way through Rob's tree to
> >>> linux-next by then.  
> >>
> >> OK.
> >>  
> >>> FYI, the warning workaround would be to make the second parameter to
> >>> is31fl32xx_parse_child_dt() non-const.
> >>>
> >>> [1] https://lkml.org/lkml/2016/3/3/924
> >>>  
> >>>>> Changes from RFC:
> >>>>>     - Removed max-brightness DT property.
> >>>>>     - Refer to these devices as "LED controllers" in Kconfig.
> >>>>>     - Removed redundant last sentence from Kconfig entry
> >>>>>     - Removed unnecessary debug code.
> >>>>>     - Do not set led_classdev.brightness to 0 explicitly, as it is
> >>>>>       already initialized to 0 by devm_kzalloc().
> >>>>>     - Used of_property_read_string() instead of of_get_property().
> >>>>>     - Fail immediately on DT parsing error in a child node, rather than
> >>>>>       continuing on with the non-faulty ones.
> >>>>>     - Added additional comments for some things that might be non-obvious.
> >>>>>     - Added constants for the location of the SSD bit in the SHUTDOWN
> >>>>>       register, and the 3216's CONFIG register.
> >>>>>     - Added special sw_shutdown_func for the 3216 device, as that bit
> >>>>>       is in a different register, at a different position, and has reverse
> >>>>>       polarity compared to all the other devices.
> >>>>>     - Refactored is31fl32xx_init_regs() to separate out some logic into
> >>>>>       is31fl32xx_reset_regs() and is31fl32xx_software_shutdown().
> >>>>>
> >>>>> [1] https://lkml.org/lkml/2016/3/2/746
> >>>>>
> >>>>>     drivers/leds/Kconfig           |   8 +
> >>>>>     drivers/leds/Makefile          |   1 +
> >>>>>     drivers/leds/leds-is31fl32xx.c | 505 +++++++++++++++++++++++++++++++++++++++++
> >>>>>     3 files changed, 514 insertions(+)
> >>>>>     create mode 100644 drivers/leds/leds-is31fl32xx.c
> >>>>>
> >>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> >>>>> index 1034696..9c63ba4 100644
> >>>>> --- a/drivers/leds/Kconfig
> >>>>> +++ b/drivers/leds/Kconfig
> >>>>> @@ -580,6 +580,14 @@ config LEDS_SN3218
> >>>>>     	  This driver can also be built as a module. If so the module
> >>>>>     	  will be called leds-sn3218.
> >>>>>
> >>>>> +config LEDS_IS31FL32XX
> >>>>> +	tristate "LED support for ISSI IS31FL32XX I2C LED controller family"
> >>>>> +	depends on LEDS_CLASS && I2C && OF
> >>>>> +	help
> >>>>> +	  Say Y here to include support for ISSI IS31FL32XX LED controllers.
> >>>>> +	  They are I2C devices with multiple constant-current channels, each
> >>>>> +	  with independent 256-level PWM control.
> >>>>> +
> >>>>>     comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
> >>>>>
> >>>>>     config LEDS_BLINKM
> >>>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> >>>>> index 89c9b6f..3fdf313 100644
> >>>>> --- a/drivers/leds/Makefile
> >>>>> +++ b/drivers/leds/Makefile
> >>>>> @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
> >>>>>     obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
> >>>>>     obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
> >>>>>     obj-$(CONFIG_LEDS_SN3218)		+= leds-sn3218.o
> >>>>> +obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
> >>>>>
> >>>>>     # LED SPI Drivers
> >>>>>     obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> >>>>> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> >>>>> new file mode 100644
> >>>>> index 0000000..49818f0
> >>>>> --- /dev/null
> >>>>> +++ b/drivers/leds/leds-is31fl32xx.c
> >>>>> @@ -0,0 +1,505 @@
> >>>>> +/*
> >>>>> + * linux/drivers/leds-is31fl32xx.c
> >>>>> + *
> >>>>> + * Driver for ISSI IS31FL32xx family of I2C LED controllers
> >>>>> + *
> >>>>> + * Copyright 2015 Allworx Corp.
> >>>>> + *
> >>>>> + *
> >>>>> + * This program is free software; you can redistribute it and/or modify
> >>>>> + * it under the terms of the GNU General Public License version 2 as
> >>>>> + * published by the Free Software Foundation.
> >>>>> + *
> >>>>> + * Datasheets: http://www.issi.com/US/product-analog-fxled-driver.shtml
> >>>>> + */
> >>>>> +
> >>>>> +#include <linux/err.h>
> >>>>> +#include <linux/i2c.h>
> >>>>> +#include <linux/kernel.h>
> >>>>> +#include <linux/leds.h>
> >>>>> +#include <linux/module.h>
> >>>>> +#include <linux/of_platform.h>
> >>>>> +
> >>>>> +/* Used to indicate a device has no such register */
> >>>>> +#define IS31FL32XX_REG_NONE 0xFF
> >>>>> +
> >>>>> +/* Software Shutdown bit in Shutdown Register */
> >>>>> +#define IS31FL32XX_SHUTDOWN_SSD_ENABLE  0
> >>>>> +#define IS31FL32XX_SHUTDOWN_SSD_DISABLE BIT(0)
> >>>>> +
> >>>>> +/* IS31FL3216 has a number of unique registers */
> >>>>> +#define IS31FL3216_CONFIG_REG 0x00
> >>>>> +#define IS31FL3216_LIGHTING_EFFECT_REG 0x03
> >>>>> +#define IS31FL3216_CHANNEL_CONFIG_REG 0x04
> >>>>> +
> >>>>> +/* Software Shutdown bit in 3216 Config Register */
> >>>>> +#define IS31FL3216_CONFIG_SSD_ENABLE  BIT(7)
> >>>>> +#define IS31FL3216_CONFIG_SSD_DISABLE 0
> >>>>> +
> >>>>> +struct is31fl32xx_priv;
> >>>>> +struct is31fl32xx_led_data {
> >>>>> +	struct led_classdev cdev;
> >>>>> +	u8 channel; /* 1-based, max priv->cdef->channels */
> >>>>> +	struct is31fl32xx_priv *priv;
> >>>>> +};
> >>>>> +
> >>>>> +struct is31fl32xx_priv {
> >>>>> +	const struct is31fl32xx_chipdef *cdef;
> >>>>> +	struct i2c_client *client;
> >>>>> +	unsigned int num_leds;
> >>>>> +	struct is31fl32xx_led_data leds[0];
> >>>>> +};
> >>>>> +
> >>>>> +/**
> >>>>> + * struct is31fl32xx_chipdef - chip-specific attributes
> >>>>> + * @channels            : Number of LED channels
> >>>>> + * @shutdown_reg        : address of Shutdown register (optional)
> >>>>> + * @pwm_update_reg      : address of PWM Update register
> >>>>> + * @global_control_reg  : address of Global Control register (optional)
> >>>>> + * @reset_reg           : address of Reset register (optional)
> >>>>> + * @pwm_register_base   : address of first PWM register
> >>>>> + * @pwm_registers_reversed: : true if PWM registers count down instead of up
> >>>>> + * @led_control_register_base : address of first LED control register (optional)
> >>>>> + * @enable_bits_per_led_control_register: number of LEDs enable bits in each
> >>>>> + * @reset_func:         : pointer to reset function
> >>>>> + *
> >>>>> + * For all optional register addresses, the sentinel value %IS31FL32XX_REG_NONE
> >>>>> + * indicates that this chip has no such register.
> >>>>> + *
> >>>>> + * If non-NULL, @reset_func will be called during probing to set all
> >>>>> + * necessary registers to a known initialization state. This is needed
> >>>>> + * for chips that do not have a @reset_reg.
> >>>>> + *
> >>>>> + * @enable_bits_per_led_control_register must be >=1 if
> >>>>> + * @led_control_register_base != %IS31FL32XX_REG_NONE.
> >>>>> + */
> >>>>> +struct is31fl32xx_chipdef {
> >>>>> +	u8	channels;
> >>>>> +	u8	shutdown_reg;
> >>>>> +	u8	pwm_update_reg;
> >>>>> +	u8	global_control_reg;
> >>>>> +	u8	reset_reg;
> >>>>> +	u8	pwm_register_base;
> >>>>> +	bool	pwm_registers_reversed;
> >>>>> +	u8	led_control_register_base;
> >>>>> +	u8	enable_bits_per_led_control_register;
> >>>>> +	int (*reset_func)(struct is31fl32xx_priv *priv);
> >>>>> +	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
> >>>>> +};
> >>>>> +
> >>>>> +static const struct is31fl32xx_chipdef is31fl3236_cdef = {
> >>>>> +	.channels				= 36,
> >>>>> +	.shutdown_reg				= 0x00,
> >>>>> +	.pwm_update_reg				= 0x25,
> >>>>> +	.global_control_reg			= 0x4a,
> >>>>> +	.reset_reg				= 0x4f,
> >>>>> +	.pwm_register_base			= 0x01,
> >>>>> +	.led_control_register_base		= 0x26,
> >>>>> +	.enable_bits_per_led_control_register	= 1,
> >>>>> +};
> >>>>> +
> >>>>> +static const struct is31fl32xx_chipdef is31fl3235_cdef = {
> >>>>> +	.channels				= 28,
> >>>>> +	.shutdown_reg				= 0x00,
> >>>>> +	.pwm_update_reg				= 0x25,
> >>>>> +	.global_control_reg			= 0x4a,
> >>>>> +	.reset_reg				= 0x4f,
> >>>>> +	.pwm_register_base			= 0x05,
> >>>>> +	.led_control_register_base		= 0x2a,
> >>>>> +	.enable_bits_per_led_control_register	= 1,
> >>>>> +};
> >>>>> +
> >>>>> +static const struct is31fl32xx_chipdef is31fl3218_cdef = {
> >>>>> +	.channels				= 18,
> >>>>> +	.shutdown_reg				= 0x00,
> >>>>> +	.pwm_update_reg				= 0x16,
> >>>>> +	.global_control_reg			= IS31FL32XX_REG_NONE,
> >>>>> +	.reset_reg				= 0x17,
> >>>>> +	.pwm_register_base			= 0x01,
> >>>>> +	.led_control_register_base		= 0x13,
> >>>>> +	.enable_bits_per_led_control_register	= 6,
> >>>>> +};
> >>>>> +
> >>>>> +static int is31fl3216_reset(struct is31fl32xx_priv *priv);
> >>>>> +static int is31fl3216_software_shutdown(struct is31fl32xx_priv *priv,
> >>>>> +					bool enable);
> >>>>> +static const struct is31fl32xx_chipdef is31fl3216_cdef = {
> >>>>> +	.channels				= 16,
> >>>>> +	.shutdown_reg				= IS31FL32XX_REG_NONE,
> >>>>> +	.pwm_update_reg				= 0xB0,
> >>>>> +	.global_control_reg			= IS31FL32XX_REG_NONE,
> >>>>> +	.reset_reg				= IS31FL32XX_REG_NONE,
> >>>>> +	.pwm_register_base			= 0x10,
> >>>>> +	.pwm_registers_reversed			= true,
> >>>>> +	.led_control_register_base		= 0x01,
> >>>>> +	.enable_bits_per_led_control_register	= 8,
> >>>>> +	.reset_func				= is31fl3216_reset,
> >>>>> +	.sw_shutdown_func			= is31fl3216_software_shutdown,
> >>>>> +};
> >>>>> +
> >>>>> +static int is31fl32xx_write(struct is31fl32xx_priv *priv, u8 reg, u8 val)
> >>>>> +{
> >>>>> +	int ret;
> >>>>> +
> >>>>> +	dev_dbg(&priv->client->dev, "writing register 0x%02X=0x%02X", reg, val);
> >>>>> +
> >>>>> +	ret =  i2c_smbus_write_byte_data(priv->client, reg, val);
> >>>>> +	if (ret) {
> >>>>> +		dev_err(&priv->client->dev,
> >>>>> +			"register write to 0x%02X failed (error %d)",
> >>>>> +			reg, ret);
> >>>>> +	}
> >>>>> +	return ret;
> >>>>> +}
> >>>>> +
> >>>>> +/*
> >>>>> + * Custom reset function for IS31FL3216 because it does not have a RESET
> >>>>> + * register the way that the other IS31FL32xx chips do. We don't bother
> >>>>> + * writing the GPIO and animation registers, because the registers we
> >>>>> + * do write ensure those will have no effect.
> >>>>> + */
> >>>>> +static int is31fl3216_reset(struct is31fl32xx_priv *priv)
> >>>>> +{
> >>>>> +	unsigned int i;
> >>>>> +	int ret;
> >>>>> +
> >>>>> +	ret = is31fl32xx_write(priv, IS31FL3216_CONFIG_REG,
> >>>>> +			       IS31FL3216_CONFIG_SSD_ENABLE);
> >>>>> +	if (ret)
> >>>>> +		return ret;
> >>>>> +	for (i = 0; i < priv->cdef->channels; i++) {
> >>>>> +		ret = is31fl32xx_write(priv, priv->cdef->pwm_register_base+i,
> >>>>> +				       0x00);
> >>>>> +		if (ret)
> >>>>> +			return ret;
> >>>>> +	}
> >>>>> +	ret = is31fl32xx_write(priv, priv->cdef->pwm_update_reg, 0);
> >>>>> +	if (ret)
> >>>>> +		return ret;
> >>>>> +	ret = is31fl32xx_write(priv, IS31FL3216_LIGHTING_EFFECT_REG, 0x00);
> >>>>> +	if (ret)
> >>>>> +		return ret;
> >>>>> +	ret = is31fl32xx_write(priv, IS31FL3216_CHANNEL_CONFIG_REG, 0x00);
> >>>>> +	if (ret)
> >>>>> +		return ret;
> >>>>> +
> >>>>> +	return 0;
> >>>>> +}
> >>>>> +
> >>>>> +/*
> >>>>> + * Custom Software-Shutdown function for IS31FL3216 because it does not have
> >>>>> + * a SHUTDOWN register the way that the other IS31FL32xx chips do.
> >>>>> + * We don't bother doing a read/modify/write on the CONFIG register because
> >>>>> + * we only ever use a value of '0' for the other fields in that register.
> >>>>> + */
> >>>>> +static int is31fl3216_software_shutdown(struct is31fl32xx_priv *priv,
> >>>>> +					bool enable)
> >>>>> +{
> >>>>> +	u8 value = enable ? IS31FL3216_CONFIG_SSD_ENABLE :
> >>>>> +			    IS31FL3216_CONFIG_SSD_DISABLE;
> >>>>> +
> >>>>> +	return is31fl32xx_write(priv, IS31FL3216_CONFIG_REG, value);
> >>>>> +}
> >>>>> +
> >>>>> +/*
> >>>>> + * NOTE: A mutex is not needed in this function because:
> >>>>> + * - All referenced data is read-only after probe()
> >>>>> + * - The I2C core has a mutex on to protect the bus
> >>>>> + * - There are no read/modify/write operations
> >>>>> + * - Intervening operations between the write of the PWM register
> >>>>> + *   and the Update register are harmless.
> >>>>> + *
> >>>>> + * Example:
> >>>>> + *	PWM_REG_1 write 16
> >>>>> + *	UPDATE_REG write 0
> >>>>> + *	PWM_REG_2 write 128
> >>>>> + *	UPDATE_REG write 0
> >>>>> + *   vs:
> >>>>> + *	PWM_REG_1 write 16
> >>>>> + *	PWM_REG_2 write 128
> >>>>> + *	UPDATE_REG write 0
> >>>>> + *	UPDATE_REG write 0
> >>>>> + * are equivalent. Poking the Update register merely applies all PWM
> >>>>> + * register writes up to that point.
> >>>>> + */
> >>>>> +static int is31fl32xx_brightness_set(struct led_classdev *led_cdev,
> >>>>> +				     enum led_brightness brightness)
> >>>>> +{
> >>>>> +	const struct is31fl32xx_led_data *led_data =
> >>>>> +		container_of(led_cdev, struct is31fl32xx_led_data, cdev);
> >>>>> +	const struct is31fl32xx_chipdef *cdef = led_data->priv->cdef;
> >>>>> +	u8 pwm_register_offset;
> >>>>> +	int ret;
> >>>>> +
> >>>>> +	dev_dbg(led_cdev->dev, "%s: %d\n", __func__, brightness);
> >>>>> +
> >>>>> +	/* NOTE: led_data->channel is 1-based */
> >>>>> +	if (cdef->pwm_registers_reversed)
> >>>>> +		pwm_register_offset = cdef->channels - led_data->channel;
> >>>>> +	else
> >>>>> +		pwm_register_offset = led_data->channel - 1;
> >>>>> +
> >>>>> +	ret = is31fl32xx_write(led_data->priv,
> >>>>> +			       cdef->pwm_register_base + pwm_register_offset,
> >>>>> +			       brightness);
> >>>>> +	if (ret)
> >>>>> +		return ret;
> >>>>> +
> >>>>> +	return is31fl32xx_write(led_data->priv, cdef->pwm_update_reg, 0);
> >>>>> +}
> >>>>> +
> >>>>> +static int is31fl32xx_reset_regs(struct is31fl32xx_priv *priv)
> >>>>> +{
> >>>>> +	const struct is31fl32xx_chipdef *cdef = priv->cdef;
> >>>>> +	int ret;
> >>>>> +
> >>>>> +	if (cdef->reset_reg != IS31FL32XX_REG_NONE) {
> >>>>> +		ret = is31fl32xx_write(priv, cdef->reset_reg, 0);
> >>>>> +		if (ret)
> >>>>> +			return ret;
> >>>>> +	}
> >>>>> +
> >>>>> +	if (cdef->reset_func)
> >>>>> +		return cdef->reset_func(priv);
> >>>>> +
> >>>>> +	return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int is31fl32xx_software_shutdown(struct is31fl32xx_priv *priv,
> >>>>> +					bool enable)
> >>>>> +{
> >>>>> +	const struct is31fl32xx_chipdef *cdef = priv->cdef;
> >>>>> +	int ret;
> >>>>> +
> >>>>> +	if (cdef->shutdown_reg != IS31FL32XX_REG_NONE) {
> >>>>> +		u8 value = enable ? IS31FL32XX_SHUTDOWN_SSD_ENABLE :
> >>>>> +				    IS31FL32XX_SHUTDOWN_SSD_DISABLE;
> >>>>> +		ret = is31fl32xx_write(priv, cdef->shutdown_reg, value);
> >>>>> +		if (ret)
> >>>>> +			return ret;
> >>>>> +	}
> >>>>> +
> >>>>> +	if (cdef->sw_shutdown_func)
> >>>>> +		return cdef->sw_shutdown_func(priv, enable);  
> >>>>
> >>>> You seem to call sw_shutdown_func only here, so why should we have
> >>>> enable parameter in this op?  
> >>>
> >>> I'm not sure if I understand the question, but I will try to answer.
> >>>
> >>> 'enable' is passed through is31fl32xx_software_shutdown to
> >>> cdef->sw_shutdown_func, so it can be either true or false at that
> >>> point. The purpose of sw_shutdown_func is to add any special behavior
> >>> when enabling/disabling software-shutdown mode, which is needed for
> >>> the 3216 because its SSD bit is in a different position and with
> >>> opposite polarity.
> >>>
> >>> Is it that 'enable' in that line of code makes it look like it's being
> >>> called with an hardcoded value rather than a variable? If so, perhaps a
> >>> different parameter name would make it more obvious? Or a kerneldoc
> >>> comment for the function to describe the parameter?
> >>>
> >>> Or have I totally missed the point of the question?  
> >>
> >> Actually I should have placed this question next to
> >> the call to s31fl32xx_software_shutdown() in is31fl32xx_init_regs(),
> >> which is passed "false" in the second argument, and there is no
> >> other call to s31fl32xx_software_shutdown() in the driver.
> >>
> >> Having the argument makes people wondering that there is some
> >> use case in the driver, where "true" is passed, but it seems not
> >> to be the case.  
> >
> > Thanks for the clarification.
> >
> > Yes, there is currently no explicit call to enable software-shutdown
> > mode. Since the reset state of these devices is to have software-shutdown
> > enabled, the only explicit operation on it that's currently needed is
> > to disable it.
> >
> > Reasons I can think to have the 'enable' parameter anyways include:
> > - It seems logical to me that an API to manipulate the software-shutdown
> >    state should allow both enabling and disabling.
> > - Having a parameter for that seemed the most obvious way to go, and it
> >    was trivial to implement.
> > - Alternatively having separate "enable" and "disable" functions would
> >    duplicate most of the logic, vs the parameter being just a single
> >    conditional. And that would also imply two function pointers in the
> >    chipdefs, which I'd prefer to minimize.
> > - If anyone wanted to implement suspend/resume in the future, they would
> >    most likely do it by enabling/disabling software-shutdown. Supporting
> >    both enable/disable from the start should make that trivial to do.  
> 
> Suspend/resume callbacks are already implemented in led-class.c and
> related ops indirectly call brightness_set. If you want to support
> suspend/resume you have to set LED_CORE_SUSPENDRESUME flag.

If I understand correctly, all LED_CORE_SUSPENDRESUME will do is cause
the led core to set the brightness to 0 on suspend (and reverse that 
on resume). I see some drivers use this flag and other do not.
This brings up the question in my mind: how would a driver decide 
whether it is  appropriate for an LED to go dark on suspend? Is that 
just the drivers that know the logical purpose of the LEDs they control?

> Setting brightness to 0 is equivalent to turning the LED controller
> in a shutdown mode, provided that all sub-LEDs are off.

This is not strictly true for these devices. If someone cared very much 
about power usage when suspended they may want to put the LED controller 
into what it calls "shutdown mode" via the SSD bit. I didn't bother mainly 
because I have no need, and also because I wasn't sure how to even trigger 
a suspend in order to test an implementation.

FYI, I just measured it the effect of software-shutdown even with all LEDs 
already off. The difference in current is about 5mA, measured at the 5V 
supply to a 3216 eval board. Not huge, but someone might care. 

> > - I thought the code read better with a bool parameter, vs a longer
> >    function name.
> >
> > So nothing really critical, but mostly just my aesthetic and preference.
> >
> > Also, I expect that is31fl32xx_software_shutdown() would be inlined, so
> > the conditional check in there is optimized out anyways, and there is no
> > performance penalty. Looking at the disassembly in my ARMv7a build, both
> > of those have indeed happened there.  
> 
> Not only the size of a binary and the performance, but also code
> readability matters. The function is called only with false argument,
> so I expect that some people may submit patches optimizing this.
> 
> Let's avoid the confusion.

I guess we just have a difference of opinion on which way is more
readable, which is OK. Unless the above explanation causes you to 
change your mind, I will remove the 'enable' parameter and add a 
"_disable" suffix to both functions. That will also leave the 
	#define IS31FL32XX_SHUTDOWN_SSD_ENABLE  0
constant unused in the code, should that also be removed? Note that 
the 3216 specific constant
	#define IS31FL3216_CONFIG_SSD_ENABLE  BIT(7)
would still be used in is31fl3216_reset().

> >>>>> +	return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
> >>>>> +{
> >>>>> +	const struct is31fl32xx_chipdef *cdef = priv->cdef;
> >>>>> +	int ret;
> >>>>> +
> >>>>> +	ret = is31fl32xx_reset_regs(priv);
> >>>>> +	if (ret)
> >>>>> +		return ret;
> >>>>> +
> >>>>> +	/*
> >>>>> +	 * Set enable bit for all channels.
> >>>>> +	 * We will control state with PWM registers alone.
> >>>>> +	 */
> >>>>> +	if (cdef->led_control_register_base != IS31FL32XX_REG_NONE) {
> >>>>> +		u8 value =
> >>>>> +		    GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
> >>>>> +		u8 num_regs = cdef->channels /
> >>>>> +				cdef->enable_bits_per_led_control_register;
> >>>>> +		int i;
> >>>>> +
> >>>>> +		for (i = 0; i < num_regs; i++) {
> >>>>> +			ret = is31fl32xx_write(priv,
> >>>>> +					       cdef->led_control_register_base+i,
> >>>>> +					       value);
> >>>>> +			if (ret)
> >>>>> +				return ret;
> >>>>> +		}
> >>>>> +	}
> >>>>> +
> >>>>> +	ret = is31fl32xx_software_shutdown(priv, false);
> >>>>> +	if (ret)
> >>>>> +		return ret;
> >>>>> +
> >>>>> +	if (cdef->global_control_reg != IS31FL32XX_REG_NONE) {
> >>>>> +		ret = is31fl32xx_write(priv, cdef->global_control_reg, 0x00);
> >>>>> +		if (ret)
> >>>>> +			return ret;
> >>>>> +	}
> >>>>> +
> >>>>> +	return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static inline size_t sizeof_is31fl32xx_priv(int num_leds)
> >>>>> +{
> >>>>> +	return sizeof(struct is31fl32xx_priv) +
> >>>>> +		      (sizeof(struct is31fl32xx_led_data) * num_leds);
> >>>>> +}
> >>>>> +
> >>>>> +static int is31fl32xx_parse_child_dt(const struct device *dev,
> >>>>> +				     const struct device_node *child,
> >>>>> +				     struct is31fl32xx_led_data *led_data)
> >>>>> +{
> >>>>> +	struct led_classdev *cdev = &led_data->cdev;
> >>>>> +	int ret = 0;
> >>>>> +	u32 reg;
> >>>>> +
> >>>>> +	if (of_property_read_string(child, "label", &cdev->name))
> >>>>> +		cdev->name = child->name;
> >>>>> +
> >>>>> +	ret = of_property_read_u32(child, "reg", &reg);
> >>>>> +	if (ret || reg < 1 || reg > led_data->priv->cdef->channels) {
> >>>>> +		dev_err(dev,
> >>>>> +			"Child node %s does not have a valid reg property\n",
> >>>>> +			child->full_name);
> >>>>> +		return -EINVAL;
> >>>>> +	}
> >>>>> +	led_data->channel = reg;
> >>>>> +
> >>>>> +	of_property_read_string(child, "linux,default-trigger",
> >>>>> +				&cdev->default_trigger);
> >>>>> +
> >>>>> +	cdev->brightness_set_blocking = is31fl32xx_brightness_set;
> >>>>> +
> >>>>> +	return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
> >>>>> +					struct is31fl32xx_priv *priv,
> >>>>> +					u8 channel)
> >>>>> +{
> >>>>> +	size_t i;
> >>>>> +
> >>>>> +	for (i = 0; i < priv->num_leds; i++) {
> >>>>> +		if (priv->leds[i].channel == channel)
> >>>>> +			return &priv->leds[i];
> >>>>> +	}
> >>>>> +
> >>>>> +	return NULL;
> >>>>> +}
> >>>>> +
> >>>>> +static int is31fl32xx_parse_dt(struct device *dev,
> >>>>> +			       struct is31fl32xx_priv *priv)
> >>>>> +{
> >>>>> +	struct device_node *child;
> >>>>> +	int ret = 0;
> >>>>> +
> >>>>> +	for_each_child_of_node(dev->of_node, child) {
> >>>>> +		struct is31fl32xx_led_data *led_data =
> >>>>> +			&priv->leds[priv->num_leds];
> >>>>> +		const struct is31fl32xx_led_data *other_led_data;
> >>>>> +
> >>>>> +		led_data->priv = priv;
> >>>>> +
> >>>>> +		ret = is31fl32xx_parse_child_dt(dev, child, led_data);
> >>>>> +		if (ret)
> >>>>> +			goto err;
> >>>>> +
> >>>>> +		/* Detect if channel is already in use by another child */
> >>>>> +		other_led_data = is31fl32xx_find_led_data(priv,
> >>>>> +							  led_data->channel);
> >>>>> +		if (other_led_data) {
> >>>>> +			dev_err(dev,
> >>>>> +				"%s and %s both attempting to use channel %d\n",
> >>>>> +				led_data->cdev.name,
> >>>>> +				other_led_data->cdev.name,
> >>>>> +				led_data->channel);
> >>>>> +			goto err;
> >>>>> +		}
> >>>>> +
> >>>>> +		ret = devm_led_classdev_register(dev, &led_data->cdev);
> >>>>> +		if (ret) {
> >>>>> +			dev_err(dev, "failed to register PWM led for %s: %d\n",
> >>>>> +				led_data->cdev.name, ret);
> >>>>> +			goto err;
> >>>>> +		}
> >>>>> +
> >>>>> +		priv->num_leds++;
> >>>>> +	}
> >>>>> +
> >>>>> +	return 0;
> >>>>> +
> >>>>> +err:
> >>>>> +	of_node_put(child);
> >>>>> +	return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static const struct of_device_id of_is31fl31xx_match[] = {
> >>>>> +	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
> >>>>> +	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
> >>>>> +	{ .compatible = "issi,is31fl3218", .data = &is31fl3218_cdef, },
> >>>>> +	{ .compatible = "issi,is31fl3216", .data = &is31fl3216_cdef, },
> >>>>> +	{},
> >>>>> +};
> >>>>> +
> >>>>> +MODULE_DEVICE_TABLE(of, of_is31fl31xx_match);
> >>>>> +
> >>>>> +static int is31fl32xx_probe(struct i2c_client *client,
> >>>>> +			    const struct i2c_device_id *id)
> >>>>> +{
> >>>>> +	const struct is31fl32xx_chipdef *cdef;
> >>>>> +	const struct of_device_id *of_dev_id;
> >>>>> +	struct device *dev = &client->dev;
> >>>>> +	struct is31fl32xx_priv *priv;
> >>>>> +	int count;
> >>>>> +	int ret = 0;
> >>>>> +
> >>>>> +	of_dev_id = of_match_device(of_is31fl31xx_match, dev);
> >>>>> +	if (!of_dev_id)
> >>>>> +		return -EINVAL;
> >>>>> +
> >>>>> +	cdef = of_dev_id->data;
> >>>>> +
> >>>>> +	count = of_get_child_count(dev->of_node);
> >>>>> +	if (!count)
> >>>>> +		return -EINVAL;
> >>>>> +
> >>>>> +	priv = devm_kzalloc(dev, sizeof_is31fl32xx_priv(count),
> >>>>> +			    GFP_KERNEL);
> >>>>> +	if (!priv)
> >>>>> +		return -ENOMEM;
> >>>>> +
> >>>>> +	priv->client = client;
> >>>>> +	priv->cdef = cdef;
> >>>>> +	i2c_set_clientdata(client, priv);
> >>>>> +
> >>>>> +	ret = is31fl32xx_init_regs(priv);
> >>>>> +	if (ret)
> >>>>> +		return ret;
> >>>>> +
> >>>>> +	ret = is31fl32xx_parse_dt(dev, priv);
> >>>>> +	if (ret)
> >>>>> +		return ret;
> >>>>> +
> >>>>> +	return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int is31fl32xx_remove(struct i2c_client *client)
> >>>>> +{
> >>>>> +	struct is31fl32xx_priv *priv = i2c_get_clientdata(client);
> >>>>> +
> >>>>> +	return is31fl32xx_reset_regs(priv);
> >>>>> +}
> >>>>> +
> >>>>> +/*
> >>>>> + * i2c-core requires that id_table be non-NULL, even though
> >>>>> + * it is not used for DeviceTree based instantiation.
> >>>>> + */
> >>>>> +static const struct i2c_device_id is31fl31xx_id[] = {
> >>>>> +	{},
> >>>>> +};
> >>>>> +
> >>>>> +MODULE_DEVICE_TABLE(i2c, is31fl31xx_id);
> >>>>> +
> >>>>> +static struct i2c_driver is31fl32xx_driver = {
> >>>>> +	.driver = {
> >>>>> +		.name	= "is31fl32xx",
> >>>>> +		.of_match_table = of_is31fl31xx_match,
> >>>>> +	},
> >>>>> +	.probe		= is31fl32xx_probe,
> >>>>> +	.remove		= is31fl32xx_remove,
> >>>>> +	.id_table	= is31fl31xx_id,
> >>>>> +};
> >>>>> +
> >>>>> +module_i2c_driver(is31fl32xx_driver);
> >>>>> +
> >>>>> +MODULE_AUTHOR("David Rivshin <drivshin@allworx.com>");
> >>>>> +MODULE_DESCRIPTION("ISSI IS31FL32xx LED driver");
> >>>>> +MODULE_LICENSE("GPL v2");
> >>>>>  
