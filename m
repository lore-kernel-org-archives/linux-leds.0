From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 01/26] ALSA: line6: Avoid polluting led_* namespace
Date: Thu, 18 Apr 2019 14:21:35 +0200
Message-ID: <20190418122135.GA6925@amd>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-2-jacek.anaszewski@gmail.com>
 <s5h8sw7riwt.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <s5h8sw7riwt.wl-tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, dtor@google.com, robh@kernel.org, Jaroslav Kysela <perex@perex.cz>, linux@roeck-us.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-04-18 07:17:54, Takashi Iwai wrote:
> On Wed, 17 Apr 2019 22:54:14 +0200,
> Jacek Anaszewski wrote:
> >=20
> > led_colors clashes with the array of the same name being added
> > to the LED class. Do the following amendments to fix this issue
> > and the other prospective one.
> >=20
> > led_colors -> toneport_led_colors
> > led_init_vals -> toneport_led_init_vals
> >=20
> > Fixes: f44edd7b2bbed ("ALSA: line6/toneport: Implement LED controls via=
 LED class")
> > Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Cc: Jaroslav Kysela <perex@perex.cz>
> > Cc: Takashi Iwai <tiwai@suse.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
>=20
> Looks good.
>=20
> Feel free to take my ack:
>   Reviewed-by: Takashi Iwai <tiwai@suse.de>

I guess this is independend of pretty much everything, and should be
taken through the sound tree?
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAly4a88ACgkQMOfwapXb+vLheQCeKn0Mp1aviCrf59LaaIwYOfbu
31sAnju8z8NM2XCi6i9PXH2Mokx/j32v
=3eLM
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
