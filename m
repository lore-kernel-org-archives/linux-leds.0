Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE41E44A3F2
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372960; cv=none; b=knnp7SxeBPlt2JUac+r10lwVvYCjUy5jxZwtykUgkt513FCC4skHGGMkGjaq5xSbrigWyr2MlVGV+0LKnQzwWvnV3c40mLSxyfWaMEx1uOIhl0L3U8xfo3dioLVPBk/GDJFzqoKg85HUfnxrtJ2H3pBgvSc/qsQwYURzeZWWLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372960; c=relaxed/simple;
	bh=wiTD8+jkVHZFaXrzpBMMhSFtQ16CU/XmzFLMLOy0Az0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ff35xKC9lCsiEMRBj4MdGPpzlXcbBR+2kds3Moba6M+veDCCHDMhkidLTjS29jR2pGyHYLd65GgiUVA7zo9DmacDjgR06zT5EOnfDZzLZ4oPmr7pSCUk4rRL6RLfV4HP6EGlUFN71aYzvmBhBBfEPeSE0NAmUTVtQpesQQ5EHjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrOyh3TT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrOyh3TT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAD11F000E9;
	Wed,  2 Sep 2026 18:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372958;
	bh=FlhH+5kKGH0YP8xHBlt3WKxN2R1mQMtLBD6QQUlTIoE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hrOyh3TTslAI5h2PtS+wnmTcXesJyuydsHUsa64j4NHS3SzS3uUJEQgySlxr/14pR
	 ZPrDn3znp4idBwsNQhHwBHe89Ghhfo0wUaUufU2neMD+mkG0QFtlvI8wLQb38C77dn
	 7A+RfWIvmJvT+RU+Ifw4zatVsDFptM6PYgJl+e7nEzxRNAWOFIuKBsjN2eny6l590+
	 tdxbPfAftJPHg+QWdA5Wo6yJZ1L7mK4yp/JiwNLKyaayl7OBQn/dptP4KRqdDpfMVi
	 5jTEaIuf0LWUfvpbqTXvl+Gq5uLrGGDkAaakOgdi1VArgkak+CdHvroGp6MimMjPHb
	 YeZY8Gm7+o04Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/12] platform/x86: ideapad-laptop: Decouple
 hardware & classdev brightness for keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-11-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-11-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:57 +0000
Message-Id: <20260902181558.5FAD11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Incorrect format string `%d` used for `unsigned int hw_brightness` =
in `dev_warn`.

Pre-existing issues:
- [High] The driver uses the unmanaged `led_classdev_register` API instead =
of the managed `devm_led_classdev_register` API.
--

commit 227fca9f070999fc85599521adcec4975c6e441e
Author: Rong Zhang <i@rong.moe>

platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for k=
eyboard backlight

This commit decouples hardware brightness from LED classdev brightness to
better support models with an ambient light sensor (ALS). It also introduces
a refactor of the initialization path to prepare for exposing the auto
brightness mode.

> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index 684421ba53cbc..712999b6900df 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c

[ ... ]

> @@ -1594,7 +1619,24 @@ static int ideapad_kbd_bl_check_tristate(int type)
>  	return (type =3D=3D KBD_BL_TRISTATE) || (type =3D=3D KBD_BL_TRISTATE_AU=
TO);
>  }
> =20
> -static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
> +static int ideapad_kbd_bl_brightness_parse(struct ideapad_private *priv,=
 unsigned int hw_brightness)
> +{
> +	/* Off, low or high */
> +	if (hw_brightness <=3D priv->kbd_bl.led.max_brightness)
> +		return hw_brightness;
> +
> +	/* Auto (controlled by EC according to ALS), report as off */
> +	if (priv->kbd_bl.type =3D=3D KBD_BL_TRISTATE_AUTO &&
> +	    hw_brightness =3D=3D KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
> +		return 0;
> +
> +	/* Unknown value */
> +	dev_warn(&priv->platform_device->dev,
> +		 "Unknown keyboard backlight value: %d", hw_brightness);

[Severity: Low]
Does this dev_warn() use the correct format string for its argument?
The hw_brightness variable is passed as an unsigned int, but the format
string uses %d which expects a signed int.

> +	return -EINVAL;
> +}

[ ... ]

> @@ -1710,21 +1758,35 @@ static int ideapad_kbd_bl_init(struct ideapad_pri=
vate *priv)
>  	if (err)
>  		return err;

[ ... ]

> +	/* Reject insane values. */
> +	err =3D ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
> +	if (err < 0)
> +		return err;
> +
>  	err =3D led_classdev_register(&priv->platform_device->dev, &priv->kbd_b=
l.led);

[Severity: High]
This isn't a bug introduced by this patch, but should this use the managed
devm_led_classdev_register() API instead?

The LED subsystem guidelines mandate using managed registration APIs to
prevent resource leaks and use-after-free hazards during driver removal.

>  	if (err)
>  		return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D11
