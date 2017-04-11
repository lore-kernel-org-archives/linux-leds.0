From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Tue, 11 Apr 2017 19:54:31 +0200
Message-ID: <20170411175431.GA25483@amd>
References: <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
 <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <20170403190032.GX20094@minitux>
 <dce7f2b1-8d1d-1c5d-5fa5-54c22b6f4758@gmail.com>
 <20170407202603.GC15143@minitux>
 <20170408133904.GA9020@amd>
 <20170410191948.GE15143@minitux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39656 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751824AbdDKRye (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Apr 2017 13:54:34 -0400
Content-Disposition: inline
In-Reply-To: <20170410191948.GE15143@minitux>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > How do we do with patterns that are implementable by the LP5xx but are
> > > not with the LPG? Should we reject those or should we do some sort of
> > > best-effort approach in the kernel?
> >=20
> > Lets say you get series of
> >=20
> > (red, green, blue, delta_t )
> >=20
> > points, meaning "in delta_t msec, change color to red, green,
> > blue. Lets ignore other channels for now. delta_t of 0 would be step
> > change. Would such interface work for you?
>=20
> So I presume this would be input to the RGB trigger that we discussed.
> But in my current device I have 6 LEDs, that are not in any RGB-like
> configuration. So we would need to come up with an interface that looks
> to be the same in both single-LED and RGB-LED setups.

Ok.

> This should be sufficient to describe a subset of the patterns I've seen
> so far in products.
>=20
> But let's consider the standard use case for an RGB LED on an Android
> phone; continuously blinking (pulsing based on patterns) as you have
> some notifications waiting. In this case you want the LED hardware to do
> all the work, so that you can deep-idle the CPU. So we would need to
> introduce a "repeat pattern"-command.

I'd say have additional parameter with number of repetitions. Yes. In
your case you can do 1 and infinity, LP5XX can do 1-255 or infinity.

> Then consider the fact that you want your patterns to have decent
> resolution, but you have a limited amount of storage. So we either have
> to be able to detect palindromes or have a way to represent this.

I'm not sure how common hardware support for palindromes is going to
be. I'd say "detect", but...

> > Simple compiler from this to LP5XX code should not be hard to
> > do.
>=20
> It sounds fairly straight forward to convert a pattern to instructions,
> but we do have an extremely limited amount of storage so it must be a
> quite good implementation for people to be able to use it for anything
> real.
>=20
> We could implement some optimization steps where we try to detect slopes
> and generate ramp-instructions instead of set-pwm + wait instructions,
> use some variables to handle ramp up/down and we could probably generate
> some jump instructions to implement loops.

Actually it is easier than that. Hardware can do slopes itself. If we
see change with non-zero delta_t, we issue slope, otherwise we issue
set_value.

Here's example "compiler": https://gitlab.com/tui/tui/blob/master/ofone/not=
cc.py
Here's example "program": https://gitlab.com/tui/tui/blob/master/ofone/test=
s.notcc/primes.nc

> But do we really want this logic in the kernel, for each LED chip
> supporting patterns?

I'd say so, yes. It should be, dunno, 200? 500? lines of code for
LP5XX?  Sounds acceptable.

Otherwise we'd have to have led-chip-dependend part in userspace. That
would be ok... but we'd _still_ need led-chip-dependend part in the
kernel... and driver spread between kernel and userland is difficult.

The code needs to be created, anyway, so lets put it in kernel.

> > AS3676 ... I'm not sure what to do, AFAICT it is too limited.
> >=20
>=20
> So out of the three examples I've looked at we're skipping one and we're
> abstracting away most functionality from another.

Well. We don't need to _skip_ AS3676, but its pattern engine is
basically useless for anything involving different PWM levels.

And abstracting away most of LP5XX functionality... well, you can
compute prime numbers on that chip (see example above), but you better
should not. And patterns we'll pretty much expose all the functionality.

> I'm sorry for being pessimistic about this, but while I can see the
> theoretical benefit of providing a uniform interface for this to user
> space I see three very different pieces of hardware that would be used
> in three different ways in products.

Three different pieces of hardware, at least two of them used in
phones to provide blinking leds... I'd say common interface is the
right thing to do.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljtGFYACgkQMOfwapXb+vJSywCeJhYyYRUM+sWGkYeuMj5uaN86
c+4AnjvCxlGHSUsMsfjvhG95H4j8GyNg
=yWVe
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
