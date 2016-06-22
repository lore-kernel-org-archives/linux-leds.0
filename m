From: Florian Vaussard <florian.vaussard@heig-vd.ch>
Subject: Re: [PATCH 2/2] leds: Add driver for NCP5623 3-channel I2C LED driver
Date: Wed, 22 Jun 2016 08:08:08 +0200
Message-ID: <9375e68a-9920-8e84-419d-890f57b6c9d2@heig-vd.ch>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466494154-3786-3-git-send-email-florian.vaussard@heig-vd.ch>
 <57695D45.60107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57695D45.60107@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Florian Vaussard <florian.vaussard@gmail.com>
Cc: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

Le 21. 06. 16 =E0 17:29, Jacek Anaszewski a =E9crit :
> Hi Florian,
>=20
> Thanks for the patch. Please refer to my comments in the code.
>=20

Thanks for your review. I completely agree with you, I will address you=
r
comments in V2. I just have one small question below.

> On 06/21/2016 09:29 AM, Florian Vaussard wrote:
>> The NCP5623 is a 3-channel LED driver from On Semiconductor controll=
ed
>> through I2C. The PWM of each channel can be independently set with 3=
2
>> distinct levels. In addition, the intensity of the current source ca=
n be
>> globally set using an external bias resistor fixing the reference
>> current (Iref) and a dedicated register (ILED), following the
>> relationship:
>>
>> I =3D 2400*Iref/(31-ILED)
>>
>> with Iref =3D Vref/Rbias, and Vref =3D 0.6V.
>>
>> Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
>> ---
>>   drivers/leds/Kconfig        |  11 ++
>>   drivers/leds/Makefile       |   1 +
>>   drivers/leds/leds-ncp5623.c | 265 ++++++++++++++++++++++++++++++++=
++++++++++++
>>   3 files changed, 277 insertions(+)
>>   create mode 100644 drivers/leds/leds-ncp5623.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 5ae2834..6d3e44d 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -588,6 +588,17 @@ config LEDS_BLINKM
>>         This option enables support for the BlinkM RGB LED connected
>>         through I2C. Say Y to enable support for the BlinkM LED.
>>
>> +config LEDS_NCP5623
>> +    tristate "LED Support for NCP5623 I2C chip"
>> +    depends on LEDS_CLASS
>> +    depends on I2C
>> +    help
>> +      This option enables support for LEDs connected to NCP5623
>> +      LED driver chips accessed via the I2C bus.
>> +      Driver supports brightness control.
>> +
>> +      Say Y to enable this driver.
>> +
>>   config LEDS_POWERNV
>>       tristate "LED support for PowerNV Platform"
>>       depends on LEDS_CLASS
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index cb2013d..a2f0e10 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_KTD2692)        +=3D leds-ktd269=
2.o
>>   obj-$(CONFIG_LEDS_POWERNV)        +=3D leds-powernv.o
>>   obj-$(CONFIG_LEDS_SEAD3)        +=3D leds-sead3.o
>>   obj-$(CONFIG_LEDS_IS31FL32XX)        +=3D leds-is31fl32xx.o
>> +obj-$(CONFIG_LEDS_NCP5623)        +=3D leds-ncp5623.o
>>
>>   # LED SPI Drivers
>>   obj-$(CONFIG_LEDS_DAC124S085)        +=3D leds-dac124s085.o
>> diff --git a/drivers/leds/leds-ncp5623.c b/drivers/leds/leds-ncp5623=
=2Ec
>> new file mode 100644
>> index 0000000..a341e4a
>> --- /dev/null
>> +++ b/drivers/leds/leds-ncp5623.c
>> @@ -0,0 +1,265 @@
>> +/*
>> + * Copyright 2016 Florian Vaussard <florian.vaussard@heig-vd.ch>
>> + *
>> + * Based on leds-tlc591xx.c
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License as publishe=
d by
>> + * the Free Software Foundation; version 2 of the License.
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/workqueue.h>
>> +
>> +#define NCP5623_MAX_LEDS    3
>> +#define NCP5623_MAX_STEPS    32
>> +#define NCP5623_MAX_CURRENT    31
>> +#define NCP5623_MAX_CURRENT_UA    30000
>> +
>> +#define NCP5623_CMD_SHIFT    5
>> +#define CMD_SHUTDOWN        (0x00 << NCP5623_CMD_SHIFT)
>> +#define CMD_ILED        (0x01 << NCP5623_CMD_SHIFT)
>> +#define CMD_PWM1        (0x02 << NCP5623_CMD_SHIFT)
>> +#define CMD_PWM2        (0x03 << NCP5623_CMD_SHIFT)
>> +#define CMD_PWM3        (0x04 << NCP5623_CMD_SHIFT)
>> +#define CMD_UPWARD_DIM        (0x05 << NCP5623_CMD_SHIFT)
>> +#define CMD_DOWNWARD_DIM    (0x06 << NCP5623_CMD_SHIFT)
>> +#define CMD_DIM_STEP        (0x07 << NCP5623_CMD_SHIFT)
>> +
>> +#define NCP5623_DATA_MASK    GENMASK(NCP5623_CMD_SHIFT - 1, 0)
>> +
>> +#define NCP5623_CMD(cmd, data)    (cmd | (data & NCP5623_DATA_MASK)=
)
>> +

[snip]

>> +
>> +static int ncp5623_configure(struct device *dev,
>> +                 struct ncp5623_priv *priv)
>> +{
>> +    unsigned int i;
>> +    unsigned int n;
>> +    struct ncp5623_led *led;
>> +    int err;
>> +
>> +    /* Compute the value of ILED register to honor led_max_current =
*/
>> +    n =3D 2400 * priv->led_iref / priv->led_max_current + 1;
>> +    if (n > NCP5623_MAX_CURRENT)
>> +        n =3D NCP5623_MAX_CURRENT;
>> +    n =3D NCP5623_MAX_CURRENT - n;
>> +
>> +    dev_dbg(dev, "setting maximum current to %u uA\n",
>> +        2400 * priv->led_iref / (NCP5623_MAX_CURRENT - n));
>> +
>> +    err =3D ncp5623_send_cmd(priv, CMD_ILED, n);
>> +    if (err < 0) {
>> +        dev_err(dev, "cannot set the current\n");
>> +        return err;
>> +    }
>> +
>> +    /* Setup each individual LED */
>> +    for (i =3D 0; i < NCP5623_MAX_LEDS; i++) {
>> +        led =3D &priv->leds[i];
>> +
>> +        if (!led->active)
>> +            continue;
>> +
>> +        led->priv =3D priv;
>> +        led->led_no =3D i;
>> +        led->ldev.brightness_set =3D ncp5623_brightness_set;
>> +        led->ldev.max_brightness =3D NCP5623_MAX_STEPS - 1;
>=20
> max_brightness should be asserted according to led-max-microamp
> property.
>=20

We can set two parameters on this chip:

- The intensity of the current source (common to all LEDs) from 0 to
NCP5623_MAX_CURRENT (31)
- The PWM for each LED independently from 0 to NCP5623_MAX_STEPS-1 (31)

My understanding was to use the led-max-microamp property to set up the=
 current
source so that even with a duty cycle of 100% (PWM=3D31) the LED cannot=
 be
damaged. In this case, I think that is unnecessary to assert max_bright=
ness, as
we are guaranteed by design that led-max-microamp will not be surpassed=
 for any
value of the PWM. Would you suggest another approach?

>> +        INIT_WORK(&led->work, ncp5623_led_work);
>=20
> Please remove it and use brightness_set_blocking op.
>=20
>> +        err =3D led_classdev_register(dev, &led->ldev);
>=20
> Use devm prefixed version.
>=20
>> +        if (err < 0) {
>> +            dev_err(dev, "couldn't register LED %s\n",
>> +                led->ldev.name);
>> +            goto exit;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +
>> +exit:
>> +    ncp5623_destroy_devices(priv);
>> +    return err;
>> +}
>> +
