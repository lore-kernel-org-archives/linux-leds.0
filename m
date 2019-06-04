From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Date: Tue, 4 Jun 2019 16:33:07 +0100
Message-ID: <20190604153307.GG2456@sirena.org.uk>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
 <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
 <20190526124838.GH2456@sirena.org.uk>
 <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
 <20190529151000.GP2456@sirena.org.uk>
 <afd2e445-09a9-a07f-f020-ede6870dce6e@ti.com>
 <20190530152643.GS2456@sirena.org.uk>
 <f9ad6600-3060-65c5-6f87-8a167c75f8b0@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oSWi0jal9INzEBQ4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f9ad6600-3060-65c5-6f87-8a167c75f8b0@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--oSWi0jal9INzEBQ4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 10:14:42AM -0500, Dan Murphy wrote:

> I am going to introduce this update in patch 4 of this series when the
> LM36274 is introduced to the regulator driver.

> It makes more sense to add it there as in patch 1 there is not really a n=
eed
> to extend the value or mask as it only supports the LM3632 device.=A0 It =
makes
> sense to add the condition when adding another device to support

Sure, add it along with the rest of the support for the new device.

--oSWi0jal9INzEBQ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz2jzIACgkQJNaLcl1U
h9BepAf+LfzMTtI0Fzd0fRSTevF4dwL9HwaAjcw3MnuMeqfJOtp4p9UJn98FfEKo
TN5y7zHRbObnaEZHniSsoyLj1SFw6SmVPcj4QjFezETEEugYpPu3LHSK2NT96a90
oZqa1rrD43ned4XfwMdNzhupU1mD2233V/J43B37eoLfovfxeqoVlRWOWZGRR+5M
o89QlDLRAVwQwjyxkvl+BO84joYEKkZEpjdUIZ0qhkFjwjo4ZnxvEO2V7pa0Y6EZ
lPHN1+8BQ4BdIF2aihTu8MC4EyqjQ/UslkWqBw0Pwbl1TJMiWmxY1Ito8AjRzBed
DDlHyaKNeV4B+d4gUugodeJxw2eu7w==
=z7wn
-----END PGP SIGNATURE-----

--oSWi0jal9INzEBQ4--
