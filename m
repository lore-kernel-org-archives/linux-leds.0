From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 25 Nov 2016 10:51:56 +0100
Message-ID: <20161125095156.GA4062@amd>
References: <CGME20161120162126epcas3p353e606ebc3d4f0868ff2937ec0e95c14@epcas3p3.samsung.com>
 <20161120162116.GA15737@amd>
 <0c4e7840-064c-5d8a-c5eb-8afe71727fcd@samsung.com>
 <3d623840-34c0-9d93-9eba-92e4198e4fff@redhat.com>
 <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <4fcc36c6-498b-0ce7-a7c8-28c214ccef88@redhat.com>
 <ff098b73-202a-200b-5c84-e96d33199d54@samsung.com>
 <20161122145825.GS13735@pali>
 <6e8c3884-fec1-461a-e9b8-2020176ada93@samsung.com>
 <20161124091525.GG13735@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53003 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753122AbcKYJv7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Nov 2016 04:51:59 -0500
Content-Disposition: inline
In-Reply-To: <20161124091525.GG13735@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2016-11-24 10:15:25, Pali Roh=E1r wrote:
> On Wednesday 23 November 2016 12:01:02 Jacek Anaszewski wrote:
> > I would also appreciate your opinion on the other solution to the
> > problem of notifying brightness changes originating from hardware,
> > i.e. hw_brightness_change{_ro} file, that would support POLLPRI events,
> > and reading brightness.
>=20
> Another idea:
>=20
> If no trigger is active then led subsystem will invoke POLLPRI on
> "brightness" sysfs file.
>=20
> And if there is active trigger then only trigger code could invoke
> POLLPRI on "brightness" file.

That would mess up interface even more. Sorry.

> Do not know if this is really enough for your situation, it is just and
> another idea.

We don't need another ideas at the moment, unless they are better than
proposed solution.

Thanks,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlg4CbwACgkQMOfwapXb+vLCOwCfYZUKp9Bsy9cKEewoCusMCbyC
N4oAn09lOB7ApoFZ9WWzFpaAyxcpELNv
=5/WF
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
