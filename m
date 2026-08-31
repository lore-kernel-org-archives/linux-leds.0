Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90967445AE2;
	Mon, 31 Aug 2026 14:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185700; cv=none; b=lDx+0chP/WWo5CFttm8kdrQ5pyHnBU4qcY76JAE/LBH1UbLXpvcg9QfyOsdDhAurj2eyBDR1Ew1J2OnlpQe2emBcwX9vURwbDMXJf8Ci4b2/dltVM/KRdzE1qUWWWJyvxKIAY3q5DMWcUTCpn1LxHTjfnZlJJeR8Ng3SEw7KPjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185700; c=relaxed/simple;
	bh=T65Cosm0xAQNaZd/jGKGtk+wV8zqpDgkRMfk4lbgvhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDxBET8Ix5APqrWcLlca9Y6xKfgoa3/uk7F78tG00j7N3eqQWjN29Sn1f5zuA+a3lugX2wng+h8IXeYu8jawzTOy/i5CNp/80bVqNssPo6NFK0ESj2GHgnhd93GScWG4+CoJbXMkXMDqFfKxcJX/8kXKhXg8YR43aI1DOVGSoXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPBwpqJx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPBwpqJx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C0B1F000E9;
	Mon, 31 Aug 2026 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788185698;
	bh=XvyAV+Jb/2dt37zdLyqko1ZPyJk/KNJ1Oynd8XnZyKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iPBwpqJx2ey6XpaUMYW+/qtC127dk1vXo3WeOR6/W+Z8SHiQDiKC9/aFOrLKqXIWY
	 DCIa1vAMocleEDrUMtnBmXC9gDxCDynvHBmYJsefbcZdkH97sUCcBojLRisHv0DjiZ
	 PUCFj+mM7CNcDyvy6TcE3pl1AEulG9/nNbfaVmH5JxIOypVVAZWaQ4Kiy20E+H2mYo
	 GiiyJidQ/TmnxaeTXLFA2pEd0Hsqzh9gBoeyKx8P+Mh/smlWUbWV39l4lGfjDUEB26
	 jhF3HJW3lq5e5F63n4rdmu8ER/FMDNdNXwLJW9Ex++5/WQ4pdEyCwlqPcnb9b4G5Ek
	 KId2OPY9+iCaQ==
Date: Mon, 31 Aug 2026 09:14:57 -0500
From: Rob Herring <robh@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, skhan@linuxfoundation.org,
	me@brighamcampbell.com, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: lacie,netxbig-leds: Convert to DT
 schema
Message-ID: <20260831141457.GA811514-robh@kernel.org>
References: <20260821123723.198286-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821123723.198286-1-challauday369@gmail.com>

On Fri, Aug 21, 2026 at 06:07:23PM +0530, Udaya Kiran Challa wrote:
> Convert lacie,netxbig-leds devicetree binding from legacy
> text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> 
> Changes since v1:
> - Use pattenProperties for LED child nodes instead of additionalProperties
> - Explicitly list the two optional properties supported by the binding
> - Place the top-level required block after child-node definition
> 
> Link to v1:https://lore.kernel.org/all/20260820150223.108374-1-challauday369@gmail.com/
> ---
>  .../bindings/leds/lacie,netxbig-leds.yaml     | 144 ++++++++++++++++++
>  .../devicetree/bindings/leds/leds-netxbig.txt |  92 -----------
>  2 files changed, 144 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
> new file mode 100644
> index 000000000000..02759ecb32d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
> @@ -0,0 +1,144 @@
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
> +    type: object
> +    additionalProperties: false

You need a $ref to led common.yaml.

> +
> +    properties:
> +      label:
> +        description: |
> +          Name for this LED. If omitted, the label is taken from the node name.
> +        $ref: /schemas/types.yaml#/definitions/string

And drop the type on all the common properties.

Rob
