From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: ledtrig-activity: use ktime_get_boot_ns()
Date: Mon, 18 Jun 2018 17:55:57 +0200
Message-ID: <20180618155557.GB30470@amd>
References: <20180618144210.72367-1-arnd@arndb.de>
 <20180618150715.GA30470@amd>
 <CAK8P3a1K19WoEGaqrj6Fx0GYyj1jmA50dS+dMJuF7ugkwjCiug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a1K19WoEGaqrj6Fx0GYyj1jmA50dS+dMJuF7ugkwjCiug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, y2038 Mailman List <y2038@lists.linaro.org>, Kees Cook <keescook@chromium.org>, Willy Tarreau <w@1wt.eu>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >> index 5081894082bd..589c1bc4d0b9 100644
> >> --- a/drivers/leds/trigger/ledtrig-activity.c
> >> +++ b/drivers/leds/trigger/ledtrig-activity.c
> >> @@ -37,7 +37,6 @@ static void led_activity_function(struct timer_list =
*t)
> >>       struct activity_data *activity_data =3D from_timer(activity_data=
, t,
> >>                                                        timer);
> >>       struct led_classdev *led_cdev =3D activity_data->led_cdev;
> >> -     struct timespec boot_time;
> >>       unsigned int target;
> >>       unsigned int usage;
> >>       int delay;
> >> @@ -57,7 +56,7 @@ static void led_activity_function(struct timer_list =
*t)
> >>               return;
> >>       }
> >>
> >> -     get_monotonic_boottime(&boot_time);
> >> +     curr_boot =3D ktime_get_boot_ns();
> >>
> >>       cpus =3D 0;
> >>       curr_used =3D 0;
> >> @@ -76,7 +75,6 @@ static void led_activity_function(struct timer_list =
*t)
> >>        * down to 16us, ensuring we won't overflow 32-bit computations =
below
> >>        * even up to 3k CPUs, while keeping divides cheap on smaller sy=
stems.
> >>        */
> >> -     curr_boot =3D timespec_to_ns(&boot_time) * cpus;
> >
> > Original code is pretty weird (notice the * cpus), so I'm
> > double-checking.
>=20
> Ok, dropping the *cpus was not intentional, I'll repost a version that pu=
ts
> it that back. Thanks for pointing this out!

Feel free to add my Acked-by to fixed version.

Thanks,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlsn1g0ACgkQMOfwapXb+vJTrQCdGtD8X0sayoNO2E4g0V054I8Z
o1cAn2HdnNkTpewCAZ/lCC6tYhSUL3Z3
=qFwR
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
