From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Sat, 8 Apr 2017 15:39:05 +0200
Message-ID: <20170408133904.GA9020@amd>
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
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170407202603.GC15143@minitux>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

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
>=20
> * Qualcomm LPG iterates over 2-64 brightness-values in a pattern, at a
>   fixed rate with knobs to configure what happens before starting and
>   after finishing iterating over the defined values. It does not support
>   smooth transitions between values.
>=20
> * AS3676 supports a pattern of 32 values controlling if the output
>   should be enabled or disabled for each 32.5ms (or 250ms) time period.
>   The delay before repeating the pattern can be configured. It support
>   smooth transitions between the states.
>=20
>=20
> So, while I think I see how you would like to architect this interface I
> am not sure how to figure out the details.
>=20
> The pattern definition would have to be expressive enough to support the
> features of LP5xx and direct enough to support the limited AS3676. It
> would likely have to express transitions, so that the LPG could generate
> intermediate steps (and we will have to adapt the resolution of the
> ramps based on the other LPGs in the system).
>=20
> How do we do with patterns that are implementable by the LP5xx but are
> not with the LPG? Should we reject those or should we do some sort of
> best-effort approach in the kernel?

Lets say you get series of

(red, green, blue, delta_t )

points, meaning "in delta_t msec, change color to red, green,
blue. Lets ignore other channels for now. delta_t of 0 would be step
change. Would such interface work for you?

Simple compiler from this to LP5XX code should not be hard to
do. AS3676 ... I'm not sure what to do, AFAICT it is too limited.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljo5/gACgkQMOfwapXb+vLxwgCeOwfVmQNSl83HtFrRiD5l2Zpy
L9sAmwdcic4hv/Mm9RqXUcQVUS1AmjX+
=yQ0E
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
