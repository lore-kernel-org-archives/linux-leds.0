From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v4 4/6] regulator: lm363x: Add support for LM36274
Date: Thu, 23 May 2019 14:04:07 +0100
Message-ID: <20190523130407.GB17245@sirena.org.uk>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-5-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522192733.13422-5-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2019 at 02:27:31PM -0500, Dan Murphy wrote:
> Adding regulator support for the LM36274 backlight driver.
> This device can leverage this existing code as the functionality
> and registers are common enough between the LM36274 and the LM363x
> series of devices.

Acked-by: Mark Brown <broonie@kernel.org>

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzmmkYACgkQJNaLcl1U
h9DJZQf/TjFmZ+I430hKts/otevTynVR0fRisQdOLf0dUH4n8JiiTpcFOVI2DSco
HFKZ9hEb+NQZLf84yh4YNLLb+DY0hlq9gkxYSmlOruPUiBLnbNRdF/hBFTc8N8Uj
GGsW63lGjGDufRX+Ld4fk4Cvn0YaYfm0SQOs6a9y8MvYYtq9Qelz7+hy3I0PgNgW
MOyqx7qRxRWkR/OvgdEFBZOP8DjxOlNUHSTMmliOGurAln7hGi4cy9QmmTapR0tS
eAAWhxgvgrL8EkniUWeFcUtpcsbpYzzvZFUk2ypYvdVsxvW8DBQNttWVs5kkF3TN
6XN9hDJDISOlFhSm/LBfhXcJoYfunA==
=rrTw
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
