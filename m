Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14754326D55;
	Mon, 29 Jun 2026 19:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782763084; cv=none; b=mnTx6B3/uN85SBRkhO07QMBCgUuZ7QFOq3LZosd/rdLVuvbdhCOW6qi/60IEutMuY2aMS7+nJdjUoIZqidjXKvQVmplOBn3nuJjBrb0QjpPMPC3Cwf26xRD75Lgg4HDDgZmCoY69XXvSdq9YlrrdHwt3ffoB5RFGjLY31Nk0L98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782763084; c=relaxed/simple;
	bh=6fczMAklCviWZVOnDk8Mtw/rbsJeuDdHxP1iw1nRQgU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nQY+KfpOsHCsmalyGIY8FmIL5DNBdAynCcc0jhhhry7AGIyZ1GfxqL2f5dZeNur0cb4zvsovy3FKrSmI44y/WB8z59HQJLku1InkBEsalmsUvnR/73EYagAOY+xN5ZfSUV8rDLrV1L8IkXBW1cy9heMTTZL4lIMOwHNcp+TiLBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6ZuOkow; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6ZuOkow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543081F000E9;
	Mon, 29 Jun 2026 19:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782763082;
	bh=NeY9lEdUmnL1ZoI/ZqVxJ7I0pyO24/jJQ1/p15Vo/eY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W6ZuOkowaqwm+dyIJsxBJF+QvkB6pL5sY0HRWTZ4Bt50sleuRA/zXARwQ9xaL6wop
	 ACmn/BDioqQm4PXLI6ZoNM/OYK7nXC/kmPYKwwIpYBBTlnZuRr6wuzOiPxa/ei4WbZ
	 8UQyHLqSK4D+zmLmMeYB14cwCQiLxs1gCURg0+9gXPcybCfLRo7bHZw5sRtWkl49eU
	 KZtYuhHMLchtgk2BpKvFf4p19vxa+4XHPwR9yZpZte/TGJJ5LinTHAQ5ih7o2WyrFJ
	 RYjUf1H7e7INI/QTsXVG2Fyz85QPjZJ189A4cNWSktGZ0G09XEywGFGrop4X9wQb40
	 oyFKPGcm1ExXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629-monza-leds-v1-1-0cf7c0a7dc14@oss.qualcomm.com>
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
 <20260629-monza-leds-v1-1-0cf7c0a7dc14@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 19:58:01 +0000
Message-Id: <20260629195802.543081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Schema validation bypass for nested physical LED channels inside mu=
lti-led nodes.
--

commit c073ead1ec3207da7ebd98641e041ef2bd14a16a
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

dt-bindings: leds: nxp,pca963x: add multicolor LED support

This commit adds support for grouping individual PCA963x channels into a
multicolor LED by introducing a multi-led@N node pattern. It follows the
convention established by other multicolor LED drivers.

> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Do=
cumentation/devicetree/bindings/leds/nxp,pca963x.yaml
> index 938d0e48fe51b..09ec140c50929 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml

[ ... ]

> @@ -84,13 +117,13 @@ allOf:
>                - nxp,pca9633
>      then:
>        patternProperties:
> -        "^led@[0-9a-f]+$":
> +        "^.*led@[0-9a-f]+$":

[Severity: Low]
Does this pattern property correctly enforce the maximum limit on nested LED
channels?

Since JSON schema patternProperties evaluate at the current object level and
do not recurse, wouldn't changing this regex only apply the maximum reg
constraint to the multi-led node itself, completely bypassing the limit
for the nested physical hardware channels?

>            properties:
>              reg:
>                maximum: 3
>      else:
>        patternProperties:
> -        "^led@[0-9a-f]+$":
> +        "^.*led@[0-9a-f]+$":
>            properties:
>              reg:
>                maximum: 7

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-monza-leds=
-v1-0-0cf7c0a7dc14@oss.qualcomm.com?part=3D1
