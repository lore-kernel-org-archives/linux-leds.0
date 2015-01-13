From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCHv2 2/2] leds: tlc59116: Driver for the TI 16 Channel i2c
 LED driver
Date: Tue, 13 Jan 2015 12:04:21 -0800
Message-ID: <CAK5ve-+xjtY7mN15H9T=AH5sYFPTLv7JPisiOA+ivAKE64fztg@mail.gmail.com>
References: <1420843545-30892-1-git-send-email-andrew@lunn.ch>
 <1420843545-30892-3-git-send-email-andrew@lunn.ch> <alpine.DEB.2.02.1501132019590.3113@pmeerw.net>
 <20150113195718.GG14570@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:54155 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752001AbbAMUEm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 13 Jan 2015 15:04:42 -0500
Received: by mail-ig0-f180.google.com with SMTP id h15so5198569igd.1
        for <linux-leds@vger.kernel.org>; Tue, 13 Jan 2015 12:04:41 -0800 (PST)
In-Reply-To: <20150113195718.GG14570@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Peter Meerwald <pmeerw@pmeerw.net>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Matthew.Fatheree@belkin.com, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Tue, Jan 13, 2015 at 11:57 AM, Andrew Lunn <andrew@lunn.ch> wrote:
> On Tue, Jan 13, 2015 at 08:39:11PM +0100, Peter Meerwald wrote:
>> On Fri, 9 Jan 2015, Andrew Lunn wrote:
>>
>> > The TLC59116 is an I2C bus controlled 16-channel LED driver.  Each LED
>> > output has its own 8-bit fixed-frequency PWM controller to control the
>> > brightness of the LED.
>>
>> some minor comments inline below
>>
>> >
>> > This is based on a driver from Belkin, but has been extensively
>> > rewritten.
>> >
>> > Signed-off-by: Andrew Lunn <andrew@lunn.ch>
>> > Cc: Matthew.Fatheree@belkin.com
>> > ---
>> >  drivers/leds/Kconfig         |   8 ++
>> >  drivers/leds/Makefile        |   1 +
>> >  drivers/leds/leds-tlc59116.c | 252 +++++++++++++++++++++++++++++++++++++++++++
>> >  3 files changed, 261 insertions(+)
>> >  create mode 100644 drivers/leds/leds-tlc59116.c
>> >
>> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> > index a6c3d2f153f3..8fc283c01673 100644
>> > --- a/drivers/leds/Kconfig
>> > +++ b/drivers/leds/Kconfig
>> > @@ -457,6 +457,14 @@ config LEDS_TCA6507
>> >       LED driver chips accessed via the I2C bus.
>> >       Driver support brightness control and hardware-assisted blinking.
>> >
>> > +config LEDS_TLC59116
>> > +   tristate "LED driver for TLC59116F controllers"
>> > +   depends on LEDS_CLASS && I2C
>> > +   select REGMAP_I2C
>> > +   help
>> > +     This option enables support for Texas Instruments TLC59116F
>> > +     LED controller.
>> > +
>> >  config LEDS_MAX8997
>> >     tristate "LED support for MAX8997 PMIC"
>> >     depends on LEDS_CLASS && MFD_MAX8997
>> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> > index 1c65a191d907..8e7d20acfa7b 100644
>> > --- a/drivers/leds/Makefile
>> > +++ b/drivers/leds/Makefile
>> > @@ -30,6 +30,7 @@ obj-$(CONFIG_LEDS_LP8501)         += leds-lp8501.o
>> >  obj-$(CONFIG_LEDS_LP8788)          += leds-lp8788.o
>> >  obj-$(CONFIG_LEDS_LP8860)          += leds-lp8860.o
>> >  obj-$(CONFIG_LEDS_TCA6507)         += leds-tca6507.o
>> > +obj-$(CONFIG_LEDS_TLC59116)                += leds-tlc59116.o
>> >  obj-$(CONFIG_LEDS_CLEVO_MAIL)              += leds-clevo-mail.o
>> >  obj-$(CONFIG_LEDS_IPAQ_MICRO)              += leds-ipaq-micro.o
>> >  obj-$(CONFIG_LEDS_HP6XX)           += leds-hp6xx.o
>> > diff --git a/drivers/leds/leds-tlc59116.c b/drivers/leds/leds-tlc59116.c
>> > new file mode 100644
>> > index 000000000000..9ed8175e7992
>> > --- /dev/null
>> > +++ b/drivers/leds/leds-tlc59116.c
>> > @@ -0,0 +1,252 @@
>> > +/*
>> > + * Copyright 2014 Belkin Inc.
>> > + * Copyright 2014 Andrew Lunn <andrew@lunn.ch>
>> > + *
>> > + * This program is free software; you can redistribute it and/or modify
>> > + * it under the terms of the GNU General Public License as published by
>> > + * the Free Software Foundation; version 2 of the License.
>> > + */
>> > +
>> > +#include <linux/i2c.h>
>> > +#include <linux/leds.h>
>> > +#include <linux/module.h>
>> > +#include <linux/of.h>
>> > +#include <linux/regmap.h>
>> > +#include <linux/slab.h>
>> > +#include <linux/workqueue.h>
>> > +
>> > +#define TLC59116_LEDS              16
>> > +
>> > +#define TLC59116_REG_MODE1 0x00    /* Mode register 0 */
>>
>> why rename the registers? mode1 vs. mode0
>
> Yes, could be better. I will fix this.
>
>> > +           if (priv->leds[reg].active)
>> > +                   return -EINVAL;
>> > +           priv->leds[reg].active = true;
>> > +           priv->leds[reg].ldev.name =
>> > +                   of_get_property(child, "label", NULL) ? : child->name;
>>
>> unusual syntax to skip the 2nd argument of the ? operator (nothing wrong)
>
> Yes, i thought so too, when i "borrowed" it from drivers/leds/leds-tca6507.c
>
> I will fix the signed/unsiged types, (x) etc.
>
>   Thanks
>         Andrew

Sure, I will update the patch after you provide a new one.
-Bryan
