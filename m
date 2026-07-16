Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273D3346E44;
	Thu, 16 Jul 2026 21:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784239186; cv=none; b=or47sM+Dr9UWwBFLzRFK9LTuXTAixhqpAmI2EUsPX2LanZjqIsZa+3IgunE3n75cZcOHa45prYGZEQ/d8KQ6IF833C49VHEXLsmGY012ajNbBFJ+zaFtNoVxcTcNQ/HF4HqjH5lYo4jKO1+Nb26mIcNomjbtxfk7QpLm+D9oJRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784239186; c=relaxed/simple;
	bh=Sn3KEh5gZtV4HohruYsJ8KZSmBEFSHM603qjbtgshJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loFlLD4gDrvZdaKy7r5M3RLlbDwAs6kfdB9U33+Foa8QkfDece8VOSbhdKOITrf2SVC52ATWGhiBeK6k1WkoF8uuew8d5uSwAnsvrwdGod7edfQDbyLdAp6oqRJgqXXejq0Prrfn+e7yMtTK7U2vvWGz24FQB3CqGuITPwP1doY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lavuRxVk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lavuRxVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6A31F000E9;
	Thu, 16 Jul 2026 21:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784239184;
	bh=NL8nrXbhMyw0sqSoXscTAfs+iPN6PpWSYafdJERYE0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lavuRxVkFdXZYV3IzAT1QUG6KVhQR3/Ee/vgOAO0uuCdGvVgqs+filTKj2U3N/0+P
	 B6grnvHq/ZGrBpQQ5JdS4u81n88yVBu6pioZYrdlU7CfTabgvwhvmXKRzvFerVoMLw
	 RMz0wwTrmHQYAjYME0vqLUu1le3OVLtXNqosX5YgTiWzt17QAWci+8VEzrGzwlpglR
	 YBUP9DPoc4MCdSa0vQnd7VUS4KgIKW2YVekY75OVTnRpdpAO7GkPqcEeADr/2Uf3hq
	 YDyO9f110075T5ojhsLEdejA/tvJ/fKyXDTVuRpO2+VSo6b+jwwbN/2Tmr1mtBh+1E
	 H0jHxt1goR8oA==
Date: Thu, 16 Jul 2026 16:59:44 -0500
From: Rob Herring <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Daniel Thompson <danielt@kernel.org>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: Re: [PATCH] dt-bindings: leds: backlight: Convert TPS65217 to DT
 schema
Message-ID: <20260716215944.GA1491596-robh@kernel.org>
References: <20260708123317.1768641-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708123317.1768641-1-egbostina@gmail.com>

On Wed, Jul 08, 2026 at 12:33:17PM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments TPS65217 PMIC bindings to DT schema.
> 
> During the conversion, the following updates were made:
> - Make the 'backlight' node optional to resolve dtbs_check warnings.
>   Some boards declare a bare TPS65217 node without implementing the
>   backlight configuration.
> - Document the 'isink-en' property in the backlight subnode to resolve
>   dtbs_check warnings. This property is used (am335x-guardian.dts)
>   to manage the backlight current sinks. It was missing from the old
>   txt binding.
> - 'additionalProperties: true' is at the top level because the
>   TPS65217 node is documented across multiple independent schemas
>   matching the same compatible string.

We can't have true here.

Looks to me like you just need to define all the child nodes like 
'regulators' (and its children)  and 'charger' (which already has a 
schema). 

> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../bindings/leds/backlight/ti,tps65217.yaml  | 82 +++++++++++++++++++
>  .../leds/backlight/tps65217-backlight.txt     | 27 ------
>  2 files changed, 82 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
> new file mode 100644
> index 000000000000..07b15cab4b63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TPS65217 family of regulators
> +
> +maintainers:
> +  - Eduard Bostina <egbostina@gmail.com>
> +
> +description: |

Don't need '|' if no formatting.

> +  The TPS65217 chip contains a boost converter and current sinks which can be
> +  used to drive LEDs for use as backlights.

> +
> +properties:
> +  compatible:
> +    const: ti,tps65217
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C slave address
> +
> +  backlight:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Node for specifying WLED1 and WLED2 lines in TPS65217.
> +
> +    properties:
> +      isel:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [1, 2]
> +        description: |
> +          Selection bit. Valid values:
> +            1 - ISEL1 (low-level)
> +            2 - ISEL2 (high-level)
> +
> +      fdim:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [100, 200, 500, 1000]
> +        description:
> +          PWM dimming frequency in Hz.
> +
> +      default-brightness:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 100
> +
> +      isink-en:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Enable backlight current sinks.

Constraints? 0 or 1?

Not used by any driver, so perhaps it should be removed from the .dts 
file.

Rob
