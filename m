From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v6 3/5] regulator: lm363x: Add support for LM36274
Date: Wed, 5 Jun 2019 19:17:16 +0100
Message-ID: <20190605181716.GU2456@sirena.org.uk>
References: <20190605125634.7042-1-dmurphy@ti.com>
 <20190605125634.7042-4-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7ufiXnXZuEWu9ktD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190605125634.7042-4-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--7ufiXnXZuEWu9ktD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 05, 2019 at 07:56:32AM -0500, Dan Murphy wrote:
> Adding regulator support for the LM36274 backlight driver.
> This device can leverage this existing code as the functionality
> and registers are common enough between the LM36274 and the LM363x
> series of devices.

Acked-by: Mark Brown <broonie@kernel.org>

--7ufiXnXZuEWu9ktD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz4BysACgkQJNaLcl1U
h9DoDgf/V2YC33j5Ud0esBDnPNRS3+xH3Zlc2kDXFTiDgjx06hmzU/n0qd1r9683
6rsudqA2fn5Em4kP85w6xlwQFYJNYBq9D5C0wOm+OMTSy5Q2OuCjutVZNEPILUds
dOGi9PL6v9MtvgpOrB0HaUaABqwHZ2AQMIXCHIpPDQceulf3dohTO03dFjwHHd88
ZUUsnDr3zWlK7lbA86ud5tutOc5mxq/23W47hdu9C4nAXnQkU7iuHLCNTcbjOHhg
mB6ba7BCxUCXKLpN5ZpROEBkcclPpZHN3efh0OKGc8rlkJ9/yORL5rnI5rnDQr+C
Azr2Sw57XsTCbxqsbYSEIhzjQVcCNw==
=TvzC
-----END PGP SIGNATURE-----

--7ufiXnXZuEWu9ktD--
