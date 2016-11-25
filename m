From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 25 Nov 2016 10:56:49 +0100
Message-ID: <20161125095649.GB4062@amd>
References: <4fcc36c6-498b-0ce7-a7c8-28c214ccef88@redhat.com>
 <ff098b73-202a-200b-5c84-e96d33199d54@samsung.com>
 <20161122145825.GS13735@pali>
 <6e8c3884-fec1-461a-e9b8-2020176ada93@samsung.com>
 <20161124091525.GG13735@pali>
 <ba7108be-82c7-2d87-c884-7284aaee80a3@samsung.com>
 <CGME20161124142652epcas3p4b06f36d2295b8857830faf66395887b3@epcas3p4.samsung.com>
 <20161124142647.GJ13735@pali>
 <50225a88-b928-c61b-bf6f-6c85fb6a9082@samsung.com>
 <20161124153651.GL13735@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53201 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751350AbcKYJ4w (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Nov 2016 04:56:52 -0500
Content-Disposition: inline
In-Reply-To: <20161124153651.GL13735@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2016-11-24 16:36:51, Pali Roh=E1r wrote:
> On Thursday 24 November 2016 16:32:06 Jacek Anaszewski wrote:
> > Since it has been reported that POLLPRI notifications on brightness
> > file can lead to increased power consumption, and having my above
> > statement I don't think that it is a good idea to use brightness
> > file for this.
>=20
> How is brightness file different from others that it cannot issue
> POLLPRI notification?

Reading "brightness" may or may not give you current brightness of the
led, depending on hardware limitations -- and you can't know. (It may
give you maximum brightness of trigger)

Reading "hw_current_brightness" file (if present) will give you
current brightness. In addition, it is pollable.
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlg4CuEACgkQMOfwapXb+vJJjwCbBLjLEfUDomM8heOHckqEc0jN
fnwAoKu3t86XD6aEHliTIeLDeYKL4riG
=DXO2
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
