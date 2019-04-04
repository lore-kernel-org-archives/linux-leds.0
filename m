From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 3/3] platform/chrome: Standardize Chrome OS keyboard
 backlight name
Date: Thu, 4 Apr 2019 20:59:19 +0200
Message-ID: <20190404185919.GB27340@amd>
References: <20190404171007.160878-1-ncrews@chromium.org>
 <20190404171007.160878-3-ncrews@chromium.org>
 <CABXOdTeFnohENJrZ+=_W-EgsrKWttSFYKoR=LaCwzbhEbaOxzw@mail.gmail.com>
 <CAE_wzQ8xS+zvSKNVs1v4B_y3NDu2qB65p_hD+j=qGHFxQWOmSg@mail.gmail.com>
 <CAHX4x87cQLhZOEDxwBJs=UkDxwGxZOELGjHtp6aFLBWmjyQAFQ@mail.gmail.com>
 <CAE_wzQ8k4vO4yLsr2WNxYQ=-6JDmTsj6OxD0f3P=k8kJYFOD9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE_wzQ8k4vO4yLsr2WNxYQ=-6JDmTsj6OxD0f3P=k8kJYFOD9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dtor@google.com>
Cc: Nick Crews <ncrews@chromium.org>, Guenter Roeck <groeck@google.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>
List-Id: linux-leds@vger.kernel.org


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-04-04 11:55:27, Dmitry Torokhov wrote:
> On Thu, Apr 4, 2019 at 11:41 AM Nick Crews <ncrews@chromium.org> wrote:
> >
> > On Thu, Apr 4, 2019 at 11:43 AM Dmitry Torokhov <dtor@google.com> wrote:
> > >
> > > On Thu, Apr 4, 2019 at 10:36 AM Guenter Roeck <groeck@google.com> wro=
te:
> > > >
> > > > On Thu, Apr 4, 2019 at 10:11 AM Nick Crews <ncrews@chromium.org> wr=
ote:
> > > > >
> > > > > We want all backlights for the system keyboard to
> > > > > use a common name, so the name "platform::kbd_backlight"
> > > > > would be better than the current "chromeos::kbd_backlight"
> > > > > name. Normally this wouldn't be worth changing, but the new
> > > > > Wilco keyboard backlight driver uses the "platform" name.
> > > > > We want to make it so all Chrome OS devices are consistent,
> > > > > so we'll change the name here too.
> > > > >
> > > >
> > > > Wondering - who is the "we" you are talking about ?
> >
> > You're right, I should have been more precise.
> > I was referring to Pavel, Enric, and myself. Pavel had this opinion her=
e:
> > https://lkml.org/lkml/2019/4/4/1040. I don't know what Pavel meant by "=
we"
> > in that comment, but I would guess that could mean the other LED mainta=
iners
> > as well? I talked with Enric 1:1 and he didn't see the problem with cha=
nging it,
> > though perhaps he was only considering our use of the LED via powerd,
> > and not users in general. I'm guessing Pavel's and Enric's meanings tho=
ugh,
> > excuse me if I am misinterpreting.
> >
> > >
> > > This also has a potential of breaking existing setups if somebody did
> > > happen to match on entire name instead of suffix. Such changes have to
> > > be considered very carefully; at this point I am against of doing
> > > this.
> >
> > Would it make sense to keep the old name as is, and only make the new
> > Wilco name begin with "platform:"? What would you think is best?
>=20
> Given that we do not have a single instance of platform::kbd_backlight
> in kernel at this time I have no idea why Pavel is trying to push this
> for Wilco driver.

See the documentation in the email I sent few seconds ago. I hope it
explains my reasoning, if not, I'll explain it.

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlymVAcACgkQMOfwapXb+vKuIgCfQ4vAKLf3CJRwuVbZyvRR1gjE
/FEAoIV1bUD24tCqtjsj6OhV3dG0cvrF
=SDUB
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
