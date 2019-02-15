From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 5/8] arm64: dts: allwinner: Enable AXP803 CHGLED for
 Olimex boards
Date: Fri, 15 Feb 2019 19:49:16 +0100
Message-ID: <20190215184916.GA17897@amd>
References: <20190215115013.11098-1-stefan@olimex.com>
 <20190215115013.11098-6-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190215115013.11098-6-stefan@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Mavrodiev <stefan@olimex.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-leds@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-02-15 13:50:10, Stefan Mavrodiev wrote:
> Teres-I and A64-OLinuXino commes with populated LED connected
> to AXP803. So to be used as battery indication, pass the LED control
> to the charger itself in mode 0 ( FULL while charging, OFF no battery
> or completed).
>=20
> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 6 ++++++
>  arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts   | 6 ++++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arc=
h/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> index f7a4bccaa5d4..7d6930319fba 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> @@ -177,6 +177,12 @@
> =20
>  #include "axp803.dtsi"
> =20
> +&axp_led {
> +	label =3D "a64-olinuxino:yellow:chgled";

There's little chance userspace will recognize this led.

Can you make it "platform:yellow:charging" and fix it for other
boards, too?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxnCawACgkQMOfwapXb+vLEAwCfUcSllFtWon2qQkW9JcK3hfq4
aMsAoKwCglaZGvwLk+NVMgYjCe18FLZf
=ftHA
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
