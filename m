Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E559366079;
	Thu,  9 Jul 2026 00:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558425; cv=none; b=KvhDTdk4pLyCjbeWEM6ozZqMjTlPlbF4bjNzrGCYcaYIurQB32SqHbqmIOumu5KMM1LpMPO9ip8wIuvnX3b7lisuT+mI9I1MC+PsXV6WFVQdzIbYzPVUUH38neX2bSwW6MeL6a03xe3omCzSUhQpE2NWKqxWvAHw2G/EbAl2+ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558425; c=relaxed/simple;
	bh=pb0AeVCaChgu10x/qYiSzNrq2usAM4fP6PA6h9cmzK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NbxIbXaXqzCVof7w+6Qpm/aj4mWmv55Be816Ven4JBP6G6M+lLzelbYJrqCMIdoit8PfiJot3SY6oknIIHAwG090suh32UF6sGR9GJQY0WI2N/A4uCWahGCBjJVh5J/n9vKQnXaOm1Dq+qmIZ9Gtsc2OO0hKBglL6CE/YKG1gt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wut+s1bT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wut+s1bT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE521F00A3E;
	Thu,  9 Jul 2026 00:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558424;
	bh=bRpI0/MZBmW7oNaKhyKr37Sq0y+OG0eF4EU2Y8paoj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wut+s1bTtgEkLtWe9Vn0XL8p94AK+VhB0jBeTa+UXWY/Wf0g/F242JVLOnkVp9Z5G
	 y2diwjVFIECFwh9MjS/znV9syuA1g78QQxWFLIyax0YAcRbqu78PauWBIijZaDlptn
	 wkRB8MryUQcVw3bzYSMGrBG/oNE1MBlgm4wKpPdp5/WhtS0Q6AdUtBcolIaWrCFOiL
	 9DsXxD2EAipCx8bSpr7RPAJDH6wWZSiBoTo/EM0C+rEqgb5Jnjm3uS+Qj2PX4L+/AX
	 zmz3AZbaxCoDA0TayguTTqudALtPBNk0UDxFBbSU8ubACg9Ep7fJq/AcLfI0Jwbz9P
	 p6QPVzTU2z9bA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edelweise Escala" <edelweise.escala@analog.com>
Cc: linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260709-ltc3220-driver-v13-1-9b53237642eb@analog.com>
References: <20260709-ltc3220-driver-v13-0-9b53237642eb@analog.com>
 <20260709-ltc3220-driver-v13-1-9b53237642eb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 00:53:43 +0000
Message-Id: <20260709005343.DAE521F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Incorrect Property Constraints for `reg` causing ineffective bou=
nds validation
- [Medium] Missing array bounds and value constraints for `led-sources` pro=
perty
- [Medium] Encoding driver software limitations into Device Tree schema for=
 aggregated LEDs
--

--- Patch [1]: [PATCH v13 1/2] dt-bindings: leds: Add LTC3220 18 channel LE=
D Driver ---
commit 4d1504d2ccfbbb8ac2eccd2728a2c5c976fd4d95
Author: Edelweise Escala <edelweise.escala@analog.com>

dt-bindings: leds: Add LTC3220 18 channel LED Driver

This commit adds device tree binding documentation for the Analog Devices
LTC3220 LED driver. The binding specifies properties for independent and
aggregated LED control across its 18 channels.

> diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml b/Do=
cumentation/devicetree/bindings/leds/adi,ltc3220.yaml
> new file mode 100644
> index 0000000000000..48215ad82d9a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml

[ ... ]

> +patternProperties:
> +  '^led@([1-9a-f]|1[0-2])$':
> +    type: object
> +    $ref: /schemas/leds/common.yaml#
> +    unevaluatedProperties: false
> +    properties:

[Severity: Medium]
Should led-sources be explicitly constrained here?

Since it is inherited from common.yaml without local bounds, a device tree
could potentially define an array of more than 18 channels or use
out-of-bounds indices and still pass validation.

> +      reg:
> +        description:
> +          Output channel for the LED (1-18 maps to LED outputs D1-D18).
> +          Unit-address must be in hexadecimal (1-12 hex =3D 1-18 decimal=
).
> +          For aggregated LED control, define only one LED node with reg =
=3D <0x1>
> +          and use led-sources to list all controlled outputs. Only reg 1=
 should
> +          be present when using led-sources.

[Severity: Medium]
Does restricting reg to 1 when led-sources is present encode a software dri=
ver
limitation into the hardware description?

If the hardware allows grouping the 18 channels into multiple discrete
physical LEDs (e.g., LED A on channels 1+2, LED B on channels 3+4), this
schema restriction would prevent valid hardware topologies from being
described.

> +        items:
> +          - minimum: 1
> +            maximum: 18

[Severity: Medium]
Are these minimum and maximum constraints properly evaluated for reg arrays?

By nesting them inside an items array list, the schema applies the numeric
constraints to the array itself, which JSON Schema ignores, silently allowi=
ng
out-of-bounds values. Placing them directly under reg allows dt-schema to
correctly validate the integers.

> +
> +    required:
> +      - reg
> +
> +    if:
> +      required:
> +        - led-sources
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - const: 1

[Severity: Medium]
Does applying const: 1 inside an items list for the reg property fail
unconditionally on arrays?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ltc3220-dr=
iver-v13-0-9b53237642eb@analog.com?part=3D1
