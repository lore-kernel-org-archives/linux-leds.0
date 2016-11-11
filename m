From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 3/4] platform: x86: dell-*: Add a generic dell-laptop notifier chain
Date: Fri, 11 Nov 2016 15:17:07 +0100
Message-ID: <201611111517.08141@pali>
References: <20161101133748.7168-1-hdegoede@redhat.com> <20161101133748.7168-3-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart56886136.kn4yoLc0V3";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36005 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750714AbcKKORL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Nov 2016 09:17:11 -0500
In-Reply-To: <20161101133748.7168-3-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

--nextPart56886136.kn4yoLc0V3
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 01 November 2016 14:37:47 Hans de Goede wrote:
> @@ -43,4 +45,13 @@ void dell_smbios_release_buffer(void);
>  void dell_smbios_send_request(int class, int select);
>=20
>  struct calling_interface_token *dell_smbios_find_token(int tokenid);
> +
> +enum dell_laptop_notifier_actions {
> +	dell_laptop_kbd_backlight_brightness_changed,
> +};

Should not be upper case? Looks like that Documentation/CodingStyle also=20
suggest it:

Names of macros defining constants and labels in enums are capitalized.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart56886136.kn4yoLc0V3
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgl0uQACgkQi/DJPQPkQ1JIBwCdGG1AFieb9YzSuNlQRgjHPl8L
+cIAn30A3Lgcb1kx2VQ5Ou164Khdp2y4
=Bk9M
-----END PGP SIGNATURE-----

--nextPart56886136.kn4yoLc0V3--
