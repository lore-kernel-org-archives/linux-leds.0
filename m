Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C493164B4;
	Mon, 27 Jul 2026 15:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164468; cv=none; b=NkHOqX+YcLl6oP2SP5RhmHTrG7Pqb3eNzIc+VRPafdVR7Ut8n1pmZp2s9MYG4B2KyHfQpLpoobxdXH3r0JzcAAzhRzsRNELVC5viaSHw8bjOYgRoCtaG20PX1/S3ljUJgWi/Powdcv5DmljK5dUWEXa8/YLZXRtjVfs89Z8RtBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164468; c=relaxed/simple;
	bh=bewvBW6ByH0VmXcblKdrD1bBh2Mz2z4C8v3AkVZVPII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tPvQHLjf9BKkM+0L+FVz5XL+hxzHJX8tEz0tzw6GV+7KBj2TnE3gDbbANz3hp16KS1utrT2Wp+xsyMHdmKuC7/A8voRrIFQld6O/mhmL8BJcjvhFHugRXvqATpCzZi0xTO2d7xXuSdXC/qBmTSQDgMVc5WJEetBrIW2yqCKR3Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgY4oAeU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgY4oAeU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809B61F000E9;
	Mon, 27 Jul 2026 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785164466;
	bh=QH0ZhkbbIhcr7kFOFThZWhEpSVMNVCH+iZ1irIdmWgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dgY4oAeUA+Hfx15pWfIzPXV9aQMGw5+LPtIFBTtUlwcmWFSu+H2/K57JtiBfW3ANU
	 +x0Amb7jzSjz9CnX9ht79OBGUO8x9LdMQ6EQQHSTk4TTOZ0lJuWLMt/cf+hThG9aqa
	 ugeQho9ClFfxFUBjF5BhV+s3n8P1jCZlhzAEi/BFvckE1YPwVKsZNDJb/aal04LAhg
	 qih6kjCsk4jeAaQzJ512g5wQ0gkGz2BP2C777CLvTpx04tadellNTHJNmWhBnnEMq6
	 FDuY8qKc+FOP53loqloBtxFu+DR9fiempjjhoyI1R/QnPXctlsxekIGBoY/J6EErlX
	 nK0WeKkMVZEXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum
 for pca9635
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727-monza-leds-v8-1-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
 <20260727-monza-leds-v8-1-6e7e93d44dba@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 15:01:06 +0000
Message-Id: <20260727150106.809B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `patternProperties` regex key in `allOf` conditionals does not =
match the top-level schema, causing a meta-schema validation (`dt_binding_c=
heck`) error.
- [Low] The commit message description is not capitalized, violating the LE=
D subsystem guidelines.
--

--- Patch [1]: [PATCH v8 1/4] dt-bindings: leds: nxp,pca963x: fix reg maxim=
um for pca9635 ---
commit febe95d1e68d24e8ea2c7f7724fbc41453e15f8d
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635

This commit updates the PCA963x LED bindings to support the PCA9635, which
has 16 channels. It modifies the top-level node regex and adjusts the=20
conditional blocks to set the appropriate reg maximum for the PCA9634.

> dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635

[Severity: Low]
This isn't a bug, but the LED subsystem guidelines require capitalizing the=
=20
description after the subsystem prefix. Should this be "Fix reg maximum..."?

> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Do=
cumentation/devicetree/bindings/leds/nxp,pca963x.yaml
> index 938d0e48fe51b..4fda602912f7a 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml

[ ... ]

> @@ -62,14 +62,14 @@ properties:
>        open-drain, newer chips to totem pole).
> =20
>  patternProperties:
> -  "^led@[0-9a-f]+$":
> +  "^led@[0-9a-f]$":
>      type: object

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
Does this regex in the conditional block need to be updated to match the new
top-level regex "^led@[0-9a-f]$"?=20

In dt-schema, pattern keys inside conditional blocks must exactly match a k=
ey=20
defined at the top-level patternProperties, or dt_binding_check will fail.=
=20

There is also an earlier conditional block for pca9632/pca9633 that appears=
 to
retain the old "^led@[0-9a-f]+$" regex. Should both of these conditionals b=
e=20
updated to prevent meta-schema validation errors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-monza-leds=
-v8-0-6e7e93d44dba@oss.qualcomm.com?part=3D1
