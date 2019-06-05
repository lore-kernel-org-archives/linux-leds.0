From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 1/6] regulator: lm363x: Make the gpio register enable
 flexible
Date: Wed, 5 Jun 2019 11:01:32 +0100
Message-ID: <20190605100132.GL2456@sirena.org.uk>
References: <20190604174345.14841-1-dmurphy@ti.com>
 <20190604174345.14841-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LkBseQZEL/3d2JPd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190604174345.14841-2-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--LkBseQZEL/3d2JPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 12:43:40PM -0500, Dan Murphy wrote:
> The use of and enablement of the GPIO can be used across devices.
> Use the enable_reg in the regulator descriptor for the register to
> write.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> ---
>=20
> v5 - No changes to the patch changes requested in this patch were done in
> patch 4 of this series - https://lore.kernel.org/patchwork/patch/1077408/

I was expecting this patch to just be completely dropped?  It looks like
the end result is very similar, we're still using enable_reg to get the
register and I don't see new validation added in patch 4.

--LkBseQZEL/3d2JPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz3kvsACgkQJNaLcl1U
h9CL4Af/eIXNOUQrDHol0TbFPD7MMFgStTriNhd5Fn+14zkke4yvtU6mzKz4ZNeh
3kKeUTQRvj9/xVuKjKsFmLteeTCj1hPJ7/oa7M5uo+zFuQWMWnkNulYXSv01yue1
61zxfIJgaHEbVlI31m0pqLAQTb5opriEJ7eWpH6Iw4aYbiWO3spi0lYrQFf0BXLR
PT6L9eDXJXE+MrXc2HrzxOXAKtB91oveq2G8WdqXp9svmP2NimUvTMUHo1HPIpUB
g7t2i9qT2k8+5WXZ/g03DN9IxVgNy29RuAYdyEpMD4vOYmbtJiaxQMknD0TQp7Kf
Gx3UQmwBAtBfKwQOUMK+mTMQn0O8yQ==
=A/Jg
-----END PGP SIGNATURE-----

--LkBseQZEL/3d2JPd--
