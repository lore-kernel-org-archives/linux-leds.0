Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110B23ACA5A
	for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2026 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481195; cv=none; b=rdZI+UyM5IeTd+pBp0xOSSJoAe0CMtEH88i7xF9oO4Ul0DQDtpKEefdNAk8Gvib5LVsMiO7pqimj4TvBEgvI9sj5GGaae2h9XxQ5EkbaSP2/gH0XJi0qKpJmxIiHv3HhshmwYFAh7XmgJBN/uLxFnNYySkBmmKAOIh9xWh6vGFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481195; c=relaxed/simple;
	bh=sgXICkWwo+TacwCPeBSqRMcxnSDsKqc+PEAsBMXuilE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DFkYkIDfKxZuyCDgt91hYJ4KJqQaAdDxoHBFLLCbmq1Yrxk2MWVe/35cMnB2qwD30nka0VOJQh5zWJVMOsu50Jd7QpK9D29ZcRQlBHlyJqNLqXNjVLzUsX6hw8sH/qvydUqi8yOny1GGVyrteyZXor9xSghRpW6fkUhgnVkXluU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwbLOj4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwbLOj4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145A21F00A3E;
	Sun, 19 Jul 2026 17:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481192;
	bh=TDvRAMjKXTQ/WM3SP+qmVw84p/QZPsfRlLBxNKSpSP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OwbLOj4GviEfaPgyF5Ku8NzBIIn6bFEAyHkv+kc4T3QSegI9F4snLntSPmDmFsGsw
	 UKvdt/qN8Aob7uIb9Q8vDw6ktosBfNvHAiPn6g/ATSW1JMVPR7XEImQooLrwcNWgbH
	 a8Pz80OUlXl/VipQ6yfSDTBlYBgwUpoypwdvIIJX6RfUBv6NlyO0xRGomwhf2dYoIa
	 /LjjsVcadd/SvfrYoksSpuPL8CfnKr84GqP92M8SkppOAt2CCgVu0FTO2a0pbQzC9X
	 XHBNpXKHQa6wvkS32ua2KdJY2aGOsKAKgoZ7plPVkIuQn3odypmBAz8JtTkYixHOBg
	 W2BcXSs3xGDpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 11/11] platform/x86: ideapad-laptop: Fully
 support auto keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-11-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
 <20260719-leds-trigger-hw-changed-v3-11-5fb55722e36e@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:13:11 +0000
Message-Id: <20260719171312.145A21F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditional hardware control notifications trigger a WARN_ON b=
acktrace in the LED subsystem if the LED trigger fails to register.
--

--- Patch [11]: [PATCH RFC v3 11/11] platform/x86: ideapad-laptop: Fully su=
pport auto keyboard backlight ---
commit 7889db12361e6ba0be277517fc8919a461f9e5eb
Author: Rong Zhang <i@rong.moe>

platform/x86: ideapad-laptop: Fully support auto keyboard backlight

This commit introduces support for the auto brightness mode of the keyboard
backlight on IdeaPad laptops. It decouples the brightness processing from t=
he
LED classdev and adds a private hardware control trigger named ideapad-auto.
Registration failures of this new trigger are handled non-fatally.

> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index 66e16abda5e36..253d2962b9276 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c

[ ... ]

> @@ -1714,9 +1714,58 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(=
struct led_classdev *led_cdev,
> +static void ideapad_kbd_bl_notify_hw_control(struct ideapad_private *pri=
v,
> +					     int hw_brightness, int last_hw_brightness)
> +{
> +	bool hw_control, last_hw_control;
> +
> +	if (priv->kbd_bl.type !=3D KBD_BL_TRISTATE_AUTO)
> +		return;
> +
> +	hw_control =3D hw_brightness =3D=3D KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
> +	last_hw_control =3D last_hw_brightness =3D=3D KBD_BL_AUTO_MODE_HW_BRIGH=
TNESS;
> +
> +	if (hw_control !=3D last_hw_control)
> +		led_trigger_notify_hw_control_changed(&priv->kbd_bl.led, hw_control);

[Severity: Medium]
Will this unconditionally trigger a WARN_ON backtrace in the LED subsystem =
if
the LED trigger fails to register during initialization?

Since the driver supports running in a degraded state when trigger
registration fails, the LED_TRIG_HW_CHANGED flag is skipped on the LED
classdev. However, if the hardware backlight state changes (e.g., via
pressing the Fn+Space hotkey), this notification is dispatched without
checking if the trigger was successfully registered.

Could this be avoided by checking ideapad_kbd_bl_auto_trigger_registered or
the LED_TRIG_HW_CHANGED flag before calling
led_trigger_notify_hw_control_changed() here in
ideapad_kbd_bl_notify_hw_control()?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-leds-trigg=
er-hw-changed-v3-0-5fb55722e36e@rong.moe?part=3D11
