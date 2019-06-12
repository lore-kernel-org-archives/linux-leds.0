From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Wed, 12 Jun 2019 11:54:13 +0200
Message-ID: <20190612095413.GA12656@amd>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
 <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
 <20190611223019.GH137143@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190611223019.GH137143@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Brian Norris <briannorris@google.com>, Daniel Thompson <daniel.thompson@linaro.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, kernel@collabora.com
List-Id: linux-leds@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-06-11 15:30:19, Matthias Kaehlcke wrote:
> On Tue, Jun 11, 2019 at 09:55:30AM -0700, Brian Norris wrote:
> > On Tue, Jun 11, 2019 at 3:49 AM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > > This is a long standing flaw in the backlight interfaces. AFAIK gener=
ic
> > > userspaces end up with a (flawed) heuristic.
> >=20
> > Bingo! Would be nice if we could start to fix this long-standing flaw.
>=20
> Agreed!
>=20
> How could a fix look like, a sysfs attribute? Would a boolean value
> like 'logarithmic_scale' or 'linear_scale' be enough or could more
> granularity be needed?

I'd expect attribute "scale" with values "linear" or "logarithmic".

> The new attribute could be optional (it only exists if explicitly
> specified by the driver) or be set to a default based on a heuristic
> if not specified and be 'fixed' on a case by case basis. The latter
> might violate "don't break userspace" though, so I'm not sure it's a
> good idea.

I'd do it only when we explicitely know. We don't want it to be buggy.

And I guess we should decide what interface we really want? (Linear?
Logarithmic?) And make new drivers do that.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0Ay8UACgkQMOfwapXb+vIeJgCggLbpjHz3nKmV58LAUi3ZiuUa
uScAn2D1iGqQP7z/oj5Jluw9Rq5L6vCE
=G1uG
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
