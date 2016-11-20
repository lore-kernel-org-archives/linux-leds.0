From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 1/6] leds: triggers: Add current_brightness trigger parameter
Date: Mon, 21 Nov 2016 00:07:35 +0100
Message-ID: <201611210007.35417@pali>
References: <20161117222441.31464-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart49329947.l02NdNHrBu";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32952 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750728AbcKTXHi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Nov 2016 18:07:38 -0500
In-Reply-To: <20161117222441.31464-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

--nextPart49329947.l02NdNHrBu
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 17 November 2016 23:24:36 Hans de Goede wrote:
> In some cases it may be desirable for userspace to be notified when
> a trigger event happens. This commit adds support for a poll-able
> current_brightness trigger specific sysfs attribute which triggers
> may register:
>=20
> What:		/sys/class/leds/<led>/current_brightness

What about name actual_brightness? That name is already used by=20
/sys/class/backlight/...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart49329947.l02NdNHrBu
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgyLLcACgkQi/DJPQPkQ1LQbwCghsuy3aUA2p5Bd81zP7dScusK
pa8AoI2mJ1AYQW1g1jcaokn5PQMuruYB
=nsrh
-----END PGP SIGNATURE-----

--nextPart49329947.l02NdNHrBu--
