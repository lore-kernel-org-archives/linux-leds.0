From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Thu, 24 Nov 2016 17:51:27 +0100
Message-ID: <201611241751.27696@pali>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com> <20161124153651.GL13735@pali> <dce7fff1-59cf-c155-2154-e6ea6bd7ee03@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5292612.Y34pIOTtxR";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <dce7fff1-59cf-c155-2154-e6ea6bd7ee03@samsung.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

--nextPart5292612.Y34pIOTtxR
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 24 November 2016 17:21:19 Jacek Anaszewski wrote:
> On 11/24/2016 04:36 PM, Pali Roh=C3=A1r wrote:
> > On Thursday 24 November 2016 16:32:06 Jacek Anaszewski wrote:
> >> Since it has been reported that POLLPRI notifications on
> >> brightness file can lead to increased power consumption, and
> >> having my above statement I don't think that it is a good idea to
> >> use brightness file for this.
> >=20
> > How is brightness file different from others that it cannot issue
> > POLLPRI notification?
> >=20
> > I understood that problem is there in case that LED level is
> > changed too many times per second (like by CPU trigger).
> >=20
> > If this is not that problem can you describe real issue, why we
> > cannot use POLLPRI for brightness file?
>=20
> It would be inconsistent not to notify all brightness changes on
> brightness file. We should notify all of them or none.

I understood that we cannot notify about changes done by CPU trigger due=20
to high power usage... Or not?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart5292612.Y34pIOTtxR
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlg3Go8ACgkQi/DJPQPkQ1JALACdHTH3wKPC8I6G6rRFNvZD1OJ4
jWkAn0T08z8rRqqz6leP6DDhvCsX5J14
=DKaE
-----END PGP SIGNATURE-----

--nextPart5292612.Y34pIOTtxR--
