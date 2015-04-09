From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH 0/4] Allow to use leds-ns2 with n090401 boards
Date: Thu, 9 Apr 2015 16:25:29 +0200
Message-ID: <20150409142529.GC1509@kw.sim.vm.gnt>
References: <1425480739-2373-1-git-send-email-simon.guinot@sequanux.org>
 <20150313094433.GU1509@kw.sim.vm.gnt>
 <20150323103243.GQ1509@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g+8Xtij24AYnRgQJ"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:41565 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753255AbbDIOZh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 9 Apr 2015 10:25:37 -0400
Content-Disposition: inline
In-Reply-To: <20150323103243.GQ1509@kw.sim.vm.gnt>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>


--g+8Xtij24AYnRgQJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2015 at 11:32:43AM +0100, Simon Guinot wrote:
> On Fri, Mar 13, 2015 at 10:44:33AM +0100, Simon Guinot wrote:
> > On Wed, Mar 04, 2015 at 03:52:15PM +0100, Simon Guinot wrote:
> > > Hello,
> > >=20
> > > This patch series allows to use the leds-ns2 driver with the n090401
> > > boards (Seagate NAS 4-Bay), based on an Armada-370 SoC.
> > >=20
> > > Here is the list changes:
> > >=20
> > > - Allow to configure the LED mode mapping.
> > > - Handle can_sleep GPIOs. On n090401, the LEDs are connected to an I2C
> > >   GPIO expander.
> > > - Make leds-ns2 depends on MACH_ARMADA_370.
> >=20
> > Hi Brian,
> >=20
> > Please consider applying the leds-ns2 patches of this serie.
>=20
> Hi Brian,
>=20
> Again, it would be nice to have this patches for the incoming release.
> Please, consider picking the leds-ns2 patches of this serie.

Hi Bryan,

Ping :)

Please, let me know if there is anything I can do to have this patches
merged for the next Linux release.

Thanks,

Simon

> > > Simon Guinot (2):
> > >   leds: leds-ns2: handle can_sleep GPIOs
> > >   leds: leds-ns2: depends on MACH_ARMADA_370
> > >=20
> > > Vincent Donnefort (2):
> > >   leds: leds-ns2: move LED modes mapping outside of the driver
> > >   ARM: Kirkwood: add modes-map property to ns2-leds nodes
> > >=20
> > >  .../devicetree/bindings/leds/leds-ns2.txt          |   9 ++
> > >  arch/arm/boot/dts/kirkwood-d2net.dts               |   5 +
> > >  arch/arm/boot/dts/kirkwood-is2.dts                 |   5 +
> > >  arch/arm/boot/dts/kirkwood-ns2.dts                 |   5 +
> > >  arch/arm/boot/dts/kirkwood-ns2max.dts              |   5 +
> > >  arch/arm/boot/dts/kirkwood-ns2mini.dts             |   5 +
> > >  drivers/leds/Kconfig                               |  12 +-
> > >  drivers/leds/leds-ns2.c                            | 156 +++++++++++=
++--------
> > >  include/dt-bindings/leds/leds-ns2.h                |   8 ++
> > >  include/linux/platform_data/leds-kirkwood-ns2.h    |  14 ++
> > >  10 files changed, 159 insertions(+), 65 deletions(-)
> > >  create mode 100644 include/dt-bindings/leds/leds-ns2.h
> > >=20
> > > --=20
> > > 2.1.1
> > >=20
> > >=20
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20
>=20
>=20
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20



> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


--g+8Xtij24AYnRgQJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUmi9kACgkQgtp0PDeOcDo8IACeLbOjkXM/j+uHe36KVabjES1B
11UAnR2T7qr2msWR0FKSto1Agx9UTNG2
=iIFD
-----END PGP SIGNATURE-----

--g+8Xtij24AYnRgQJ--
