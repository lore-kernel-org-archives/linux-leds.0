From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [patch v4 2/2] mfd: Add Mellanox regmap I2C driver
Date: Tue, 5 Sep 2017 09:13:57 +0100
Message-ID: <20170905081357.odg56cf3pkmze6cm@dell>
References: <1504029616-192277-1-git-send-email-vadimp@mellanox.com>
 <1504029616-192277-3-git-send-email-vadimp@mellanox.com>
 <20170905073540.uxqhchcveu5d6vtk@dell>
 <AM4PR05MB333008AD8B8B9FC8BEBE2411A2960@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM4PR05MB333008AD8B8B9FC8BEBE2411A2960@AM4PR05MB3330.eurprd05.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue, 05 Sep 2017, Vadim Pasternak wrote:
> > -----Original Message-----
> > From: Lee Jones [mailto:lee.jones@linaro.org]
> > Sent: Tuesday, September 05, 2017 10:36 AM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: robh+dt@kernel.org; pavel@ucw.cz; devicetree@vger.kernel.org;
> > j.anaszewski@samsung.com; rpurdie@rpsys.net; linux-leds@vger.kernel.org;
> > jiri@resnulli.us; gregkh@linuxfoundation.org; platform-driver-
> > x86@vger.kernel.org
> > Subject: Re: [patch v4 2/2] mfd: Add Mellanox regmap I2C driver

This should not appear in your replies.

Please fix your mailer.

> > On Tue, 29 Aug 2017, Vadim Pasternak wrote:
> > 
> > > This patch adds I2C regmap driver for Mellanox BMC cards with the
> > > programmable devices attached to I2C interface. It allows support for
> > > CPLD devices with one and two bytes address space.
> > >
> > > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > > Acked-by: Pavel Machek <pavel@ucw.cz>
> > > ---
> > >  MAINTAINERS              |   1 +
> > >  drivers/mfd/Kconfig      |  13 ++++
> > >  drivers/mfd/Makefile     |   1 +
> > >  drivers/mfd/mlxreg-i2c.c | 183
> > > +++++++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 198 insertions(+)
> > >  create mode 100644 drivers/mfd/mlxreg-i2c.c
> > 
> > I don't know what this is, but it is not an MFD driver.  Please find somewhere
> > more appropriate to locate it.  MFD is not a dumping ground for drivers
> > which do not fit anywhere else.
> 
> Hi Lee,
> 
> As according your previous notes I am splitting hotplug driver  and moving it to new 
> folder drivers/platform/mellanox/, possibly it would be the best place to relocate it
> there. I also intend to have in the future small drivers mlxreg-spi, mlxreg-mmio and
> maybe it would be correct to to use these new folder for all of them?

I'm afraid I don't have the topology of the driver in my mind.  I
guess those decisions will be best taken by the Platform maintainer.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
