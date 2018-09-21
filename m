From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v12 1/2] leds: core: Introduce LED pattern trigger
Date: Fri, 21 Sep 2018 23:17:58 +0200
Message-ID: <20180921211758.GC18062@amd>
References: <67ebebf02edd6d8ee42a13b139733e9cc680ea86.1536631975.git.baolin.wang@linaro.org>
 <CAMz4kuJx9twJ=wM5qsucV3JH_VS-AC1aWMqpQOwAMkCuKBHLRg@mail.gmail.com>
 <324778a9-a32c-ae6e-337a-39845f214bfc@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <324778a9-a32c-ae6e-337a-39845f214bfc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--NU0Ex4SbNnrxsi6C
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

To paint a picture:

brightness

   rise hold          lower       hold down
  ^    XXXXXXXXXXXXXXX
  |   X               XX
  |  X                  XX
  | X                     XXXXXXXXXXXXXXXXXXXXXXXXXX
  +-------------------------------------------------------> time

This is what Baolin's hardware can do, right?

This is also what pattern trigger can do, right?

So all we need to do is match the two interfaces, so that hw_pattern
returns -EINVAL on patterns hardware can not actually do.

I believe I described code to do that in [0] above.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlulYAYACgkQMOfwapXb+vIJRgCffOmvia1hPAQGZz0N+KNpi2lm
yuIAoKxzd78UcCCS+x133y+Fr+jNrBjt
=O2R8
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--
