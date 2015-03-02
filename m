From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 0/3] Add ktd2692 Flash LED driver
Date: Mon, 2 Mar 2015 11:15:30 +0200
Message-ID: <20150302091530.GQ6539@valkosipuli.retiisi.org.uk>
References: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
 <54F02DF5.1000706@samsung.com>
 <54F40DDF.8070708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:59541 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753629AbbCBJPh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 Mar 2015 04:15:37 -0500
Content-Disposition: inline
In-Reply-To: <54F40DDF.8070708@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, cooloney@gmail.com, rpurdie@rpsys.net, treding@nvidia.com, p.zabel@pengutronix.de, andrew@lunn.ch, gregkh@linuxfoundation.org, florian.vaussard@epfl.ch, arno@natisbad.org, kuninori.morimoto.gx@renesas.com, hytszk@gmail.com, antonynpavlov@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, sw0312.kim@samsung.com, ideal.song@samsung.com

H Ingi,

On Mon, Mar 02, 2015 at 04:14:39PM +0900, Ingi Kim wrote:
> Hi Jacek
>=20
> On 2015=EB=85=84 02=EC=9B=94 27=EC=9D=BC 17:42, Jacek Anaszewski wrot=
e:
> > Hi Ingi,
> >=20
> > On 02/27/2015 02:01 AM, Ingi Kim wrote:
> >> This patch supports KTD2692 flash LED driver
> >>
> >> Ingi Kim (3):
> >>    of: Add vendor prefix for Kinetic technologies
> >>    leds: ktd2692: add device tree bindings for ktd2692
> >>    leds: Add ktd2692 flash LED driver
> >>
> >>   .../devicetree/bindings/leds/leds-ktd2692.txt      |   19 ++
> >>   .../devicetree/bindings/vendor-prefixes.txt        |    1 +
> >>   drivers/leds/Kconfig                               |    8 +
> >>   drivers/leds/Makefile                              |    1 +
> >>   drivers/leds/leds-ktd2692.c                        |  245 ++++++=
++++++++++++++
> >>   5 files changed, 274 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/leds/leds-k=
td2692.txt
> >>   create mode 100644 drivers/leds/leds-ktd2692.c
> >>
> >=20
> > In your device tree binding documentation there is torch-gpio menti=
oned,
> > but you seem not to use it in the driver.
> >=20
> > We have already LED Flash class (/drivers/leds/led-class-flash.c) f=
or
> > this type of devices, which handles both torch and flash modes
> > (flash_strobe sysfs attribute is provided for strobing the flash).
> >=20
> > The reference drivers using LED Flash class are still pending [1], =
but I
> > think that at least leds-aat1290 driver is almost ready for merging=
=2E
> > It controls very similar device to yours.
> >=20
> > Another advantage of using LED Flash class is that it has been desi=
gned
> > to be compatible with Video for Linux 2 subsystem, which will allow=
 for registering LED Flash class devices as a V4L2 sub-devices.
> >=20
> > Adding Sakari.
> >=20
>=20
> Ok, I'll check LED Flash class, and add torch-gpio

Many LED flash chips include a hardware pin for torch control but few r=
eally
need it. If you don't, i.e. you can implement the torch using the contr=
ol bus
instead, I think I'd probably drop it from the chip's DT bindings.

I wonder what others think.

--=20
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
