From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/3] drivers/mfd/menf21bmc: introduce MEN 14F021P00
 BMC MFD Core driver
Date: Fri, 18 Jul 2014 08:25:36 +0100
Message-ID: <20140718072536.GI30888@lee--X1>
References: <cover.1405602280.git.andreas.werner@men.de>
 <e035a8a5211769e610a1337dc786f2fcc8dfd14d.1405602280.git.andreas.werner@men.de>
 <20140717124156.GF30888@lee--X1>
 <20140717140653.GA8468@awelinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:34046 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751503AbaGRHZm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 18 Jul 2014 03:25:42 -0400
Received: by mail-ie0-f176.google.com with SMTP id tr6so4231967ieb.35
        for <linux-leds@vger.kernel.org>; Fri, 18 Jul 2014 00:25:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140717140653.GA8468@awelinux>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andreas Werner <andreas.werner@men.de>
Cc: linux-kernel@vger.kernel.org, sameo@linux.intel.com, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, wim@iguana.be, linux-watchdog@vger.kernel.org

On Thu, 17 Jul 2014, Andreas Werner wrote:
> On Thu, Jul 17, 2014 at 01:41:56PM +0100, Lee Jones wrote:
> > On Thu, 17 Jul 2014, Andreas Werner wrote:
> > > The MEN 14F021P00 Board Management Controller provides an
> > > I2C interface to the host to access the feature implemented in th=
e BMC.
> > > The BMC is a PIC Microntroller assembled on CPCI Card from MEN Mi=
kroelektronik
> > > and on a few Box/Display Computer.
> > >=20
> > > Added MFD Core driver, supporting the I2C communication to the de=
vice.
> > >=20
> > > The MFD driver currently supports the following features:
> > >  	- Watchdog
> > >  	- LEDs
> > >=20
> > > Signed-off-by: Andreas Werner <andreas.werner@men.de>
> > > ---
> > >  drivers/mfd/Kconfig     |  12 +++++
> > >  drivers/mfd/Makefile    |   1 +
> > >  drivers/mfd/menf21bmc.c | 136 ++++++++++++++++++++++++++++++++++=
++++++++++++++
> > >  3 files changed, 149 insertions(+)
> > >  create mode 100644 drivers/mfd/menf21bmc.c
> > >=20
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index b8d9ca0..6e2cd14 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -453,6 +453,18 @@ config MFD_MAX8998
> > >  	  additional drivers must be enabled in order to use the functi=
onality
> > >  	  of the device.
> > > =20
> > > +config MFD_MENF21BMC
> > > +	tristate "MEN 14F021P00 Board Management Controller Support"
> > > +	depends on I2C=3Dy
> > > +	select MFD_CORE
> > > +	help
> > > +	  Say yes here to add support for the MEN 14F021P00 BMC
> > > +	  which is a Board Management Controller connected to the I2C b=
us.
> > > +	  The device supports multiple sub-devices like LED and WDT.
> > > +	  This driver provides common support for accessing the devices=
;
> > > +	  additional drivers must be enabled in order to use the
> > > +	  functionality of the BMC device.
> >=20
> > Can you mention what those devices are here in the help text?
> >
>=20
> I've mentioned the sub-devices "LED" and "WDT" but i can also write
> the name to the help text like "menf21bmc_wdt" and "leds-menf21bmc".

Scrap this comment, I was being silly and didn't see "LED and WDT".

[...]

> > > +MODULE_DEVICE_TABLE(i2c, menf21bmc_id_table);
> > > +
> > > +static struct i2c_driver menf21bmc_driver =3D {
> > > +	.driver		=3D {
> > > +		.name	=3D "menf21bmc",
> > > +		.owner	=3D THIS_MODULE,
> >=20
> > Remove this line, it's handled elsewhere.
>=20
> Which line? the ".owner" line?

Yeah.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
