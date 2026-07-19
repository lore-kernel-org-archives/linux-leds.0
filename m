Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE923ACA61
	for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2026 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481191; cv=none; b=c1qZWMBwxTXQeJJQ0z+ZRc1dtxcoizkT9Oa/g1bQ/cNzPr7xxwsz9csYZnYEWXX61/0pX/gMCjBihhuEo3COdoFNRJtlzbCt668C2XnMQF/GtT/uH8du/5YbGgBl9kK1u29SFWZ27BHdVctXPg4NU8QaoSKk2QrB1yahfiPwvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481191; c=relaxed/simple;
	bh=EKSqCmG8GcYAw5x6hCR84lROWbJCCctOVnNO7Jh+jE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I2yWiCYtEHS32uZYflwYOCLzKfhKNRC8eEPBo9LDQDkbAKjmmyE2upnWuRE7nwPDTvc/7FIAXb8IqQ43/CJ01dloAl/UdJamKYBI+b2nJ+gB9nW9S5fyvpghxXw/psOnURtU+gE7OC4gEkOgq/tEr7qn528lQD78QhScj6wMY2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFywsrv4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFywsrv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574BB1F00A3E;
	Sun, 19 Jul 2026 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481186;
	bh=z8gbWlqa7xdY/pwv80dEXE7juT1hIP3mck44hxee5M0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nFywsrv4lh4pDaTL4zWMfX8KjcVFKXk4CUCd37NU1RltQl7vz9iegPugDQIc3/MLB
	 WQjuOob2871TDmzj6eN0bpJvecqh4oWbJpp3iWENBFqAVbd0xaVKYpUFC1yZEjfvlA
	 7pK59f8PUDCydUjTAje6JVJqRZSVlAs08NSJeQgDrD6k/8TR8le5Qtzf8nT4as35C6
	 YRRB8A1nnf8UQf1d6SyFJi0i7gfKnPhuR5IiUtOTz1f6/+PofgAruOEOH+ljTngDMg
	 mH54rxISwbFCLUD0tS/YfavXEfNGJ/26ER8yCT6LeMvGl1op5aDdP/4mYnsDmQ/ua4
	 NyVSEQSR94lfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 09/11] platform/x86: ideapad-laptop: Decouple
 hardware & classdev brightness for keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-9-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
 <20260719-leds-trigger-hw-changed-v3-9-5fb55722e36e@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:13:05 +0000
Message-Id: <20260719171306.574BB1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The refactored initialization path drops hardware brightness val=
idation, allowing registration of buggy hardware states.
--

--- Patch [9]: [PATCH RFC v3 09/11] platform/x86: ideapad-laptop: Decouple =
hardware & classdev brightness for keyboard backlight ---
commit c04be41ffaebded5f3d78556c570769ff717d019
Author: Rong Zhang <i@rong.moe>

platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for k=
eyboard backlight

This commit decouples the hardware brightness from the LED classdev
brightness for keyboard backlights. It converts the last hardware
brightness state into an atomic_t to prevent race conditions and refactors
the initialization path.

> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c

[ ... ]

> @@ -1700,21 +1745,30 @@ static int ideapad_kbd_bl_init(struct ideapad_pri=
vate *priv)
>  	if (WARN_ON(priv->kbd_bl.initialized))
>  		return -EEXIST;
> =20
> -	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
> -		priv->kbd_bl.led.max_brightness =3D 2;
> -	else
> -		priv->kbd_bl.led.max_brightness =3D 1;
> +	hw_brightness =3D ideapad_kbd_bl_hw_brightness_get(priv);
> +	if (hw_brightness < 0)
> +		return hw_brightness;
> =20
> -	brightness =3D ideapad_kbd_bl_brightness_get(priv);
> -	if (brightness < 0)
> -		return brightness;
> +	atomic_set(&priv->kbd_bl.last_hw_brightness, hw_brightness);

[Severity: Medium]
Does this refactored initialization path drop the validation of the initial
hardware brightness?

In the old code, ideapad_kbd_bl_brightness_get() validated the brightness
against max_brightness, returning -EINVAL if the firmware returned an inval=
id
value. This safely aborted the initialization.

In this new flow, ideapad_kbd_bl_hw_brightness_get() just returns the raw
hardware value without validation, because max_brightness is not set until
later in this function, and ideapad_kbd_bl_brightness_parse() is bypassed.

If the firmware boots in a buggy state with an out-of-range brightness, will
this allow the LED class device to register successfully, only to spam dmesg
with "Unknown keyboard backlight value" warnings on every subsequent user-s=
pace
read?

> -	priv->kbd_bl.last_brightness =3D brightness;
>  	priv->kbd_bl.led.name                    =3D "platform::" LED_FUNCTION_=
KBD_BACKLIGHT;
>  	priv->kbd_bl.led.brightness_get          =3D ideapad_kbd_bl_led_cdev_br=
ightness_get;
>  	priv->kbd_bl.led.brightness_set_blocking =3D ideapad_kbd_bl_led_cdev_br=
ightness_set;
>  	priv->kbd_bl.led.flags                   =3D LED_BRIGHT_HW_CHANGED | LE=
D_RETAIN_AT_SHUTDOWN;
> =20
> +	switch (priv->kbd_bl.type) {
> +	case KBD_BL_TRISTATE_AUTO:
> +	case KBD_BL_TRISTATE:
> +		priv->kbd_bl.led.max_brightness =3D 2;
> +		break;
> +	case KBD_BL_STANDARD:
> +		priv->kbd_bl.led.max_brightness =3D 1;
> +		break;
> +	default:
> +		/* This has already been validated by ideapad_check_features(). */
> +		unreachable();
> +	}
> +
>  	err =3D led_classdev_register(&priv->platform_device->dev, &priv->kbd_b=
l.led);
>  	if (err)
>  		return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-leds-trigg=
er-hw-changed-v3-0-5fb55722e36e@rong.moe?part=3D9
