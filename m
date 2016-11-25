From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 25 Nov 2016 13:05:17 +0100
Message-ID: <20161125120517.GA4792@amd>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <20161125100140.GC4062@amd>
 <b159c2e1-dbf7-1ee3-707c-82891c7194db@redhat.com>
 <201611251226.13615@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201611251226.13615@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, gdg@zplane.com, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > As for the modeling how the hotkey controls the LED as a trigger,
> > although I do like this from one pov, I can see Jacek's point that
> > this is confusing as there really is nothing to configure here,
> > where as normally a user could do "echo none > trigger" to break
> > the link. So I think that is best (cleanest /minimal non confusing
> > API) with just the hw_brightness_change sysfs-attribute and not
> > model this as a trigger.
>=20
> I can accept with this solution (no trigger, event on new sysfs file=20
> which returns current/actual brightness state, new sysfs file only for=20
> devices which can report brightness state).
>=20
> But I'm not sure if it is really fixing that original problem with high=
=20
> power usage...

Yes, it is fixing that problem.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlg4KPwACgkQMOfwapXb+vI3uQCgnlAiZfEKol1euoxHj6NLg5Sz
SakAoMJWBPVSTIAm9Zui1+5ADb1a/MJv
=s/Lu
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
