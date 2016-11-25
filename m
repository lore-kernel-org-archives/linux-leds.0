From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 25 Nov 2016 11:07:31 +0100
Message-ID: <20161125100730.GD4062@amd>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <55cdf83d-2233-151f-08e1-11d4619e8fd5@redhat.com>
 <7b8252c4-bb2a-01dd-2404-9b81c192fb6a@gmail.com>
 <CGME20161120150524epcas2p1f634a13bf220f21e7dd95b272b28594c@epcas2p1.samsung.com>
 <201611201605.17631@pali>
 <d6b177fc-313f-6597-4c8c-fc3c6f48778a@samsung.com>
 <2e1ddcc3-489d-bab1-ebb9-dad02db7b37c@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2e1ddcc3-489d-bab1-ebb9-dad02db7b37c@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2016-11-21 10:31:33, Hans de Goede wrote:
> Hi,
>=20
> On 21-11-16 09:35, Jacek Anaszewski wrote:
> >On 11/20/2016 04:05 PM, Pali Roh=E1r wrote:
> >>On Saturday 19 November 2016 16:44:09 Jacek Anaszewski wrote:
> >>>Hi,
> >>>
> >>>On 11/18/2016 07:47 PM, Hans de Goede wrote:
> >>>>HI,
> >>>>
> >>>>On 18-11-16 17:03, Jacek Anaszewski wrote:
> >>>>>Hi,
> >>>>>
> >>>>>On 11/18/2016 10:07 AM, Hans de Goede wrote:
> >>>>>>Hi,
> >>>>>>
> >>>>>>On 18-11-16 09:55, Jacek Anaszewski wrote:
> >>>>>>>Hi Hans,
> >>>>>>>
> >>>>>>>Thanks for the patch.
> >>>>>>>
> >>>>>>>I think we need less generic trigger name.
> >>>>>>>With present name we pretend that all kbd-backlight controllers
> >>>>>>>can change LED brightness autonomously.
> >>>>>>>
> >>>>>>>How about kbd-backlight-pollable ?
> >>>>>>
> >>>>>>This is a trigger to control kbd-backlights, in the
> >>>>>>current use-case the brightness change is already done
> >>>>>>by the firmware, hence the set_brightness argument to
> >>>>>>ledtrig_kbd_backlight(), so that we can avoid setting
> >>>>>>it again.
> >>>>>>
> >>>>>>But I can see future cases where we do want to have some
> >>>>>>event (e.g. a wmi hotkey event on a laptop where the firmware
> >>>>>>does not do the adjustment automatically) which does
> >>>>>>lead to actually updating the brightness.
> >>>>>>
> >>>>>>So I decided to go with a generic kbd-backlight trigger,
> >>>>>>which in the future can also be used to directly control
> >>>>>>kbd-backlight brightness; and not just to make ot
> >>>>>>poll-able.
> >>>>>
> >>>>>I thought that kbd-backlight stands for "keyboard backlight",
> >>>>
> >>>>It does.
> >>>>
> >>>>>that's why I assessed it is too generic.
> >>>>
> >>>>The whole purpose of the trigger as implemented is to be
> >>>>generic, as it seems senseless to implement a one off
> >>>>trigger for just the dell / thinkpad case.
> >>>>
> >>>>>It seems however to be
> >>>>>the other way round - if kbd-backlight means that this is
> >>>>>a trigger only for use with dell-laptop keyboard driver
> >>>>>(I see kbd namespacing prefix in the driver functions) than it is
> >>>>>not generic at all.
> >>>>
> >>>>The trigger as implemented is generic, if you think
> >>>>otherwise, please let me know which part is not generic
> >>>>according to you.
> >>>
> >>>I think I was too meticulous here. In the end of the previous
> >>>message I mentioned that we cannot guarantee that all keyboard
> >>>backlight controllers can adjust brightness autonomously.
> >>>Nonetheless, for the ones that cannot do that it would make no sense
> >>>to have a trigger. In view of that this trigger is generic enough.
> >>>
> >>>I'll wait for Pavel's opinion before merging the patch set
> >>>as he was also involved in this whole thread.
> >>
> >>Do you mean me? Or Pavel Machek (CCed) who was involved in LEDs for inp=
ut devices?
> >
> >I meant Pavel Machek, I haven't known that Pali is an equivalent of
> >Pavel :-)
> >Your opinion is very much appreciated though, thanks.
> >
> >>As pointed in other email, we do not know if HW really controls keyboar=
d backlight,
> >>so adding "fake" trigger on machines without HW control is not a good i=
dea.
> >>
> >
> >Yes, I had also similar doubts, but got almost convinced due to
> >no objections. Now it becomes clear that we need to improve this
> >feature.
>=20
> But we are not adding such a fake trigger. We are only setting up the
> kbd-backlight trigger on systems where there actually is hw-control.
>=20
> Sure someone can do echo "kbd-backlight" > trigger to enable it,
> but the same is true for e.g. "mtd" or "nand-disk" on systems
> without an mtd-device / a nand-disk, and the result is the same,
> the LED gets coupled to the trigger, but nothing ever triggers
> the trigger.

We can do that, yes.

Alternatively, we could do some magic so that kbd-backlight trigger is
not available for other leds, and that _only_ kbd-backlight trigger is
available for leds that are always controlled by the hardware. But we
can do that in future patch...

> I really believe that we have the right design now (I was skeptical
> about the trigger approach at first, but it has turned out really
> well) and unless Pavel Machek has any objections I would really like
> patches 1-2 of this series merged.

I certainly like the interface from thedescription.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlg4DWIACgkQMOfwapXb+vLj0ACffRh74ZbQgxD0cFPOto9ww9UI
3KsAnRlaj0OJvElV/JtABeG0sXtxVigf
=h5G1
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--
