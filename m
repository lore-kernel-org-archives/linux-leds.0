From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: as3645a flash userland interface
Date: Thu, 14 Sep 2017 13:53:23 +0200
Message-ID: <20170914115323.GA1850@amd>
References: <20170912084236.1154-1-sakari.ailus@linux.intel.com>
 <20170912084236.1154-25-sakari.ailus@linux.intel.com>
 <20170912103628.GB27117@amd>
 <7b679cb3-ce58-e1d1-60bf-995896bf46eb@gmail.com>
 <20170912215529.GA17218@amd>
 <21824758-28a1-7007-6db5-86a900025d14@gmail.com>
 <CGME20170914092415epcas2p26c049a698851778673034c16afb290b9@epcas2p2.samsung.com>
 <4bf12e8e-beff-0199-cdee-4a52ebe7cdaf@samsung.com>
 <20170914100718.GA3843@amd>
 <1f34a891-edb1-251c-86a8-ba4a90c485d3@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1f34a891-edb1-251c-86a8-ba4a90c485d3-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-09-14 13:01:19, Sylwester Nawrocki wrote:
> On 09/14/2017 12:07 PM, Pavel Machek wrote:
> >>Isn't the V4L2 subdev/Media Controller API supposed to provide means
> >>for associating flash LEDs with camera sensors? You seem to be insisting
> >>on using the sysfs leds interface for that, which is not a primary
> >>interface for camera flash AFAICT.
> >
> >a) subdev/media controller API currently does not provide such means.
>=20
> Yes, but it should, that's what it was designed for AFAIK.
>=20
> >b) if we have /sys/class/leds interface to userland, it should be
> >useful.
>=20
> At the same time we shouldn't overcomplicate it with the camera
> functionality.

I'm advocating adding label =3D "main_camera" into the .dts. That's all.

> >c) having flashlight application going through media controller API is
> >a bad joke.
>=20
> It doesn't have to, maybe I misunderstood what you exactly ask for.
> Nevertheless what's missing is some user visible name/label for each
> flash LED, right? Currently enumerating flash LEDs can be done by looking
> at the function part of /sys/class/leds/<led-controller>:<colour>:
> <function> path.
>=20
> Could additional information be appended to the <function> part, so
> user can identify which LED is which? E.g. "flash(rear)", "flash(front)",
> etc. This could be achieved by simply adding label property in DT.
> Or is the list of supported <function> strings already standardized?

label =3D "flash_main_camera" would work for me, yes. And yes, I'd
prefer to do this before 4.14 release, so that userland-visible
interface does not change.

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm6bbMACgkQMOfwapXb+vLs5ACfSHGpLyqkbp6oPuWYh9pfwq6S
9RkAmwabXDg4cqAZMqZP9Si2IOvyxCDb
=yM0y
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
