From: Mark Brown <broonie@kernel.org>
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Date: Wed, 22 May 2019 11:59:58 +0100
Message-ID: <20190522105958.GA8582@sirena.org.uk>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190521211504.GD1580@sirena.org.uk>
 <151079e6-4ae3-3b95-2dc1-c57927b0425f@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <151079e6-4ae3-3b95-2dc1-c57927b0425f@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com
List-Id: linux-leds@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 07:48:18PM -0500, Dan Murphy wrote:
> On 5/21/19 4:15 PM, Mark Brown wrote:
> > On Tue, May 21, 2019 at 10:30:38PM +0200, Jacek Anaszewski wrote:

> >>       regulator: lm363x: Make the gpio register enable flexible
> >>       regulator: lm363x: Add support for LM36274

> > Why have these been applied, I haven't reviewed them?  As far as I can
> > tell they were sent before the merge window so I'd expect a resend at
> > this point...

> You and Liam were cc'd on April 10,2019 for v2 of this patch set.  So I am not sure why the review was missed.

> My apologies for not cc'ing you on v4 but there were no change since that time.

Perhaps I was busy, perhaps I saw that the series had other problems and
needed a rework as it was so I just waited for the resend in case they
had knock on effects on the regulator patches.

> I cannot find v3 of this patchset.

> The initial patches were sent on April 5, 2019

And not CCed to maintainers...  AFAICT I got at most one copy of this
ages ago that needed revisions.

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzlK6sACgkQJNaLcl1U
h9DIxwf/elASizg6DnbC1WJHknM3Px/oCI41SFbyGi9xneuPmdbhCz8Nww6n0jGS
E7nidc60vg2h46WDkL6UWKeoMcYV37TAtb8nQXFvW7gb83q5qiCYgVtXDWhUASv1
Dmtd1FSzIuMuIZ9a3+iB53oyeSIgJvKYDJhkk/uC2yoMspBEdTan+pGjoRcIoe5W
jciG+nb/O+me09wsgY+gGGCAl3wBsm5cS40a9Cxn1Healyo+R4MQg0LV5GYPFaK1
hXO1SSc3F4EN+nP2pTElID7ALNZigiL7eDa6eJXcXhJCU9/1IKQQTPw8Z4/MXYLZ
KF0EsXThXq9Fq/Fil2HkAs67jOrAmw==
=DPu1
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
