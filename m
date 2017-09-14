From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: as3645a flash userland interface
Date: Thu, 14 Sep 2017 12:07:18 +0200
Message-ID: <20170914100718.GA3843@amd>
References: <20170912084236.1154-1-sakari.ailus@linux.intel.com>
 <20170912084236.1154-25-sakari.ailus@linux.intel.com>
 <20170912103628.GB27117@amd>
 <7b679cb3-ce58-e1d1-60bf-995896bf46eb@gmail.com>
 <20170912215529.GA17218@amd>
 <21824758-28a1-7007-6db5-86a900025d14@gmail.com>
 <CGME20170914092415epcas2p26c049a698851778673034c16afb290b9@epcas2p2.samsung.com>
 <4bf12e8e-beff-0199-cdee-4a52ebe7cdaf@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4bf12e8e-beff-0199-cdee-4a52ebe7cdaf-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>>What directory are the flash controls in?
> >>>>
> >>>>/sys/class/leds/led-controller:flash ?
> >>>>
> >>>>Could we arrange for something less generic, like
> >>>>
> >>>>/sys/class/leds/main-camera:flash ?
> >>>
> >>>I'd rather avoid overcomplicating this. LED class device name pattern
> >>>is well defined to devicename:colour:function
> >>>(see Documentation/leds/leds-class.txt, "LED Device Naming" section).
> >>>
> >>>In this case "flash" in place of the "function" segment makes the
> >>>things clear enough I suppose.
> >>
> >>It does not.
> >>
> >>Phones usually have two cameras, front and back, and these days both
> >>cameras have their flash.
> >>
> >>And poor userspace flashlight application can not know if as3645
> >>drivers front LED or back LED. Thus, I'd set devicename to
> >>front-camera or main-camera -- because that's what it is associated
> >>with. Userspace does not care what hardware drives the LED, but needs
> >>to know if it is front or back camera.
> >
> >The name of a LED flash class device isn't fixed and is derived
> >from DT label property. Name in the example of some DT bindings
> >will not force people to apply similar pattern for the other
> >drivers and even for the related one. No worry about having
> >to keep anything forever basing on that.
>=20
> Isn't the V4L2 subdev/Media Controller API supposed to provide means
> for associating flash LEDs with camera sensors? You seem to be insisting
> on using the sysfs leds interface for that, which is not a primary
> interface for camera flash AFAICT.

a) subdev/media controller API currently does not provide such means.

b) if we have /sys/class/leds interface to userland, it should be
useful.

c) having flashlight application going through media controller API is
a bad joke.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm6VNYACgkQMOfwapXb+vIu4wCfcERX0wrdAVt5HeogfBdgba5W
SnIAnReSCKgIbWpDTsfX3/BRFNgx6t/C
=MD5V
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
