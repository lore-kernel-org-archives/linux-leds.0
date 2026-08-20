Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CE23C07A;
	Thu, 20 Aug 2026 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238672; cv=none; b=EQx+aMD58XbylypmnPvKzCDmbjlt7mZH8EmUrI8nd8sFiYgAeXwE0bvpGKlwlbse7MwyLSQvjX6B3GtsBNPNsVB1GNH4uUCB8wRBx85qx/bKb9TZ5WiKgXXzWWU1+pxVbLZYzCmiUmXoitTKG6XBMdnsq3jcLYaEzvt4nqJdVvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238672; c=relaxed/simple;
	bh=sMIN4rONHr+GTk2Cihr6EERw4CQ/i6QFB02GHngKen0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hxJaFz09dAyutsGCga92lJdg4BCYmlKLV2WCW/7EFDnV6v2EV+pkQjNzQXpTzrXErQ8SNjMbhfgi6j8ok1noZC3XOG+kSDRnhQqoXGlpyOl5GFs9DHhdiCKIIZQSjAbdXabWJoxNv2nbGnlGmh6yHjphyteozMiqcoBS+OFnous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiFmB5A8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PiFmB5A8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0231A1F00A3A;
	Thu, 20 Aug 2026 15:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787238671;
	bh=qv/T9hkMxoW8p1DmrchdRmD5/DK5LRVEFMKWMhXZeEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PiFmB5A8H1fqWKBxmUjv2LzrLTKnHTdY2u5aA49f34xZ+tV+CNHOdJgSFWfkaZrWp
	 HerGtWvjGi9GWhhqIhH6/RORbzd/XBWqhWxat0cGgd99jl2YbqiYnP5oN3d3jzQBsA
	 K7IkeXv6uP8sERnHiLcrFs/HqpfNreO+JlRjibQGAAVMGO+D3jC7bWt38DDwwzYb0R
	 58Y07aOjOtOXE50oY8bLLwF6ztdFS1w2Heod4PhBVpTsoKbVm0pywZe8Pft4NuYFvx
	 DVFLeMm9u2J6fqXmKEfK3NqB0NMIo1dGfNkzDgc9m0lRoxaq2W64JDFN9Y6KPamQ+5
	 lGhmh5nn7Yogw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: leds: lacie,netxbig-leds: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260820150223.108374-1-challauday369@gmail.com>
References: <20260820150223.108374-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 15:11:10 +0000
Message-Id: <20260820151111.0231A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The dt-schema incorrectly uses an object schema for `additionalP=
roperties` to define child LED nodes instead of `patternProperties`.
--

--- Patch [1]: [PATCH] dt-bindings: leds: lacie,netxbig-leds: Convert to DT=
 schema ---
commit aac938a074c3b72885d598a72f89b254f35a5d88
Author: Udaya Kiran Challa <challauday369@gmail.com>

dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
   =20
This commit converts the lacie,netxbig-leds devicetree binding from the
legacy text format to DT schema.

> diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.ya=
ml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
> new file mode 100644
> index 0000000000000..ffdd47458d248
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml

[ ... ]

> +required:
> +  - compatible
> +  - gpio-ext
> +
> +additionalProperties:
> +  description: Each child node represents a single LED
> +  type: object
> +  $ref: common.yaml#
> +  unevaluatedProperties: false

[Severity: Medium]
Will this strict additionalProperties definition cause standard device tree
properties to fail validation?

Because additionalProperties is defined as an object schema here, any
top-level property added to the netxbig-leds node that isn't explicitly
defined (like status =3D "okay" or pinctrl-0) will be forced to evaluate
as an object, triggering schema validation errors for strings or arrays.

Should child LED nodes be defined using patternProperties instead, so that
standard node properties are not caught by this block?

> +
> +  properties:
> +    mode-addr:
> +      description: Mode register address on gpio-ext bus.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820150223.1083=
74-1-challauday369@gmail.com?part=3D1
