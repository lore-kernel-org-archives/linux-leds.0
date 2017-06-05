From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH V2 1/2] leds: leds-qti-rgb: Add LED driver for QTI
 TRI_LED module
Date: Mon, 5 Jun 2017 23:16:09 +0200
Message-ID: <20170605211609.GA9035@amd>
References: <20170601072723.12760-1-fenglinw@codeaurora.org>
 <8058ed85-5a64-8dc3-99ea-1ad8128e043d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8058ed85-5a64-8dc3-99ea-1ad8128e043d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, subbaram-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, aghayal-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, wruan-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, kgunda-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Generally I came to a conclusion that it will be best to register
> additional LED RGB class device in an addition to three LED class
> devices representing each color. In order to avoid hard to solve
> locking problems I propose to allow for simultaneous access to LED
> class devices and LED RGB class device gathering them.
>=20
> All in all, currently we also don't give an exclusive access to
> a particular LED class device, which always can lead to overwriting
> current brightness by another process. These issues must be arbitrated
> by user space.
>=20
> I propose that LED RGB class device exposed following files:
>=20
> - red_brightness
> - green_brightness
> - blue_brightness
> - latch_color

Actually, I'd just do single file, "rgb_brightness" with 3
values. Overhead of writing 3 values is pretty much 0.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlk1yhkACgkQMOfwapXb+vIAwACgjhajnN742qdDzvMP2Pq4zDbZ
i6YAn2sKMgy6i+eD1ReaFXeJK3+5p3mt
=l7qr
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
