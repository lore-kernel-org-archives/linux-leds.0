From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 2/4] platform: x86: thinkpad: Call led_notify_brightness_change on kbd brightness change
Date: Fri, 11 Nov 2016 15:12:34 +0100
Message-ID: <201611111512.36115@pali>
References: <20161101133748.7168-1-hdegoede@redhat.com> <20161101133748.7168-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2149669.FC9QfI743l";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34778 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750714AbcKKOMo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Nov 2016 09:12:44 -0500
In-Reply-To: <20161101133748.7168-2-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

--nextPart2149669.FC9QfI743l
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 01 November 2016 14:37:46 Hans de Goede wrote:
> Make thinkpad_acpi call led_notify_brightness_change on the kbd_led
> led_classdev registered by thinkpad_acpi when the kbd backlight
> brightness changes.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> -This is a new patch in v3 of this patch-set
> Changes in v4:
> -No Changes
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c index b65ce75..5dcd7d8b
> 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -162,6 +162,7 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_HOTKEY_BASE		=3D 0x1001, /* first hotkey (FN+F1) */
>  	TP_HKEY_EV_BRGHT_UP		=3D 0x1010, /* Brightness up */
>  	TP_HKEY_EV_BRGHT_DOWN		=3D 0x1011, /* Brightness down */
> +	TP_HKEY_EV_THINKLIGHT		=3D 0x1012, /* Thinklight/kbd backlight */

My question remains. Is this for Thinklight or keyboard backlight?=20
Because Thinklinght has led device "tpacpi_led_thinklight" and keyboard=20
backlight has led device "tpacpi_led_kbdlight".

>  	TP_HKEY_EV_VOL_UP		=3D 0x1015, /* Volume up or unmute */
>  	TP_HKEY_EV_VOL_DOWN		=3D 0x1016, /* Volume down or unmute */
>  	TP_HKEY_EV_VOL_MUTE		=3D 0x1017, /* Mixer output mute */
> @@ -5167,6 +5168,8 @@ static int __init kbdlight_init(struct
> ibm_init_struct *iibm) return rc;
>  	}
>=20
> +	tpacpi_hotkey_driver_mask_set(hotkey_driver_mask |
> +				      TP_ACPI_HKEY_THNKLGHT_MASK);
>  	return 0;
>  }
>=20
> @@ -9114,6 +9117,8 @@ static void tpacpi_driver_event(const unsigned
> int hkey_event) volume_alsa_notify_change();
>  		}
>  	}
> +	if (tp_features.kbdlight && hkey_event =3D=3D TP_HKEY_EV_THINKLIGHT)
> +		led_notify_brightness_change(&tpacpi_led_kbdlight.led_classdev);

This looks incorrect. You are trying to inform tpacpi_led_kbdlight when=20
tpacpi_led_thinklight change led status?

>  }
>=20
>  static void hotkey_driver_event(const unsigned int scancode)

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2149669.FC9QfI743l
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgl0dQACgkQi/DJPQPkQ1IgKwCgyHasa0OZw0OgCDzwXFGyE2t4
gYQAniYL0Av17HJQDuOSUUxIi4Y2iukm
=gDNf
-----END PGP SIGNATURE-----

--nextPart2149669.FC9QfI743l--
