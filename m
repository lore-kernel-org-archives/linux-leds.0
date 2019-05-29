From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Date: Wed, 29 May 2019 16:10:00 +0100
Message-ID: <20190529151000.GP2456@sirena.org.uk>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
 <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
 <20190526124838.GH2456@sirena.org.uk>
 <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MmQIYbZiCoQ2kDro"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--MmQIYbZiCoQ2kDro
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2019 at 06:51:32AM -0500, Dan Murphy wrote:

> Although I don't disagree with you I don't see how the interface is fragi=
le
> with only these 3 regulators defined.

> Would it not be prudent to amend this driver if/when a new regulator is
> needed that has a different enable bit/register combination?=A0=A0 And if=
 that

The fragility I'm worried about is someone forgetting to make suitable
updates, especially if they don't use the feature in their own system.

> was the case I would almost expect a different driver completely if the
> regmap did not line up correctly.=A0 I only reused this driver because the
> registers and bits lined up and did not think it was necessary to create a
> whole new driver.

This is a single register bit which is set once on startup isn't it?  It
seems like exactly the sort of thing that a hardware designer might
change incompatibly, perhaps even for good reasons like adding more
flexibility over which pins can be used to control the enable and far
=66rom something that would require a totally new driver if it was handled
differently.

--MmQIYbZiCoQ2kDro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzuoMMACgkQJNaLcl1U
h9CHOwf/UTUIOVotY6+NILgR0Cw+Y05M6AKN4cKcbuwRRwmm1J5pa51uu354zrST
lHS9DeCOTICl1VOZ4foUZ2puX0m/dClezj0InMSDzh8QYhqPJDpG8l+RBRtG1Uuo
oX+BePc+pB59jJsTM7MJixZ295Z/x5hCOMrlofwAVgN7N8a4ROG4JNki6abmidEA
FX4nfqRQICbLPYrXpMCoVqMwh8Qi0E7pD5YBrRlJ9RnG5VbVVZiKjieRUj5x4edV
aOdFllk8NGf1A6fp5q/DALioeamKiuad6Eyx8CUbxgHo6In8DnfCBKbf23cUZakA
qmg5QUork2WSm5tWHSU11Ami190r+g==
=dJBD
-----END PGP SIGNATURE-----

--MmQIYbZiCoQ2kDro--
