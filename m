Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297FE383C84;
	Thu,  1 Oct 2026 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790836473; cv=none; b=iStoGIcIA2hf93lmMW6PqENCn+jgYuIS11sMBLMy6/B3jq3T3xeU+IiHOHjwJ92PsyB47dX3A68mU88yuOIhE4SZqOOOTj4yi7BxYF6wxhnqe8jzV/KrKU+vpN+u48Ps69VCSmHsA3EpCcvs7z764OfRB/FImRB81LlnG+Am0NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790836473; c=relaxed/simple;
	bh=Xqf0ef1yjlBQ20CpTSX0mlKLpdnuo1pJ/aoRQhHgL/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M864Uds7Fbtsb620zexT565XHsjx/nM/vAspUPCHy5XzAhcIDJbFIVDvJeouWTZ9RFob4LdYf3r6T7SLHrVvXZLVMjq0ms1L1j4sFnZ9Nrxix4VthJvD/NHpI1Oa2u0jO6PACgd5AeE3/TK+5KO6upgNX8Fv0ztFatd3kuxaMto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKuqaIrk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKuqaIrk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F5E1F000FF;
	Thu,  1 Oct 2026 06:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790836472;
	bh=ishbe5yVH7ESxyGdItWFKgeQ767zZHov4+5nBqQ23sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VKuqaIrkEp7GtWwGsx3+vLWbX9Yr8kRZ6Q5PQHEOzVYPOveti3uAo+gnKdx7kvaT8
	 ISR/b1ZvmjcoXG+jOiw+Vvvtg0LciZSDWN2SaehJuiafwbEiybKwiOikuchxYtALMG
	 1lm9fA9OxlGE8bcCmWAdHZXdYjmWUzE4phFseEWfgeDraadU3BD1D0Fz7busTFH1na
	 XocvBeEEet/NnCJxD7JOSwcKRTtw7xP26jsyLcZjLoudDha7SHiCFnBnXhtGAwbGMb
	 Jee/vmhW/mVBoYakVg0QggEOAljjZ88DPOlrqs4ROjXilxclA+XWURM4oT3xsJALjb
	 gPGdZ4TVqngKA==
Date: Thu, 1 Oct 2026 08:34:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rillian Grant <rillian.grant@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ruslan Koreev <koreev.r@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: Document TI LM3643 dual LED
 flash driver
Message-ID: <20261001-humble-gray-aardvark-ae01ce@quoll>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
 <20260928094302.86966-2-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928094302.86966-2-rillian.grant@gmail.com>

On Mon, Sep 28, 2026 at 10:42:34AM +0100, Rillian Grant wrote:
> +properties:
> +  compatible:
> +    enum:
> +      - ti,lm3643
> +
> +  reg:
> +    maxItems: 1
> +

Missing supply, enable-gpios.

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0-1]$":
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description: Index of the LED.
> +        minimum: 0

Drop, that's alerady minimum.

> +        maximum: 1
> +
> +      led-sources:
> +        minItems: 1
> +        maxItems: 2
> +        items:
> +          minimum: 0

As well

> +          maximum: 1
> +
> +      flash-max-microamp:
> +        description: |
> +          Maximum flash current through this LED. Each high-side current source
> +          can provide up to 1.5A. The maximum current the boost can deliver is
> +          1.5A across both sources.
> +
> +          Valid values for an LED connected to one source:
> +            10900 - 1500000, step by 11725 (rounded down)
> +          Valid values for an LED connected to both sources:
> +            21800 - 1500000, step by 23450 (rounded down)
> +
> +        minimum: 10900
> +        maximum: 1500000
> +
> +      led-max-microamp:
> +        description: |
> +          Maximum torch current through this LED. In torch mode each high-side
> +          current source can provide up to 179mA.
> +
> +          Valid values for an LED connected to one source:
> +            977 - 179000, step by 1400 (rounded down)
> +          Valid values for an LED connected to both sources:
> +            1954 - 358000, step by 2800 (rounded down)
> +
> +        minimum: 977
> +        maximum: 358000
> +
> +      flash-max-timeout-us:
> +        description: |

Drop |

> +          The chip supports timeouts from 10ms to 100ms in increments of 10ms
> +          and from 100ms to 400ms in increments of 50ms. The provided value
> +          will be rounded down to a supported value.
> +

Drop blank line

> +        minimum: 10000
> +        maximum: 400000
> +
> +    required:
> +      - reg
> +      - led-sources
> +      - flash-max-microamp
> +      - led-max-microamp
> +      - flash-max-timeout-us
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash-led-controller@63 {

led-controller@63


Best regards,
Krzysztof

