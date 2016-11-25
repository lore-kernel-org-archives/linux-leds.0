From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 25 Nov 2016 11:01:41 +0100
Message-ID: <20161125100140.GC4062@amd>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <201611241751.27696@pali>
 <5238be1f-d669-07e6-c796-5bc0126cb456@gmail.com>
 <CGME20161124214512epcas4p493721bb45b10e1f41a8ea38e01d6e471@epcas4p4.samsung.com>
 <201611242245.00217@pali>
 <afdfe71f-6f39-6f4b-4c92-47142d6267d3@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <afdfe71f-6f39-6f4b-4c92-47142d6267d3@samsung.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> In view of the above we could report hw brightness changes with POLLPRI
> on brightness file, but unfortunately we can't because it is impossible
> to guarantee that readout of brightness file will return the brightness
> the POLLPRI was meant to notify about.

Agreed here.

> That's why a separate read only file seems to be the only proper
> solution.

Yes please. And lets make self-changing leds into a trigger, as
proposed, and as Hans' patch should be already doing.

> Moreover, the file should return the brightness from the time
> of last POLLPRI.

Not sure I agree here. Normally, kernel returns current state for
variables, does not track "old" state.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlg4DAQACgkQMOfwapXb+vKbWwCfYJd3P3oeIO7gzuS6aiCko0hV
00oAn1GNcKbMH3Yn1WUSM9fiCcrzZKi7
=JCiR
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
