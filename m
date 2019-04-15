From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5/5] leds: lm3697: Introduce the lm3697 driver
Date: Mon, 15 Apr 2019 16:03:06 +0200
Message-ID: <20190415140306.GA13084@amd>
References: <20190325142403.30447-1-dmurphy@ti.com>
 <20190325142403.30447-6-dmurphy@ti.com>
 <20190413200605.GA3013@amd>
 <f47fff9b-bca1-6412-c423-acf01baabc9f@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f47fff9b-bca1-6412-c423-acf01baabc9f@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> >> index 735009e73414..688bb9a6f275 100644
> >> --- a/drivers/leds/Kconfig
> >> +++ b/drivers/leds/Kconfig
> >> @@ -776,9 +776,15 @@ config LEDS_NIC78BX
> >>  	  To compile this driver as a module, choose M here: the module
> >>  	  will be called leds-nic78bx.
> >> =20
> >> +config LEDS_LM3697
> >> +	tristate "LED driver for LM3697"
> >> +	depends on LEDS_TI_LMU_COMMON
> >> +	help
> >> +	  Say Y to enable the LM3697 LED driver for TI LMU devices.
> >> +	  This supports the LED device LM3697.
> >> +
> >>  config LEDS_TI_LMU_COMMON
> >>  	tristate "LED driver for TI LMU"
> >> -	depends on REGMAP
> >>  	help
> >>            Say Y to enable the LED driver for TI LMU devices.
> >>            This supports common features between the TI LM3532, LM3631=
, LM3632,
=2E..
> > Plus we'd normally expect "COMMON" first and then specific driver. Not
> > sure if Kconfig can handle it out-of-order...
>=20
> OK.  Should I rename the ti_lmu file to leds-common-ti-lmu?

Oh, no, that is not what I meant.

You have

config B
       depends on A

config A

above. We really want

config A

config B
       depends on A

> This keeps the naming convention the same in the leds directory as well.
>=20
> FYI I will not add your acked-by on the LMU patch that introduced the cod=
e unless you approve.
> Since you found issues with the kconfig

I did not review it in great detail, so no acked-by's, yet :-).
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAly0jxkACgkQMOfwapXb+vITrQCdHUFgkRNr0jijvWO/hgXaEbue
eqoAnjr1VJSXdiyqH/OpCmSVu22z7g0B
=r85c
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
