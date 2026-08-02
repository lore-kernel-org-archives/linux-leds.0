Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658C938239B;
	Sun,  2 Aug 2026 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672550; cv=none; b=ORroUDl1IAeiPJRKKCS0B1vUJ4ymhPaSeG25bcZqgGe/oLTv5tOcBdistbv/n+Xd3+n13MG76oW1KZB5FN+MO/mF7sgf4daiqoDL1kWFZJCt5hhBURlGLtl3z1wS2DomC/IMgpUGHDG8Tc6bq1RDcqRQr4iVftLhu+aHNnbZaR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672550; c=relaxed/simple;
	bh=fOFcre735NwEwh8kVb6Y/67813qyxQUiUnopX6dMPmo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DeaubvhmVk79TxwptqU7AuMITfMpm1dgBc5X3CLbMw0h7UxhJfUEYxCmgk3JsbdcvbmEBJv+fcUCxw3mJ22BLsZb+UvCLUeUypuIHQsmV/hAaULIc9ynGWmULPeHpVJxAYeB3sR1ZG1ewGpByey61y+mgQwa9kEBgF84I1UD5aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bxy52Kqj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bxy52Kqj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A268B1F000E9;
	Sun,  2 Aug 2026 12:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672549;
	bh=ys/o9fRv22NjH1T5HdCH1vTXsjsFIgg+R4NV3434XYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bxy52Kqjzq6YjA/DXURfBgys2AjKqSaq2wbmM5hMXHwCbyiGpkmdQXODuHLhlKDd7
	 lmW+7ZRyaH86fbmx6S3ApRQ0XhvMAKiOE1DTL9kA4syluHugsUiotDRlcGMQmqId4Z
	 /rKwa1nqOhoyqGEF4xsDXZyItvfmM1KtKbnK8G4qjdjFjDbzdDYyBGIFZOrrA9+PQF
	 ZiSTiD9TjLJDoFVB3z3qw3zkV6iedy3+7WBrp4eP3flz0TuXtCSL5dX4PtgIF3m3PD
	 0oB748LAm3pASrzlSEmRFCxMdsUImT6UWdt3IraXeXedrMjIl4Ug7tVGcrISexaTZY
	 Wi+xxV7GVLzxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: leds-group-multicolor: Enable
 default-intensity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Wahren" <wahrenst@gmx.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260802115727.50411-2-wahrenst@gmx.net>
References: <20260802115727.50411-1-wahrenst@gmx.net>
 <20260802115727.50411-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 12:09:08 +0000
Message-Id: <20260802120908.A268B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The scalar `default-intensity` property is structurally misappli=
ed to the top-level multi-color parent node instead of the individual monoc=
hromatic sub-LED nodes.
--

--- Patch [1]: [PATCH V2 1/2] dt-bindings: leds-group-multicolor: Enable de=
fault-intensity ---
commit bf29f5ac49b0a3cb58ee37092ceaf9652d2451d0
Author: Stefan Wahren <wahrenst@gmx.net>

dt-bindings: leds-group-multicolor: Enable default-intensity

This commit updates the leds-group-multicolor binding to allow the
default-intensity property on the top-level multicolor LED node.

> diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor=
.yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> index 5c9cfa39396b0..1f308cdb71c86 100644
> --- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> @@ -19,6 +19,8 @@ properties:
> =20
>    leds: true
> =20
> +  default-intensity: true
> +

[Severity: Medium]
Does this misapply the scalar default-intensity property to the top-level
multicolor parent node?

Because default-intensity is defined as a scalar uint32 type in common.yaml,
placing it on a multicolor aggregate node prevents it from conveying the
per-color-component intensity values required to define a default color mix.
If a developer attempts to define a mix using an array (e.g. <255 128 0>),
schema validation will fail due to the scalar type constraint.

Would it be more appropriate to apply this property exclusively to the
referenced monochromatic sub-LED nodes (e.g. gpio-leds), which already
inherit this property, rather than the parent group?

>  required:
>    - leds

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802115727.5041=
1-1-wahrenst@gmx.net?part=3D1
