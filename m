From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v4] leds: add driver for Mellanox systems LEDs
Date: Thu, 8 Sep 2016 07:45:17 +0000
Message-ID: <AM5PR0501MB20979261B70C6240DDD1DF94A2FB0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1473319553-37195-1-git-send-email-vadimp@mellanox.com>
 <a5a27472-968c-5ea6-1152-27ef1ccd073d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-db5eur01on0048.outbound.protection.outlook.com ([104.47.2.48]:35542
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S941078AbcIHPV4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 8 Sep 2016 11:21:56 -0400
In-Reply-To: <a5a27472-968c-5ea6-1152-27ef1ccd073d@samsung.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>
Cc: "dave@treblig.org" <dave@treblig.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>

Hi Jacek,

Thank you very much for all your great reviews.

Only it should be "mlxcpld", instead of "mkxcpld".
=20

> -----Original Message-----
> From: Jacek Anaszewski [mailto:j.anaszewski@samsung.com]
> Sent: Thursday, September 08, 2016 10:41 AM
> To: Vadim Pasternak <vadimp@mellanox.com>; rpurdie@rpsys.net
> Cc: dave@treblig.org; linux-leds@vger.kernel.org; linux-kernel@vger.kerne=
l.org;
> jiri@resnulli.us; Michael Shych <michaelsh@mellanox.com>
> Subject: Re: [patch v4] leds: add driver for Mellanox systems LEDs
>=20
> Hi Vadim,
>=20
> Thanks for the updated version. I found few more minor issues, please loo=
k
> below.
>=20
> I actually have them fixed, so the patch is ready for being applied to th=
e linux-
> leds.git.
>=20
> Please refer below and let me know if you have any objections.
>=20
> On 09/08/2016 09:25 AM, vadimp@mellanox.com wrote:
> > From: Vadim Pasternak <vadimp@mellanox.com>
> >
> > This makes it possible to create a set of LEDs for Mellanox systems:
> > "msx6710", "msx6720", "msb7700", "msn2700", "msx1410", "msn2410",
> > "msb7800", "msn2740", "msn2100".
> >
> > Driver obtains LED devices according to system configuration, provided
> > through system DMI data, like fan1:green, fan1:red and creates devices
> > in
>=20
> s/fan1:green/mkxcpld:fan1:green/
> s/fan1:red/mkxcpld:fan1:red/

> s/mkxcpld:fan1:green/mlxcpld:fan1:green/
> s/mkxcpld:fan1:red/mlxcpld:fan1:red/

>=20
> > form: "devicename:colour:function".
> >
> > LED setting is controlled through on board CPLD Lattice device.
> > For setting particular LED off, solid, blink:
> > echo 0 > /sys/class/leds/mlxcpld\:status\:green/brightness
> > echo 1 > /sys/class/leds/mlxcpld\:status\:green/brightness
> > echo timer > /sys/class/leds/mlxcpld\:status\:green/trigger
> >
> > On module probing all LEDs are set green, on removing - off.
> >
> > Last setting overwrites previous, f.e. sequence for changing LED from
> > green - red - green:
> > echo 1 > /sys/class/leds/mlxcpld\:psu\:green/brightness
> > echo 1 > /sys/class/leds/mlxcpld\:psu\:red/brightness
> > echo 1 > /sys/class/leds/mlxcpld\:psu\:green/brightness
> > Note: LEDs cannot be turned on/off simultaneously.
> >
> > The Kconfig currently controlling compilation of this code is:
> > drivers/leds/Kconfig:config LEDS_MLXCPLD
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > Reviewed-by: Jiri Pirko <jiri@mellanox.com>
> > ---
> > v3->v4
> >  Fixes issues pointed out by Jacek:
> >  - change in all commnets led to LED;
> >  - add in defines prefix MLXCPLD;
> >  - add to LED names device prefix mlxcpld;
> >  - fix long comment stile;
> >  - replace mlxcpld_led_brightness by mlxcpld_led_set_brightness;
> >  - replace mlxcpld_led_blink by mlxcpld_led_blink_set
> > ---
> > v2->v3:
> >  Fixes issues pointed out by Dave:
> >  - fix in comments 3KHz and 6KHz to 3Hz and 6Hz respectively;
> > ---
> > v1->v2:
> >  Fixes issues pointed out by Jacek:
> >  - fix style in patch cover text;
> >  - add doc file with hw description;
> >  - arrange include directives in alphabetical order;
> >  - make defines more clear;
> >  - fix several comments for structure descriptions;
> >  - add several empty lines between defentions;
> >  - change max_brightness profile setting to 1 instead of LED_FULL;
> >  - use capital letters for the enumerator;
> >  - change in if (product =3D=3D NULL) to (!product);
> >  - add comments to mlxcpld_led_store_hw;
> >  - remove switch statement from mlxcpld_led_brightness;
> >  - modify mlxcpld_led_blink;
> >  - remove unnecessary devm_kfree in mlxcpld_led_config;
> >  - remove switch statement from mlxcpld_led_config;
> >  - remove platform_get_drvdata from mlxcpld_led_probe;
> > ---
> >  Documentation/leds/leds-mlxcpld.txt | 110 +++++++++
> >  MAINTAINERS                         |   8 +
> >  drivers/leds/Kconfig                |   8 +
> >  drivers/leds/Makefile               |   1 +
> >  drivers/leds/leds-mlxcpld.c         | 429
> ++++++++++++++++++++++++++++++++++++
> >  5 files changed, 556 insertions(+)
> >  create mode 100644 Documentation/leds/leds-mlxcpld.txt
> >  create mode 100644 drivers/leds/leds-mlxcpld.c
> >
> > diff --git a/Documentation/leds/leds-mlxcpld.txt
> > b/Documentation/leds/leds-mlxcpld.txt
> > new file mode 100644
> > index 0000000..7b4c2a3
> > --- /dev/null
> > +++ b/Documentation/leds/leds-mlxcpld.txt
> > @@ -0,0 +1,110 @@
> > +ver LEDs-mlxcpld
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +Driver for Mellanox systems LEDs.
> > +Provide system LED support for the nex Mellanox systems:
> > +"msx6710", "msx6720", "msb7700", "msn2700", "msx1410", "msn2410",
> > +"msb7800", "msn2740", "msn2100".
> > +
> > +Description
> > +-----------
> > +Driver provides the following LEDs for the systems "msx6710",
> > +"msx6720", "msb7700", "msn2700", "msx1410", "msn2410", "msb7800",
> "msn2740":
> > +  mlxcpld:fan1:green
> > +  mlxcpld:fan1:red
> > +  mlxcpld:fan2:green
> > +  mlxcpld:fan2:red
> > +  mlxcpld:fan3:green
> > +  mlxcpld:fan3:red
> > +  mlxcpld:fan4:green
> > +  mlxcpld:fan4:red
> > +  mlxcpld:psu:green
> > +  mlxcpld:psu:red
> > +  mlxcpld:status:green
> > +  mlxcpld:status:red
> > +
> > + "status"
> > +  CPLD reg offset: 0x20
> > +  Bits [3:0]
> > +
> > + "psu"
> > +  CPLD reg offset: 0x20
> > +  Bits [7:4]
> > +
> > + "fan1"
> > +  CPLD reg offset: 0x21
> > +  Bits [3:0]
> > +
> > + "fan2"
> > +  CPLD reg offset: 0x21
> > +  Bits [7:4]
> > +
> > + "fan3"
> > +  CPLD reg offset: 0x22
> > +  Bits [3:0]
> > +
> > + "fan4"
> > +  CPLD reg offset: 0x22
> > +  Bits [7:4]
> > +
> > + Color mask for all the above LEDs:
> > +  [bit3,bit2,bit1,bit0] or
> > +  [bit7,bit6,bit5,bit4]:
> > +	[0,0,0,0] =3D LED OFF
> > +	[0,1,0,1] =3D Red static ON
> > +	[1,1,0,1] =3D Green static ON
> > +	[0,1,1,0] =3D Red blink 3Hz
> > +	[1,1,1,0] =3D Green blink 3Hz
> > +	[0,1,1,1] =3D Red blink 6Hz
> > +	[1,1,1,1] =3D Green blink 6Hz
> > +
> > +Driver provides the following LEDs for the system "msn2100":
> > +  mlxcpld:fan:green
> > +  mlxcpld:fan:red
> > +  mlxcpld:psu1:green
> > +  mlxcpld:psu1:red
> > +  mlxcpld:psu2:green
> > +  mlxcpld:psu2:red
> > +  mlxcpld:status:green
> > +  mlxcpld:status:red
> > +  mlxcpld:uid:blue
> > +
> > + "status"
> > +  CPLD reg offset: 0x20
> > +  Bits [3:0]
> > +
> > + "fan"
> > +  CPLD reg offset: 0x21
> > +  Bits [3:0]
> > +
> > + "psu1"
> > +  CPLD reg offset: 0x23
> > +  Bits [3:0]
> > +
> > + "psu2"
> > +  CPLD reg offset: 0x23
> > +  Bits [7:4]
> > +
> > + "uid"
> > +  CPLD reg offset: 0x24
> > +  Bits [3:0]
> > +
> > + Color mask for all the above LEDs, excepted uid:
> > +  [bit3,bit2,bit1,bit0] or
> > +  [bit7,bit6,bit5,bit4]:
> > +	[0,0,0,0] =3D LED OFF
> > +	[0,1,0,1] =3D Red static ON
> > +	[1,1,0,1] =3D Green static ON
> > +	[0,1,1,0] =3D Red blink 3Hz
> > +	[1,1,1,0] =3D Green blink 3Hz
> > +	[0,1,1,1] =3D Red blink 6Hz
> > +	[1,1,1,1] =3D Green blink 6Hz
> > +
> > + Color mask for uid LED:
> > +  [bit3,bit2,bit1,bit0]:
> > +	[0,0,0,0] =3D LED OFF
> > +	[1,1,0,1] =3D Blue static ON
> > +	[1,1,1,0] =3D Blue blink 3Hz
> > +	[1,1,1,1] =3D Blue blink 6Hz
> > +
> > +Driver supports HW blinking at 3Hz and 6Hz frequency (50% duty cycle).
> > +For 3Hz duty cylce is about 167 msec, for 6Hz is about 83 msec.
> > diff --git a/MAINTAINERS b/MAINTAINERS index 0bbe4b1..adb9e9b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7655,6 +7655,14 @@ W:	http://www.mellanox.com
> >  Q:	http://patchwork.ozlabs.org/project/netdev/list/
> >  F:	drivers/net/ethernet/mellanox/mlxsw/
> >
> > +MELLANOX MLXCPLD LED DRIVER
> > +M:	Vadim Pasternak <vadimp@mellanox.com>
> > +L:	linux-leds@vger.kernel.org
> > +S:	Supported
> > +W:	http://www.mellanox.com
> > +F:	drivers/leds/leds-mlxcpld.c
> > +F:	Documentation/leds/leds-mlxcpld.txt
> > +
> >  SOFT-ROCE DRIVER (rxe)
> >  M:	Moni Shoua <monis@mellanox.com>
> >  L:	linux-rdma@vger.kernel.org
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig index
> > 9dcc9b1..4cd85be 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -631,6 +631,14 @@ config LEDS_VERSATILE
> >  	  This option enabled support for the LEDs on the ARM Versatile
> >  	  and RealView boards. Say Y to enabled these.
> >
> > +config LEDS_MLXCPLD
> > +	tristate "LED support for the Mellanox boards"
> > +	depends on X86_64 && DMI
> > +	depends on LEDS_CLASS
> > +	help
> > +	  This option enabled support for the LEDs on the Mellanox
> > +	  boards. Say Y to enabled these.
> > +
> >  comment "LED Triggers"
> >  source "drivers/leds/trigger/Kconfig"
> >
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile index
> > 0684c86..9a2494b 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -68,6 +68,7 @@ obj-$(CONFIG_LEDS_KTD2692)		+=3D leds-
> ktd2692.o
> >  obj-$(CONFIG_LEDS_POWERNV)		+=3D leds-powernv.o
> >  obj-$(CONFIG_LEDS_SEAD3)		+=3D leds-sead3.o
> >  obj-$(CONFIG_LEDS_IS31FL32XX)		+=3D leds-is31fl32xx.o
> > +obj-$(CONFIG_LEDS_MLXCPLD)		+=3D leds-mlxcpld.o
> >
> >  # LED SPI Drivers
> >  obj-$(CONFIG_LEDS_DAC124S085)		+=3D leds-dac124s085.o
> > diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
> > new file mode 100644 index 0000000..10b03c5
> > --- /dev/null
> > +++ b/drivers/leds/leds-mlxcpld.c
> > @@ -0,0 +1,429 @@
> > +/*
> > + * drivers/leds/leds-mlxcpld.c
> > + * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
> > + * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
> > + *
> > + * Redistribution and use in source and binary forms, with or without
> > + * modification, are permitted provided that the following conditions =
are
> met:
> > + *
> > + * 1. Redistributions of source code must retain the above copyright
> > + *    notice, this list of conditions and the following disclaimer.
> > + * 2. Redistributions in binary form must reproduce the above copyrigh=
t
> > + *    notice, this list of conditions and the following disclaimer in =
the
> > + *    documentation and/or other materials provided with the distribut=
ion.
> > + * 3. Neither the names of the copyright holders nor the names of its
> > + *    contributors may be used to endorse or promote products derived =
from
> > + *    this software without specific prior written permission.
> > + *
> > + * Alternatively, this software may be distributed under the terms of
> > +the
> > + * GNU General Public License ("GPL") version 2 as published by the
> > +Free
> > + * Software Foundation.
> > + *
> > + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> > + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED
> > +TO, THE
> > + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> PARTICULAR
> > +PURPOSE
> > + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> > +CONTRIBUTORS BE
> > + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
> > +OR
> > + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> PROCUREMENT
> > +OF
> > + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
> > +BUSINESS
> > + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
> > +WHETHER IN
> > + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> > +OTHERWISE)
> > + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> > +ADVISED OF THE
> > + * POSSIBILITY OF SUCH DAMAGE.
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/device.h>
> > +#include <linux/dmi.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/version.h>
> > +
> > +#define MLXPLAT_CPLD_LPC_REG_BASE_ADRR     0x2500 /* LPC bus access
> */
> > +
> > +/* Color codes for LEDs */
> > +#define MLXCPLD_LED_OFFSET_HALF		0x01 /* Offset from solid: 3Hz
> blink */
> > +#define MLXCPLD_LED_OFFSET_FULL		0x02 /* Offset from solid: 6Hz
> blink */
> > +#define MLXCPLD_LED_IS_OFF		0x00 /* Off */
> > +#define MLXCPLD_LED_RED_STATIC_ON	0x05 /* Solid red */
> > +#define MLXCPLD_LED_RED_BLINK_HALF
> 	(MLXCPLD_LED_RED_STATIC_ON + \
> > +					 MLXCPLD_LED_OFFSET_HALF)
> > +#define MLXCPLD_LED_RED_BLINK_FULL
> 	(MLXCPLD_LED_RED_STATIC_ON + \
> > +					 MLXCPLD_LED_OFFSET_FULL)
> > +#define MLXCPLD_LED_GREEN_STATIC_ON	0x0D /* Solid green */
> > +#define MLXCPLD_LED_GREEN_BLINK_HALF
> 	(MLXCPLD_LED_GREEN_STATIC_ON + \
> > +					 MLXCPLD_LED_OFFSET_HALF)
> > +#define MLXCPLD_LED_GREEN_BLINK_FULL
> 	(MLXCPLD_LED_GREEN_STATIC_ON + \
> > +					 MLXCPLD_LED_OFFSET_FULL)
> > +#define MLXCPLD_LED_BLINK_3HZ		167 /* ~167 msec off/on */
> > +#define MLXCPLD_LED_BLINK_6HZ		83 /* ~83 msec off/on */
> > +
> > +/**
> > + * mlxcpld_param - LED access parameters:
> > + * @offset - offset for LED access in CPLD device
> > + * @mask - mask for LED access in CPLD device
> > + * @base_color - base color code for LED **/ struct mlxcpld_param {
> > +	u8 offset;
> > +	u8 mask;
> > +	u8 base_color;
> > +};
> > +
> > +/**
> > + * mlxcpld_led_priv - LED private data:
> > + * @cled - LED class device instance
> > + * @param - LED CPLD access parameters **/ struct mlxcpld_led_priv {
> > +	struct led_classdev cdev;
> > +	struct mlxcpld_param param;
> > +};
> > +
> > +#define cdev_to_priv(c)		container_of(c, struct
> mlxcpld_led_priv, cdev)
> > +
> > +/**
> > + * mlxcpld_led_profile - system LED profile (defined per system class)=
:
> > + * @offset - offset for LED access in CPLD device
> > + * @mask - mask for LED access in CPLD device
> > + * @base_color - base color code
> > + * @brightness - default brightness setting (on/off)
> > + * @name - LED name
> > +**/
> > +struct mlxcpld_led_profile {
> > +	u8 offset;
> > +	u8 mask;
> > +	u8 base_color;
> > +	enum led_brightness brightness;
> > +	const char *name;
> > +};
> > +
> > +/**
> > + * mlxcpld_led_pdata - system LED private data
> > + * @pdev - platform device pointer
> > + * @pled - LED class device instance
> > + * @profile - system configuration profile
> > + * @num_led_instances - number of LED instances
> > + * @lock - device access lock
> > +**/
> > +struct mlxcpld_led_pdata {
> > +	struct platform_device *pdev;
> > +	struct mlxcpld_led_priv *pled;
> > +	struct mlxcpld_led_profile *profile;
> > +	int num_led_instances;
> > +	spinlock_t lock;
> > +};
> > +
> > +static struct mlxcpld_led_pdata *mlxcpld_led;
> > +
> > +/* Default profile fit the next Mellanox systems:
> > + * "msx6710", "msx6720", "msb7700", "msn2700", "msx1410",
> > + * "msn2410", "msb7800", "msn2740"
> > + */
> > +struct mlxcpld_led_profile mlxcpld_led_default_profile[] =3D {
> > +	{
> > +		0x21, 0xf0, MLXCPLD_LED_GREEN_STATIC_ON, 1,
> > +		"mlxcpld:fan1:green",
> > +	},
> > +	{
> > +		0x21, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
> > +		"mlxcpld:fan1:red",
> > +	},
> > +	{
> > +		0x21, 0x0f, MLXCPLD_LED_GREEN_STATIC_ON, 1,
> > +		"mlxcpld:fan2:green",
> > +	},
> > +	{
> > +		0x21, 0x0f, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
> > +		"mlxcpld:fan2:red",
> > +	},
> > +	{
> > +		0x22, 0xf0, MLXCPLD_LED_GREEN_STATIC_ON, 1,
> > +		"mlxcpld:fan3:green",
> > +	},
> > +	{
> > +		0x22, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
> > +		"mlxcpld:fan3:red",
> > +	},
> > +	{
> > +		0x22, 0x0f, MLXCPLD_LED_GREEN_STATIC_ON, 1,
> > +		"mlxcpld:fan4:green",
> > +	},
> > +	{
> > +		0x22, 0x0f, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
> > +		"mlxcpld:fan4:red",
> > +	},
> > +	{
> > +		0x20, 0x0f, MLXCPLD_LED_GREEN_STATIC_ON, 1,
> > +		"mlxcpld:psu:green",
> > +	},
> > +	{
> > +		0x20, 0x0f, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
> > +		"mlxcpld:psu:red",
> > +	},
> > +	{
> > +		0x20, 0xf0, MLXCPLD_LED_GREEN_STATIC_ON, 1,
> > +		"mlxcpld:status:green",
> > +	},
> > +	{
> > +		0x20, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
> > +		"mlxcpld:status:red",
> > +	},
> > +};
> > +
> > +/* Profile fit the Mellanox systems based on "msn2100" */ struct
> > +mlxcpld_led_profile mlxcpld_led_msn2100_profile[] =3D {
> > +	{
> > +		0x21, 0xf0, MLXCPLD_LED_GREEN_STATIC_ON, 1,
> > +		"mlxcpld:fan:green",
> > +	},
> > +	{
> > +		0x21, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
> > +		"mlxcpld:fan:red",
> > +	},
> > +	{
> > +		0x23, 0xf0, MLXCPLD_LED_GREEN_STATIC_ON, 1,
> > +		"mlxcpld:psu1:green",
> > +	},
> > +	{
> > +		0x23, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
> > +		"mlxcpld:psu1:red",
> > +	},
> > +	{
> > +		0x23, 0x0f, MLXCPLD_LED_GREEN_STATIC_ON, 1,
> > +		"mlxcpld:psu2:green",
> > +	},
> > +	{
> > +		0x23, 0x0f, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
> > +		"mlxcpld:psu2:red",
> > +	},
> > +	{
> > +		0x20, 0xf0, MLXCPLD_LED_GREEN_STATIC_ON, 1,
> > +		"mlxcpld:status:green",
> > +	},
> > +	{
> > +		0x20, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
> > +		"mlxcpld:status:red",
> > +	},
> > +	{
> > +		0x24, 0xf0, MLXCPLD_LED_GREEN_STATIC_ON, LED_OFF,
> > +		"mlxcpld:uid:blue",
> > +	},
> > +};
> > +
> > +enum mlxcpld_led_platform_types {
> > +	MLXCPLD_LED_PLATFORM_DEFAULT,
> > +	MLXCPLD_LED_PLATFORM_MSN2100,
> > +};
> > +
> > +const char *mlx_product_names[] =3D {
> > +	"DEFAULT",
> > +	"MSN2100",
> > +};
> > +
> > +static enum
> > +mlxcpld_led_platform_types mlxcpld_led_platform_check_sys_type(void)
> > +{
> > +	const char *mlx_product_name;
> > +	int i;
> > +
> > +	mlx_product_name =3D dmi_get_system_info(DMI_PRODUCT_NAME);
> > +	if (!mlx_product_name)
> > +		return MLXCPLD_LED_PLATFORM_DEFAULT;
> > +
> > +	for (i =3D 1;  i < ARRAY_SIZE(mlx_product_names); i++) {
> > +		if (strstr(mlx_product_name, mlx_product_names[i]))
> > +			return i;
> > +	}
> > +
> > +	return MLXCPLD_LED_PLATFORM_DEFAULT; }
> > +
> > +static void mlxcpld_led_bus_access_func(u16 base, u8 offset, u8 rw_fla=
g,
> > +					u8 *data)
> > +{
> > +	u32 addr =3D base + offset;
> > +
> > +	if (rw_flag =3D=3D 0)
> > +		outb(*data, addr);
> > +	else
> > +		*data =3D inb(addr);
> > +}
> > +
> > +static void mlxcpld_led_store_hw(u8 mask, u8 off, u8 vset) {
> > +	u8 nib, val;
> > +
> > +	/*
> > +	 * Each LED is controlled through low or high nibble of the relevant
> > +	 * CPLD register. Register offset is specified by off parameter.
> > +	 * Parameter vset provides color code: 0x0 for off, 0x5 for solid red=
,
> > +	 * 0x6 for 3Hz blink red, 0xd for solid green, 0xe for 3Hz blink
> > +	 * green.
> > +	 * Parameter mask specifies which nibble is used for specific LED: ma=
sk
> > +	 * 0xf0 - lower nibble is to be used (bits from 0 to 3), mask 0x0f -
> > +	 * higher nibble (bits from 4 to 7).
> > +	 */
> > +	spin_lock(&mlxcpld_led->lock);
> > +	mlxcpld_led_bus_access_func(MLXPLAT_CPLD_LPC_REG_BASE_ADRR,
> off, 1,
> > +				    &val);
> > +	nib =3D (mask =3D=3D 0xf0) ? vset : (vset << 4);
> > +	val =3D (val & mask) | nib;
> > +	mlxcpld_led_bus_access_func(MLXPLAT_CPLD_LPC_REG_BASE_ADRR,
> off, 0,
> > +				    &val);
> > +	spin_unlock(&mlxcpld_led->lock);
> > +}
> > +
> > +static void mlxcpld_led_set_brightness(struct led_classdev *led,
> > +				       enum led_brightness value)\
>=20
> For consistency with the op name it will be better to rename it to
> mlxcpld_led_brightness_set.
>=20
> > +{
> > +	struct mlxcpld_led_priv *pled =3D cdev_to_priv(led);
> > +
> > +	if (value) {
> > +		mlxcpld_led_store_hw(pled->param.mask, pled->param.offset,
> > +				     pled->param.base_color);
> > +		return;
> > +	}
> > +
> > +	mlxcpld_led_store_hw(pled->param.mask, pled->param.offset,
> > +			     MLXCPLD_LED_IS_OFF);
> > +}
> > +
> > +static int mlxcpld_led_blink_set(struct led_classdev *led,
> > +				 unsigned long *delay_on,
> > +				 unsigned long *delay_off)
> > +{
> > +	struct mlxcpld_led_priv *pled =3D cdev_to_priv(led);
> > +
> > +	/* HW supports two types of blinking: full (6Hz) and half (3Hz).
> > +	 * For delay on/off zero default setting 3Hz is used.
> > +	 */
> > +	if (!(*delay_on =3D=3D 0 && *delay_off =3D=3D 0) &&
> > +	    !(*delay_on =3D=3D MLXCPLD_LED_BLINK_3HZ &&
> > +	      *delay_off =3D=3D MLXCPLD_LED_BLINK_3HZ) &&
> > +	    !(*delay_on =3D=3D MLXCPLD_LED_BLINK_6HZ &&
> > +	      *delay_off =3D=3D MLXCPLD_LED_BLINK_6HZ))
> > +		return -EINVAL;
> > +
> > +	if (*delay_on =3D=3D MLXCPLD_LED_BLINK_6HZ)
> > +		mlxcpld_led_store_hw(pled->param.mask, pled->param.offset,
> > +				     pled->param.base_color +
> > +				     MLXCPLD_LED_OFFSET_FULL);
> > +	else
> > +		mlxcpld_led_store_hw(pled->param.mask, pled->param.offset,
> > +				     pled->param.base_color +
> > +				     MLXCPLD_LED_OFFSET_HALF);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mlxcpld_led_config(struct device *dev,
> > +			      struct mlxcpld_led_pdata *cpld) {
> > +	int i;
> > +	int err;
> > +
> > +	cpld->pled =3D devm_kzalloc(dev, sizeof(struct mlxcpld_led_priv) *
> > +				  cpld->num_led_instances, GFP_KERNEL);
> > +	if (!cpld->pled)
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < cpld->num_led_instances; i++) {
> > +		cpld->pled[i].cdev.name =3D cpld->profile[i].name;
> > +		cpld->pled[i].cdev.brightness =3D cpld->profile[i].brightness;
> > +		cpld->pled[i].cdev.max_brightness =3D 1;
> > +		cpld->pled[i].cdev.brightness_set =3D mlxcpld_led_set_brightness;
> > +		cpld->pled[i].cdev.blink_set =3D mlxcpld_led_blink_set;
> > +		cpld->pled[i].cdev.flags =3D LED_CORE_SUSPENDRESUME;
> > +		err =3D devm_led_classdev_register(dev, &cpld->pled[i].cdev);
> > +		if (err)
> > +			return err;
> > +
> > +		cpld->pled[i].param.offset =3D mlxcpld_led->profile[i].offset;
> > +		cpld->pled[i].param.mask =3D mlxcpld_led->profile[i].mask;
> > +		cpld->pled[i].param.base_color =3D
> > +					mlxcpld_led->profile[i].base_color;
> > +
> > +		if (mlxcpld_led->profile[i].brightness)
> > +			mlxcpld_led_set_brightness(&cpld->pled[i].cdev,
> > +					mlxcpld_led->profile[i].brightness);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int __init mlxcpld_led_probe(struct platform_device *pdev) {
> > +	enum mlxcpld_led_platform_types mlxcpld_led_plat =3D
> > +
> 	mlxcpld_led_platform_check_sys_type();
> > +
> > +	mlxcpld_led =3D devm_kzalloc(&pdev->dev, sizeof(*mlxcpld_led),
> > +				   GFP_KERNEL);
> > +	if (!mlxcpld_led)
> > +		return -ENOMEM;
> > +
> > +	mlxcpld_led->pdev =3D pdev;
> > +
> > +	switch (mlxcpld_led_plat) {
> > +	case MLXCPLD_LED_PLATFORM_MSN2100:
> > +		mlxcpld_led->profile =3D mlxcpld_led_msn2100_profile;
> > +		mlxcpld_led->num_led_instances =3D
> > +				ARRAY_SIZE(mlxcpld_led_msn2100_profile);
> > +		break;
> > +
> > +	default:
> > +		mlxcpld_led->profile =3D mlxcpld_led_default_profile;
> > +		mlxcpld_led->num_led_instances =3D
> > +				ARRAY_SIZE(mlxcpld_led_default_profile);
> > +		break;
> > +	}
> > +
> > +	spin_lock_init(&mlxcpld_led->lock);
> > +
> > +	return mlxcpld_led_config(&pdev->dev, mlxcpld_led); }
> > +
> > +static struct platform_driver mlxcpld_led_driver =3D {
> > +	.driver =3D {
> > +		.name	=3D KBUILD_MODNAME,
> > +	},
> > +};
> > +
> > +static int __init mlxcpld_led_init(void) {
> > +	struct platform_device *pdev;
> > +	int err;
> > +
> > +	pdev =3D platform_device_register_simple(KBUILD_MODNAME, -1, NULL,
> 0);
> > +	if (!pdev) {
> > +		pr_err("Device allocation failed\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	err =3D platform_driver_probe(&mlxcpld_led_driver, mlxcpld_led_probe)=
;
> > +	if (err) {
> > +		pr_err("Probe platform driver failed\n");
> > +		platform_device_unregister(pdev);
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +static void __exit mlxcpld_led_exit(void) {
> > +	platform_device_unregister(mlxcpld_led->pdev);
> > +	platform_driver_unregister(&mlxcpld_led_driver);
> > +}
> > +
> > +module_init(mlxcpld_led_init);
> > +module_exit(mlxcpld_led_exit);
> > +
> > +MODULE_AUTHOR("Vadim Pasternak (vadimp@mellanox.com)");
>=20
> We usually use angle brackets around the email address, so let's change i=
t to:
>=20
> MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
>=20
> > +MODULE_DESCRIPTION("Mellanox board LED driver");
> MODULE_LICENSE("GPL
> > +v2"); MODULE_ALIAS("platform:leds_mlxcpld");
> >
>=20
>=20
> --
> Best regards,
> Jacek Anaszewski

Best regards,
Vadim.
