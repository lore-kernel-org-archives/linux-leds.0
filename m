From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/6] leds: triggers: Add current_brightness trigger
 parameter
Date: Mon, 21 Nov 2016 00:48:42 +0100
Message-ID: <20161120234842.GA30717@amd>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <201611210007.35417@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41220 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752607AbcKTXsp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Nov 2016 18:48:45 -0500
Content-Disposition: inline
In-Reply-To: <201611210007.35417@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2016-11-21 00:07:35, Pali Roh=E1r wrote:
> On Thursday 17 November 2016 23:24:36 Hans de Goede wrote:
> > In some cases it may be desirable for userspace to be notified when
> > a trigger event happens. This commit adds support for a poll-able
> > current_brightness trigger specific sysfs attribute which triggers
> > may register:
> >=20
> > What:		/sys/class/leds/<led>/current_brightness
>=20
> What about name actual_brightness? That name is already used by=20
> /sys/class/backlight/...

Is that a problem?
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgyNloACgkQMOfwapXb+vIPQgCgveccdwSBHujbVX7AW/rPgAuS
xd0An32erGieHQXvwQkDjFhXPVJi5zXj
=FoSL
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
