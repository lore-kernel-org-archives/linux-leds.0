Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C093B95F6;
	Wed, 29 Jul 2026 23:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785367223; cv=none; b=FtlPrn32d2G7xZe17RMFV6CHPECaiQeZuO6/1+8vSExpt3qYAtjomE4yHiQp3nd+eA84P4bK+9oRayqGyErnYF4BIB5wSNOBZVt1tajGsjXEjI664ro48hMLC9BXVHFCsJYL5iCCbHr+D/muV9MO9RyQYfbaZvQM/99Uwfr3pMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785367223; c=relaxed/simple;
	bh=qlhud1W5pnOpTlETT6b6AS1tq8X5vt/mX8iE4IxKCmY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h499+71I0M4LAbwLi+IlKHmM8ddgYXFSEMbNtN6j5EznedLoAclbINhbMn3y/56QsBX+3jjXDZzIDKK1h/UE7scExOfQu8wJjpkjj1dnI56voi8SHdSnrezNJEENgEWITZmhPcsepgLOdDkblA7WopLLY7k6AxGoUQ34H+lD+TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMhepbnV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMhepbnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8481F000E9;
	Wed, 29 Jul 2026 23:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785367222;
	bh=/H/3YazZ7Oo2LPjKSnBI/e4LJhHdR0FX0Nuhz6kXHCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RMhepbnV7sNDMi8ZUSyX+7cnmTZHcs/O45Zi7PDBY1LlZLSccF2mFPfDcpiLJh/tA
	 aw+21pTfx7xbY3wxq8x2sNF0HP4d57rQ/pFjNM/RrX1803V18naqP1He3sEDYRdCsp
	 JiHiQduLT/KhuO56RBxBQwhIszQhyKYQidVGAo7IWQyJyuHGJWJD8gBBuIRP7uNIT3
	 JM2PhFW+x0lPJHB96QxFF6ZyBX4kNvulfGA6/Z46KyjKKbHATyxlkkrlIqEhF9tFAH
	 wQ83MJL4eojPOhdjB4As6qOEpRWMN5C2GGAgrK08Il1ACneT/yj9oIEg/xqUSCj4Nc
	 sJdCfkpat5HUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-upstream-ltc3208-v8-1-6bdcc35e65d7@analog.com>
References: <20260730-upstream-ltc3208-v8-0-6bdcc35e65d7@analog.com>
 <20260730-upstream-ltc3208-v8-1-6bdcc35e65d7@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 23:20:21 +0000
Message-Id: <20260729232022.4A8481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema omits `#address-cells` and `#size-cells` from the top-le=
vel `required` list, which allows structurally incomplete device tree nodes=
 to silently pass validation.
--

--- Patch [1]: [PATCH v8 1/2] dt-bindings: leds: Document LTC3208 Multidisp=
lay LED Driver ---
commit 40f57e6c55c9069959e21c4ed832c353a3472f0a
Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>

dt-bindings: leds: Document LTC3208 Multidisplay LED Driver

This commit adds Devicetree Documentation for the LTC3208 Multidisplay LED
Driver.

> diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml b/Do=
cumentation/devicetree/bindings/leds/adi,ltc3208.yaml
> new file mode 100644
> index 0000000000000..0a01e07e0ab70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml

[ ... ]

> +patternProperties:
> +  "^led@[0-7]$":
> +    type: object
> +    $ref: /schemas/leds/common.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        description:
> +          LED Channel Number. each channel maps to a specific channel gr=
oup used
> +          to configure the brightness level of the output pins correspon=
ding to
> +          the channel.
> +        enum:
> +          - 0 # Main Channel (8-bit brightness)
> +          - 1 # Sub Channel (8-bit brightness)
> +          - 2 # AUX Channel (4-bit brightness)
> +          - 3 # Camera Channel, Low-side byte (4-bit brightness)
> +          - 4 # Camera Channel, High-side byte (4-bit brightness)
> +          - 5 # Red Channel (4-bit brightness)
> +          - 6 # Blue Channel (4-bit brightness)
> +          - 7 # Green Channel (4-bit brightness)
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg

[Severity: Low]
Should #address-cells and #size-cells be included in this top-level required
list?

The schema defines child LED nodes in patternProperties that strictly
require a reg property. This means the parent controller node must establish
an address space for them.=20

If #address-cells and #size-cells are omitted from the required list, a
device tree author could configure the node with led@X child nodes but forg=
et
to set the addressing cells, and the structurally incomplete device tree
nodes could silently pass schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-upstream-l=
tc3208-v8-0-6bdcc35e65d7@analog.com?part=3D1
