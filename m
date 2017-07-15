From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 3/3] DT: leds: Add Qualcomm Light Pulse Generator
 binding
Date: Sat, 15 Jul 2017 11:14:39 +0200
Message-ID: <20170715091439.GC26602@amd>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:42014 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751161AbdGOJOl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 15 Jul 2017 05:14:41 -0400
Content-Disposition: inline
In-Reply-To: <20170714224520.467-4-bjorn.andersson@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This adds the binding document describing the three hardware blocks
> related to the Light Pulse Generator found in a wide range of Qualcomm
> PMICs.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>=20
> Changes since v1:
> - Dropped custom pattern properties
> - Renamed cell-index to qcom,lpg-channel to clarify its purpose
>=20
>  .../devicetree/bindings/leds/leds-qcom-lpg.txt     | 145 +++++++++++++++=
++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.=
txt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/D=
ocumentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> new file mode 100644
> index 000000000000..cc9ffee6586b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> @@ -0,0 +1,145 @@
> +Binding for Qualcomm Light Pulse Generator
> +

Can we use similar format to other files in the directory?

> +The Qualcomm Light Pulse Generator consists of three different hardware =
blocks;
> +a ramp generator with lookup table, the light pulse generator and a three
> +channel current sink. These blocks are found in a wide range of Qualcomm=
 PMICs.
> +Each of these are described individually below.
> +
> +=3D Lookup Table (LUT)
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "qcom,spmi-lpg-lut"

I guess we don't need to know type of the compatible atribute, other
files say

Required properties:

- compatible : Must be "skyworks,aat1290".
- flen-gpios : Must be device tree identifier of the flash device
=2E..

which is easier to understand.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllp3P8ACgkQMOfwapXb+vJpSACfSMx8nE/jnmftXvprgP2Ee+Yd
NU8AoLah4Bkvdmqruqfed+zK4O0twF1L
=rclI
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
