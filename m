From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Tue, 17 Jul 2018 23:07:00 +0200
Message-ID: <20180717210700.GA9090@amd>
References: <CAMz4kuKZ6Z1h=yzFYJihEH1ARC5FKtDC6RLz0u8SmaekOZ=utw@mail.gmail.com>
 <20180714212033.GA31950@amd>
 <00fa2693-9308-8d74-0124-04066a76c35a@gmail.com>
 <20180714222924.GA2776@amd>
 <20180714223907.GB2776@amd>
 <1138f834-e805-6076-bb5b-aa1fdc1f2606@gmail.com>
 <2c3a8911-150a-9b25-2a66-a9432047f96b@lechnology.com>
 <68996338-a902-2b57-0bb9-df274a496b06@gmail.com>
 <20180716215616.GB10734@amd>
 <8c07a016-d77d-4799-b005-6a9ea94954ce@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8c07a016-d77d-4799-b005-6a9ea94954ce@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: David Lechner <david@lechnology.com>, Baolin Wang <baolin.wang@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>- different hardware means via which brightness is set (MMIO, I2C, SPI,
> >>   PWM and other pulsed fashion based protocols),
> >>- the need for deferring brightness setting to a workqueue task to
> >>   allow for setting LED brightness from atomic context,
> >>- contention on locks
> >
> >I disagree here. Yes, it would be hard to synchronize blinking down to
> >microseconds, but it would be easy to get synchronization right down
> >to miliseconds and humans will not be able to tell the difference.
>=20
> There have been problems with blink interval stability close to
> 1ms, and thus there were some attempts of employing hr timers,
> which in turn introduced a new class of issues related to
> system performance etc.

Yeah, well. This is LED subsystem. Noone should program blink
intervals at 1 msec.

> >>For the LEDs driven by the same chip it would make more sense
> >>to allow for synchronization, but it can be achieved on driver
> >>level, with help of some subsystem level interface to indicate
> >>which LEDs should be synchronized.
> >>
> >>However, when we start to pretend that we can synchronize the
> >>devices, we must answer how accurate we can be. The accuracy
> >>will decrease as blink frequency rises. We'd need to define
> >>reliability limit.
> >
> >We don't need _that_ ammount of overengineering. We just need to
> >synchronize them well enough :-).
>=20
> Well, it would be disappointing for the users to realize that
> they don't get the effect advertised by the ABI documentation.

Linux is always best-effort, w.r.t. timing. And we can do well enough
that user will not see anything bad on "normal" systems.

> >>We've had few attempts of approaching the subject of synchronized
> >>blinking but none of them proved to be good enough to be merged.
> >
> >I'm sure interested person could do something like that in less than
> >two weeks fulltime... It is not rocket science, just a lot of work in
> >kernel...
> >
> >But patterns are few years overdue and I believe we should not delay
> >them any further.
> >
> >So... I guess I agree with Jacek in the end :-).
>=20
> How about taking Baolin's patches as of v5? Later, provided that
> the pattern trigger yet to be implemented will create pattern file
> on activation, we'll need to initialize default-trigger DT property,
> to keep the interface unchanged.

I have yet to look at the v5 of patches. But I agree that we do not
need to design synchronization at this moment.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltOWnQACgkQMOfwapXb+vK+BgCgi8BFHlK77ZlmasnTYuSICrbz
uc8AoMCy1B/YoIs4mGUQwRRpUrFC11SW
=kX9A
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
