From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 2/4] platform: x86: thinkpad: Call led_notify_brightness_change on kbd brightness change
Date: Fri, 11 Nov 2016 15:46:22 +0100
Message-ID: <201611111546.23658@pali>
References: <20161101133748.7168-1-hdegoede@redhat.com> <201611111512.36115@pali> <f90bd318-9f3f-62e4-be49-e03cae4eac14@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2074731.8L6CvcCThU";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32985 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753356AbcKKOq1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Nov 2016 09:46:27 -0500
In-Reply-To: <f90bd318-9f3f-62e4-be49-e03cae4eac14@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

--nextPart2074731.8L6CvcCThU
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 11 November 2016 15:33:48 Hans de Goede wrote:
> Hi,
>=20
> On 11-11-16 15:12, Pali Roh=C3=A1r wrote:
> > On Tuesday 01 November 2016 14:37:46 Hans de Goede wrote:
> >> Make thinkpad_acpi call led_notify_brightness_change on the
> >> kbd_led led_classdev registered by thinkpad_acpi when the kbd
> >> backlight brightness changes.
> >>=20
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >> Changes in v3:
> >> -This is a new patch in v3 of this patch-set
> >> Changes in v4:
> >> -No Changes
> >> ---
> >>=20
> >>  drivers/platform/x86/thinkpad_acpi.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>=20
> >> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> >> b/drivers/platform/x86/thinkpad_acpi.c index b65ce75..5dcd7d8b
> >> 100644
> >> --- a/drivers/platform/x86/thinkpad_acpi.c
> >> +++ b/drivers/platform/x86/thinkpad_acpi.c
> >> @@ -162,6 +162,7 @@ enum tpacpi_hkey_event_t {
> >>=20
> >>  	TP_HKEY_EV_HOTKEY_BASE		=3D 0x1001, /* first hotkey (FN+F1) */
> >>  	TP_HKEY_EV_BRGHT_UP		=3D 0x1010, /* Brightness up */
> >>  	TP_HKEY_EV_BRGHT_DOWN		=3D 0x1011, /* Brightness down */
> >>=20
> >> +	TP_HKEY_EV_THINKLIGHT		=3D 0x1012, /* Thinklight/kbd backlight=20
*/
> >=20
> > My question remains. Is this for Thinklight or keyboard backlight?
> > Because Thinklinght has led device "tpacpi_led_thinklight" and
> > keyboard backlight has led device "tpacpi_led_kbdlight".
>=20
> I would say both, this matches with the pre-existing
> TP_ACPI_HKEY_THNKLGHT_MASK (they have a 1:1 mapping),
> keep in mind that there are no thinkpads with both
> a thinklight and a backlit keyboard

That is not truth. X230 is in variant with both Thinklight (light above=20
display) and keyboard backlight. Plus in BIOS it is possible to=20
configure if you want to enable only Thinkligh, only keyboard backlight=20
or both. Probably T430 and other 30s models can be found with both. But=20
I do not own those modules...

> as those both
> serve the same purpose so it looks like the re-used
> the scancode.

So I could guess that it reports event when one of those leds are=20
changed...

> I've tried this code on both a W541 and a P50 and both
> emit TP_ACPI_HOTKEYSCAN_FNPAGEUP for the backlight
> keyboard hotkey (fn + space), I'm naming the event for
> this TP_HKEY_EV_THINKLIGHT for consistency with the
> existing TP_ACPI_HKEY_THNKLGHT_MASK which corresponds
> to TP_ACPI_HOTKEYSCAN_FNPAGEUP.
>=20
> >>  	TP_HKEY_EV_VOL_UP		=3D 0x1015, /* Volume up or unmute */
> >>  	TP_HKEY_EV_VOL_DOWN		=3D 0x1016, /* Volume down or unmute */
> >>  	TP_HKEY_EV_VOL_MUTE		=3D 0x1017, /* Mixer output mute */
> >>=20
> >> @@ -5167,6 +5168,8 @@ static int __init kbdlight_init(struct
> >> ibm_init_struct *iibm) return rc;
> >>=20
> >>  	}
> >>=20
> >> +	tpacpi_hotkey_driver_mask_set(hotkey_driver_mask |
> >> +				      TP_ACPI_HKEY_THNKLGHT_MASK);
> >>=20
> >>  	return 0;
> >> =20
> >>  }
> >>=20
> >> @@ -9114,6 +9117,8 @@ static void tpacpi_driver_event(const
> >> unsigned int hkey_event) volume_alsa_notify_change();
> >>=20
> >>  		}
> >>  =09
> >>  	}
> >>=20
> >> +	if (tp_features.kbdlight && hkey_event =3D=3D TP_HKEY_EV_THINKLIGHT)
> >> +=09
> >> led_notify_brightness_change(&tpacpi_led_kbdlight.led_classdev)
> >> ;
> >=20
> > This looks incorrect. You are trying to inform tpacpi_led_kbdlight
> > when tpacpi_led_thinklight change led status?
>=20
> No as said the scancode / event is shared, notice the check for
> tp_features.kbdlight, so the notify will only happen on laptops which
> actually have a backlit keyboard.

If that event is send when either Thinklight or keyb-backlight is=20
changed, should not we inform both led devices about level change? Do=20
you have a chance to test it on notebook with Thinklight?

And funny question is what would happen on those machines which have=20
both Thinklight and keyboard backlight?

Anyway, I would suggest different name, not TP_HKEY_EV_THINKLIGHT as it=20
is not thinklight-only and could be misleading in keyboard backlight=20
context...

> Regards,
>=20
> Hans
>=20
> >>  }
> >> =20
> >>  static void hotkey_driver_event(const unsigned int scancode)

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2074731.8L6CvcCThU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgl2b8ACgkQi/DJPQPkQ1K77ACfaq+M+mR6BxoCVdpVlPdq1HQQ
ZTsAn3Db7/nfNKGf/CYJscj0udszVvSE
=5SJe
-----END PGP SIGNATURE-----

--nextPart2074731.8L6CvcCThU--
