From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v12 1/2] leds: core: Introduce LED pattern trigger
Date: Fri, 21 Sep 2018 23:12:21 +0200
Message-ID: <20180921211221.GB18062@amd>
References: <67ebebf02edd6d8ee42a13b139733e9cc680ea86.1536631975.git.baolin.wang@linaro.org>
 <CAMz4kuJx9twJ=wM5qsucV3JH_VS-AC1aWMqpQOwAMkCuKBHLRg@mail.gmail.com>
 <324778a9-a32c-ae6e-337a-39845f214bfc@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <324778a9-a32c-ae6e-337a-39845f214bfc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2018-09-21 22:59:40, Jacek Anaszewski wrote:
> Hi Baolin,
>=20
> On 09/21/2018 05:31 AM, Baolin Wang wrote:
> > Hi Jacek and Pavel,
> >=20
> > On 11 September 2018 at 10:47, Baolin Wang <baolin.wang@linaro.org> wro=
te:
> >> This patch adds one new led trigger that LED device can configure
> >> the software or hardware pattern and trigger it.
> >>
> >> Consumers can write 'pattern' file to enable the software pattern
> >> which alters the brightness for the specified duration with one
> >> software timer.
> >>
> >> Moreover consumers can write 'hw_pattern' file to enable the hardware
> >> pattern for some LED controllers which can autonomously control
> >> brightness over time, according to some preprogrammed hardware
> >> patterns.
> >>
> >> Signed-off-by: Raphael Teysseyre <rteysseyre@gmail.com>
> >> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

> > Do you have any comments for the v12 patch set? Thanks.
>=20
> We will probably have to remove hw_pattern from ledtrig-pattern
> since we are unable to come up with generic interface for it.
> Unless thread [0] will end up with some brilliant ideas. So far
> we're waiting for Pavel's reply.
>=20
> [0] https://lkml.org/lkml/2018/9/13/1216

Patch 1/2 is not controversial; I believe we can apply it now.

2/2: Non-linear or not, can we just ignore that for now? We don't have
well-defined meaning of what brightness 128 means, so... I believe we
can do that reasonably safely.

I don't exactly understand what you are saying with the four tuples.

Yes, sc27xx currently has a limit where it can do single rise, hold,
lower, hold at zero.

That is described by pattern:

"0 rise_duration brightness high_duration brightness fall_duration 0   low_=
duration"

We should add this to sc27xx handler:

> I'd actually like to see this at begining of function:
>     if (pattern[0].brightness !=3D 0)
>         return -EINVAL;
>     if (pattern[2].brightness !=3D 0)
>         return -EINVAL;
>     if (pattern[3].brightness !=3D 0)
>         return -EINVAL;
>     if (pattern[1].brightness !=3D pattern[2].brightness)
>         return -EINVAL;
>=20
> ..so if user writes something unexpected, he gets the error back.

Then it is compatible -- or should be. Pattern trigger should do the
same -- rise, hold, lower, hold at zero.

I don't really see the problem.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlulXrUACgkQMOfwapXb+vJjxwCfShrrN7WuiyD03m4OCK62wOJr
tawAoMTx6qvVG0GNl5/Ei3a78aTJTMuE
=3PAe
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
