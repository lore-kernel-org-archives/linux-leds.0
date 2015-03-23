From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH 0/3] Add DT support for netxbig LEDs
Date: Mon, 23 Mar 2015 11:31:39 +0100
Message-ID: <20150323103138.GP1509@kw.sim.vm.gnt>
References: <1424703861-20903-1-git-send-email-simon.guinot@sequanux.org>
 <20150309094107.GL1509@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pbf06CWejC5c8J2q"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:51266 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752144AbbCWKbm (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 23 Mar 2015 06:31:42 -0400
Content-Disposition: inline
In-Reply-To: <20150309094107.GL1509@kw.sim.vm.gnt>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vincent Donnefort <vdonnefort@gmail.com>


--pbf06CWejC5c8J2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2015 at 10:41:08AM +0100, Simon Guinot wrote:
> On Mon, Feb 23, 2015 at 04:04:18PM +0100, Simon Guinot wrote:
> > Hello,
> >=20
> > This patch series adds DT support for the LEDs found on the Kirkwood-ba=
sed
> > LaCie boards 2Big and 5Big Network v2.
> >=20
> > Simon
> >=20
> > Simon Guinot (3):
> >   leds: netxbig: add device tree binding
> >   ARM: Kirkwood: add LED DT entries for netxbig boards
> >   ARM: mvebu: remove static LED setup for netxbig boards
>=20
> Hi Brian,
>=20
> Please, consider merging the first patch of this serie.

Hi Brian,

It would be nice to have this patches for the incoming release.
Please, consider picking them.

Thanks,

Simon

> >=20
> >  .../devicetree/bindings/gpio/netxbig-gpio-ext.txt  |  22 ++
> >  .../devicetree/bindings/leds/leds-netxbig.txt      |  90 ++++++++
> >  arch/arm/boot/dts/kirkwood-net5big.dts             |  60 +++++
> >  arch/arm/boot/dts/kirkwood-netxbig.dtsi            |  80 +++++++
> >  arch/arm/mach-mvebu/Kconfig                        |   7 -
> >  arch/arm/mach-mvebu/Makefile                       |   1 -
> >  arch/arm/mach-mvebu/board.h                        |  21 --
> >  arch/arm/mach-mvebu/kirkwood.c                     |   4 -
> >  arch/arm/mach-mvebu/netxbig.c                      | 191 -------------=
---
> >  drivers/leds/leds-netxbig.c                        | 244 +++++++++++++=
++++++--
> >  include/dt-bindings/leds/leds-netxbig.h            |  18 ++
> >  11 files changed, 493 insertions(+), 245 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/netxbig-gpio=
-ext.txt
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig=
=2Etxt
> >  delete mode 100644 arch/arm/mach-mvebu/board.h
> >  delete mode 100644 arch/arm/mach-mvebu/netxbig.c
> >  create mode 100644 include/dt-bindings/leds/leds-netxbig.h
> >=20
> > --=20
> > 2.1.1
> >=20
> >=20
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


--pbf06CWejC5c8J2q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUP64oACgkQgtp0PDeOcDpf0wCggs6pagfDHsb2/0OjQ0xVcWtp
JvAAn1GzKyagwJM1ENtAez/3v6OkSgWO
=W83W
-----END PGP SIGNATURE-----

--pbf06CWejC5c8J2q--
