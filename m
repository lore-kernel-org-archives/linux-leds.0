From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Date: Thu, 30 May 2019 16:26:43 +0100
Message-ID: <20190530152643.GS2456@sirena.org.uk>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
 <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
 <20190526124838.GH2456@sirena.org.uk>
 <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
 <20190529151000.GP2456@sirena.org.uk>
 <afd2e445-09a9-a07f-f020-ede6870dce6e@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l8yJEXo8J9fv7OFY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <afd2e445-09a9-a07f-f020-ede6870dce6e@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--l8yJEXo8J9fv7OFY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2019 at 03:47:08PM -0500, Dan Murphy wrote:
> On 5/29/19 10:10 AM, Mark Brown wrote:
> > On Wed, May 29, 2019 at 06:51:32AM -0500, Dan Murphy wrote:

> > > Although I don't disagree with you I don't see how the interface is f=
ragile
> > > with only these 3 regulators defined.
> > > Would it not be prudent to amend this driver if/when a new regulator =
is
> > > needed that has a different enable bit/register combination?=A0=A0 An=
d if that

> > The fragility I'm worried about is someone forgetting to make suitable
> > updates, especially if they don't use the feature in their own system.

> If they don't define the enable GPIO in the device tree then the gpio
> descriptor pointer is NULL and the register write does not occur.

> The documentation indicates that this is only applicable for 3632 I need =
to
> add the LM36274.

This isn't so much about people's DTs (though that's a definite concern
as well) as it is about support for any future devices in the driver, a
user might see that the driver supports GPIO enables, correctly set up
their device tree and have things fall over because the driver silently
tries to configure the registers incorrectly.

> Currently I don't have a device in this family that requires this level of
> flexibility for this pin or configuration.

> So if a need should arise should we not implement that flexibility at that
> point?

This isn't about implementing support for some theoretical thing, this
is about making the implementation of the current support more robust
and making the driver more maintainable going forwards.

> Not only this but the gpio descriptor is protected in
> lm363x_regulator_of_get_enable_gpio due to checking of the regulator ID.=
=A0 As
> in patch #4 of this series if LM3632 or LM36274 check for enable definiti=
on
> in the DT and create the descriptor if found.=A0 If it is any other regul=
ator
> then don't do anything.

> If the HW designer changes these bits we end up with a new part and then =
at
> that point we could add code to redefine the bit mask as well.

That code is rather far away from the code you're changing and it's
really not clear that this will do the right thing for new devices, it
already appears that we're handling two devices without obvious code for
that (the regulator IDs get reused AFAICT).  If there were a switch
statement right there it'd be clearer.

Part of this is a reviewability thing - I initially stopped on the patch
because it looked like it was using the enable field for something other
than the intended purpose and now there's all this chasing around to see
if the code is OK.

--l8yJEXo8J9fv7OFY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzv9jAACgkQJNaLcl1U
h9Coxwf/eJTeUUiLevK6jVmMW/DPxH+hiCsuGV40/Osbq3h1ZtqjTvKWzZKnxuxU
3G8p1GFNL4Wfwu3eY+qtvgphGUHDvRmCqCQy7hnS7fu/8stbrKh9THxDNxVCHLPO
JG8Ad2THpo2KK9vG2vh/rlUKSpgRL+3omZMaN+bvTIAa4VxOkpe83vyB3Z5UXghj
qVl5E5bUtj/HbA7M9q3aBkNd58uWKzPvNCpTQqPS0JiCsCpYxwnX3YAXxzrgVdDa
5UzL0buh6OUQMS4md18P3ktyM4lCUJ+5bARs0cY40OSoc/6LxjIWjcf0sP36BCCz
56jXejLh8o+ZbcGM5hf3pBRpFVN+Qw==
=ruZM
-----END PGP SIGNATURE-----

--l8yJEXo8J9fv7OFY--
