From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 1/4] drivers/mfd/menf21bmc: introduce MEN 14F021P00
 BMC MFD Core driver
Date: Wed, 27 Aug 2014 12:01:42 +0100
Message-ID: <20140827110142.GA6364@lee--X1>
References: <cover.1409074255.git.andreas.werner@men.de>
 <67faa70de03924edc768002df17b02e47256260c.1409074255.git.andreas.werner@men.de>
 <20140827072633.GY26707@lee--X1>
 <20140827105204.GA2083@awelinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f46.google.com ([209.85.192.46]:45703 "EHLO
	mail-qg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755973AbaH0LBt (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 27 Aug 2014 07:01:49 -0400
Received: by mail-qg0-f46.google.com with SMTP id z60so30948qgd.19
        for <linux-leds@vger.kernel.org>; Wed, 27 Aug 2014 04:01:48 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140827105204.GA2083@awelinux>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andreas Werner <andreas.werner@men.de>
Cc: linux-kernel@vger.kernel.org, sameo@linux.intel.com, wim@iguana.be, linux-watchdog@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jdelvare@suse.de, linux@roeck-us.net, lm-sensors@lm-sensors.org, johannes.thumshirn@men.de

On Wed, 27 Aug 2014, Andreas Werner wrote:
> On Wed, Aug 27, 2014 at 08:26:33AM +0100, Lee Jones wrote:
> > On Tue, 26 Aug 2014, Andreas Werner wrote:
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
> > > 	- Hwmon (voltage monitoring)
> > >=20
> > > Signed-off-by: Andreas Werner <andreas.werner@men.de>
> > > Acked-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/mfd/Kconfig     |  12 +++++
> > >  drivers/mfd/Makefile    |   1 +
> > >  drivers/mfd/menf21bmc.c | 132 ++++++++++++++++++++++++++++++++++=
++++++++++++++
> > >  3 files changed, 145 insertions(+)
> > >  create mode 100644 drivers/mfd/menf21bmc.c
> > >=20
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index b8d9ca0..6a9f101 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -453,6 +453,18 @@ config MFD_MAX8998
> > >  	  additional drivers must be enabled in order to use the functi=
onality
> > >  	  of the device.
> > > =20
> > > +config MFD_MENF21BMC
> > > +	tristate "MEN 14F021P00 Board Management Controller Support"
> > > +	depends on I2C
> > > +	select MFD_CORE
> > > +	help
> > > +	  Say yes here to add support for the MEN 14F021P00 BMC
> > > +	  which is a Board Management Controller connected to the I2C b=
us.
> > > +	  The device supports multiple sub-devices like LED, HWMON  and=
 WDT.
> >=20
> > Nit: Whitespace error.
> >=20
>=20
> I run checkpatch but did not find any whitespace error.
> Where is it?

After 'HWMON'.

> > > +MODULE_DEVICE_TABLE(i2c, menf21bmc_id_table);
> > > +
> > > +static struct i2c_driver menf21bmc_driver =3D {
> > > +	.driver.name	=3D "menf21bmc",
> > > +	.id_table	=3D menf21bmc_id_table,
> > > +	.probe		=3D menf21bmc_probe,
> > > +	.remove		=3D menf21bmc_remove,
> > > +};
> >=20
> > No DT support?
> >=20
>=20
> No not at the moment because it is used only on x86 system.

Ah okay.  Shouldn't the Kconfig depend on X86 then?  What about ACPI?

> > > +module_i2c_driver(menf21bmc_driver);
> > > +
> > > +MODULE_DESCRIPTION("MEN 14F021P00 BMC mfd core driver");
> >=20
> > s/mfd/MFD
> >=20
> > > +MODULE_AUTHOR("Andreas Werner <andreas.werner@men.de>");
> > > +MODULE_LICENSE("GPL v2");
> >=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
