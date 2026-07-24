Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D891F3612E7;
	Fri, 24 Jul 2026 16:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911019; cv=none; b=WdGo6t3oAUzJBtFb45xFtqqoVqyxx3qhqNOqtRvhz1I7Sr7U5R+TmzAljF7Jet2WTJPzVbpP9svzUCHiYNoJRq6ik9ima+GmB86mAlY4iGah1C/9ALVcRN4jvP5v2jumnGwi0LW1cCzRnXh2WbkKDQ2D/BwuKd+Cq2x7aQ5Tl4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911019; c=relaxed/simple;
	bh=AaJqSZ8ME+OpyEsrT97A/5HVdy30K+bgERg/+IGmGXA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oE3JFX1kNUWmC/JwNnbJrrUvdED8eIXsOz7qo37X+ecWu3wT3r+iVZDHauIW6/QLWeM3gH4ebLv+e5Fcw78JNG/IS3o9GTlQ1I1C3QGw1+sqE6Gd54utXP7OCHlIbrMimDQTXhsiyK2Dk6ZOzhESLAR6wYapgYNwyIVi9HqmwNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lc4NMM5D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lc4NMM5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29171F000E9;
	Fri, 24 Jul 2026 16:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911018;
	bh=HQOka7agdpZEgoJhoY6PMq2HMv8QjB2u2bCpGLRsDvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lc4NMM5DQR3rvN9341JcWXFVSrdXreUw7Kfu8fH0kWYj4WXp51PM8ot2s5bIjLAqk
	 BOOYoYb6dl8LfbOTu4nDsM5zwgc8F3nuu6+Sbl2dJ7u8t6uSSqOyhpW1uXAsBhtKm/
	 JWqdGpeYGPONZgZAzCyi7PWr/Mosw7zQvbzFCAWISyvopcGIXwJXxe3eDgWS2BUuaw
	 n4CDNbxatXuLOVvSLs8hAFf/v/3kVr2BrpO4KcOUvf/G8sQQGSesYeCyjeX9FIdB9B
	 TycEjHzk8hQhZ413LmoAlDtB+XUWGjZh3dwp9i/2QMHegLprNx3Wl/v8CR8MVGcbXR
	 L829PTP8KqtFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,ns2-leds: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ninad Naik" <ninadnaik07@gmail.com>
Cc: conor+dt@kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260724162332.32291-1-ninadnaik07@gmail.com>
References: <20260724162332.32291-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 16:36:57 +0000
Message-Id: <20260724163657.F29171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The top-level `additionalProperties` is incorrectly defined as a=
 child-node schema, causing it to incorrectly reject standard device tree p=
roperties.
--

--- Patch [1]: [PATCH v3] dt-bindings: leds: lacie,ns2-leds: Convert to DT =
schema ---
commit 2e02c3a2b329288ad4aeeb155d96aec6b772c421
Author: Ninad Naik <ninadnaik07@gmail.com>

dt-bindings: leds: lacie,ns2-leds: Convert to DT schema

Convert lacie,ns2-leds to DT schema.

Closes: https://lore.kernel.org/r/202607231542.6ovJrInT-lkp@intel.com/

> diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b=
/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> new file mode 100644
> index 0000000000000..2138c75c04133
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: lacie,ns2-leds
> +
> +additionalProperties:
> +  type: object
> +  $ref: common.yaml#
> +  unevaluatedProperties: false

[Severity: Medium]
Does this incorrectly apply an object constraint to all unspecified top-lev=
el
properties?=20

It appears this schema logic will cause valid device trees containing stand=
ard
non-object properties (like status or pinctrl-0) to fail validation during
make dtbs_check.=20

Should child nodes instead be matched using patternProperties, with
additionalProperties: false or unevaluatedProperties: false used at the top
level to allow standard DT properties?

> +
> +  description: Each child node represents a single LED
> +
> +  properties:
> +    cmd-gpio:
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724162332.3229=
1-1-ninadnaik07@gmail.com?part=3D1
