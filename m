Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64A63CF213;
	Wed,  9 Sep 2026 07:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937618; cv=none; b=kpKX+mxIq3q+l/XAzwB6WZjE3Dl0AiV5fiU4DUi31zG8cJhU+P6QBp7YnBLLdxeECW5Z/Kx7osHKDRfIXMsCnPhRCRT6vnNm4G5vNAuwGLigSHhs48vLQfb27/1NgYUu2sJzQM6M+nrC88SJDHHXoo6Ek3DoCSFLKQH1dHQscco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937618; c=relaxed/simple;
	bh=3PQ8SaiJX8EFZMmmevORSA+SS1ZbeIwl3qMoj3+SWFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGbZaXo7MyOAs6Npq//1zMTnOaxMVkRnxwdSsFG4W4Y1K+BiJSdW7GLcm6xekHlEAQ8MdvxFgURNTdtJ3siGgsjPjAyUl/aR7ljpN9HSomXbmbwOPPMloN7xIF6zma6pXq20+Q+TortCTVR9Z3i4skXo+Lla3z5AAU3YfF3Di9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9aAcCjZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9aAcCjZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098381F00A3A;
	Wed,  9 Sep 2026 07:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788937617;
	bh=u4NkRglqy3b34NHGDOaJvbAMf5KMklgzL1oPwYJHodw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j9aAcCjZgwgoQiCi2fvHTWv9wArVczORNOr96zKuGa7T+d/j0+dN7IIIlilIXfOKg
	 LwVh6NEzMvL+ZymU98w014h+i5xOZtEizD+mcJJ3xfIbtQcKeHIpvR1gJi4tLPO8zY
	 REg3c7XbkQT2OJKj9TvIJR2OYsAXitib7u0LuSj2M6XOd8vIt/DyLXddHgY5kA1Vn6
	 JZNFSi1gDLX223kP6pB+iOZbehopBjMPqX/P96uAv9atZcbqKP8Mly1aUlCNlKdyaN
	 0KkNcE3EA/r7iAPskDnWm4+AXwDBxn5rGOKScUXy9S+DcC+Z9IU8zc1tufysv1N5nJ
	 y6mkwhlFUCJGA==
Date: Wed, 9 Sep 2026 09:06:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT
 schema
Message-ID: <20260909-arcane-yellow-beluga-5ce6f7@quoll>
References: <20260901170358.176103-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901170358.176103-1-challauday369@gmail.com>

On Tue, Sep 01, 2026 at 10:33:58PM +0530, Udaya Kiran Challa wrote:
> Convert lacie,netxbig-leds devicetree binding from legacy
> text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v2:
> - Add reference to led common.yaml
> - Drop type for all common properties
> 
> Link to v2:https://lore.kernel.org/all/20260821123723.198286-1-challauday369@gmail.com/
> 
> Changes since v1:
> - Use pattenProperties for LED child nodes instead of additionalProperties
> - Explicitly list the two optional properties supported by the binding
> - Place the top-level required block after child-node definition
> 
> Link to v1:https://lore.kernel.org/all/20260820150223.108374-1-challauday369@gmail.com/
> ---
>  .../bindings/leds/lacie,netxbig-leds.yaml     | 139 ++++++++++++++++++
>  .../devicetree/bindings/leds/leds-netxbig.txt |  92 ------------
>  2 files changed, 139 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
> new file mode 100644
> index 000000000000..5cb2eaf74d1a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/lacie,netxbig-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LaCie/Seagate netxbig CPLD LEDs
> +
> +maintainers:
> +  - Simon Guinot <simon.guinot@sequanux.org>
> +
> +description: |
> +  Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seagate
> +  boards (Example: 2Big/5Big Network v2, 2Big NAS).
> +
> +properties:
> +  compatible:
> +    const: lacie,netxbig-leds
> +
> +  gpio-ext:
> +    description: Phandle for the gpio-ext bus.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  timers:
> +    description: |
> +      Timer array. Each timer entry is represented by three integers:
> +      Mode (gpio-ext bus), delay_on and delay_off.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +patternProperties:
> +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":

This is an odd pattern. Why is pinctrl an LED? or gpio-ext?

Actually entire pattern is very odd - it has $ in the middle, but then
followed with other REQUIRED stuff. I am surprised it works, but
regardless it is absolutely not readable. Looks like a begative pattern,
but why would you have negative pattern for known properties?




> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      label: true
> +      linux,default-trigger: true

Drop both, common.yaml provides these.

> +
> +      mode-addr:
> +        description: Mode register address on gpio-ext bus.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      mode-val:
> +        description: |

Do not need '|' unless you need to preserve formatting.

> +          Mode to value mapping. Each entry is represented by two integers:
> +          a mode and the corresponding value on the gpio-ext bus.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +      bright-addr:
> +        description: Brightness register address on gpio-ext bus.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      max-brightness:
> +        description: Maximum brightness value.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    required:
> +      - mode-addr
> +      - mode-val
> +      - bright-addr
> +      - max-brightness
> +
> +required:
> +  - compatible
> +  - gpio-ext
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/leds-netxbig.h>
> +
> +    netxbig-leds {

Just "leds"

> +        compatible = "lacie,netxbig-leds";

Best regards,
Krzysztof

