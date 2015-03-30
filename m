From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH 0/3] Add DT support for netxbig LEDs
Date: Mon, 30 Mar 2015 10:30:40 +0200
Message-ID: <20150330083040.GY1509@kw.sim.vm.gnt>
References: <1424703861-20903-1-git-send-email-simon.guinot@sequanux.org>
 <20150309094107.GL1509@kw.sim.vm.gnt>
 <5506FE46.4000405@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K1J4S+9Iyh/oeWZQ"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:59412 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753276AbbC3Iap (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 30 Mar 2015 04:30:45 -0400
Content-Disposition: inline
In-Reply-To: <5506FE46.4000405@free-electrons.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>


--K1J4S+9Iyh/oeWZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2015 at 05:01:10PM +0100, Gregory CLEMENT wrote:
> Hi all,
>=20
> On 09/03/2015 10:41, Simon Guinot wrote:
> > On Mon, Feb 23, 2015 at 04:04:18PM +0100, Simon Guinot wrote:
> >> Hello,
> >>
> >> This patch series adds DT support for the LEDs found on the Kirkwood-b=
ased
> >> LaCie boards 2Big and 5Big Network v2.
> >>
> >> Simon
> >>
> >> Simon Guinot (3):
> >>   leds: netxbig: add device tree binding
> >>   ARM: Kirkwood: add LED DT entries for netxbig boards
> >>   ARM: mvebu: remove static LED setup for netxbig boards
> >=20
> > Hi Brian,
> >=20
> > Please, consider merging the first patch of this serie.
>=20
> Brian,
>=20
> here again let me know when this patch will be merged, and I will
> also need a stable tag as patch 2 depends on this one.
>=20
> Andrew, Jason,
>=20
> patch 2 and 3 looks OK for me. What is your opinion about it?

Hi Gregory, Andrew and Jason,

This patch set seems stuck. I believe that Bryan is probably too busy to
handle it...

Is that possible to merge it via the mvebu tree ? Since only some LaCie
boards are impacted, I think it could make sense.

Thanks,

Simon

> >>
> >>  .../devicetree/bindings/gpio/netxbig-gpio-ext.txt  |  22 ++
> >>  .../devicetree/bindings/leds/leds-netxbig.txt      |  90 ++++++++
> >>  arch/arm/boot/dts/kirkwood-net5big.dts             |  60 +++++
> >>  arch/arm/boot/dts/kirkwood-netxbig.dtsi            |  80 +++++++
> >>  arch/arm/mach-mvebu/Kconfig                        |   7 -
> >>  arch/arm/mach-mvebu/Makefile                       |   1 -
> >>  arch/arm/mach-mvebu/board.h                        |  21 --
> >>  arch/arm/mach-mvebu/kirkwood.c                     |   4 -
> >>  arch/arm/mach-mvebu/netxbig.c                      | 191 ------------=
----
> >>  drivers/leds/leds-netxbig.c                        | 244 ++++++++++++=
+++++++--
> >>  include/dt-bindings/leds/leds-netxbig.h            |  18 ++
> >>  11 files changed, 493 insertions(+), 245 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/gpio/netxbig-gpi=
o-ext.txt
> >>  create mode 100644 Documentation/devicetree/bindings/leds/leds-netxbi=
g.txt
> >>  delete mode 100644 arch/arm/mach-mvebu/board.h
> >>  delete mode 100644 arch/arm/mach-mvebu/netxbig.c
> >>  create mode 100644 include/dt-bindings/leds/leds-netxbig.h
> >>
> >> --=20
> >> 2.1.1
> >>
> >>
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >>
> >>
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20
>=20
> --=20
> Gregory Clement, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--K1J4S+9Iyh/oeWZQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUZCbAACgkQgtp0PDeOcDpupwCghSyuFNXY2syEPN+Xrw9EbmOf
vsMAoJAHS9dDY5vvBinGwOBGCc87tGGv
=/ApZ
-----END PGP SIGNATURE-----

--K1J4S+9Iyh/oeWZQ--
