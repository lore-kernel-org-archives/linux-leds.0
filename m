Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3266D3A6B6A;
	Fri, 24 Jul 2026 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879665; cv=none; b=deW0wnKv8SKbSDw4/0GmCwSMCC7uBYglvX8DUUBVScUEUvnOG7m0sRdUKvk+XVnThXpCOuoA9fQhc1vjbeib1NVTbPpWwlJEX4sWXC/Mlv/BXg+mam73gFYETNCcsHZAAWT/5o246ap5EoE1bnOnvZ4ldXjf9VkH85A1MmUjOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879665; c=relaxed/simple;
	bh=14rrVpcTQglQP+2MqAtatXxWVpxP2jb8x3TI4RYI+o0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mekFk7VQC99pS0tzk8XGu2Ly2jp2SjeN5cTA+EUXvAbmgxNZAuMTTiDGZbXs+TqqWVcm0yU/wDrzkzVdr3KoYoZUydWgD9Ka2X4V86Z9FTt23xKNAZp5BJCLU5tPpKDn3bJPthpNBX+iiuvAe25stlWA7qM7AyC4CAqAWBfRpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ln2dW61p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ln2dW61p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601261F000E9;
	Fri, 24 Jul 2026 07:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784879663;
	bh=cdcjOuzdqMJcVA4kpTSVVWi+CyFozf/hb6cex9g2RIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ln2dW61pXhyy1INxIanlm7CveRMuswPQ8V4KBaBllnrJgcehi+LHWABmbtqnv9QyE
	 UVoR7kXaarbSdDgxkPaASL4PEUc2pAPLmGOqpfEen0FnYoDFjQ8A5srgozxib1XRc3
	 Qb/0xZ0NYPj5Zg0stKcagcRKwPArg5AB8s1htM6gFbp5a4Eg1OxERYRRAUy7MIBOfM
	 E/uk3gU/JR9wDtc+m+kS+aqiFY9GRlWYcHd/YCvFpjWV0aKx8CJqCjckTUzyXxtp+N
	 XVAsQgBrKUP8a049cAQi7uo7xxFuJ+i4vueo9akLJZBso2f9t3WS2/TdkzMactMj9F
	 ZFUC3Rp2xO+Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum
 for pca9635
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260724-monza-leds-v7-1-0125a3bfea98@oss.qualcomm.com>
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
 <20260724-monza-leds-v7-1-0125a3bfea98@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:54:22 +0000
Message-Id: <20260724075423.601261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete node name regex update in conditional schema blocks.
--

--- Patch [1]: [PATCH v7 1/4] dt-bindings: leds: nxp,pca963x: fix reg maxim=
um for pca9635 ---
commit 0690191fc4f385657c026eb25eb9afc4e79fffd4
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635

This commit updates the pca963x binding to support 16 LED channels on the
pca9635. It gives pca9634 its own conditional block and sets the maximum
registry value to 15 unconditionally in the top-level node.

> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Do=
cumentation/devicetree/bindings/leds/nxp,pca963x.yaml
> index 938d0e48fe51b..4fda602912f7a 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> @@ -62,14 +62,14 @@ properties:
>        open-drain, newer chips to totem pole).
> =20
>  patternProperties:
> -  "^led@[0-9a-f]+$":
> +  "^led@[0-9a-f]$":

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
          ^^^^^^^^^^^^^^^^^^

[Severity: Medium]
The commit message states the node name regex was tightened from
^led@[0-9a-f]+$ to ^led@[0-9a-f]$, but it seems this was only applied to the
top-level patternProperties.

Does this conditional block in Documentation/devicetree/bindings/leds/nxp,p=
ca963x.yaml
also need to be updated to match the top-level regex?

Leaving it as ^led@[0-9a-f]+$ creates a mismatch, and there may be other
allOf conditional blocks (like the one for pca9632/pca9633) that were also
missed.

>            properties:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-monza-leds=
-v7-0-0125a3bfea98@oss.qualcomm.com?part=3D1
