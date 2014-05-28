From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/3] drivers/mfd/menf21bmc: introduce MEN 14F021P00
 BMC MFD Core driver
Date: Wed, 28 May 2014 09:24:05 +0100
Message-ID: <20140528082404.GA10803@lee--X1>
References: <cover.1401181010.git.andreas.werner@men.de>
 <a3cd43562effd2580d0174c56eff5584791217ac.1401181010.git.andreas.werner@men.de>
 <20140527150547.GA4227@lee--X1>
 <20140528070222.GA24101@jtlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140528070222.GA24101@jtlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Thumshirn <johannes.thumshirn@men.de>
Cc: Andreas Werner <andreas.werner@men.de>, linux-kernel@vger.kernel.org, sameo@linux.intel.com, wim@iguana.be, linux-watchdog@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

> > > The MEN 14F021P00 Board Management Controller provides an
> > > I2C interface to the host to access the feature implemented in th=
e BMC.
> > > The BMC is a PIC Microntroller assembled on CPCI Card from MEN Mi=
kroelektronik
> > > and on a few Box/Display Computer.
> > >
> > > Added MFD Core driver, supporting the I2C communication to the de=
vice.
> > >
> > > The MFD driver currently supports the following features:
> > > 	- Watchdog
> > > 	- LEDs
> > >
> > > Signed-off-by: Andreas Werner <andreas.werner@men.de>
> > > ---
> > >  drivers/mfd/Kconfig           |  12 +++
> > >  drivers/mfd/Makefile          |   1 +
> > >  drivers/mfd/menf21bmc.c       | 220 ++++++++++++++++++++++++++++=
++++++++++++++
> > >  include/linux/mfd/menf21bmc.h |  31 ++++++
> > >  4 files changed, 264 insertions(+)
> > >  create mode 100644 drivers/mfd/menf21bmc.c
> > >  create mode 100644 include/linux/mfd/menf21bmc.h

[...]

> > > +static int menf21bmc_write_byte(struct i2c_client *client, u8 va=
l)
> > > +{
> > > +	int ret;
> > > +	struct menf21bmc *data =3D i2c_get_clientdata(client);
> > > +
> > > +	mutex_lock(&data->lock);
> > > +	ret =3D i2c_smbus_write_byte(client, val);
> > > +	mutex_unlock(&data->lock);
> > > +
> > > +	return ret;
> > > +}
> >
> > Didn't we ask you to remove these?  Just make the i2c_smbus_* calls
> > from within the driver.  The I2C subsystem conducts its own locking=
=2E
> > I'm really starting to frown on aggregation for the sake of
> > aggregation.  It's just overhead.
> >
>=20
> Correct me if I'm wrong but as far as I remember Guenther asked to re=
tain the
> original API, not the remove the "abstraction layer". Once we build a=
 board with
> one of these BMCs attached via e.g. SPI we would have to reintroduce =
it anyways,
> in order to re-use these drivers.

If there are two or more possible interfaces then I agree, these
aggregations would be the best approach.  However, as it stands, that's
not currently the case.

Genuine question; are Men on the verge of building such a board, or
are we talking about 'ifs' and 'maybes'?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
