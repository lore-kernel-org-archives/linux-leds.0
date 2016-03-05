From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 3/4] leds: Add driver for the ISSI IS31FL32xx family of
 LED controllers
Date: Sat, 5 Mar 2016 12:39:35 +0100
Message-ID: <56DAC577.1050003@gmail.com>
References: <1456974095-1867-1-git-send-email-drivshin.allworx@gmail.com>
 <1456974095-1867-4-git-send-email-drivshin.allworx@gmail.com>
 <682127661.49201.48a3a228-580f-4e1c-8c1d-bebac820f9fc.open-xchange@email.1und1.de>
 <20160304092706.278ba7c3.drivshin.allworx@gmail.com>
 <56D9ABD9.6040708@samsung.com>
 <20160305011259.40fec807.drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34467 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755832AbcCELkD (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 5 Mar 2016 06:40:03 -0500
In-Reply-To: <20160305011259.40fec807.drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Mark Rutland <mark.rutland@arm.com>

On 03/05/2016 07:12 AM, David Rivshin (Allworx) wrote:
> On Fri, 04 Mar 2016 16:38:01 +0100
> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>
>> On 03/04/2016 03:27 PM, David Rivshin (Allworx) wrote:
>>> (Stefan, sorry for the duplicate, I just realized that I originally
>>> replied only to you by accident).
>>>
>>> On Thu, 3 Mar 2016 19:13:03 +0100 (CET)
>>> Stefan Wahren <stefan.wahren@i2se.com> wrote:
>>>
>>>> Hi David,
>>>>
>>>> i will test the driver on weekend. Some comments below
>>>
>>> Great, thanks very much.
>>>
>>>>> "David Rivshin (Allworx)" <drivshin.allworx@gmail.com> hat am 3. =
M=C3=A4rz 2016 um
>>>>> 04:01 geschrieben:
>>>>>
>>>>>
>>>>> From: David Rivshin <drivshin@allworx.com>
>>>>>
>>>>> The IS31FL32xx family of LED controllers are I2C devices with mul=
tiple
>>>>> constant-current channels, each with independent 256-level PWM co=
ntrol.
>>>>>
>>>>> Datasheets: http://www.issi.com/US/product-analog-fxled-driver.sh=
tml
>>>>>
>>>>> This has been tested on the IS31FL3236 and IS31FL3216, on an ARM
>>>>> (TI am335x) platform.
>>>>>
>>>>> The programming paradigm of these devices is similar in the follo=
wing
>>>>> ways:
>>>>> - All registers are 8 bit
>>>>> - All LED control registers are write-only
>>>>> - Each LED channel has a PWM register (0-255)
>>>>> - PWM register writes are shadowed until an Update register is po=
ked
>>>>> - All have a concept of Software Shutdown, which disables output
>>>>>
>>>>> However, there are some differences in devices:
>>>>> - 3236/3235 have a separate Control register for each LED,
>>>>> (3218/3216 pack the enable bits into fewer registers)
>>>>> - 3236/3235 have a per-channel current divisor setting
>>>>> - 3236/3235 have a Global Control register that can turn off all =
LEDs
>>>>> - 3216 is unique in a number of ways
>>>>> - OUT9-OUT16 can be configured as GPIOs instead of LED controls
>>>>> - LEDs can be programmed with an 8-frame animation, with
>>>>> programmable delay between frames
>>>>> - LEDs can be modulated by an input audio signal
>>>>> - Max output current can be adjusted from 1/4 to 2x globally
>>>>> - Has a Configuration register instead of a Shutdown register
>>>>>
>>>>> This driver currently only supports the base PWM control function
>>>>> of these devices. The following features of these devices are not
>>>>> implemented, although it should be possible to add them in the fu=
ture:
>>>>> - All devices are capable of going into a lower-power "software
>>>>> shutdown" mode.
>>>>> - The is31fl3236 and is31fl3235 can reduce the max output current
>>>>> per-channel with a divisor of 1, 2, 3, or 4.
>>>>> - The is31fl3216 can use some LED channels as GPIOs instead.
>>>>> - The is31fl3216 can animate LEDs in hardware.
>>>>> - The is31fl3216 can modulate LEDs according to an audio input.
>>>>> - The is31fl3216 can reduce/increase max output current globally.
>>>>>
>>>>> Signed-off-by: David Rivshin <drivshin@allworx.com>
>>>>> ---
>>>>>
>>>>> You may see two instances of this warning:
>>>>> "passing argument 1 of 'of_property_read_string' discards 'const'
>>>>> qualifier from pointer target type"
>>>>> That is a result of of_property_read_string() taking a non-const
>>>>> struct device_node pointer parameter. I have separately submitted=
 a
>>>>> patch to fix that [1], and a few related functions which had the =
same
>>>>> issue. I'm hoping that will get into linux-next before this does,=
 so
>>>>> that the warnings never show up there.
>>>>>
>>>>> Changes from RFC:
>>>>> - Removed max-brightness DT property.
>>>>> - Refer to these devices as "LED controllers" in Kconfig.
>>>>> - Removed redundant last sentence from Kconfig entry
>>>>> - Removed unnecessary debug code.
>>>>> - Do not set led_classdev.brightness to 0 explicitly, as it is
>>>>> already initialized to 0 by devm_kzalloc().
>>>>> - Used of_property_read_string() instead of of_get_property().
>>>>> - Fail immediately on DT parsing error in a child node, rather th=
an
>>>>> continuing on with the non-faulty ones.
>>>>> - Added additional comments for some things that might be non-obv=
ious.
>>>>> - Added constants for the location of the SSD bit in the SHUTDOWN
>>>>> register, and the 3216's CONFIG register.
>>>>> - Added special sw_shutdown_func for the 3216 device, as that bit
>>>>> is in a different register, at a different position, and has reve=
rse
>>>>> polarity compared to all the other devices.
>>>>> - Refactored is31fl32xx_init_regs() to separate out some logic in=
to
>>>>> is31fl32xx_reset_regs() and is31fl32xx_software_shutdown().
>>>>>
>>>>> [1] https://lkml.org/lkml/2016/3/2/746
>>>>>
>>>>> drivers/leds/Kconfig | 8 +
>>>>> drivers/leds/Makefile | 1 +
>>>>> drivers/leds/leds-is31fl32xx.c | 505 ++++++++++++++++++++++++++++=
+++++++++++++
>>>>> 3 files changed, 514 insertions(+)
>>>>> create mode 100644 drivers/leds/leds-is31fl32xx.c
>>>>>
>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>> index 1034696..9c63ba4 100644
>>>>> --- a/drivers/leds/Kconfig
>>>>> +++ b/drivers/leds/Kconfig
>>>>> @@ -580,6 +580,14 @@ config LEDS_SN3218
>>>>> This driver can also be built as a module. If so the module
>>>>> will be called leds-sn3218.
>>>>>
>>>>> +config LEDS_IS31FL32XX
>>>>> + tristate "LED support for ISSI IS31FL32XX I2C LED controller fa=
mily"
>>>>> + depends on LEDS_CLASS && I2C && OF
>>>>> + help
>>>>> + Say Y here to include support for ISSI IS31FL32XX LED controlle=
rs.
>>>>> + They are I2C devices with multiple constant-current channels, e=
ach
>>>>> + with independent 256-level PWM control.
>>>>
>>>> Is it worth to mention the module name here?
>>>
>>> I noticed that some do and some don't. I don't mind adding it, but =
it
>>> also seemed like it would be obvious, and therefore unnecessary.
>>>
>>> Jacek, which do you prefer?
>>
>> I agree - it's obvious, we can skip it.
>>
>>>>> +
>>>>> comment "LED driver for blink(1) USB RGB LED is under Special HID=
 drivers
>>>>> (HID_THINGM)"
>>>>>
>>>>> config LEDS_BLINKM
>>>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>>>> index 89c9b6f..3fdf313 100644
>>>>> --- a/drivers/leds/Makefile
>>>>> +++ b/drivers/leds/Makefile
>>>>> @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_KTD2692) +=3D leds-ktd2692.o
>>>>> obj-$(CONFIG_LEDS_POWERNV) +=3D leds-powernv.o
>>>>> obj-$(CONFIG_LEDS_SEAD3) +=3D leds-sead3.o
>>>>> obj-$(CONFIG_LEDS_SN3218) +=3D leds-sn3218.o
>>>>> +obj-$(CONFIG_LEDS_IS31FL32XX) +=3D leds-is31fl32xx.o
>>>>>
>>>>> # LED SPI Drivers
>>>>> obj-$(CONFIG_LEDS_DAC124S085) +=3D leds-dac124s085.o
>>>>> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-i=
s31fl32xx.c
>>>>> new file mode 100644
>>>>> index 0000000..49818f0
>>>>> --- /dev/null
>>>>> +++ b/drivers/leds/leds-is31fl32xx.c
>>>>> @@ -0,0 +1,505 @@
>>>>> +/*
>>>>> + * linux/drivers/leds-is31fl32xx.c
>>>>
>>>> I think this is unnecessary.
>>>
>>> I tend to agree. I think I used leds-pwm.c as a template, and that =
had
>>> such a comment. I assumed it was coding-style and kept it, but now =
I see
>>> that only a minority of led drivers have it. If I do another spin f=
or
>>> any reason I'll remove it.
>>>
>>>>> + *
>>>>> + * Driver for ISSI IS31FL32xx family of I2C LED controllers
>>>>> + *
>>>>> + * Copyright 2015 Allworx Corp.
>>>>> + *
>>>>> + *
>>>>> + * This program is free software; you can redistribute it and/or=
 modify
>>>>> + * it under the terms of the GNU General Public License version =
2 as
>>>>> + * published by the Free Software Foundation.
>>>>> + *
>>>>> + * Datasheets: http://www.issi.com/US/product-analog-fxled-drive=
r.shtml
>>>>> + */
>>>>> +
>>>>
>>>> Shouldn't we include <linux/device.h> here?
>>>
>>> Good catch. I was getting that via i2c.h, but since struct device i=
s
>>> referenced explicitly in a few places, device.h should probably be
>>> included directly.
>>
>> linux/device.h is included from linux/leds.h
>
> This is true, but SubmitChecklist says the following on this topic:
> 1: If you use a facility then #include the file that defines/declares
>     that facility.  Don't depend on other header files pulling in one=
s
>     that you use.

I'm not sure why declarations are mentioned here. If a type is used
only as an opaque pointer, a declaration suffices. It reduces the numbe=
r
of build dependencies.

> (Oddly CodingStyle is silent on the topic, which is where I would hav=
e
> thought such a thing would be documented.)
>
> I interpreted that to mean that because 'struct device*' appears in
> this file, it should include <linux/device.h> directly.

The header is required if full information about the type implementatio=
n
is required, i.e. there are defined variables of the type or the code
refers to the type properties (e.g. dev->of_node).

linux/leds.h could compile without including linux/device.h, if only
it declared struct device, struct attribute_group and
struct device_attribute types.

It might have been that that this include directive has been added
intentionally for the LED class drivers not to be forced to include
it on their own, and indeed most of them don't do it.

Nothing prevents us from sticking to the SubmitChecklist though.

>>>>> +#include <linux/err.h>
>>>>> +#include <linux/i2c.h>
>>>>> +#include <linux/kernel.h>
>>>>> +#include <linux/leds.h>
>>>>> +#include <linux/module.h>
>>>>> +#include <linux/of_platform.h>
>>>>> +
>>>>> +/* Used to indicate a device has no such register */
>>>>> +#define IS31FL32XX_REG_NONE 0xFF
>>>>> +
>>>>> +/* Software Shutdown bit in Shutdown Register */
>>>>> +#define IS31FL32XX_SHUTDOWN_SSD_ENABLE 0
>>>>> +#define IS31FL32XX_SHUTDOWN_SSD_DISABLE BIT(0)
>>>>> +
>>>>> +/* IS31FL3216 has a number of unique registers */
>>>>> +#define IS31FL3216_CONFIG_REG 0x00
>>>>> +#define IS31FL3216_LIGHTING_EFFECT_REG 0x03
>>>>> +#define IS31FL3216_CHANNEL_CONFIG_REG 0x04
>>>>> +
>>>>> +/* Software Shutdown bit in 3216 Config Register */
>>>>> +#define IS31FL3216_CONFIG_SSD_ENABLE BIT(7)
>>>>> +#define IS31FL3216_CONFIG_SSD_DISABLE 0
>>>>> +
>>>>> +struct is31fl32xx_priv;
>>>>> +struct is31fl32xx_led_data {
>>>>> + struct led_classdev cdev;
>>>>> + u8 channel; /* 1-based, max priv->cdef->channels */
>>>>> + struct is31fl32xx_priv *priv;
>>>>> +};
>>>>> +
>>>>> +struct is31fl32xx_priv {
>>>>> + const struct is31fl32xx_chipdef *cdef;
>>>>> + struct i2c_client *client;
>>>>> + unsigned int num_leds;
>>>>> + struct is31fl32xx_led_data leds[0];
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct is31fl32xx_chipdef - chip-specific attributes
>>>>> + * @channels : Number of LED channels
>>>>> + * @shutdown_reg : address of Shutdown register (optional)
>>>>> + * @pwm_update_reg : address of PWM Update register
>>>>> + * @global_control_reg : address of Global Control register (opt=
ional)
>>>>> + * @reset_reg : address of Reset register (optional)
>>>>> + * @pwm_register_base : address of first PWM register
>>>>> + * @pwm_registers_reversed: : true if PWM registers count down i=
nstead of up
>>>>> + * @led_control_register_base : address of first LED control reg=
ister
>>>>> (optional)
>>>>> + * @enable_bits_per_led_control_register: number of LEDs enable =
bits in each
>>>>> + * @reset_func: : pointer to reset function
>>>>> + *
>>>>> + * For all optional register addresses, the sentinel value
>>>>> %IS31FL32XX_REG_NONE
>>>>> + * indicates that this chip has no such register.
>>>>> + *
>>>>> + * If non-NULL, @reset_func will be called during probing to set=
 all
>>>>> + * necessary registers to a known initialization state. This is =
needed
>>>>> + * for chips that do not have a @reset_reg.
>>>>> + *
>>>>> + * @enable_bits_per_led_control_register must be >=3D1 if
>>>>> + * @led_control_register_base !=3D %IS31FL32XX_REG_NONE.
>>>>> + */
>>>>> +struct is31fl32xx_chipdef {
>>>>> + u8 channels;
>>>>> + u8 shutdown_reg;
>>>>> + u8 pwm_update_reg;
>>>>> + u8 global_control_reg;
>>>>> + u8 reset_reg;
>>>>> + u8 pwm_register_base;
>>>>> + bool pwm_registers_reversed;
>>>>> + u8 led_control_register_base;
>>>>> + u8 enable_bits_per_led_control_register;
>>>>> + int (*reset_func)(struct is31fl32xx_priv *priv);
>>>>> + int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enab=
le);
>>>>> +};
>>>>> +
>>>>> +static const struct is31fl32xx_chipdef is31fl3236_cdef =3D {
>>>>> + .channels =3D 36,
>>>>> + .shutdown_reg =3D 0x00,
>>>>> + .pwm_update_reg =3D 0x25,
>>>>> + .global_control_reg =3D 0x4a,
>>>>> + .reset_reg =3D 0x4f,
>>>>> + .pwm_register_base =3D 0x01,
>>>>> + .led_control_register_base =3D 0x26,
>>>>> + .enable_bits_per_led_control_register =3D 1,
>>>>> +};
>>>>> +
>>>>> +static const struct is31fl32xx_chipdef is31fl3235_cdef =3D {
>>>>> + .channels =3D 28,
>>>>> + .shutdown_reg =3D 0x00,
>>>>> + .pwm_update_reg =3D 0x25,
>>>>> + .global_control_reg =3D 0x4a,
>>>>> + .reset_reg =3D 0x4f,
>>>>> + .pwm_register_base =3D 0x05,
>>>>> + .led_control_register_base =3D 0x2a,
>>>>> + .enable_bits_per_led_control_register =3D 1,
>>>>> +};
>>>>> +
>>>>> +static const struct is31fl32xx_chipdef is31fl3218_cdef =3D {
>>>>> + .channels =3D 18,
>>>>> + .shutdown_reg =3D 0x00,
>>>>> + .pwm_update_reg =3D 0x16,
>>>>> + .global_control_reg =3D IS31FL32XX_REG_NONE,
>>>>> + .reset_reg =3D 0x17,
>>>>> + .pwm_register_base =3D 0x01,
>>>>> + .led_control_register_base =3D 0x13,
>>>>> + .enable_bits_per_led_control_register =3D 6,
>>>>> +};
>>>>> +
>>>>> +static int is31fl3216_reset(struct is31fl32xx_priv *priv);
>>>>> +static int is31fl3216_software_shutdown(struct is31fl32xx_priv *=
priv,
>>>>> + bool enable);
>>>>> +static const struct is31fl32xx_chipdef is31fl3216_cdef =3D {
>>>>> + .channels =3D 16,
>>>>> + .shutdown_reg =3D IS31FL32XX_REG_NONE,
>>>>> + .pwm_update_reg =3D 0xB0,
>>>>> + .global_control_reg =3D IS31FL32XX_REG_NONE,
>>>>> + .reset_reg =3D IS31FL32XX_REG_NONE,
>>>>> + .pwm_register_base =3D 0x10,
>>>>> + .pwm_registers_reversed =3D true,
>>>>> + .led_control_register_base =3D 0x01,
>>>>> + .enable_bits_per_led_control_register =3D 8,
>>>>> + .reset_func =3D is31fl3216_reset,
>>>>> + .sw_shutdown_func =3D is31fl3216_software_shutdown,
>>>>> +};
>>>>> +
>>>>> +static int is31fl32xx_write(struct is31fl32xx_priv *priv, u8 reg=
, u8 val)
>>>>> +{
>>>>> + int ret;
>>>>> +
>>>>> + dev_dbg(&priv->client->dev, "writing register 0x%02X=3D0x%02X",=
 reg, val);
>>>>> +
>>>>> + ret =3D i2c_smbus_write_byte_data(priv->client, reg, val);
>>>>> + if (ret) {
>>>>> + dev_err(&priv->client->dev,
>>>>> + "register write to 0x%02X failed (error %d)",
>>>>> + reg, ret);
>>>>> + }
>>>>
>>>> In case somebody use this driver as heartbeat and writing fails pe=
rmanently the
>>>> log will be flooded.
>>>
>>> Unless I'm mistaken that would require the device/bus to fail after
>>> successfully probing (probe code itself bails on the first write
>>> failure, so there would be no flooding as a result of that). So whi=
le
>>> not impossible, I imagine it would be unlikely, and I'd hate to rem=
ove
>>> an error message for such an important condition.
>>>
>>> I suppose I could use dev_err_ratelimited() to soften any potential
>>> flooding, but I second guess that because:
>>>    - In led_core.c set_brightness_delayed() has a dev_err() that wo=
uld come
>>>      out on each failed LED update anyways.
>>>    - There is precedent in other led drivers of a similar error mes=
sage.
>>>    - Some userspace logging programs will compresses repeated messa=
ges anyways.
>>>
>>> Jacek, what is your preference on this?
>>
>> Let's leave it as is. Permanent I2C bus failure is a critical error =
and
>> flooding the log would only allow to diagnose the problem quicker.
>>
>>>>> + return ret;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Custom reset function for IS31FL3216 because it does not have=
 a RESET
>>>>> + * register the way that the other IS31FL32xx chips do. We don't=
 bother
>>>>> + * writing the GPIO and animation registers, because the registe=
rs we
>>>>> + * do write ensure those will have no effect.
>>>>> + */
>>>>> +static int is31fl3216_reset(struct is31fl32xx_priv *priv)
>>>>> +{
>>>>> + unsigned int i;
>>>>> + int ret;
>>>>> +
>>>>> + ret =3D is31fl32xx_write(priv, IS31FL3216_CONFIG_REG,
>>>>> + IS31FL3216_CONFIG_SSD_ENABLE);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> + for (i =3D 0; i < priv->cdef->channels; i++) {
>>>>> + ret =3D is31fl32xx_write(priv, priv->cdef->pwm_register_base+i,
>>>>> + 0x00);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> + }
>>>>> + ret =3D is31fl32xx_write(priv, priv->cdef->pwm_update_reg, 0);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> + ret =3D is31fl32xx_write(priv, IS31FL3216_LIGHTING_EFFECT_REG, =
0x00);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> + ret =3D is31fl32xx_write(priv, IS31FL3216_CHANNEL_CONFIG_REG, 0=
x00);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> +
>>>>> + return 0;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Custom Software-Shutdown function for IS31FL3216 because it d=
oes not have
>>>>> + * a SHUTDOWN register the way that the other IS31FL32xx chips d=
o.
>>>>> + * We don't bother doing a read/modify/write on the CONFIG regis=
ter because
>>>>> + * we only ever use a value of '0' for the other fields in that =
register.
>>>>> + */
>>>>> +static int is31fl3216_software_shutdown(struct is31fl32xx_priv *=
priv,
>>>>> + bool enable)
>>>>> +{
>>>>> + u8 value =3D enable ? IS31FL3216_CONFIG_SSD_ENABLE :
>>>>> + IS31FL3216_CONFIG_SSD_DISABLE;
>>>>> +
>>>>> + return is31fl32xx_write(priv, IS31FL3216_CONFIG_REG, value);
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * NOTE: A mutex is not needed in this function because:
>>>>> + * - All referenced data is read-only after probe()
>>>>> + * - The I2C core has a mutex on to protect the bus
>>>>> + * - There are no read/modify/write operations
>>>>> + * - Intervening operations between the write of the PWM registe=
r
>>>>> + * and the Update register are harmless.
>>>>> + *
>>>>> + * Example:
>>>>> + * PWM_REG_1 write 16
>>>>> + * UPDATE_REG write 0
>>>>> + * PWM_REG_2 write 128
>>>>> + * UPDATE_REG write 0
>>>>> + * vs:
>>>>> + * PWM_REG_1 write 16
>>>>> + * PWM_REG_2 write 128
>>>>> + * UPDATE_REG write 0
>>>>> + * UPDATE_REG write 0
>>>>> + * are equivalent. Poking the Update register merely applies all=
 PWM
>>>>> + * register writes up to that point.
>>>>> + */
>>>>> +static int is31fl32xx_brightness_set(struct led_classdev *led_cd=
ev,
>>>>> + enum led_brightness brightness)
>>>>> +{
>>>>> + const struct is31fl32xx_led_data *led_data =3D
>>>>> + container_of(led_cdev, struct is31fl32xx_led_data, cdev);
>>>>> + const struct is31fl32xx_chipdef *cdef =3D led_data->priv->cdef;
>>>>> + u8 pwm_register_offset;
>>>>> + int ret;
>>>>> +
>>>>> + dev_dbg(led_cdev->dev, "%s: %d\n", __func__, brightness);
>>>>> +
>>>>> + /* NOTE: led_data->channel is 1-based */
>>>>> + if (cdef->pwm_registers_reversed)
>>>>> + pwm_register_offset =3D cdef->channels - led_data->channel;
>>>>> + else
>>>>> + pwm_register_offset =3D led_data->channel - 1;
>>>>> +
>>>>> + ret =3D is31fl32xx_write(led_data->priv,
>>>>> + cdef->pwm_register_base + pwm_register_offset,
>>>>> + brightness);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> +
>>>>> + return is31fl32xx_write(led_data->priv, cdef->pwm_update_reg, 0=
);
>>>>> +}
>>>>> +
>>>>> +static int is31fl32xx_reset_regs(struct is31fl32xx_priv *priv)
>>>>> +{
>>>>> + const struct is31fl32xx_chipdef *cdef =3D priv->cdef;
>>>>> + int ret;
>>>>> +
>>>>> + if (cdef->reset_reg !=3D IS31FL32XX_REG_NONE) {
>>>>> + ret =3D is31fl32xx_write(priv, cdef->reset_reg, 0);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> + }
>>>>> +
>>>>> + if (cdef->reset_func)
>>>>> + return cdef->reset_func(priv);
>>>>> +
>>>>> + return 0;
>>>>> +}
>>>>> +
>>>>> +static int is31fl32xx_software_shutdown(struct is31fl32xx_priv *=
priv,
>>>>> + bool enable)
>>>>> +{
>>>>> + const struct is31fl32xx_chipdef *cdef =3D priv->cdef;
>>>>> + int ret;
>>>>> +
>>>>> + if (cdef->shutdown_reg !=3D IS31FL32XX_REG_NONE) {
>>>>> + u8 value =3D enable ? IS31FL32XX_SHUTDOWN_SSD_ENABLE :
>>>>> + IS31FL32XX_SHUTDOWN_SSD_DISABLE;
>>>>> + ret =3D is31fl32xx_write(priv, cdef->shutdown_reg, value);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> + }
>>>>> +
>>>>> + if (cdef->sw_shutdown_func)
>>>>> + return cdef->sw_shutdown_func(priv, enable);
>>>>> +
>>>>> + return 0;
>>>>> +}
>>>>> +
>>>>> +static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
>>>>> +{
>>>>> + const struct is31fl32xx_chipdef *cdef =3D priv->cdef;
>>>>> + int ret;
>>>>> +
>>>>> + ret =3D is31fl32xx_reset_regs(priv);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> +
>>>>> + /*
>>>>> + * Set enable bit for all channels.
>>>>> + * We will control state with PWM registers alone.
>>>>> + */
>>>>> + if (cdef->led_control_register_base !=3D IS31FL32XX_REG_NONE) {
>>>>> + u8 value =3D
>>>>> + GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
>>>>> + u8 num_regs =3D cdef->channels /
>>>>> + cdef->enable_bits_per_led_control_register;
>>>>> + int i;
>>>>> +
>>>>> + for (i =3D 0; i < num_regs; i++) {
>>>>> + ret =3D is31fl32xx_write(priv,
>>>>> + cdef->led_control_register_base+i,
>>>>> + value);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> + }
>>>>> + }
>>>>> +
>>>>> + ret =3D is31fl32xx_software_shutdown(priv, false);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> +
>>>>> + if (cdef->global_control_reg !=3D IS31FL32XX_REG_NONE) {
>>>>> + ret =3D is31fl32xx_write(priv, cdef->global_control_reg, 0x00);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> + }
>>>>> +
>>>>> + return 0;
>>>>> +}
>>>>> +
>>>>> +static inline size_t sizeof_is31fl32xx_priv(int num_leds)
>>>>> +{
>>>>> + return sizeof(struct is31fl32xx_priv) +
>>>>> + (sizeof(struct is31fl32xx_led_data) * num_leds);
>>>>> +}
>>>>> +
>>>>> +static int is31fl32xx_parse_child_dt(const struct device *dev,
>>>>> + const struct device_node *child,
>>>>> + struct is31fl32xx_led_data *led_data)
>>>>> +{
>>>>> + struct led_classdev *cdev =3D &led_data->cdev;
>>>>> + int ret =3D 0;
>>>>> + u32 reg;
>>>>> +
>>>>> + if (of_property_read_string(child, "label", &cdev->name))
>>>>> + cdev->name =3D child->name;
>>>>> +
>>>>> + ret =3D of_property_read_u32(child, "reg", &reg);
>>>>> + if (ret || reg < 1 || reg > led_data->priv->cdef->channels) {
>>>>> + dev_err(dev,
>>>>> + "Child node %s does not have a valid reg property\n",
>>>>> + child->full_name);
>>>>> + return -EINVAL;
>>>>> + }
>>>>> + led_data->channel =3D reg;
>>>>> +
>>>>> + of_property_read_string(child, "linux,default-trigger",
>>>>> + &cdev->default_trigger);
>>>>> +
>>>>> + cdev->brightness_set_blocking =3D is31fl32xx_brightness_set;
>>>>> +
>>>>> + return 0;
>>>>> +}
>>>>> +
>>>>> +static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
>>>>> + struct is31fl32xx_priv *priv,
>>>>> + u8 channel)
>>>>> +{
>>>>> + size_t i;
>>>>> +
>>>>> + for (i =3D 0; i < priv->num_leds; i++) {
>>>>> + if (priv->leds[i].channel =3D=3D channel)
>>>>> + return &priv->leds[i];
>>>>> + }
>>>>> +
>>>>> + return NULL;
>>>>> +}
>>>>> +
>>>>> +static int is31fl32xx_parse_dt(struct device *dev,
>>>>> + struct is31fl32xx_priv *priv)
>>>>> +{
>>>>> + struct device_node *child;
>>>>> + int ret =3D 0;
>>>>> +
>>>>> + for_each_child_of_node(dev->of_node, child) {
>>>>> + struct is31fl32xx_led_data *led_data =3D
>>>>> + &priv->leds[priv->num_leds];
>>>>
>>>> Maybe i missed something, but is it really protected against out o=
f index
>>>> access?
>>>
>>> The array is allocated with size equal to the number of child nodes=
,
>>> and num_leds is incremented once for each child node parsed. So in
>>> order for the index to be out of bounds, the number of child nodes
>>> would need to increase during the probe. I assumed that the DT is
>>> static during probing, but if that's not the case then you're right
>>> that this is a potential problem. Also, this equivalent logic is
>>> used in leds-pwm, leds-gpio, and leds-ns2, so that gives me
>>> confidence that its safe.
>>> Unless DT overlays change that assumption?
>>
>> DT overlays would matter here if child DT nodes could be dynamically
>> removed, i.e. if it was possible by design to dynamically unplug LED=
s
>> from the current outputs during LED controller operation, which is n=
ot
>> the case for this device (and any other LED controller I am aware of=
).
>>
>>>>> + const struct is31fl32xx_led_data *other_led_data;
>>>>> +
>>>>> + led_data->priv =3D priv;
>>>>> +
>>>>> + ret =3D is31fl32xx_parse_child_dt(dev, child, led_data);
>>>>> + if (ret)
>>>>> + goto err;
>>>>> +
>>>>> + /* Detect if channel is already in use by another child */
>>>>> + other_led_data =3D is31fl32xx_find_led_data(priv,
>>>>> + led_data->channel);
>>>>> + if (other_led_data) {
>>>>> + dev_err(dev,
>>>>> + "%s and %s both attempting to use channel %d\n",
>>>>> + led_data->cdev.name,
>>>>> + other_led_data->cdev.name,
>>>>> + led_data->channel);
>>>>> + goto err;
>>>>> + }
>>>>> +
>>>>> + ret =3D devm_led_classdev_register(dev, &led_data->cdev);
>>>>> + if (ret) {
>>>>> + dev_err(dev, "failed to register PWM led for %s: %d\n",
>>>>> + led_data->cdev.name, ret);
>>>>> + goto err;
>>>>> + }
>>>>> +
>>>>> + priv->num_leds++;
>>>>> + }
>>>>> +
>>>>> + return 0;
>>>>> +
>>>>> +err:
>>>>> + of_node_put(child);
>>>>> + return ret;
>>>>> +}
>>>>> +
>>>>> +static const struct of_device_id of_is31fl31xx_match[] =3D {
>>>>> + { .compatible =3D "issi,is31fl3236", .data =3D &is31fl3236_cdef=
, },
>>>>> + { .compatible =3D "issi,is31fl3235", .data =3D &is31fl3235_cdef=
, },
>>>>> + { .compatible =3D "issi,is31fl3218", .data =3D &is31fl3218_cdef=
, },
>>>>> + { .compatible =3D "issi,is31fl3216", .data =3D &is31fl3216_cdef=
, },
>>>>> + {},
>>>>> +};
>>>>> +
>>>>> +MODULE_DEVICE_TABLE(of, of_is31fl31xx_match);
>>>>> +
>>>>> +static int is31fl32xx_probe(struct i2c_client *client,
>>>>> + const struct i2c_device_id *id)
>>>>> +{
>>>>> + const struct is31fl32xx_chipdef *cdef;
>>>>> + const struct of_device_id *of_dev_id;
>>>>> + struct device *dev =3D &client->dev;
>>>>> + struct is31fl32xx_priv *priv;
>>>>> + int count;
>>>>> + int ret =3D 0;
>>>>> +
>>>>> + of_dev_id =3D of_match_device(of_is31fl31xx_match, dev);
>>>>> + if (!of_dev_id)
>>>>> + return -EINVAL;
>>>>> +
>>>>> + cdef =3D of_dev_id->data;
>>>>> +
>>>>> + count =3D of_get_child_count(dev->of_node);
>>>>> + if (!count)
>>>>> + return -EINVAL;
>>>>> +
>>>>> + priv =3D devm_kzalloc(dev, sizeof_is31fl32xx_priv(count),
>>>>> + GFP_KERNEL);
>>>>> + if (!priv)
>>>>> + return -ENOMEM;
>>>>> +
>>>>> + priv->client =3D client;
>>>>> + priv->cdef =3D cdef;
>>>>> + i2c_set_clientdata(client, priv);
>>>>> +
>>>>> + ret =3D is31fl32xx_init_regs(priv);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> +
>>>>> + ret =3D is31fl32xx_parse_dt(dev, priv);
>>>>> + if (ret)
>>>>> + return ret;
>>>>> +
>>>>> + return 0;
>>>>> +}
>>>>> +
>>>>> +static int is31fl32xx_remove(struct i2c_client *client)
>>>>> +{
>>>>> + struct is31fl32xx_priv *priv =3D i2c_get_clientdata(client);
>>>>> +
>>>>> + return is31fl32xx_reset_regs(priv);
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * i2c-core requires that id_table be non-NULL, even though
>>>>> + * it is not used for DeviceTree based instantiation.
>>>>> + */
>>>>> +static const struct i2c_device_id is31fl31xx_id[] =3D {
>>>>> + {},
>>>>> +};
>>>>> +
>>>>> +MODULE_DEVICE_TABLE(i2c, is31fl31xx_id);
>>>>> +
>>>>> +static struct i2c_driver is31fl32xx_driver =3D {
>>>>> + .driver =3D {
>>>>> + .name =3D "is31fl32xx",
>>>>> + .of_match_table =3D of_is31fl31xx_match,
>>>>> + },
>>>>> + .probe =3D is31fl32xx_probe,
>>>>> + .remove =3D is31fl32xx_remove,
>>>>
>>>> Sorry, what was the reason to skip shutdown?
>>>
>>> If I understood Jacek's last email on the topic [1] correctly, he's=
 now
>>> of the opinion that the decision to turn LEDs off on reboot should =
be
>>> left to userspace, rather than done by the driver. For these device=
s,
>>> the only thing a shutdown callback would do is turn off the LEDs (t=
hrough
>>> any of multiple methods). So, if we want to leave the state as-is o=
n
>>> reboot there's no need for a shutdown callback.
>>>
>>> [1] http://www.spinics.net/lists/linux-leds/msg05644.html
>>>
>>>>> + .id_table =3D is31fl31xx_id,
>>>>> +};
>>>>> +
>>>>> +module_i2c_driver(is31fl32xx_driver);
>>>>> +
>>>>> +MODULE_AUTHOR("David Rivshin <drivshin@allworx.com>");
>>>>> +MODULE_DESCRIPTION("ISSI IS31FL32xx LED driver");
>>>>> +MODULE_LICENSE("GPL v2");
>>>>> --
>>>>> 2.5.0
>>>>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--=20
Best Regards,
Jacek Anaszewski
