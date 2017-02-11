From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v8 0/7] platform/x86: Notify userspace about hotkeys
 changing kbd-backlight brightness
Date: Sat, 11 Feb 2017 21:08:25 +0100
Message-ID: <20170211200825.GA1014@amd>
References: <20170209154417.19040-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40022 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751050AbdBKUI2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 11 Feb 2017 15:08:28 -0500
Content-Disposition: inline
In-Reply-To: <20170209154417.19040-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-02-09 16:44:10, Hans de Goede wrote:
> Hi All,
>=20
> Here is v8 of the platform drivers changes matching / using the new
> v8 LED subsys led_classdev_notify_brightness_hw_changed() functionality
> queued in -next.
>=20
> There have been some changes (and preparation patches added) compared
> to the previous versions since the new LED api requires the driver to
> only call led_classdev_notify_brightness_hw_changed() on hotkey triggered
> changes and the ACPI events indicating brightness changes also get
> triggered when setting the brightness to led_set_brightness (or sysfs).
>=20
> This series depends on the patch adding
> led_classdev_notify_brightness_hw_changed() to the LED subsystem,
> Jacek can you create a stable branch with just that patch which the
> platform/x86 platform maintainers can merge, so that they can apply
> this series ?

Series looks good to me.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlifbzkACgkQMOfwapXb+vKwRwCeN6hpcZZ7uR1dGJXYeEW5+FIA
9DwAn3PJYP1pYf8qdPEykukl0CrGpigi
=9Tnr
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
