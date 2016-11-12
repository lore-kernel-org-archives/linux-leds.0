From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [ibm-acpi-devel] [PATCH v4 2/4] platform: x86: thinkpad: Call led_notify_brightness_change on kbd brightness change
Date: Sat, 12 Nov 2016 12:52:43 +0100
Message-ID: <201611121252.44443@pali>
References: <20161101133748.7168-1-hdegoede@redhat.com> <f90bd318-9f3f-62e4-be49-e03cae4eac14@redhat.com> <20161111184051.xemayi634xqhkp4c@kevinolos>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3055530.W1npbVJ6jn";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36494 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752845AbcKLLws (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Nov 2016 06:52:48 -0500
In-Reply-To: <20161111184051.xemayi634xqhkp4c@kevinolos>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Kevin Locke <kevin@kevinlocke.name>
Cc: Hans de Goede <hdegoede@redhat.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Richard Purdie <rpurdie@rpsys.net>, Darren Hart <dvhart@infradead.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

--nextPart3055530.W1npbVJ6jn
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 11 November 2016 19:40:51 Kevin Locke wrote:
> On Fri, 2016-11-11 at 15:33 +0100, Hans de Goede wrote:
> > On 11-11-16 15:12, Pali Roh=C3=A1r wrote:
> >> My question remains. Is this for Thinklight or keyboard backlight?
> >> Because Thinklinght has led device "tpacpi_led_thinklight" and
> >> keyboard backlight has led device "tpacpi_led_kbdlight".
> >=20
> > I would say both, this matches with the pre-existing
> > TP_ACPI_HKEY_THNKLGHT_MASK (they have a 1:1 mapping),
> > keep in mind that there are no thinkpads with both
> > a thinklight and a backlit keyboard, as those both
> > serve the same purpose so it looks like the re-used
> > the scancode.
>=20
> That's not entirely correct.  The ThinkPad T430 has both a ThinkLight
> and a keyboard backlight.  Pressing Fn-Space toggles between 4
> states:
>=20
> Both Off -> Backlight Low -> Backlight High -> ThinkLight On (BL Off)
>=20
> I tested out your patch and observed the following behavior (printing
> brightness initially and on POLLPRI):
>=20
> # Initial state with both lights off.
> tpacpi::kbd_backlight/brightness: 0
> tpacpi::thinklight/brightness: 0
> # Press Fn-Space.  KBD Backlight comes on low.
> tpacpi::kbd_backlight/brightness: 1
> # Press Fn-Space.  KBD Backlight brightens to high.
> tpacpi::kbd_backlight/brightness: 2
> # Press Fn-Space.  KBD Backlight turns off.  ThinkLight turns on.
> tpacpi::kbd_backlight/brightness: 0
> # Press Fn-Space.  ThinkLight turns off.
> tpacpi::kbd_backlight/brightness: 0
>=20
> It works, but the behavior is not quite what I would hope for.  There
> are no poll events for tpacpi::thinklight/brightness

Yes, this is what I already pointed... That we should send event also=20
for tpacpi::thinklight.

> and when the
> ThinkLight turns off it triggers an unnecessary
> tpacpi::kbd_backlight/brightness poll event.

It is problem? Or are forced to send event only if brightness level is=20
really changed? I think that bigger problem is when brightness changes,=20
but we do not send event.

Should not be event treated as "hey, brightness level was probably=20
changed, read file to get current status"?

> If there is anything else I can do to assist, let me know.

Great, this is really useful to see somebody who can test patches on=20
those machines with both Thinklight and keyboard backlight...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3055530.W1npbVJ6jn
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgnAowACgkQi/DJPQPkQ1KkhwCfQ99J8AhuclxXvXSySuNacPTV
yVsAoIvWkyaOcQosf3UcmtAHlauynCme
=7Jou
-----END PGP SIGNATURE-----

--nextPart3055530.W1npbVJ6jn--
