Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF2F31A057;
	Fri,  3 Jul 2026 04:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783053357; cv=none; b=U/9FB68F65nQ7zdgOgxi/ArkchYv1qgjBfgHuWkUcllMwE9xb49VNEGB2bpgwYkfBUcKZo1STo1vfckq8shuH7+rq4S/J9Txq5Hcjj215ZPVczlw5BdwAPfMXaSvapJebH/jw8fzRzyCiukeRv4F97q0OF+7QA4Fe45sw1bmbao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783053357; c=relaxed/simple;
	bh=BIzZxOMYXBTR6f9cLdfqa88+3XLxMtVfLb3/YAThfAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VNOrRH8yod1dBQibohuw8BhjQzVuUNbT0U3Bvrgj3lcqIvpqqAWyncbp1g6VvqklgxEiqorf1V/fqQ0g0vOsSqA/+yoTFPsPoi0L+OafQezeq8yQ9giKnMDh44Qg9hGiluHZ4wpN7CYBp2t3dOEjTmhV28ypGG9CZglrIytLajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5BMKqsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5BMKqsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926F71F000E9;
	Fri,  3 Jul 2026 04:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783053347;
	bh=oXM+/1zXEVRpV9V3J/vpe1t+0ampSwkpNVsHcS0q4OY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A5BMKqsaZ15+92zpvHn29FT4e46PMldvOtRiha/htCrL097jzC5YzQhV5rMdru8Qn
	 KfWzcqUCUJYdMRjjKGKOElfC69PhbLuV383KrQ7h6J2OabdN/UBH/ikX59ApLqUiAu
	 jV8xn0gKziJ3ac8/kqyMeFWykoaBdODSas83tliQwucmzP5m0tZXkFKR7x7j3NIYxY
	 NUZMdxdWKicY2KT8ZG2H2FNcMu8m36zHWQUVwBx9OkHWIZp0WSsbMoWL/AH3Dkl7JL
	 aSQIcSAlcmrd9BvVX/vw4q0AVpj6zbTL2OEQX7YD+UoGtuy7KC9EVJ8vy8PdNGqEOL
	 jnI89PFd2UX1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edelweise Escala" <edelweise.escala@analog.com>
Cc: lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260703-ltc3220-driver-v12-1-d4f0da2985e2@analog.com>
References: <20260703-ltc3220-driver-v12-0-d4f0da2985e2@analog.com>
 <20260703-ltc3220-driver-v12-1-d4f0da2985e2@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 04:35:46 +0000
Message-Id: <20260703043546.926F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Invalid JSON schema constraints on the `reg` property inside `pa=
tternProperties`.
--

commit 70a03b6b56cf5d4bab2e86c90bde0b112ebfaa81
Author: Edelweise Escala <edelweise.escala@analog.com>

dt-bindings: leds: Add LTC3220 18 channel LED Driver

LTC3220 is a multi-display LED driver with I2C interface.
The LTC3220 provides individual brightness control (64-step),
blinking, and gradation features for up to 18 LED outputs.

> diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml b/Do=
cumentation/devicetree/bindings/leds/adi,ltc3220.yaml
> new file mode 100644
> index 0000000000000..c859490e9108e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml

[ ... ]

> +patternProperties:
> +  '^led@([1-9a-f]|1[0-2])$':
> +    type: object
> +    $ref: /schemas/leds/common.yaml#
> +    unevaluatedProperties: false
> +    properties:
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
> +        minimum: 1
> +        maximum: 18

[Severity: Medium]
Since the reg property is parsed by dt-schema as a uint32-matrix (an array =
of
arrays), do these scalar minimum and maximum constraints actually apply?

JSON Schema silently ignores numeric constraints when applied to an array,
meaning this might not provide the intended validation for the unit-address.

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
> +          const: 1

[Severity: Medium]
Will this const constraint fail validation against the array [[1]] during
make dt_binding_check?

Because dt-schema's automated fixups do not recursively patch constraints
inside if-then conditional blocks, this strict equality check for a scalar
integer might cause false-positive failures for device trees using the
'Aggregated LED' configuration with led-sources and reg =3D <0x1> (including
the example provided at the bottom of this binding).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-ltc3220-dr=
iver-v12-0-d4f0da2985e2@analog.com?part=3D1
