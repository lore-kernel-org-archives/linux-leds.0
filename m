From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Sun, 20 Nov 2016 16:05:17 +0100
Message-ID: <201611201605.17631@pali>
References: <20161117222441.31464-1-hdegoede@redhat.com> <55cdf83d-2233-151f-08e1-11d4619e8fd5@redhat.com> <7b8252c4-bb2a-01dd-2404-9b81c192fb6a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart17622104.D2YBm7EWrm";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35088 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752439AbcKTPFU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Nov 2016 10:05:20 -0500
In-Reply-To: <7b8252c4-bb2a-01dd-2404-9b81c192fb6a@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>

--nextPart17622104.D2YBm7EWrm
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 19 November 2016 16:44:09 Jacek Anaszewski wrote:
> Hi,
>=20
> On 11/18/2016 07:47 PM, Hans de Goede wrote:
> > HI,
> >=20
> > On 18-11-16 17:03, Jacek Anaszewski wrote:
> >> Hi,
> >>=20
> >> On 11/18/2016 10:07 AM, Hans de Goede wrote:
> >>> Hi,
> >>>=20
> >>> On 18-11-16 09:55, Jacek Anaszewski wrote:
> >>>> Hi Hans,
> >>>>=20
> >>>> Thanks for the patch.
> >>>>=20
> >>>> I think we need less generic trigger name.
> >>>> With present name we pretend that all kbd-backlight controllers
> >>>> can change LED brightness autonomously.
> >>>>=20
> >>>> How about kbd-backlight-pollable ?
> >>>=20
> >>> This is a trigger to control kbd-backlights, in the
> >>> current use-case the brightness change is already done
> >>> by the firmware, hence the set_brightness argument to
> >>> ledtrig_kbd_backlight(), so that we can avoid setting
> >>> it again.
> >>>=20
> >>> But I can see future cases where we do want to have some
> >>> event (e.g. a wmi hotkey event on a laptop where the firmware
> >>> does not do the adjustment automatically) which does
> >>> lead to actually updating the brightness.
> >>>=20
> >>> So I decided to go with a generic kbd-backlight trigger,
> >>> which in the future can also be used to directly control
> >>> kbd-backlight brightness; and not just to make ot
> >>> poll-able.
> >>=20
> >> I thought that kbd-backlight stands for "keyboard backlight",
> >=20
> > It does.
> >=20
> >> that's why I assessed it is too generic.
> >=20
> > The whole purpose of the trigger as implemented is to be
> > generic, as it seems senseless to implement a one off
> > trigger for just the dell / thinkpad case.
> >=20
> >> It seems however to be
> >> the other way round - if kbd-backlight means that this is
> >> a trigger only for use with dell-laptop keyboard driver
> >> (I see kbd namespacing prefix in the driver functions) than it is
> >> not generic at all.
> >=20
> > The trigger as implemented is generic, if you think
> > otherwise, please let me know which part is not generic
> > according to you.
>=20
> I think I was too meticulous here. In the end of the previous
> message I mentioned that we cannot guarantee that all keyboard
> backlight controllers can adjust brightness autonomously.
> Nonetheless, for the ones that cannot do that it would make no sense
> to have a trigger. In view of that this trigger is generic enough.
>=20
> I'll wait for Pavel's opinion before merging the patch set
> as he was also involved in this whole thread.

Do you mean me? Or Pavel Machek (CCed) who was involved in LEDs for input d=
evices?

As pointed in other email, we do not know if HW really controls keyboard ba=
cklight,
so adding "fake" trigger on machines without HW control is not a good idea.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart17622104.D2YBm7EWrm
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgxu60ACgkQi/DJPQPkQ1J9GACfccFvwvP1Zd0VF9/Lbf4DX5be
FewAnArq0RCHZzT8lb8M3i3FSTAxxBee
=6OGU
-----END PGP SIGNATURE-----

--nextPart17622104.D2YBm7EWrm--
