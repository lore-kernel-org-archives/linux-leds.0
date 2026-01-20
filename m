Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86889350293;
	Tue, 20 Jan 2026 19:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938969; cv=none; b=VylsZ3Qw2WSEyQAliyU32gM1uKbKsNZe1rgpVS7341vyM8zXPYEmZSL4CipnvFfjiEach2AnK2sxAV5B12DgowxDWt7RcdCYrQlcWrIFUNptSxxWyInpTvGX64YLeJN7rVEMcMRxTDybhfwN08X5+Xhjae3lgNUnNNRwoq9vsZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938969; c=relaxed/simple;
	bh=oRP0a3osRmBmz0bppPgFf0JtbYUvuf/0ZaeMJohJHpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWeKtLLNKcqJfsxcKgMSB/Ro9v77RzSLTgf/Jn1UqQh0os/DAHZyweiZScLpjz2Egw3/NfF9j3cgHus9dWXQuXo6tHqyLjiUIra9CXrEgkUCRoHWJeIMNmkdyiT4+HWWDQL6P6Qfuent4wBzSOP9z0spsXLq5k3d9tjL5teDpjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtR1Ow2B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtR1Ow2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2123CC16AAE;
	Tue, 20 Jan 2026 19:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768938966;
	bh=oRP0a3osRmBmz0bppPgFf0JtbYUvuf/0ZaeMJohJHpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MtR1Ow2B2AJeUnKNipZfPq1CiuSYZDB2bdZ22NdO1hGzQJsPkQXvtD/ftz8yIcCV0
	 q+XizZ/pj2r0GI3FaJB4hRMuruTBY4z1uPjQGVuZh92TRtzzpIeoJh3XFPmSUNXuWr
	 jCKcK7PQLs+wYQ9z+zIS+11/OsjmC4wEFh0ZTFVPlEnQKQzkPsLnn5ox8yLHDOui13
	 9ghUDkGZmGOUA8XLgv0a7xF87JZs6Q9FVUA71WYW2GwaSmrIKkHy6+3WaJMOqO6q/e
	 1/XVOtE3X+4n58zhpOb3lo/Gmca+Ezxg1hiewldKCYs2CKYP/hodSlqyQ9qT6Quf7+
	 UBiKyTY6AzYjw==
Date: Tue, 20 Jan 2026 19:56:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Edelweise Escala <edelweise.escala@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Message-ID: <20260120-magenta-emission-2aacd7e1772c@spud>
References: <20260120-ltc3220-driver-v3-0-fef612ec4faa@analog.com>
 <20260120-ltc3220-driver-v3-1-fef612ec4faa@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hsQjSgQnmzY/B+re"
Content-Disposition: inline
In-Reply-To: <20260120-ltc3220-driver-v3-1-fef612ec4faa@analog.com>


--hsQjSgQnmzY/B+re
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 01:35:06PM +0800, Edelweise Escala wrote:
> Document device tree bindings for the LTC3220 18-channel LED driver
> with I2C interface, individual brightness control, and hardware-assisted
> blink/gradation features.
>=20
> Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> ---
>  .../devicetree/bindings/leds/leds-ltc3220.yaml     | 120 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 127 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml b/D=
ocumentation/devicetree/bindings/leds/leds-ltc3220.yaml
> new file mode 100644
> index 000000000000..6274c6c6ad79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml

filename should match the compatible, so s/leds-/adi,/

Otherwise, this looks pretty okay to me. With that changed,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

Cheers,
Conor.

> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-ltc3220.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices LTC3220 LED Driver
> +
> +maintainers:
> +  - Edelweise Escala <edelweise.escala@analog.com>
> +
> +description:
> +  The LTC3220 is a multi-display LED driver, which contains a high-effic=
iency,
> +  low-noise charge pump to provide power to up to 18 LED current sources.
> +  The LEDs are individually configurable to 64-step linear brightness co=
ntrol,
> +  blinking and gradation control via 2-wire I2C interface.
> +
> +  For more product information please see the link below
> +    https://www.analog.com/en/products/ltc3220.html
> +
> +properties:
> +  compatible:
> +    const: adi,ltc3220

--hsQjSgQnmzY/B+re
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW/d0gAKCRB4tDGHoIJi
0gUyAQCWAPo8Dt3NliH1MAzmvp/xpo/IfCW99+trjIoV/TKPMQEAir67IMOAbPO4
kcuJhCTf7Iv4Fp8gZLeuDLflE58JQgg=
=cSCa
-----END PGP SIGNATURE-----

--hsQjSgQnmzY/B+re--
