From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 3/3] platform/chrome: Standardize Chrome OS keyboard
 backlight name
Date: Thu, 4 Apr 2019 20:56:56 +0200
Message-ID: <20190404185656.GA27340@amd>
References: <20190404171007.160878-1-ncrews@chromium.org>
 <20190404171007.160878-3-ncrews@chromium.org>
 <CABXOdTeFnohENJrZ+=_W-EgsrKWttSFYKoR=LaCwzbhEbaOxzw@mail.gmail.com>
 <CAE_wzQ8xS+zvSKNVs1v4B_y3NDu2qB65p_hD+j=qGHFxQWOmSg@mail.gmail.com>
 <CAHX4x87cQLhZOEDxwBJs=UkDxwGxZOELGjHtp6aFLBWmjyQAFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHX4x87cQLhZOEDxwBJs=UkDxwGxZOELGjHtp6aFLBWmjyQAFQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Crews <ncrews@chromium.org>
Cc: Dmitry Torokhov <dtor@google.com>, Guenter Roeck <groeck@google.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>
List-Id: linux-leds@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> You're right, I should have been more precise.
> I was referring to Pavel, Enric, and myself. Pavel had this opinion here:
> https://lkml.org/lkml/2019/4/4/1040. I don't know what Pavel meant by "we"
> in that comment, but I would guess that could mean the other LED maintain=
ers
> as well? I talked with Enric 1:1 and he didn't see the problem with chang=
ing it,
> though perhaps he was only considering our use of the LED via powerd,
> and not users in general. I'm guessing Pavel's and Enric's meanings thoug=
h,
> excuse me if I am misinterpreting.
>=20
> >
> > This also has a potential of breaking existing setups if somebody did
> > happen to match on entire name instead of suffix. Such changes have to
> > be considered very carefully; at this point I am against of doing
> > this.
>=20
> Would it make sense to keep the old name as is, and only make the new
> Wilco name begin with "platform:"? What would you think is best?

That works for me.

I think we might be able to get away with changing the name (we have
some really bad names in the LED subsystem, and it would be nice to
fix them), but my priority at the moment is not to extend the problem.

								Pavel

-*- org -*-

It is somehow important to provide consistent interface to the
userland. LED devices have one problem there, and that is naming of
directories in /sys/class/leds. It would be nice if userland would
just know right "name" for given LED function, but situation got more
complex.

Anyway, if backwards compatibility is not an issue, new code should
use one of the "good" names from this list, and you should extend the
list where applicable.

Bad names are listed, too; in case you are writing application that
wants to use particular feature, you should probe for good name, first,
but then try the bad ones, too.

* Keyboards

Good: "input*:*:capslock"
Good: "input*:*:scrolllock"
Good: "input*:*:numlock"
Bad: "shift-key-light" (Motorola Droid 4, capslock)

Set of common keyboard LEDs, going back to PC AT or so.

Good: "platform::kbd_backlight"
Bad: "tpacpi::thinklight" (IBM/Lenovo Thinkpads)
Bad: "lp5523:kb{1,2,3,4,5,6}" (Nokia N900)

Frontlight/backlight of main keyboard.

Bad: "button-backlight" (Motorola Droid 4)

Some phones have touch buttons below screen; it is different from main
keyboard. And this is their backlight.

* Sound subsystem

Good: "platform:*:mute"
Good: "platform:*:micmute"

LEDs on notebook body, indicating that sound input / output is muted.

* System notification

Good: "status-led:{red,green,blue}" (Motorola Droid 4)
Bad: "lp5523:{r,g,b}" (Nokia N900)

Phones usually have multi-color status LED.

* Power management

Good: "platform:*:charging" (allwinner sun50i)


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlymU3gACgkQMOfwapXb+vIkLQCgh9qnaGmnwyyWKBT53sDXfYRw
0acAoKNM9v7PQbJWEeEG37rjAy9mG3Vn
=lwBd
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
