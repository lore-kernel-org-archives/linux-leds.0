Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101571;
	b=mnDuZj76RTaSfqf8igFCRVQtscalFLEd3dXAdA/HBbCVVeF7bt2nerahWNGrQrUEGjIt
	 ImKWcbQ+VOKWQEABVUt2i5lHkqZurUsmhretBbFw+0CZN7SrZ6rCtgIv9rubSDfC0Etf2
	 2EKDVtR5rjLrcf4PmmNlWfaW1DceYBg7c/BEiYLSvxp2vLxdOWLQVxCqv/qu1efN77C7U
	 U7P6BX3X4F/RVy3NgnAO5zvnOOp+TaI/HQ45ZMQJ1eU3axycw5HCbZm4eBR8+ZSeQvs04
	 ioasZ71bVocy5yIlHanJryXl0m9YiEnkpZe2sK+3PAA6ya/jPzZVisekGD6AlAgtjQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101571;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u5NdGxT+oa0YFqAB6ooI7Tkr7l0+H+ZijJ/X3Dkqahc=;
	b=5SOquzAVdl9TM2pXRym41p5Eyc5GaBIadDJNOaHnwnQMocj5bD06DnNkTy8irhRXGItY
	 jnM9QcOIaHCiT7gkmOYbefN5URN3J1mRKQV5ige+BcKAIXMvpHp/0piBDUZwidpUx8tjV
	 aIeSmpwzYwg32kR4YHg2NZ45mqX9equbrYmgYeHNB022b4TSXc53jekyoijnIB/61Vmv0
	 tjp2RCYc8wk38jR71xSp21CNCGJ1DelxC5DaoSY4nIGLPfpZthfY63GInVFfEFCmSTelF
	 VuRBskvZKPkv9aHQLGYACbpa19eICgxjOmwvxb/HZ+LYg/r7u925EEhhneve3oNXYCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtOA5+5L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784F5606A31A;
	Tue, 27 Oct 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtOA5+5L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8221F01181;
	Tue, 27 Oct 2026 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101571;
	bh=u5NdGxT+oa0YFqAB6ooI7Tkr7l0+H+ZijJ/X3Dkqahc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mtOA5+5LoOhWT1TeLEg7DWORyT+rXK0CaLOBiPqn26F1Jw8G3ls02AaxsDlo2BIVb
	 2t19nEVf9mepJ7bxh2P+hoNYd/odaqgQKxcjGxoWjKEqRScM8ETHNWWXnkGNsPMfRl
	 Io2J8POdsyARQ+TX6HSH6W8BvrdDefsObhUe549GbPOwATl9AvYZxfD05b+GKwoeeF
	 cQ36LnIGAjpUIcrUlD/np6vhUhbh28eEuM7TAK7hfqFc1lZyB3Wrh4PdW+SqBbNVro
	 YMrIOmdPG17b+dmn73gLZ6HbPUd5fb3LYTddQKIwM/LhugVV1J3iB4uh6cD8L3nlWw
	 nxF0+HOBCpLpg==
Message-ID: <sashiko-outbox-186471@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] mfd: aat2870: Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261027113230.47538-4-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
 <20261027113230.47538-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:46:09 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] backlight: aat2870_bl: uninitialized max_current in aat2870_bl_pro=
be()
--

commit 303056dfc011ffb951cd71d913b86ff6e8d6b044
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: aat2870: Convert to use OF bindings

This commit converts the AAT2870 MFD core, regulator, and backlight drivers=
 to
use Device Tree bindings and modern GPIO and regulator frameworks, removing
legacy platform data support.

> diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlig=
ht/aat2870_bl.c
> index e85f2b4d81068..8e889e35621bb 100644
> --- a/drivers/video/backlight/aat2870_bl.c
> +++ b/drivers/video/backlight/aat2870_bl.c

[ ... ]

> @@ -84,24 +92,12 @@ static const struct backlight_ops aat2870_bl_ops =3D {
> =20
>  static int aat2870_bl_probe(struct platform_device *pdev)
>  {
> -	struct aat2870_bl_platform_data *pdata =3D dev_get_platdata(&pdev->dev);
>  	struct aat2870_bl_driver_data *aat2870_bl;
>  	struct backlight_device *bd;
>  	struct backlight_properties props;
> +	u32 max_current;
>  	int ret =3D 0;

[ ... ]

> @@ -128,19 +124,19 @@ static int aat2870_bl_probe(struct platform_device =
*pdev)
> =20
>  	aat2870_bl->bd =3D bd;
> =20
> -	if (pdata->channels > 0)
> -		aat2870_bl->channels =3D pdata->channels;
> -	else
> -		aat2870_bl->channels =3D AAT2870_BL_CH_ALL;
> +	aat2870_bl->channels =3D AAT2870_BL_CH_ALL;
> +	device_property_read_u8(&pdev->dev, "skyworks,channels", &aat2870_bl->c=
hannels);
> +
> +	device_property_read_u32(&pdev->dev, "led-max-microamp", &max_current);
> +	max_current =3D clamp(max_current, AAT2870_CURRENT_MIN, AAT2870_CURRENT=
_MAX);
> +	max_current /=3D AAT2870_CURRENT_STEP;
> =20
>  	/*
>  	 * The maximum number of brightness steps is determined by the max curr=
ent.
> -	 * The aat2870_current enum maps directly to the allowed brightness ste=
ps.
> +	 * The max_current value calculated above maps to the allowed brightness
> +	 * steps with +1 offset since max_current 0 is still 450uA.
>  	 */
> -	if (pdata->max_current > 0)
> -		bd->props.max_brightness =3D pdata->max_current;
> -	else
> -		bd->props.max_brightness =3D AAT2870_CURRENT_27_9;
> +	bd->props.max_brightness =3D max_current + 1;

[Severity: High]
In aat2870_bl_probe(), max_current is declared on the stack without an
initial value. Unlike aat2870_bl->channels, which is initialized to
AAT2870_BL_CH_ALL before device_property_read_u8(), max_current is passed
directly to device_property_read_u32() without a default value or a return
value check.

When the optional led-max-microamp property is absent from the Device Tree
node, device_property_read_u32() returns -EINVAL without modifying
max_current.

Does this cause clamp() to read an uninitialized stack variable, resulting =
in
an arbitrary bd->props.max_brightness value that aat2870_bl_update_status()
then programs into the AAT2870_BLM register? Should max_current be
initialized to AAT2870_CURRENT_MAX prior to calling
device_property_read_u32()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113230.4753=
8-1-clamor95@gmail.com?part=3D3
