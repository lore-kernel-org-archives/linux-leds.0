Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C1744CAEC;
	Wed,  8 Jul 2026 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520792; cv=none; b=ND0OMxt1eFBg8jSOVpIfGiUQiSNDwtQxIkeP3Zn5T6LPN3MZ5ko7SmZngLmQ/d/10prHj9qbgxwVizeKcSVvdEwRSs6NQ4xx4Ujle6fNVc/DVTXh+ZRGSxQd0X4Ooh5usbTR0duVdgC3/NZRIkgjlKCXL2vF/lkceyUMQIZ3ias=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520792; c=relaxed/simple;
	bh=il/wf9nMdPkGdA7/ZV5x9NrSLeECQQYnXCZcW9Bs5O0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e4vUYyd2MR370xqhS8ItrcX66gDxNoA3kOFoaJvAYxyvs5JHleFzT4OFgYjIrqeFLhG12Ncd7amgBuZ/i8HlyWIMuE+PHV4h6HMB9Lj8e3/R7qYSYFyMBfaHBktt+uXFvh9ykmqY+g/ulkfAFoAl8hM2ghblvgX5ul606gZYayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vb3qCSeG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vb3qCSeG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B780E1F000E9;
	Wed,  8 Jul 2026 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783520791;
	bh=nfJmK4/idDBA7HbXpVPCxNpV9yFWt/jj8qOxZrZsy+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vb3qCSeGp2r8A9mPvVfjPjoKeMCOqzj134hbE/vwVLyN6/p1SrZH5JvAVCx7kul8+
	 QF+eUzhRV5eJWT0X/vxPXae6VXc+GT7scNTqq13bRR76NpEcv0oiJTXrxGortO0fAv
	 /q+VsscuyCiaUHk7G/q7r0euOqdVMJCfMB1pGMKNPN4cAHw/JC6k18NU11uYE2ZSZW
	 7kZG8AhaVt2qJyUOkWPg4U5ELwveX9x0BdmvSbrhUnpV50c0WcU52+EL5H6+kI/lo8
	 BKD+QiT+uBS8aMcjrBYidiZclchNC5Lez2liuuIzLvEnXjOxr3Fjg4p9g0a9Hr9LZN
	 hkGOqqc7I9mCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum
 for pca9635
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260708-monza-leds-v4-1-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
 <20260708-monza-leds-v4-1-a7acfc524c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 14:26:30 +0000
Message-Id: <20260708142630.B780E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Incomplete refactoring of node name regex in `allOf` conditionals, =
contradicting commit message.
- [Low] Commit message description starts with a lowercase letter, violatin=
g LED subsystem naming conventions.
--

--- Patch [1]: [PATCH v4 1/4] dt-bindings: leds: nxp,pca963x: fix reg maxim=
um for pca9635 ---
commit d35db04fcd6edecc8a6a664a044fa839e273b39c
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635

This commit updates the pca9635 LED controller bindings to support 16 chann=
els
by separating the pca9634 conditional logic. It also sets a default register
maximum of 15 and restricts the node name regex to a single hex digit.

> dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635

[Severity: Low]
This isn't a bug, but the commit message subject starts with a lowercase
letter. The LED subsystem conventions require capitalizing the description
after the prefix. Could this be updated to "Fix reg maximum for pca9635"?

> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Do=
cumentation/devicetree/bindings/leds/nxp,pca963x.yaml
> index 938d0e48fe51b..4fda602912f7a 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml

[ ... ]

> @@ -88,7 +88,13 @@ allOf:
>            properties:
>              reg:
>                maximum: 3
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nxp,pca9634
> +    then:
>        patternProperties:
>          "^led@[0-9a-f]+$":

[Severity: Low]
The commit message states the node name regex was tightened to
"^led@[0-9a-f]$", but it appears the broader "^led@[0-9a-f]+$" regex was le=
ft
in place in the allOf conditionals.

While the multi-digit hex nodes will still be rejected globally due to the
root schema, should this conditional and the similar conditional for
nxp,pca9632/pca9633 earlier in the file also be updated to match the commit
message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-monza-leds=
-v4-0-a7acfc524c0b@oss.qualcomm.com?part=3D1
