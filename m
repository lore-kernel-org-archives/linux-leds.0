From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard
	backlight trigger
Date: Fri, 25 Nov 2016 12:05:58 +0100
Message-ID: <20161125110557.GA13204@amd>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
	<201611241751.27696@pali>
	<5238be1f-d669-07e6-c796-5bc0126cb456@gmail.com>
	<CGME20161124214512epcas4p493721bb45b10e1f41a8ea38e01d6e471@epcas4p4.samsung.com>
	<201611242245.00217@pali>
	<afdfe71f-6f39-6f4b-4c92-47142d6267d3@samsung.com>
	<20161125100140.GC4062@amd>
	<e32e3d6c-5d6d-c882-21d9-8028c8311b0b@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7608324091764621321=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <e32e3d6c-5d6d-c882-21d9-8028c8311b0b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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


--===============7608324091764621321==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>In view of the above we could report hw brightness changes with POLLPRI
> >>on brightness file, but unfortunately we can't because it is impossible
> >>to guarantee that readout of brightness file will return the brightness
> >>the POLLPRI was meant to notify about.
> >
> >Agreed here.
> >
> >>That's why a separate read only file seems to be the only proper
> >>solution.
> >
> >Yes please. And lets make self-changing leds into a trigger, as
> >proposed, and as Hans' patch should be already doing.
>=20
> We can set one trigger at a time. In this case it will be impossible
> to have hw brightness change notifications while other trigger is
> active.

And that is a _good_ thing. We don't want to deal with "echo heartbeat
> kbd_backlight_trigger" and then asking for hardware brightness
changes.

Lets keep it simple. Yes, monitoring backlight state while hardware
updates it is useful. But doing the monitor when some kind of blinking
=66rom the kernel is active is just a unneccessary complexity...

> >>Moreover, the file should return the brightness from the time
> >>of last POLLPRI.
> >
> >Not sure I agree here. Normally, kernel returns current state for
> >variables, does not track "old" state.
>=20
> It would report current state. The file called hw_brightness_change
> should report last brightness change originating from hardware.
> The most recent hw brightness change is still current state from
> this perspective. It will be valid until next hw brightness change
> occurs.
>=20
> Current state does not mean current brightness in this case.

Well.. actually... I think this is a little bit over complex and
probably unneccessary. I'd let Hans implement whatever he thinks is
easiest.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlg4GxUACgkQMOfwapXb+vI/BACgisQCx52YD4Yh02eI5rkadrbe
pMAAmgK37R1MY26GSAlLopFmS4oLp6Rj
=V5XL
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--


--===============7608324091764621321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------

--===============7608324091764621321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============7608324091764621321==--
