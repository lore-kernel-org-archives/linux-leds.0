From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Sat, 8 Apr 2017 11:57:59 +0200
Message-ID: <20170408095759.GB17007@amd>
References: <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
 <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <20170403190032.GX20094@minitux>
 <dce7f2b1-8d1d-1c5d-5fa5-54c22b6f4758@gmail.com>
 <20170407202603.GC15143@minitux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34493 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752415AbdDHJ6C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 8 Apr 2017 05:58:02 -0400
Content-Disposition: inline
In-Reply-To: <20170407202603.GC15143@minitux>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > On 04/03/2017 09:00 PM, Bjorn Andersson wrote:
> [..]
> > > For the patterns I don't know how a trigger for this would look like,
> > > how would setting the pattern of a trigger be propagated down to the
> > > hardware?
> >=20
> > We'd need a new op and API similar to blink_set()/led_blink_set().
> >=20
>=20
> I've tried to find different LED circuits with some sort of pattern
> generator in an attempt to figure out how to design this interface, but
> turned out to be quite hard to find examples; the three I can compare
> are:
>=20
> * LP5xx series "implements" pattern generation by executing code.

It supports "linear" and "exponential" transitions between
values. Variable number of steps.

> * Qualcomm LPG iterates over 2-64 brightness-values in a pattern, at a
>   fixed rate with knobs to configure what happens before starting and
>   after finishing iterating over the defined values. It does not support
>   smooth transitions between values.
>=20
> * AS3676 supports a pattern of 32 values controlling if the output
>   should be enabled or disabled for each 32.5ms (or 250ms) time period.
>   The delay before repeating the pattern can be configured. It support
>   smooth transitions between the states.

Ok, that's "really interesting" one. As far as I can see, the pattern
really should only contain justtwo intensities...

> So, while I think I see how you would like to architect this interface I
> am not sure how to figure out the details.
>=20
> The pattern definition would have to be expressive enough to support the
> features of LP5xx and direct enough to support the limited AS3676. It
> would likely have to express transitions, so that the LPG could generate
> intermediate steps (and we will have to adapt the resolution of the
> ramps based on the other LPGs in the system).

That's why I believe it is important to present whole pattern engine
as one unit to the userspace. Userspace should always upload pattern
for _all_ the LEDs at once.

> How do we do with patterns that are implementable by the LP5xx but are
> not with the LPG? Should we reject those or should we do some sort of
> best-effort approach in the kernel?

Up to you, I guess. Both rejecting and best-effort make some sense.

OTOH if pattern is "(off, 0msec), (white, +1000msec), (off,
+0msec)"... you can't really do it "exactly" even on LP5xx, due to
non-trivial conversion between PWM and what user sees....

So on LPG you'd really do "(off, 0msec), (10% white, +100msec), (20%
white, +100msec), ..."

AS3676... I guess after we reject all patterns that have more than 0
and one specific brightness, we can use similar approximation we'd do
on LPG?=20

> > This is what we have now, so we can live with it. Addition of a new
> > RGB trigger would be an improvement of the existing state.
> >=20
>=20
> If we do the brightness compensation (for e.g. white balance
> adjustments) in a trigger then there's added value.
>=20
> The part where I see this affects the LPG driver is that the brightness
> of the patterns might have to be adjusted accordingly - which probably
> would be easier to implement if the kernel just exposed the compensation
> values to user space.

Well, compensation needs to happen "during the transitions",
too.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljotCcACgkQMOfwapXb+vLjDQCglUybKBRnRs7q/FXUYZyyIm7t
eWUAn3cZU8pj+QDITEbM5GNbXnROxPhp
=yBtN
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
