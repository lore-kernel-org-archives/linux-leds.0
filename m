From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: add LED_ON brightness as boolean value
Date: Wed, 4 Jan 2017 23:42:30 +0100
Message-ID: <20170104224230.GA18891@amd>
References: <CGME20170104134122epcas1p48ee63a75c2e159b06d792ec8bc7d4e6d@epcas1p4.samsung.com>
 <20170104134107.24902-1-andi.shyti@samsung.com>
 <b3ac3619-3b80-a9ab-fa0c-b56685291fd6@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:48108 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032539AbdADWmd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Jan 2017 17:42:33 -0500
Content-Disposition: inline
In-Reply-To: <b3ac3619-3b80-a9ab-fa0c-b56685291fd6@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Some devices do not handle the led brightness or simply don't
> > care about it. Conceptually said devices want to just switch on
> > or off the led. It is useless in this case to have a 255 range
> > of brightness, while just having an LED_ON and LED_OFF improves
> > the boolean meaning of the led status.
> >=20
> > Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> > ---
> >  include/linux/leds.h | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > index 569cb531094c..0258f9c49034 100644
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -27,6 +27,7 @@ struct device;
> > =20
> >  enum led_brightness {
> >  	LED_OFF		=3D 0,
> > +	LED_ON,
>=20
> Now lack of explicit value assignment to LED_ON looks weird
> since it is surrounded by other initializer values.
> I'd prefer to have "LED_ON =3D 1," in this line.

Yes, please, good idea.

(Documentation already says on/off leds should use 0/1. Good.)

With "=3D 1" added for consistency,

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlhtelYACgkQMOfwapXb+vJiYACgud6GyMIuF1JSzZEIiCgvBj3a
8IAAnRQjCw0UnnBEZO4aa6BePKOaseVb
=WNSb
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
