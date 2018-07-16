From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Mon, 16 Jul 2018 23:56:16 +0200
Message-ID: <20180716215616.GB10734@amd>
References: <CAMz4kuJfPKykB6G-8C25mmMCfQgefv-Y=k2OQYZR_e0Tvg3guQ@mail.gmail.com>
 <8da1b769-8aa3-9698-467a-2e7b0707fecf@gmail.com>
 <CAMz4kuKZ6Z1h=yzFYJihEH1ARC5FKtDC6RLz0u8SmaekOZ=utw@mail.gmail.com>
 <20180714212033.GA31950@amd>
 <00fa2693-9308-8d74-0124-04066a76c35a@gmail.com>
 <20180714222924.GA2776@amd>
 <20180714223907.GB2776@amd>
 <1138f834-e805-6076-bb5b-aa1fdc1f2606@gmail.com>
 <2c3a8911-150a-9b25-2a66-a9432047f96b@lechnology.com>
 <68996338-a902-2b57-0bb9-df274a496b06@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <68996338-a902-2b57-0bb9-df274a496b06@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: David Lechner <david@lechnology.com>, Baolin Wang <baolin.wang@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>echo pattern > trigger
> >>>echo "1 2 3 4 5 6 7 8" > somewhere
> >>
> >>s/somewhere/pattern/
> >>
> >>pattern trigger should create "pattern" file similarly how ledtrig-timer
> >>creates delay_{on|off} files.
> >>
> >
> >I don't think this is the best way. For example, if you want more than o=
ne
> >LED to have the same pattern, then the patterns will not be synchronized
> >between the LEDs. The same things happens now with many of the existing
> >triggers. For example, if I have two LEDs side-by-side using the heartbe=
at
> >trigger, they may blink at the same time or they may not, which is not
> >very nice. I think we can make something better.

Yes, synchronization would be nice -- it is really a must for RGB LEDs
-- but I believe it is too much to ask from Baolin at the moment.

> It is virtually impossible to enforce synchronous blinking for the
> LEDs driven by different hardware due to:
>=20
> - different hardware means via which brightness is set (MMIO, I2C, SPI,
>   PWM and other pulsed fashion based protocols),
> - the need for deferring brightness setting to a workqueue task to
>   allow for setting LED brightness from atomic context,
> - contention on locks

I disagree here. Yes, it would be hard to synchronize blinking down to
microseconds, but it would be easy to get synchronization right down
to miliseconds and humans will not be able to tell the difference.

> For the LEDs driven by the same chip it would make more sense
> to allow for synchronization, but it can be achieved on driver
> level, with help of some subsystem level interface to indicate
> which LEDs should be synchronized.
>=20
> However, when we start to pretend that we can synchronize the
> devices, we must answer how accurate we can be. The accuracy
> will decrease as blink frequency rises. We'd need to define
> reliability limit.

We don't need _that_ ammount of overengineering. We just need to
synchronize them well enough :-).

> We've had few attempts of approaching the subject of synchronized
> blinking but none of them proved to be good enough to be merged.

I'm sure interested person could do something like that in less than
two weeks fulltime... It is not rocket science, just a lot of work in
kernel...=20

But patterns are few years overdue and I believe we should not delay
them any further.

So... I guess I agree with Jacek in the end :-).

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltNFIAACgkQMOfwapXb+vK00wCgpHQ4rxBXORCX5Z+HmRWgPeA0
V58An00SukHgMNMoCXrbGD0Gty5Wnf1d
=DW3Y
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
