From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 1/4] drivers/mfd/menf21bmc: introduce MEN 14F021P00
 BMC MFD Core driver
Date: Wed, 27 Aug 2014 14:46:35 +0100
Message-ID: <20140827134635.GE6364@lee--X1>
References: <cover.1409074255.git.andreas.werner@men.de>
 <67faa70de03924edc768002df17b02e47256260c.1409074255.git.andreas.werner@men.de>
 <20140827072633.GY26707@lee--X1>
 <53FDDF0F.2080607@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qc0-f178.google.com ([209.85.216.178]:65511 "EHLO
	mail-qc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933802AbaH0Nql (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 27 Aug 2014 09:46:41 -0400
Received: by mail-qc0-f178.google.com with SMTP id x3so261165qcv.9
        for <linux-leds@vger.kernel.org>; Wed, 27 Aug 2014 06:46:41 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <53FDDF0F.2080607@roeck-us.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andreas Werner <andreas.werner@men.de>, linux-kernel@vger.kernel.org, sameo@linux.intel.com, wim@iguana.be, linux-watchdog@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jdelvare@suse.de, lm-sensors@lm-sensors.org, johannes.thumshirn@men.de

On Wed, 27 Aug 2014, Guenter Roeck wrote:
> On 08/27/2014 12:26 AM, Lee Jones wrote:
> >On Tue, 26 Aug 2014, Andreas Werner wrote:
> >>The MEN 14F021P00 Board Management Controller provides an
> >>I2C interface to the host to access the feature implemented in the =
BMC.
> >>The BMC is a PIC Microntroller assembled on CPCI Card from MEN Mikr=
oelektronik
> >>and on a few Box/Display Computer.
> >>
> >>Added MFD Core driver, supporting the I2C communication to the devi=
ce.
> >>
> >>The MFD driver currently supports the following features:
> >>  	- Watchdog
> >>  	- LEDs
> >>	- Hwmon (voltage monitoring)
> >>
>=20
> >>+	{ }
> >>+};
> >>+MODULE_DEVICE_TABLE(i2c, menf21bmc_id_table);
> >>+
> >>+static struct i2c_driver menf21bmc_driver =3D {
> >>+	.driver.name	=3D "menf21bmc",
> >>+	.id_table	=3D menf21bmc_id_table,
> >>+	.probe		=3D menf21bmc_probe,
> >>+	.remove		=3D menf21bmc_remove,
> >>+};
> >
> >No DT support?
> >
> i2c devices auto-instantiate from dt entries even if there is no
> explicit devicetree configuration here. The devicetree entry
> would have to be something like "men,menf21bmc", ie it needs
> to match the driver name.

https://patchwork.ozlabs.org/patch/362180/

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
