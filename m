From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCHv2 1/2] mfd: cpcap: Add missing include dependencies
Date: Wed, 22 Mar 2017 10:27:08 +0100
Message-ID: <20170322092708.GA26771@amd>
References: <20170322000912.24210-1-sre@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170322000912.24210-1-sre@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-03-22 01:09:11, Sebastian Reichel wrote:
> This fixes compilation for files, that try to include the
> cpcap header in alphabetically sorted #include lists.
>=20
> Signed-off-by: Sebastian Reichel <sre@kernel.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

> ---
> This patch is new, since PATCHv1 did not order the includes
> in the led driver alphabetically.
> ---
>  include/linux/mfd/motorola-cpcap.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motor=
ola-cpcap.h
> index 7629e0d24d26..b8916953a537 100644
> --- a/include/linux/mfd/motorola-cpcap.h
> +++ b/include/linux/mfd/motorola-cpcap.h
> @@ -14,6 +14,9 @@
>   * published by the Free Software Foundation.
>   */
> =20
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +
>  #define CPCAP_VENDOR_ST		0
>  #define CPCAP_VENDOR_TI		1
> =20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljSQ2wACgkQMOfwapXb+vJCkgCgprxs8cpdjg81H049gmjOKPiA
VV0An0cAIAAvZpE3fet3GpzNpXraWUfV
=L9BX
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
