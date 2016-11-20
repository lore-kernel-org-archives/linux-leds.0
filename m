From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard
	backlight trigger
Date: Sun, 20 Nov 2016 20:45:49 +0100
Message-ID: <201611202045.50048@pali>
References: <20161117222441.31464-1-hdegoede@redhat.com>
	<20161120162116.GA15737@amd>
	<acd1691b-56be-c902-feff-7ecf38ea102a@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2724269659929980200=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <acd1691b-56be-c902-feff-7ecf38ea102a-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

--===============2724269659929980200==
Content-Type: multipart/signed; boundary="nextPart2960607.WFKbCDr2Mv";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2960607.WFKbCDr2Mv
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 20 November 2016 19:48:02 Hans de Goede wrote:
> HI,
>=20
> On 20-11-16 17:21, Pavel Machek wrote:
> > Hi!
> >=20
> >>>>>>> Thanks for the patch.
> >>>>>>>=20
> >>>>>>> I think we need less generic trigger name.
> >>>>>>> With present name we pretend that all kbd-backlight
> >>>>>>> controllers can change LED brightness autonomously.
> >>>>>>>=20
> >>>>>>> How about kbd-backlight-pollable ?
> >>>>>>=20
> >>>>>> This is a trigger to control kbd-backlights, in the
> >>>>>> current use-case the brightness change is already done
> >>>>>> by the firmware, hence the set_brightness argument to
> >>>>>> ledtrig_kbd_backlight(), so that we can avoid setting
> >>>>>> it again.
> >>>>>>=20
> >>>>>> But I can see future cases where we do want to have some
> >>>>>> event (e.g. a wmi hotkey event on a laptop where the firmware
> >>>>>> does not do the adjustment automatically) which does
> >>>>>> lead to actually updating the brightness.
> >>>>>>=20
> >>>>>> So I decided to go with a generic kbd-backlight trigger,
> >>>>>> which in the future can also be used to directly control
> >>>>>> kbd-backlight brightness; and not just to make ot
> >>>>>> poll-able.
> >>>>>=20
> >>>>> I thought that kbd-backlight stands for "keyboard backlight",
> >>>>=20
> >>>> It does.
> >>>>=20
> >>>>> that's why I assessed it is too generic.
> >>>>=20
> >>>> The whole purpose of the trigger as implemented is to be
> >>>> generic, as it seems senseless to implement a one off
> >>>> trigger for just the dell / thinkpad case.
> >>>>=20
> >>>>> It seems however to be
> >>>>> the other way round - if kbd-backlight means that this is
> >>>>> a trigger only for use with dell-laptop keyboard driver
> >>>>> (I see kbd namespacing prefix in the driver functions) than it
> >>>>> is not generic at all.
> >>>>=20
> >>>> The trigger as implemented is generic, if you think
> >>>> otherwise, please let me know which part is not generic
> >>>> according to you.
> >>>=20
> >>> I think I was too meticulous here. In the end of the previous
> >>> message I mentioned that we cannot guarantee that all keyboard
> >>> backlight controllers can adjust brightness autonomously.
> >>> Nonetheless, for the ones that cannot do that it would make no
> >>> sense to have a trigger. In view of that this trigger is generic
> >>> enough.
> >>>=20
> >>> I'll wait for Pavel's opinion before merging the patch set
> >>> as he was also involved in this whole thread.
> >=20
> > If we have a keyboard backlight that may be changed automatically,
> > I'd go for trigger. If we know for sure that hardware will not
> > change brightnes "on its own", I'd not put a trigger there (and
> > polling makes no sense). If we don't know... I guess I'd go for
> > trigger.
> >=20
> > We can do various white/blacklists if we really want to..
> >=20
> >> As pointed in other email, we do not know if HW really controls
> >> keyboard backlight, so adding "fake" trigger on machines without
> >> HW control is not a good idea.
> >=20
> > Well, if we know that hardware will not change the brightness on
> > its own, yes, I'd avoid the trigger. If we don't know (as is
> > common on ACPI machines, I'd keep the trigger).
>=20
> Right, this is taken care of by the default_trigger field of the
> led_classdev, we only set the "kbd-backlight" default_trigger on
> (kbd-backlight) LED devices where we know we have a hotkey directly
> controlling the brightness.
>=20
> Regards,
>=20
> Hans

Hm... now I'm thinking... should not be there a generic readonly led=20
trigger named "managed by hw" (or similar name)? Only LED drivers (not=20
userspace) could set it and when set it tells that hw could on its own=20
change level of LED. Not keyboard backlight specific, but generic for=20
led subsystem.

It not this what is needed for keyboard backlight LED drivers?

=2D-=20
Pali Roh=C3=A1r
pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--nextPart2960607.WFKbCDr2Mv
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgx/W4ACgkQi/DJPQPkQ1LPggCgn3jnjuQRXthI1/dXtuWe/xXh
xUQAoJ5lqf6kV6Y3NOWoNmLfNeIJPmb+
=BBaz
-----END PGP SIGNATURE-----

--nextPart2960607.WFKbCDr2Mv--


--===============2724269659929980200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------

--===============2724269659929980200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============2724269659929980200==--
