From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/3] leds: upboard: Add LED support
Date: Tue, 23 Oct 2018 20:54:53 +0200
Message-ID: <20181023185453.GA27397@amd>
References: <20180421085009.28773-1-javier@emutex.com>
 <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-3-git-send-email-dan@emutex.com>
 <ede59ef8-7caf-413d-6858-33a1eab5f084@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ede59ef8-7caf-413d-6858-33a1eab5f084@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan O'Donovan <dan@emutex.com>, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +	led->field =3D devm_regmap_field_alloc(dev, regmap, conf);
> > +	if (IS_ERR(led->field))
> > +		return PTR_ERR(led->field);
> > +
> > +	led->cdev.max_brightness =3D 1;
>=20
> s/1/LED_ON/

Actually, I prefer constant 1 here, as it makes it immediately obvious
this supports just 0/1.

Yes, LED_ON is also 1, but I had to grep the header files for
that... (I thought it was 255).

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvPbn0ACgkQMOfwapXb+vKJ0wCgs05bYwEDzqTvqEaSr6m7/qay
y7YAn2yT6+0M45hzqiLsckrjnAXtEXAA
=Q3b8
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
