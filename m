From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] drivers/mfd/menf21bmc: introduce MEN 14F021P00 BMC
 MFD Core driver
Date: Mon, 19 May 2014 18:39:53 +0100
Message-ID: <20140519173953.GA20874@lee--X1>
References: <cover.1400258021.git.andreas.werner@men.de>
 <58de41a38511a107941d9c3b2cea314c0becfff7.1400258021.git.andreas.werner@men.de>
 <5377849E.7020001@roeck-us.net>
 <20140519124324.GB398@awelinux>
 <537A05D4.6080308@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:51512 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932691AbaESRkA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 19 May 2014 13:40:00 -0400
Received: by mail-ie0-f171.google.com with SMTP id rp18so2964000iec.16
        for <linux-leds@vger.kernel.org>; Mon, 19 May 2014 10:39:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <537A05D4.6080308@roeck-us.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andreas Werner <andreas.werner@men.de>, linux-kernel@vger.kernel.org, sameo@linux.intel.com, wim@iguana.be, linux-watchdog@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, johannes.thumshirn@men.de, thomas.schnuerer@men.de, wernerandy@gmx.de

On Mon, 19 May 2014, Guenter Roeck wrote:

> On 05/19/2014 05:43 AM, Andreas Werner wrote:
> >aOn Sat, May 17, 2014 at 08:47:42AM -0700, Guenter Roeck wrote:
> >>On 05/16/2014 09:37 AM, Andreas Werner wrote:
> >>>The MEN 14F021P00 Board Management Controller provides an
> >>>I2C interface to the host to access the feature implemented in the=
 BMC.
> >>>The BMC is a PIC Microntroller assembled on CPCI Card from MEN Mik=
roelektronik
> >>>and on a few Box/Display Computer.
> >>>
> >>>Added MFD Core driver, supporting the I2C communication to the dev=
ice.
> >>>
> >>>The MFD driver currently supports the following features:
> >>>	- Watchdog
> >>>	- LEDs
> >>>
> >>>Signed-off-by: Andreas Werner <andreas.werner@men.de>
> >>>---
> >>>  drivers/mfd/Kconfig           |  12 +++
> >>>  drivers/mfd/Makefile          |   1 +
> >>>  drivers/mfd/menf21bmc.c       | 193 ++++++++++++++++++++++++++++=
++++++++++++++
> >>>  include/linux/mfd/menf21bmc.h |  32 +++++++
> >>>  4 files changed, 238 insertions(+)
> >>>  create mode 100644 drivers/mfd/menf21bmc.c
> >>>  create mode 100644 include/linux/mfd/menf21bmc.h
> >>>
> >>>diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> >>>index ab5a43c..7c2e8d2 100644
> >>>--- a/drivers/mfd/Kconfig
> >>>+++ b/drivers/mfd/Kconfig
> >>>@@ -427,6 +427,18 @@ config MFD_MAX8998
> >>>  	  additional drivers must be enabled in order to use the functi=
onality
> >>>  	  of the device.
> >>>
> >>>+config MFD_MENF21BMC
> >>>+	tristate "MEN 14F021P00 Board Management Controller Support"
> >>>+	depends on I2C=3Dy
> >>>+	select MFD_CORE
> >>>+	help
> >>>+	  Say yes here to add support for the MEN 14F021P00 BMC
> >>>+	  which is a Board Management Controller connected to the I2C bu=
s.
> >>>+	  This driver provides common support for accessing the devices;
> >>>+	  additional drivers must be enabled in order to use the
> >>>+	  functionality of the BMC device.
> >>>+
> >>>+
> >>>  config EZX_PCAP
> >>>  	bool "Motorola EZXPCAP Support"
> >>>  	depends on SPI_MASTER
> >>>diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> >>>index 5913208..8f2be38 100644
> >>>--- a/drivers/mfd/Makefile
> >>>+++ b/drivers/mfd/Makefile
> >>>@@ -167,3 +167,4 @@ obj-$(CONFIG_MFD_AS3711)	+=3D as3711.o
> >>>  obj-$(CONFIG_MFD_AS3722)	+=3D as3722.o
> >>>  obj-$(CONFIG_MFD_STW481X)	+=3D stw481x.o
> >>>  obj-$(CONFIG_MFD_IPAQ_MICRO)	+=3D ipaq-micro.o
> >>>+obj-$(CONFIG_MFD_MENF21BMC)	+=3D menf21bmc.o
> >>>diff --git a/drivers/mfd/menf21bmc.c b/drivers/mfd/menf21bmc.c
> >>>new file mode 100644
> >>>index 0000000..77de1a8
> >>>--- /dev/null
> >>>+++ b/drivers/mfd/menf21bmc.c
> >>>@@ -0,0 +1,193 @@
> >>>+/*
> >>>+ *  MEN 14F021P00 Board Management Controller (BMC) MFD Core Driv=
er.
> >>>+ *
> >>>+ *  Copyright (C) 2014 MEN Mikro Elektronik Nuernberg GmbH
> >>>+ *  Author: Andreas Werner <andreas.werner@men.de>
> >>>+ *  All rights reserved.
> >>>+ *
> >>>+ *  This program is free software; you can redistribute  it and/o=
r modify it
> >>>+ *  under  the terms of  the GNU General  Public License as publi=
shed by the
> >>>+ *  Free Software Foundation;  either version 2 of the  License, =
or (at your
> >>>+ *  option) any later version.
> >>>+ *
> >>>+ */
> >>>+
> >>>+#include <linux/kernel.h>
> >>>+#include <linux/device.h>
> >>>+#include <linux/module.h>
> >>>+#include <linux/i2c.h>
> >>>+#include <linux/mfd/core.h>
> >>>+#include <linux/mfd/menf21bmc.h>
> >>>+
> >>>+#define BMC_CMD_REV_MAJOR	0x80
> >>>+#define BMC_CMD_REV_MINOR	0x81
> >>>+#define BMC_CMD_REV_MAIN	0x82
> >>>+#define BMC_CMD_REV_BUILD	0x83
> >>>+#define BMC_CMD_REV_VERI	0x84
> >>>+
> >>>+static struct mfd_cell menf21bmc_cell[] =3D {
> >>>+	{
> >>>+		.name =3D "menf21bmc_wd",
> >>>+	},
> >>>+	{
> >>>+		.name =3D "menf21bmc_led",
> >>>+	},
> >>>+};
> >>>+
> >>>+static int
> >>>+menf21bmc_read_byte_data(struct i2c_client *client, u8 reg, uint8=
_t *val)
> >>>+{
> >>>+	int ret;
> >>>+	struct menf21bmc *data =3D i2c_get_clientdata(client);
> >>>+
> >>>+	mutex_lock(&data->lock);
> >>>+	ret =3D i2c_smbus_read_byte_data(client, reg);
> >>>+	mutex_unlock(&data->lock);
> >>>+
> >>>+	if (ret < 0) {
> >>>+		dev_err(&client->dev, "failed to read byte at 0x%02x\n", reg);
> >>>+		return ret;
> >>>+	}
> >>>+
> >>>+	*val =3D (uint8_t)ret;
> >>>+
> >>>+	return 0;
> >>>+}
> >>>+
> >>I personally would prefer if you would retain the original API, whi=
ch returns both value
> >>and error code as return value. I don't see the benefit of changing=
 the API as you did -
> >>it just complicates the code.
> >>
> >>Thanks,
> >>Guenter
> >>
> >I think it is ok for a wrapper like this because it does not really =
change an API because
> >it is menf21bmc related.
> >
> >I did the same in rtc-rx8581, and it was already done in rtc_ds1307.=
c.
> >
> >I personally prefer this way because the return of the function and =
the return
> >value of the i2c_smbus_read - which is the value read from the devic=
e - are seperated.
> >
> >If it is a no go for the mfd/wdt core i can change it back to the or=
iginal i2c_smbus API.
> >If it is ok on your side for a wrapper like this, we can let it as i=
t is.
> >
>=20
> Not my call to make; depends on the mfd maintainer. I would not accep=
t it, as I see it
> as unnecessary, adding complexity, and pointless. Sure, you can alway=
s find examples
> for everything somewhere in the kernel, but that doesn't make it bett=
er.

I'm inclined to agree with Guenter, this patch is just noise.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
