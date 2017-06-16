From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 7/8] smiapp: Add support for flash, lens and EEPROM
 devices
Date: Fri, 16 Jun 2017 15:10:13 +0200
Message-ID: <20170616131013.GA9383@amd>
References: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
 <1497433639-13101-8-git-send-email-sakari.ailus@linux.intel.com>
 <20170616120712.GA5774@amd>
 <20170616122629.GL15419@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170616122629.GL15419-z7MJbOB4PBP+e+fPlCVrcFDQ4js95KgL@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > These types devices aren't directly related to the sensor, but are
> > > nevertheless handled by the smiapp driver due to the relationship of =
these
> > > component to the main part of the camera module --- the sensor.
> > >=20
> > > Additionally, for the async sub-device registration to work, the noti=
fier
> > > containing matching fwnodes will need to be registered. This is natur=
al to
> > > perform in a sensor driver as well.
> > >=20
> > > This does not yet address providing the user space with information o=
n how
> > > to associate the sensor, lens or EEPROM devices but the kernel now ha=
s the
> > > necessary information to do that.
> >=20
> > Let me see... I guess this is going to be quite interesting for me,
> > too, because I'll be able to remove similar code in omap3 isp driver.
>=20
> Yes, indeed. And with this, we have the lens - sensor association
> information as a bonus.
>=20
> I'll drop EEPROM support in v2, I guess you wouldn't have needed it? I gu=
ess
> we'll need to see examples that can be found in the wild. My current
> understanding is that EEPROM could be a separate chip in the module as we=
ll
> as integrated to the sensor.

I don't think I need EEPROM, no. (But I did not check the datasheets).

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllD2LUACgkQMOfwapXb+vLL8gCgv4o1ZMIvat4VUezoruHnhDkl
i1QAn1dJYWLrmz5bItw6h0HSFBxQlriS
=9Vdi
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
