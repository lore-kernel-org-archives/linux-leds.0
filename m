From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Sun, 20 Nov 2016 17:21:16 +0100
Message-ID: <20161120162116.GA15737@amd>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <55cdf83d-2233-151f-08e1-11d4619e8fd5@redhat.com>
 <7b8252c4-bb2a-01dd-2404-9b81c192fb6a@gmail.com>
 <201611201605.17631@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201611201605.17631@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >>>> Thanks for the patch.
> > >>>>=20
> > >>>> I think we need less generic trigger name.
> > >>>> With present name we pretend that all kbd-backlight controllers
> > >>>> can change LED brightness autonomously.
> > >>>>=20
> > >>>> How about kbd-backlight-pollable ?
> > >>>=20
> > >>> This is a trigger to control kbd-backlights, in the
> > >>> current use-case the brightness change is already done
> > >>> by the firmware, hence the set_brightness argument to
> > >>> ledtrig_kbd_backlight(), so that we can avoid setting
> > >>> it again.
> > >>>=20
> > >>> But I can see future cases where we do want to have some
> > >>> event (e.g. a wmi hotkey event on a laptop where the firmware
> > >>> does not do the adjustment automatically) which does
> > >>> lead to actually updating the brightness.
> > >>>=20
> > >>> So I decided to go with a generic kbd-backlight trigger,
> > >>> which in the future can also be used to directly control
> > >>> kbd-backlight brightness; and not just to make ot
> > >>> poll-able.
> > >>=20
> > >> I thought that kbd-backlight stands for "keyboard backlight",
> > >=20
> > > It does.
> > >=20
> > >> that's why I assessed it is too generic.
> > >=20
> > > The whole purpose of the trigger as implemented is to be
> > > generic, as it seems senseless to implement a one off
> > > trigger for just the dell / thinkpad case.
> > >=20
> > >> It seems however to be
> > >> the other way round - if kbd-backlight means that this is
> > >> a trigger only for use with dell-laptop keyboard driver
> > >> (I see kbd namespacing prefix in the driver functions) than it is
> > >> not generic at all.
> > >=20
> > > The trigger as implemented is generic, if you think
> > > otherwise, please let me know which part is not generic
> > > according to you.
> >=20
> > I think I was too meticulous here. In the end of the previous
> > message I mentioned that we cannot guarantee that all keyboard
> > backlight controllers can adjust brightness autonomously.
> > Nonetheless, for the ones that cannot do that it would make no sense
> > to have a trigger. In view of that this trigger is generic enough.
> >=20
> > I'll wait for Pavel's opinion before merging the patch set
> > as he was also involved in this whole thread.

If we have a keyboard backlight that may be changed automatically, I'd
go for trigger. If we know for sure that hardware will not change
brightnes "on its own", I'd not put a trigger there (and polling makes
no sense). If we don't know... I guess I'd go for trigger.

We can do various white/blacklists if we really want to..

> As pointed in other email, we do not know if HW really controls keyboard =
backlight,
> so adding "fake" trigger on machines without HW control is not a good ide=
a.

Well, if we know that hardware will not change the brightness on its
own, yes, I'd avoid the trigger. If we don't know (as is common on
ACPI machines, I'd keep the trigger).

Best regards,

     	    	   	      	       	       	  	     	   Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgxzXwACgkQMOfwapXb+vLHXgCgn7D7UN/iEvEv2lTzr6JwLpEm
BRIAnjwXGj4CO4h3Yu4dUCgw5Y9zmngy
=8vI2
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
