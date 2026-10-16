Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C92471268;
	Fri, 16 Oct 2026 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168478; cv=none; b=TNx8HLPd7D6GYpjLNu2wcku0+L+e8ELg+SW6/JFuJ1wPd4PxpCtxaGSmedR6K3kXlmBGQje1Yzv7AQ9vny3zLKAbTz/ShllGcmt7ZeI+RvuiD9pqINS9XxHr8t7prK9okciEDv9hl1r0a7VpoFyYuPnEETfhv2B3wEhdx3//PGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168478; c=relaxed/simple;
	bh=n9UXeNGZSq934a6r4agCoS65X4HMJj1z0ZVbuJCqE+g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QI+fiqslmwUi3XlixBCWovAu4SM6E8O9exvWWli12avf6u45qab65Eoc0ZJ8JHOqaQOCs2OXuhir1k3XZGyk37L1rILMX77on2wK+QDDLFBF7L/5c8bD7xwck3xNaCzIrlpnAuGC9P5mJH1t/mtpDD7Gn/RS3B1931sJCz7iHZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMBW9Hil; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMBW9Hil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEFA1F000C4;
	Fri, 16 Oct 2026 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792168476;
	bh=nPZ1tobbugwxIkrvSON12T5qqG/QLDhvrRmZL9DUI0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YMBW9HilrVcOJcifDBGmwtDX/r+jkfEQXICC2b5LH+DU9sC/vG9Xsi+0IIejn5jmC
	 AdlZd6XBF8k3joH/BwD34NHCTFddi46XbIKEFuUd+seeYcjUOdhpBpnhobOK03dnRo
	 nE8+42yeyoJC4JqYTKFiGyD9r+hbaf0Nv7XOES/VnRBj+wv+09UsfWkW6MuJAWiPVV
	 plESLWV2cOnkS4u/3d775LSN5uVp0hTixoptFnJKeA4bMkjAgtRsdsOrTh5297QKhs
	 61K9lqsYbBHxcy0x5MKu3661xI3Vz+l/A8cn/zyZxIc3jDjAmZdZ+5p7DpERpHYAlb
	 y3wSmcdsSvjLQ==
Message-ID: <sashiko-outbox-174646@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99703
 backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luka Panio" <lukapanio@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261016162912.64581-2-lukapanio@gmail.com>
References: <20261016162912.64581-1-lukapanio@gmail.com>
 <20261016162912.64581-2-lukapanio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 16:34:35 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing 'pwms' property for PWM input
- [Low] dt-bindings: missing power supply property
--

commit bdcbdabe3e1453e58fc8f39fabc82b20db81480c
Author: Luka Panio <lukapanio@gmail.com>

dt-bindings: leds: backlight: Add Awinic AW99703 backlight

The Awinic AW99703 is a 3-string WLED driver converter with an
integrated boost converter and 11-bit brightness control over I2C,
optionally combined with a PWM input.

> diff --git a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99=
703.yaml b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.=
yaml
> new file mode 100644
> index 0000000000000..62e8cc3118f2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/awinic,aw99703.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Awinic AW99703 WLED Backlight Driver
> +
> +maintainers:
> +  - Luka Panio <lukapanio@gmail.com>
> +
> +description:
> +  The AW99703 is a 3-string WLED driver with an integrated boost convert=
er
> +  and 11-bit I2C (optionally PWM) brightness control.
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: awinic,aw99703

[Severity: Low]
Is a power supply property needed for the boost converter?

The hardware has an integrated boost converter, which typically requires
a supply such as 'vin-supply' or 'vcc-supply'. Because the schema enforces
'unevaluatedProperties: false', boards with a controllable regulator poweri=
ng
the backlight will fail schema validation if they attempt to define it.

[ ... ]

> +  awinic,inductor-nanohenry:
> +    description: Boost inductor value.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [4700, 10000]
> +    default: 4700
> +
> +  awinic,pwm-input:
> +    description: Combine the PWM input pin with the I2C brightness.
> +    type: boolean

[Severity: Medium]
Should the standard 'pwms' property be defined alongside this property?

The schema defines 'awinic,pwm-input' to indicate the hardware uses a PWM
input pin, but it doesn't define the standard 'pwms' property. Since this
schema uses 'unevaluatedProperties: false', board device trees attempting
to properly link a PWM controller using 'pwms =3D <&pwm ...>;' will fail
schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016162912.6458=
1-1-lukapanio@gmail.com?part=3D1
