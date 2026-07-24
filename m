Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0643446DE;
	Fri, 24 Jul 2026 07:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879787; cv=none; b=s28Bn3f0YjszjoXy4yKEqsys6U5XdsqdRcaMwgE2S+wnysBKR9aKeodsKTO3gODf0n5ZJUjz4tNMTiaszJOfGU72KJDjTfgPIadZcSAMMq1HZzRAhCkR/vWSHfVuZgXVb82WAL73A0ZrlpoyqFIyBtPhSI/u8UqDpXAzZjO+Vq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879787; c=relaxed/simple;
	bh=UN43pdCLa/AGoaiqBSKA0qF3FVLR0FTXZP2w6MxV6nY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q/Xj1n0/g1qof8HxJ6DstilLdsvl4s8SlKE5y3xdu3VOF+3k8f0/+eTbXu5BzFXBPBsjk2L+uVeIcLWP2HOtOtLHUXCu/+o8QlfSoZktmIbreCDE03HGmaQGTCZKrQMjdoGkiDb6nXKuhw9QiZISMafkHBTUzyluQsr7xPGBKRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iW28IPgz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iW28IPgz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65E11F00A3A;
	Fri, 24 Jul 2026 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784879786;
	bh=b820psz2ge/p08pofscQSsAVW/kw8fEjG4vWTzqeBn8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iW28IPgzVCW3REzM9t0fDqF/AAxZQGio7tvpqOc4vKxh+13LOI/pAq/p/KZxuzuOU
	 +AJUMttlX3YDMcysAPeucAWnBAqOalzJxNeM9C25GZ9U+hRy4SJcFBzpaFujPaUQa5
	 lPkmbcvg2XiHLp5PECNJDxr9RDpMd0+1MBbkRSf0plv6XcN9I/hkKDIDLvqY8cDNbw
	 CII7My7bGrY0XH689WOiR8v9o/a3eMIWYsuwpR4L9/GIoiTssk1vm0qTD3BFZbby5q
	 CDkyJjW5Qfr7h6erf89loOyoV+gw5QhM156JXyN0heNPmvL3FQgL6RIX7AA5/6OeRU
	 SxRwjBGN9+jHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-monza-leds-v7-2-0125a3bfea98@oss.qualcomm.com>
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
 <20260724-monza-leds-v7-2-0125a3bfea98@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:56:25 +0000
Message-Id: <20260724075625.A65E11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `multi-led` node incorrectly requires a unit address and a `re=
g` property, falsely claiming a physical PWM channel for a logical grouping=
 and causing legacy drivers to misbehave.
- [Low] The commit message description is not capitalized, violating the LE=
D subsystem naming conventions.
--

--- Patch [2]: [PATCH v7 2/4] dt-bindings: leds: nxp,pca963x: add multicolo=
r LED support ---
commit 2f0b1f07fd505c331c2a3ed9b93793cfdf27bd7f
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

dt-bindings: leds: nxp,pca963x: add multicolor LED support

This commit adds support for grouping individual PCA963x channels into a
multicolor LED. It introduces a multi-led node pattern to model hardware
where multiple PWM channels drive a single physical RGB LED.

> dt-bindings: leds: nxp,pca963x: add multicolor LED support

[Severity: Low]
This isn't a bug, but the description after the subsystem prefix should
be capitalized according to LED subsystem naming conventions. Should "add"
be changed to "Add"?

> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Do=
cumentation/devicetree/bindings/leds/nxp,pca963x.yaml
> --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> @@ -74,6 +74,40 @@ patternProperties:
[ ... ]
> +  "^multi-led@[0-9a-f]$":
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        maximum: 15
[ ... ]
> +    required:
> +      - reg
> +      - "#address-cells"
> +      - "#size-cells"

[Severity: High]
Does requiring a reg property here incorrectly assign a physical PWM channel
address to a logical grouping?

Since the multi-led node acts as a logical container for the physical LEDs,
having it claim a physical address can lead to overlapping duplicate address
conceptualization, such as both the parent multi-led node and its first chi=
ld
claiming reg =3D <0>.

Will the existing leds-pca963x driver, which lacks multicolor support, sile=
ntly
misinterpret this multi-led node as a standard single-channel monochrome LED
mapped to channel 0 and ignore the subnodes instead of safely erroring out?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-monza-leds=
-v7-0-0125a3bfea98@oss.qualcomm.com?part=3D2
