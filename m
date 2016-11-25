From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard
	backlight trigger
Date: Fri, 25 Nov 2016 15:49:00 +0100
Message-ID: <20161125144859.GA20139@amd>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
	<201611241751.27696@pali>
	<5238be1f-d669-07e6-c796-5bc0126cb456@gmail.com>
	<CGME20161124214512epcas4p493721bb45b10e1f41a8ea38e01d6e471@epcas4p4.samsung.com>
	<201611242245.00217@pali>
	<afdfe71f-6f39-6f4b-4c92-47142d6267d3@samsung.com>
	<20161125100140.GC4062@amd>
	<e32e3d6c-5d6d-c882-21d9-8028c8311b0b@samsung.com>
	<20161125110557.GA13204@amd>
	<2367b9a7-68f7-2038-0d3a-a9561055b4f6@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4377553540683919497=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <2367b9a7-68f7-2038-0d3a-a9561055b4f6-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, gdg-EWGI23mR1M3QT0dZR+AlfA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--===============4377553540683919497==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >Lets keep it simple. Yes, monitoring backlight state while hardware
> >updates it is useful. But doing the monitor when some kind of blinking
> >from the kernel is active is just a unneccessary complexity...
>=20
> Triggers are not limited to periodic blinking or reporting cpu
> activity. There is also oneshot trigger that can be used e.g. when
> user touches the screen, as Pali mentioned.

Using oneshot trigger for this would be pretty strange. Notice that in
some cases (thinkpad battery led, for example) we either have firmware
controls the LED (but then software can't control it) or we have
software controlling the LED (but then we don't know what firmware
would put there). Maybe keyboard backlight can be controlled
"simultaneously" by both software and firmware, but there are
certainly LEDs that can't handle that, and IMO it would be nice to
have same interface.

> >Well.. actually... I think this is a little bit over complex and
> >probably unneccessary. I'd let Hans implement whatever he thinks is
> >easiest.
>=20
> I'd say this is the trigger approach which is a bit convoluted.

In my eyes trigger approach is neccessary at least for some hardware,
and things it pretty clear: trigger on =3D=3D LED changes without
userspace involvement. trigger off =3D=3D userspace controls the LED.

So I'd do the trigger here. It is same way we can handle LEDs on
thinkpad. Yes, it means you won't be able to do oneshot trigger on
backlight. I don't think that's a huge problem.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlg4T1sACgkQMOfwapXb+vLrVACff6Ng66auav+y7SoDcPCMa1we
oJYAn2vBmh9rE7oHC1WjQpiEC6V1hiZK
=FaoT
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--


--===============4377553540683919497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------

--===============4377553540683919497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============4377553540683919497==--
