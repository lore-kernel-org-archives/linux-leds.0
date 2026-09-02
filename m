Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFDB4156C2;
	Wed,  2 Sep 2026 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352266; cv=none; b=QUHh7a6+rQBJ/KVCSft3F/DGWWIV+n6QevVrdfCq6d/HFvI6hrOVpF9liQJrZnfjKTf4rA4m+1NlL5pJBTtpXqgET7LTm25XQv95BSFnS3eOfykoHYf/VQd706wSxTdA9FbxI7CAKIvLExwZMaNUVsxSLiV3I5Z7K74oO8JrfeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352266; c=relaxed/simple;
	bh=C7oHn4XivxySXy0y+yr4wWMQoZ5AQOtuheiFlAgGvEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MRSaICmYhXgk5sjdsLeaYR+VzM2bZO86UGThIKceL3bfAvoxoE5kRhjVBauQYCno509iVn2oArUbUYL0fn8lWhO1RPQe0VSGmbSX9p9RHyaYnIrZ7lkBxHvdFQ1z6MkiBc8JZuS1WOUhiogFtAUW9kIsez3PhQMVWZPmbx3F41w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cS0RsluM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cS0RsluM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B171F000E9;
	Wed,  2 Sep 2026 12:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788352265;
	bh=GEQKhOVzBV3dKXQ8n+gpBDXvJoW60Dmhe+PlGVvNK1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cS0RsluMcDpNVxBHCUJhHQrCt+InzKmO6a1mawxMsHAT+KNRgHpVqn1ICX/GQI7W0
	 cMOSniIvbPFjVgrnImJLjlkfR1xh/MknJfpiqXktum3KMibi6h2ZwQnaeYYdMC5P9d
	 ExQr+QCR/d9BKzHxidhRtRlbkYitv7B0M7NzuRa+iD7/yRpP3heymJqNmE/BpP45rw
	 MwvIki+abq2hYcrWrpohxXYCUyw1ZRHyFd11wkRLbj8hawM7GfdgLKBfffkFAM4254
	 Ms/cH70yz7P4ZyGts7aQGOgUOJbk+yhUJiT+1sN0i6vWkImrwLINN5XZ4sk9cMwhW1
	 ghvov9Ku1Xwbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: leds: pca995x: describe output-gain
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <7f61e7e8781292450f920c49ef8853b802d76ecc.1788350618.git.nora.schiffer@ew.tq-group.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
 <7f61e7e8781292450f920c49ef8853b802d76ecc.1788350618.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 12:31:04 +0000
Message-Id: <20260902123105.11B171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The custom, device-specific property `output-gain` lacks a mandator=
y vendor prefix.
- [Low] The `output-gain` property incorrectly exposes a raw hardware regis=
ter value directly to the Device Tree instead of describing physical units.
- [Low] The commit message description is not capitalized, violating LED su=
bsystem naming conventions.
--

commit 09d8712f125575e995a97c0a819c386e17eb766a
Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>

dt-bindings: leds: pca995x: describe output-gain property

This commit adds the output-gain property to the pca995x device tree bindin=
g,
allowing configuration of the output current to adjust for different hardwa=
re
designs.

> dt-bindings: leds: pca995x: describe output-gain property

[Severity: Low]
This isn't a bug, but the subsystem guidelines for LED bindings specify
that the description after the prefix should be capitalized. Should
this be changed to "Describe output-gain property"?

> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml b/Do=
cumentation/devicetree/bindings/leds/nxp,pca995x.yaml
> --- a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
[ ... ]
> @@ -36,6 +36,14 @@ properties:
>    "#size-cells":
>      const: 0
> =20
> +  output-gain:

[Severity: Low]
Because this is a custom, device-specific property, does it require a
mandatory vendor prefix (such as nxp,output-gain)? Exposing it without a
prefix could pollute the global device tree namespace and potentially confl=
ict
with future standard properties or other bindings.

> +    description:
> +      Set the output gain controlling the LED current as described in the
> +      PCA995x datasheets.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 128
> +    maximum: 255

[Severity: Low]
Do these constraints expose a raw 8-bit hardware register value directly
to the device tree? Usually, device tree properties describe hardware neutr=
ally
using standard physical units (such as microamps) rather than tying the val=
ue
to the internal register layout of the chip. Could this be abstracted to use
standard physical units instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6d3600f99c77c31166f=
0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com?part=3D2
