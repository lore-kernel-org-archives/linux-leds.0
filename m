From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6] platform/chrome: Add Wilco EC keyboard backlight LEDs
 support
Date: Tue, 4 Jun 2019 00:13:56 +0200
Message-ID: <20190603221356.GA20392@amd>
References: <20190409001642.249197-1-ncrews@chromium.org>
 <20190409095503.GB32344@atrey.karlin.mff.cuni.cz>
 <66bafd50-1599-db70-99da-e7f5877281c2@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <66bafd50-1599-db70-99da-e7f5877281c2@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Nick Crews <ncrews@chromium.org>, bleung@chromium.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, dlaurie@chromium.org, sjg@google.com, groeck@google.com, dtor@google.com
List-Id: linux-leds@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On 9/4/19 11:55, Pavel Machek wrote:
> >> The EC is in charge of controlling the keyboard backlight on
> >> the Wilco platform. We expose a standard LED class device at
> >> /sys/class/leds/chromeos::kbd_backlight. This driver is modeled
> >=20
> > As discussed, please use platform::.
> >=20
>=20
> Last time I looked at this patch there were some work and discussion ongo=
ing
> about led naming in led ML, did the discussion end? I'm not able to find =
if
> there is a final agreement.

Jacek is working on series to clean up naming, yes.

Under new naming system, it should be
"/sys/class/leds/color:kbd_backlight", AFAICT. That is acceptable to
me.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz1m6QACgkQMOfwapXb+vJ5LwCgpek5SXHzggCsQQ2ueC/e0eSG
2R0An3py0o6dk8ItqDWaq+E99cUrXv68
=AtT6
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
