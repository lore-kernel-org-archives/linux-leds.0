From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v3 2/3] leds: as3645a: Add LED flash class driver
Date: Mon, 28 Aug 2017 13:04:51 +0200
Message-ID: <20170828110451.GB492@amd>
References: <20170823081100.11733-1-sakari.ailus@linux.intel.com>
 <20170823081100.11733-3-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170823081100.11733-3-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-08-23 11:10:59, Sakari Ailus wrote:
> Add a LED flash class driver for the as3654a flash controller. A V4L2 fla=
sh
> driver for it already exists (drivers/media/i2c/as3645a.c), and this driv=
er
> is based on that.

We do not want to have two drivers for same hardware... how is that
supposed to work?

Yes, we might want to have both LED and v4l2 interface for a single
LED, because v4l2 is just too hairy to use, but we should not
duplicate drivers for that.

We _might_ want to do some helpers; as these LED drivers are all quite
similar, it should be possible to have "flash led driver" and just
link it to v4l2 and LED interfaces...

								Pavel
							=09

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmj+NMACgkQMOfwapXb+vIsTQCfeJ2mbl5kw0F1KRV06I5qdava
V0gAniQ/ty/wRVriN2CtcwCkzJZu04KT
=b6lL
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
