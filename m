From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH 0/4] Allow to use leds-ns2 with n090401 boards
Date: Mon, 30 Mar 2015 10:34:43 +0200
Message-ID: <20150330083443.GZ1509@kw.sim.vm.gnt>
References: <1425480739-2373-1-git-send-email-simon.guinot@sequanux.org>
 <20150313094433.GU1509@kw.sim.vm.gnt>
 <5506FC38.3020904@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NvqZDi+E7kI0ww+8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:59455 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752845AbbC3Ieq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 30 Mar 2015 04:34:46 -0400
Content-Disposition: inline
In-Reply-To: <5506FC38.3020904@free-electrons.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Bryan Wu <cooloney@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Vincent Donnefort <vdonnefort@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>


--NvqZDi+E7kI0ww+8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2015 at 04:52:24PM +0100, Gregory CLEMENT wrote:
> Hi Simon, Bryan,
>=20
> On 13/03/2015 10:44, Simon Guinot wrote:
> > On Wed, Mar 04, 2015 at 03:52:15PM +0100, Simon Guinot wrote:
> >> Hello,
> >>
> >> This patch series allows to use the leds-ns2 driver with the n090401
> >> boards (Seagate NAS 4-Bay), based on an Armada-370 SoC.
> >>
> >> Here is the list changes:
> >>
> >> - Allow to configure the LED mode mapping.
> >> - Handle can_sleep GPIOs. On n090401, the LEDs are connected to an I2C
> >>   GPIO expander.
> >> - Make leds-ns2 depends on MACH_ARMADA_370.
> >=20
> > Hi Brian,
> >=20
> > Please consider applying the leds-ns2 patches of this serie.
>=20
> Let me know when this will be applied so I will be able to
> apply the patch 3. I will also need a stable tag for the dependency.

Hi Gregory, Andrew and Jason,

Again, this patch set seems stuck. And again, may it is possible to
merge it through the mvebu tree ?

Thanks,

Simon

> >> Simon Guinot (2):
> >>   leds: leds-ns2: handle can_sleep GPIOs
> >>   leds: leds-ns2: depends on MACH_ARMADA_370
> >>
> >> Vincent Donnefort (2):
> >>   leds: leds-ns2: move LED modes mapping outside of the driver
> >>   ARM: Kirkwood: add modes-map property to ns2-leds nodes
> >>
> >>  .../devicetree/bindings/leds/leds-ns2.txt          |   9 ++
> >>  arch/arm/boot/dts/kirkwood-d2net.dts               |   5 +
> >>  arch/arm/boot/dts/kirkwood-is2.dts                 |   5 +
> >>  arch/arm/boot/dts/kirkwood-ns2.dts                 |   5 +
> >>  arch/arm/boot/dts/kirkwood-ns2max.dts              |   5 +
> >>  arch/arm/boot/dts/kirkwood-ns2mini.dts             |   5 +
> >>  drivers/leds/Kconfig                               |  12 +-
> >>  drivers/leds/leds-ns2.c                            | 156 ++++++++++++=
+--------
> >>  include/dt-bindings/leds/leds-ns2.h                |   8 ++
> >>  include/linux/platform_data/leds-kirkwood-ns2.h    |  14 ++
> >>  10 files changed, 159 insertions(+), 65 deletions(-)
> >>  create mode 100644 include/dt-bindings/leds/leds-ns2.h
> >>
> >> --=20
> >> 2.1.1
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

--NvqZDi+E7kI0ww+8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUZCqMACgkQgtp0PDeOcDo2nQCfXG+xEOZJK/vSMhqtXBAPsQJy
eA0An2EbZ8vUKwVLnVXXkTrXl+ZBdx64
=D9y8
-----END PGP SIGNATURE-----

--NvqZDi+E7kI0ww+8--
