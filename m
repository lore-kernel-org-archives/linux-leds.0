Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C80A3B42E1;
	Thu, 13 Aug 2026 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613123; cv=none; b=goW3+zNaiv0Ev+Tbpmjv21A0NyY6Gro5O/unJxXnmT3prXKQCbvL2cA8d22Wpgi1DnDsuB0HdINzCe1HH6mDNkeUvsNMPx2BizlYdEtKUI8eyKplxQoOc86c0LHVVhnQaHbfgpXKKGo/zSSp2HGDUXd1dmABo+Xhh+Jf0ik5EVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613123; c=relaxed/simple;
	bh=TeagSVJLtXkPA0vCulcev49Bg4PDr2H/cBGccm98e1s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kLRkLwvKWeK+2oCYLdXHpsHWVYRZVQ6NbcQiKmkFl3wzYD3Z4TkuLkiibEmT4IZysswklF08V8FcYHEP/V+y1ZjB12u2qP2cTCKflCXGbRkmpKC8DHK/QdWKHWQ1Oa4rlDc0oPikeY6cogDlGI8P5152yjiqhDadg7WBSvX8PTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqabAdOK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqabAdOK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0228D1F00A3A;
	Thu, 13 Aug 2026 09:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786613122;
	bh=5m+zRvM06Y6YpthYQIijyM3wG1Soo7V9LgkDOhpGfxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DqabAdOK4QLo4GYuRerdDAGWNXKKPHvk7mIVz27ZnQ752qEtOdM3H+0RLEJKIWZWe
	 rZ1r/MqucP3ALepgqcnUAfQCWXPbgWq02f05PGtvgfle+Y2pRNYAbDLEu5tQOjhwH1
	 fT7xGCrtweyg1YGcaoiqqioNwLd2KR01yVu/VrW4RYmO46jzX1fxV0v+Gy56TbPTvi
	 8AGZ5ko2cVeTAcA3BFnb+Oo0GkbPu1vfMVwLndyafRYgub2bCZVN3EYguV4/NdJo+v
	 BG16ZULxaFrRZsTeo8bcmT5qjOTLRSN69OUSx2LsAsuN25c8R/Ni4KAprSYA8fDjWO
	 K31xAt6kEuJyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4] leds: rgb: leds-group-multicolor: Implement
 default-intensity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Wahren" <wahrenst@gmx.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813091428.9072-1-wahrenst@gmx.net>
References: <20260813091428.9072-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 09:25:21 +0000
Message-Id: <20260813092522.0228D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `default-intensity` property read from individual monochroma=
tic LED nodes is applied to the multicolor group without rescaling, causing=
 incorrect brightness calculations.
--

--- Patch [1]: [PATCH V4] leds: rgb: leds-group-multicolor: Implement defau=
lt-intensity ---
commit 13399f1aaceaf09afa7e252e35000d7d61ab1925
Author: Stefan Wahren <wahrenst@gmx.net>

leds: rgb: leds-group-multicolor: Implement default-intensity

This commit introduces support for the default-intensity property during
boot for LED multicolor groups. If the property is missing, the code falls
back to the previous behavior of configuring the sub-LED intensity to its
maximum.

> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/=
leds-group-multicolor.c
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -108,8 +108,10 @@ static int leds_gmc_probe(struct platform_device *pd=
ev)
> =20
>  		subled[i].color_index =3D led_cdev->color;
> =20
> -		/* Configure the LED intensity to its maximum */
> -		subled[i].intensity =3D max_brightness;
> +		ret =3D device_property_read_u32(led_cdev->dev, "default-intensity",
> +					       &subled[i].intensity);
> +		if (ret || subled[i].intensity > max_brightness)
> +			subled[i].intensity =3D max_brightness;

[Severity: Medium]
Does this logic properly scale the intensity when the individual LEDs in the
group have different maximum brightness values?

If a multicolor group consists of LEDs with vastly different maximum bright=
ness
capabilities (like a GPIO LED maxing at 1 and a PWM LED maxing at 255), the
overall group max_brightness will evaluate to 255.

When reading the default-intensity from the device tree, the value is typic=
ally
specified on the scale of the individual sub-LED's max brightness. If this
value is assigned directly to subled[i].intensity without being scaled up to
the group's max_brightness, the sub-LED might be initialized with only a ti=
ny
fraction of its intended intensity, often resulting in the LED being comple=
tely
unlit instead of at the requested intensity.

>  	}
> =20
>  	/* Initialise the multicolor's LED class device */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813091428.9072=
-1-wahrenst@gmx.net?part=3D1
