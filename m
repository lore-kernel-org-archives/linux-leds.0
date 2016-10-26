From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 2/5] platform: x86: thinkpad: Call led_notify_brightness_change on kbd brightness change
Date: Wed, 26 Oct 2016 19:51:03 +0200
Message-ID: <201610261951.03527@pali>
References: <20161026174118.3431-1-hdegoede@redhat.com> <20161026174118.3431-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart21113274.KeL6cJecXN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35749 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753283AbcJZRvG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Oct 2016 13:51:06 -0400
In-Reply-To: <20161026174118.3431-2-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

--nextPart21113274.KeL6cJecXN
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 26 October 2016 19:41:15 Hans de Goede wrote:
> +	TP_HKEY_EV_THINKLIGHT		=3D 0x1012, /* Thinklight/kbd backlight */

Hi! Do you have some documentation for this number? When it is send?=20
When keyboard baklight level is changed or when thinklight is turned=20
on/off? Or in both cases?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart21113274.KeL6cJecXN
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgQ7QcACgkQi/DJPQPkQ1IifgCfebG3LMXtBNYxNAbZt/0lxcAq
Ag4AoJJrd3odcyAjF7PWgXS5tbRuXbQR
=LhS5
-----END PGP SIGNATURE-----

--nextPart21113274.KeL6cJecXN--
