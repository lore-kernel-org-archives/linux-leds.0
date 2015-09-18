From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH v4 0/3] Add DT support for netxbig LEDs
Date: Fri, 18 Sep 2015 15:23:56 +0200
Message-ID: <20150918132356.GO7306@kw.sim.vm.gnt>
References: <1442505571-9744-1-git-send-email-simon.guinot@sequanux.org>
 <55FBD641.7030902@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G+DT6X5ssgZ56VG3"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:41741 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751418AbbIRNPf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 18 Sep 2015 09:15:35 -0400
Content-Disposition: inline
In-Reply-To: <55FBD641.7030902@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org


--G+DT6X5ssgZ56VG3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2015 at 11:15:45AM +0200, Jacek Anaszewski wrote:
> Hi Simon,
>=20
> Thanks for the update.
>=20
> On 09/17/2015 05:59 PM, Simon Guinot wrote:
> >Hello,
> >
> >This patch series adds DT support for the LEDs found on the Kirkwood-bas=
ed
> >LaCie boards 2Big and 5Big Network v2.
> >
> >Changes for v2:
> >- Check timer mode value retrieved from DT.
> >- In netxbig_leds_get_of_pdata, don't use unsigned long variables to get
> >   timer delay values from DT with function of_property_read_u32_index.
> >   Instead, use a temporary u32 variable. This allows to silence a static
> >   checker warning.
> >- Make timer property optional in the binding documentation. It is now
> >   aligned with the driver code.
> >
> >Changes for v3:
> >- Fix pointer usage with the temporary u32 variable while calling
> >   of_property_read_u32_index.
> >
> >Changes for v4:
> >- In DT binding document netxbig-gpio-ext.txt, detail byte order for
> >   registers and latch mechanism for "enable-gpio".
> >- In leds-netxbig.c, add some error messages.
> >- In leds-netxbig.c, fix some "sizeof" style issues.
> >- In leds-netxbig.c, in netxbig_leds_get_of_pdata(), move the
> >   of_property_read_string() calls after the error-prone checks.
> >- Add some Acked-by.
> >
> >Jacek,
> >
> >I did not convert the bright-max DT property into led-max-microamp.
> >The reason is that I can't translate the bright-max values into
> >microamperes.
>=20
> Doesn't specification of your device say what current value given
> brightness level reflects?

I double-checked and I can confirm that I don't have the current values
for the LEDs. Although this feature is nice to have, it has not been
used by the LaCie stock firmware. LEDs are only enabled at their maximum
level. I believe it is the reason why it has not been specified...

Simon

--G+DT6X5ssgZ56VG3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlX8EGwACgkQgtp0PDeOcDpbeACdE2LAiH2vZdVJLqbiPRRl3V7g
0BoAni6ApWFelSTbFzCOlty4nyHrIxNk
=9d1r
-----END PGP SIGNATURE-----

--G+DT6X5ssgZ56VG3--
