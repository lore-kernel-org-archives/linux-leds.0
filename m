From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: lp55xx: make various arrays static const
Date: Thu, 29 Jun 2017 22:48:31 +0200
Message-ID: <20170629204831.GA763@amd>
References: <20170629175738.12467-1-colin.king@canonical.com>
 <d57c8cab-4577-d227-64df-553b948566d9@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51457 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752397AbdF2Usf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jun 2017 16:48:35 -0400
Content-Disposition: inline
In-Reply-To: <d57c8cab-4577-d227-64df-553b948566d9@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Thanks for the patch.
>=20
> Do you have some profiling results showing the benefit of these changes?
> It seems that these functions are called only on driver initialization.
> Making the local arrays static will prevent releasing this memory even
> though it will be no longer needed.
>=20
> Anyway, the size of arrays is 3 bytes, so the impact of these changes
> seems to be virtually negligible. I am not taking this patch unless
> you are able to provide the numbers showing the gain.

C will have to initialize the array on stack, then copy values
there.. which is ugly. "static const" also tells the reader what is
going on there (nothing).

I'd say this is a good patch.

Acked-by: Pavel Machek <pavel@ucw.cz>

								Pavel

> > +++ b/drivers/leds/leds-lp5523.c
> > @@ -168,13 +168,13 @@ static int lp5523_post_init_device(struct lp55xx_=
chip *chip)
> >  static void lp5523_load_engine(struct lp55xx_chip *chip)
> >  {
> >  	enum lp55xx_engine_index idx =3D chip->engine_idx;
> > -	u8 mask[] =3D {
> > +	static const u8 mask[] =3D {
> >  		[LP55XX_ENGINE_1] =3D LP5523_MODE_ENG1_M,
> >  		[LP55XX_ENGINE_2] =3D LP5523_MODE_ENG2_M,
> >  		[LP55XX_ENGINE_3] =3D LP5523_MODE_ENG3_M,
> >  	};
> > =20
> > -	u8 val[] =3D {
> > +	static const u8 val[] =3D {
> >  		[LP55XX_ENGINE_1] =3D LP5523_LOAD_ENG1,
> >  		[LP55XX_ENGINE_2] =3D LP5523_LOAD_ENG2,
> >  		[LP55XX_ENGINE_3] =3D LP5523_LOAD_ENG3,
> > @@ -188,7 +188,7 @@ static void lp5523_load_engine(struct lp55xx_chip *=
chip)
> >  static void lp5523_load_engine_and_select_page(struct lp55xx_chip *chi=
p)
> >  {
> >  	enum lp55xx_engine_index idx =3D chip->engine_idx;
> > -	u8 page_sel[] =3D {
> > +	static const u8 page_sel[] =3D {
> >  		[LP55XX_ENGINE_1] =3D LP5523_PAGE_ENG1,
> >  		[LP55XX_ENGINE_2] =3D LP5523_PAGE_ENG2,
> >  		[LP55XX_ENGINE_3] =3D LP5523_PAGE_ENG3,
> > @@ -208,7 +208,7 @@ static void lp5523_stop_all_engines(struct lp55xx_c=
hip *chip)
> >  static void lp5523_stop_engine(struct lp55xx_chip *chip)
> >  {
> >  	enum lp55xx_engine_index idx =3D chip->engine_idx;
> > -	u8 mask[] =3D {
> > +	static const u8 mask[] =3D {
> >  		[LP55XX_ENGINE_1] =3D LP5523_MODE_ENG1_M,
> >  		[LP55XX_ENGINE_2] =3D LP5523_MODE_ENG2_M,
> >  		[LP55XX_ENGINE_3] =3D LP5523_MODE_ENG3_M,
> > @@ -505,7 +505,7 @@ static int lp5523_load_mux(struct lp55xx_chip *chip=
, u16 mux, int nr)
> >  {
> >  	struct lp55xx_engine *engine =3D &chip->engines[nr - 1];
> >  	int ret;
> > -	u8 mux_page[] =3D {
> > +	static const u8 mux_page[] =3D {
> >  		[LP55XX_ENGINE_1] =3D LP5523_PAGE_MUX1,
> >  		[LP55XX_ENGINE_2] =3D LP5523_PAGE_MUX2,
> >  		[LP55XX_ENGINE_3] =3D LP5523_PAGE_MUX3,
> >=20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllVZ58ACgkQMOfwapXb+vK6TACfcIB/Hs3YSnfGFSx4Wd2r3D5Q
u8cAoMOKFCLEFO3JmSNchNAHyetrI+ny
=Jr4f
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
