From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v12 1/2] leds: core: Introduce LED pattern trigger
Date: Fri, 21 Sep 2018 23:04:40 +0200
Message-ID: <20180921210440.GA18062@amd>
References: <67ebebf02edd6d8ee42a13b139733e9cc680ea86.1536631975.git.baolin.wang@linaro.org>
 <CAMz4kuJx9twJ=wM5qsucV3JH_VS-AC1aWMqpQOwAMkCuKBHLRg@mail.gmail.com>
 <324778a9-a32c-ae6e-337a-39845f214bfc@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <324778a9-a32c-ae6e-337a-39845f214bfc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--/04w6evG8XlLl3ft
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
> >> ---
> >> Changes from v11:
> >>  - Change -1 means repeat indefinitely.
> >>
> >> Changes from v10:
> >>  - Change 'int' to 'u32' for delta_t field.
> >>
> >> Changes from v9:
> >>  - None.
> >>
> >> Changes from v8:
> >>  - None.
> >>
> >> Changes from v7:
> >>  - Move the SC27XX hardware patterns description into its own ABI file.
> >>
> >> Changes from v6:
> >>  - Improve commit message.
> >>  - Optimize the description of the hw_pattern file.
> >>  - Simplify some logics.
> >>
> >> Changes from v5:
> >>  - Add one 'hw_pattern' file for hardware patterns.
> >>
> >> Changes from v4:
> >>  - Change the repeat file to return the originally written number.
> >>  - Improve comments.
> >>  - Fix some build warnings.
> >>
> >> Changes from v3:
> >>  - Reset pattern number to 0 if user provides incorrect pattern string.
> >>  - Support one pattern.
> >>
> >> Changes from v2:
> >>  - Remove hardware_pattern boolen.
> >>  - Chnage the pattern string format.
> >>
> >> Changes from v1:
> >>  - Use ATTRIBUTE_GROUPS() to define attributes.
> >>  - Introduce hardware_pattern flag to determine if software pattern
> >>  or hardware pattern.
> >>  - Re-implement pattern_trig_store_pattern() function.
> >>  - Remove pattern_get() interface.
> >>  - Improve comments.
> >>  - Other small optimization.
> >> ---
> >=20
> > Do you have any comments for the v12 patch set? Thanks.
>=20
> We will probably have to remove hw_pattern from ledtrig-pattern
> since we are unable to come up with generic interface for it.
> Unless thread [0] will end up with some brilliant ideas. So far
> we're waiting for Pavel's reply.

I believe same semantics as pattern works well for hw_pattern, and
suggested code changes to make it more robust. I don't really
understand what issues you see there.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlulXOgACgkQMOfwapXb+vIwxACeOY/GmDdT/ZG/AhTETS7oy+Zz
7JgAnRDsn5vgCJj2Z/pd4tlAv6EmaFjY
=5GPL
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
