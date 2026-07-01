Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9D736D51F;
	Wed,  1 Jul 2026 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923126; cv=none; b=Vwb3t3XTp/xWZsoihqru+OYibDYtjfuxQP2YTxhBFgnzsnHSzuWACmDYlyI3z0796BhY5SzRQnQhF6oXJleQyu8kCA/Gzp9JQUWNGaaf2xVYkusKTBhdeiBJA3l9otMq+RjnID7FyQnlErfo4Tq/Piat7pjo1YcmHoqB6zyJu/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923126; c=relaxed/simple;
	bh=4YYewqLtFt58TyVzsStO08cWygUggMFs82tXYW8e3Rw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NvjrwAHa0OAAdGDFyPUgK0URLXW4ZkzY2T/w5Sl6Gh1ROedOD3pkB610oSqznOvNgijlHfSdwzgmHOVtTK4WVPG/BwaL3RzJ14TxZvCwV72Jx49TTQEklHPeacitCsRyz1u+Rd/9uz7d/sOf/w+HSm3qtjRD6ZXIwOkpufN8piA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPk1VUgv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPk1VUgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DF71F000E9;
	Wed,  1 Jul 2026 16:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782923125;
	bh=zX4SSI8vwfcVuCKAap4u8k1BnTa7W7YOjaBRP5duUgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kPk1VUgvkQY9D3orvUJZuzvtMF1rm15uMX5YGXFZvcWTgm6FY65AHkSxrGADPBso4
	 m1Kf+rXPoNjhZME7vtYwCBY0+rHkZ0pZoMObKdmWDnML7sILAGr+XuZ6Lh0J/cdMti
	 VHhDTeMPhjV0CgNbxmIRFryQBB/gRwQdeRcsYWpP2l7+dd5IwLj28JoDeWbTL2sMju
	 /RTnTBA+Ob6ilhf9XsyfZcWKG+9iSKE4905gLzKKEClhhwBaYi239xX4L87OmTvxF6
	 JrYMXBqMIlmC3FdC+1BqnpSsWkr33bY5YrbvAfFmHieSeZn2vxCnop2N2FtmTENSK8
	 yeb+RPdONo5Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260701-monza-leds-v2-1-c1be0b472926@oss.qualcomm.com>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-1-c1be0b472926@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 16:25:24 +0000
Message-Id: <20260701162524.B4DF71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema fails to apply hardware channel limits (`reg` maximum=
s) to the newly added `multi-led` nodes and their nested `led` subnodes.
- [Medium] The nested `led` subnodes inside `multi-led` do not require the =
`color` property in the schema, which is strictly required by the driver.
--

commit 8324e8da2f8fc6d6c98d977c8dcc9ab3eb3a5fcd
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

dt-bindings: leds: nxp,pca963x: add multicolor LED support

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This is necessary to
model hardware setups where multiple PWM channels drive a single physical
RGB LED.

> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Do=
cumentation/devicetree/bindings/leds/nxp,pca963x.yaml
> index 938d0e48fe51b..04b05b8195c18 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml

[ ... ]

> @@ -74,6 +74,39 @@ patternProperties:
>      required:
>        - reg
> =20
> +  "^multi-led@[0-9a-f]+$":
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0

[Severity: Medium]
Does this miss the hardware maximum bounds for the reg property?=20

The existing allOf conditional blocks in this schema apply a maximum limit =
to
the reg property of top-level led nodes based on the compatible string. How=
ever,
those conditionals do not appear to target the new multi-led nodes or their
nested led subnodes, which would allow device trees with out-of-bounds chan=
nels
to silently pass validation.

> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^led@[0-9a-f]+$":
> +        type: object
> +        $ref: common.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            minimum: 0
> +
> +        required:
> +          - reg

[Severity: Medium]
Should color be included in this required list?=20

If the driver unconditionally returns an error when the color property is
missing for nested sub-LEDs, omitting it from the required list here allows
incomplete device trees to pass schema validation but fail later at runtime.

> +
> +    required:
> +      - reg
> +      - "#address-cells"
> +      - "#size-cells"
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-monza-leds=
-v2-0-c1be0b472926@oss.qualcomm.com?part=3D1
