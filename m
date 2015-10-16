From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v2 3/3] leds: rt5033: Add RT5033 Flash led device driver
Date: Fri, 16 Oct 2015 15:09:19 +0900
Message-ID: <5620948F.8000303@samsung.com>
References: <1444655578-19806-1-git-send-email-ingi2.kim@samsung.com>
 <1444655578-19806-4-git-send-email-ingi2.kim@samsung.com>
 <561BCD71.9020001@samsung.com> <561C7354.9080504@samsung.com>
 <561CC67E.6050107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59661 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752172AbbJPGJV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 16 Oct 2015 02:09:21 -0400
In-reply-to: <561CC67E.6050107@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Jacek,

Sorry I'm late :(
I'll send version3 patch soon

On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 17:53, Jacek Anaszewski wrote:
> Hi Ingi,
>=20
> On 10/13/2015 04:58 AM, Ingi Kim wrote:
>> Hi Jacek,
>>
>> Thanks for your kind comments
>> I also append reply below
>>
>> On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 00:10, Jacek Anaszewski wro=
te:
>>> Hi Ingi,
>>>
>>> Thanks for the update. Few comments below.
>>>
>>> On 10/12/2015 03:12 PM, Ingi Kim wrote:
>>>> This patch adds device driver of Richtek RT5033 PMIC.
>>>> The driver supports a current regulated output to drive
>>>> white LEDs for camera flash.
>>>>
>>>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>>>> ---
>>>>    drivers/leds/Kconfig               |   8 ++
>>>>    drivers/leds/Makefile              |   1 +
>>>>    drivers/leds/leds-rt5033.c         | 223 ++++++++++++++++++++++=
+++++++++++++++
>>>>    include/linux/mfd/rt5033-private.h |  49 ++++++++
>>>>    include/linux/mfd/rt5033.h         |  22 +++-
>>>>    5 files changed, 301 insertions(+), 2 deletions(-)
>>>>    create mode 100644 drivers/leds/leds-rt5033.c
>>>>
>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>> index 42990f2..29613e3 100644
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -345,6 +345,14 @@ config LEDS_PCA963X
>>>>          LED driver chip accessed via the I2C bus. Supported
>>>>          devices include PCA9633 and PCA9634
>>>>
>>>> +config LEDS_RT5033
>>>> +    tristate "LED support for RT5033 PMIC"
>>>> +    depends on LEDS_CLASS_FLASH && OF
>>>> +    depends on MFD_RT5033
>>>> +    help
>>>> +      This option enables support for on-chip LED driver on
>>>> +      RT5033 PMIC.
>>>> +
>>>>    config LEDS_WM831X_STATUS
>>>>        tristate "LED support for status LEDs on WM831x PMICs"
>>>>        depends on LEDS_CLASS
>>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>>> index b503f92..bcc4d93 100644
>>>> --- a/drivers/leds/Makefile
>>>> +++ b/drivers/leds/Makefile
>>>> @@ -23,6 +23,7 @@ obj-$(CONFIG_LEDS_COBALT_QUBE)        +=3D leds-=
cobalt-qube.o
>>>>    obj-$(CONFIG_LEDS_COBALT_RAQ)        +=3D leds-cobalt-raq.o
>>>>    obj-$(CONFIG_LEDS_SUNFIRE)        +=3D leds-sunfire.o
>>>>    obj-$(CONFIG_LEDS_PCA9532)        +=3D leds-pca9532.o
>>>> +obj-$(CONFIG_LEDS_RT5033)        +=3D leds-rt5033.o
>>>>    obj-$(CONFIG_LEDS_GPIO_REGISTER)    +=3D leds-gpio-register.o
>>>>    obj-$(CONFIG_LEDS_GPIO)            +=3D leds-gpio.o
>>>>    obj-$(CONFIG_LEDS_LP3944)        +=3D leds-lp3944.o
>>>> diff --git a/drivers/leds/leds-rt5033.c b/drivers/leds/leds-rt5033=
=2Ec
>>>> new file mode 100644
>>>> index 0000000..b470c94
>>>> --- /dev/null
>>>> +++ b/drivers/leds/leds-rt5033.c
>>>> @@ -0,0 +1,223 @@
>>>> +/*
>>>> + * led driver for RT5033
>>>> + *
>>>> + * Copyright (C) 2015 Samsung Electronics, Co., Ltd.
>>>> + * Ingi Kim <ingi2.kim@samsung.com>
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or =
modify
>>>> + * it under the terms of the GNU General Public License version 2=
 as
>>>> + * published by the Free Software Foundation.
>>>> + *
>>>> + */
>>>> +
>>>> +#include <linux/mfd/rt5033.h>
>>>> +#include <linux/mfd/rt5033-private.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/platform_device.h>
>>>> +
>>>> +#define RT5033_LED_FLASH_TIMEOUT_MIN        64000
>>>> +#define RT5033_LED_FLASH_TIMEOUT_STEPS        32000
>>>> +#define RT5033_LED_TORCH_CURRENT_LEVEL_MAX    16
>>>> +
>>>> +/* Macro for getting offset of flash timeout */
>>>> +#define GET_TIMEOUT_OFFSET(tm, step)    ((tm) / (step) - 2)
>>>> +
>>>> +static struct rt5033_led *flcdev_to_led(
>>>> +                struct led_classdev_flash *fled_cdev)
>>>> +{
>>>> +    return container_of(fled_cdev, struct rt5033_led, fled_cdev);
>>>> +}
>>>> +
>>>> +static int rt5033_led_brightness_set(struct led_classdev *led_cde=
v,
>>>> +                     enum led_brightness brightness)
>>>> +{
>>>> +    struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_=
cdev);
>>>> +    struct rt5033_led *led =3D flcdev_to_led(fled_cdev);
>>>
>>> I assume that you don't use mutex here deliberately?
>>>
>>
>> Actually I'm not sure why flash driver uses mutex.
>=20
> Which flash driver do you have on mind?
>=20

Oh, nothing on my mind, I can understand it's usage on flash led driver=
 through your description

>> In consideration of blocking competition, however, I'd be better to =
use it
>>
>=20
> [...]
>=20
>>>> +
>>>> +static int rt5033_led_flash_strobe_set(struct led_classdev_flash =
*fled_cdev,
>>>> +                       bool state)
>>>> +{
>>>> +    struct rt5033_led *led =3D flcdev_to_led(fled_cdev);
>>>> +    u32 flash_tm_reg;
>>>
>>> I think that you need a mutex here and in rt5033_led_flash_strobe_s=
et. Otherwise following is possible:
>>>
>>> Process 1:
>>>      rt5033_led_flash_strobe_set(led_cdev, 1);
>>>
>>>      regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION1,
>>>              RT5033_FLED_FUNC1_MASK, RT5033_FLED_RESET);
>>>      fled_cdev->led_cdev.brightness =3D LED_OFF;
>>>
>>> Process 2:
>>>      led_set_brightness(led_cdev, 1);
>>>
>>>      fled_cdev->led_cdev.brightness =3D 1;
>>>
>>>      rt5033_led_brightness_set(led_cdev, LED_FULL);
>>>
>>>      regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
>>>              RT5033_FLED_FUNC1_MASK, RT5033_FLED_PINCTRL);
>>>      regmap_update_bits(led->regmap,    RT5033_REG_FLED_CTRL1,
>>>              RT5033_FLED_CTRL1_MASK,
>>>              (brightness - 1) << 4);
>>>      regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION2,
>>>              RT5033_FLED_CTRL2_MASK, RT5033_FLED_ENFLED);
>>>
>>> Process 1:
>>>      regmap_update_bits(led->regmap,    RT5033_REG_FLED_STROBE_CTRL=
2,
>>>          RT5033_FLED_STRBCTRL2_MASK, flash_tm_reg);
>>>      regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION1,
>>>          RT5033_FLED_FUNC1_MASK, RT5033_FLED_STRB_SEL
>>>          | RT5033_FLED_PINCTRL);
>>>      regmap_update_bits(led->regmap,    RT5033_REG_FLED_FUNCTION2,
>>>          RT5033_FLED_FUNC2_MASK, RT5033_FLED_ENFLED
>>>
>>> In a result LED class device will report brightness value 1,
>>> whereas it would be inconsistent with hardware state, since
>>> flash strobe turns torch mode off.
>>>
>>>
>>
>> Thanks for your explanation in detail,
>> I was worried about cases of using shared resource for flash led.
>> because I thought flash led would be called just from camera or dire=
ctly itself.
>> I should consider using mutex
>=20
> You don't provide support for v4l2-flash-led-class and you don't
> implement external_strobe_set op. Only if the op is implemented a v4l=
2
> device can switch the strobe source from software to external,
> which allows strobing the flash directly by camera sensor or ISP,
> but without software interaction.
>=20

Okay, thanks :)
