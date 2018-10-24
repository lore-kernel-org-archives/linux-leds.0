From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v15 1/2] leds: core: Introduce LED pattern trigger
Date: Wed, 24 Oct 2018 10:31:43 +0200
Message-ID: <20181024083143.GA24165@amd>
References: <9794969ab8a5a6f62d8ac54cdebcaa3caedfc6d6.1539230481.git.baolin.wang@linaro.org>
 <d90397dd-429f-4f3f-307c-b69dccc360e0@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d90397dd-429f-4f3f-307c-b69dccc360e0@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +
> > +		The gradual dimming format of the software pattern values should be:
> > +		"brightness_1 duration_1 brightness_2 duration_2 brightness_3
> > +		duration_3 ...". For example:
> > +
> > +		echo 0 1000 255 2000 > pattern
> > +
> > +		It will make the LED go gradually from zero-intensity to max (255)
> > +		intensity in 1000 milliseconds, then back to zero intensity in 2000
> > +		milliseconds:
> > +
> > +		LED brightness
> > +		    ^
> > +		255-|       / \            / \            /
> > +		    |      /    \         /    \         /
> > +		    |     /       \      /       \      /
> > +		    |    /          \   /          \   /
> > +		  0-|   /             \/             \/
> > +		    +---0----1----2----3----4----5----6------------> time (s)
> > +

Ok, so I got around to testing this.

echo "0 1000 10 2550 0 1000 0 100" > pattern

makes expected pattern [  .-xXx-.  ].

But when I do

echo "0 1000 10 2550 0 1000" > pattern

I only get expected pattern on the first iteration, then I get
[    Xx-.   ].

I'm using led-controller:flash on nokia n900 (so everything in
software).

> OK, let's abide by constant update interval for now.
>=20
> Thank you for your work on this patch set throughout
> all these months. We will have -rc8, so one week of testing
> before sending upstream should be enough.
>=20
> Patch set applied to the for-next branch of linux-leds.git.

Thanks!
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvQLe8ACgkQMOfwapXb+vJv3wCcCzjCiv8b5zBW5DE6MWaAQVjS
oxUAn3rZi5MI0deWIzolnVib0O+1VRRC
=4v+J
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
