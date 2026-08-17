Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B9448CF7
	for <linux-leds@vger.kernel.org>; Mon, 17 Aug 2026 17:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786987090; cv=none; b=l89BkStrSLCs0O+0d9/a+yHuM/ogyaoJJyLT9IrX8d6IKbphWPTJAm6xgqW1qEJriQUv4rvn+O9GDxNPXbTsQDI8XcV3huu1APzIf91Z+rUAVddlBaXu5hl34OQiW3LgUcDdUsOcxrxbq2KiO2dNe3meLNzw+THPvtd8Y0WZZKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786987090; c=relaxed/simple;
	bh=kpjTI7Gr0Fb+69WPxGUA6fFitgqCbaLwiFh4hq8aZ+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K9m8nhrGGhuTbbeFHHrz8XBd0+L/igVpjN+mHzghkOddlX6Muahz4P1Zbo8uqboSs3hPiua0h+rg42rk9Hfw3GFn3mmoaGo7+aehHFAX39FFIKIKKQN7RGz3yXQVnE3pVHNW8eH+gekcQYP8RhYe95xOnDOalbL/BQZSfajFPBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnEzj/40; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnEzj/40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0241F000E9;
	Mon, 17 Aug 2026 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786987089;
	bh=hRm2ZuPRE4rami4zWoUZyjYkK7rJIN1lymSrdbntFNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OnEzj/40vUJ/qMswWRLU2vDG9sazF4SAETpLb5mBLWIr79kzZvwdbX4xfruvWRA8z
	 EN1leLmH7ae7E27Zgyk726aI22dsV7bljUrySph5ZnpzwRcQzQ5f4cgy0imft7h5eT
	 7/vQM9wBqp/ha7pvtFS42OJISl4zBkLD/Uc3n30pl9eIfzJoirEdCBNLMkWwPg4C7P
	 j0meYOzZHP3YKIaI+rTWYHbfpGchax0aFbn7/kJ5vooXOIMfM7V2Xaw6Tu3galtobh
	 oEi7QysCgOFNBcV+ydiQGhOFLCyYCKoC8nwJje5eiMW+yMYKA5fhUOTbWcn7zkbU8z
	 XQRU7/V3jM0pQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] backlight: led_bl: Add
 devm_led_backlight_register() helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260817170817.1933046-2-alexander.sverdlin@siemens.com>
References: <20260817170817.1933046-1-alexander.sverdlin@siemens.com>
 <20260817170817.1933046-2-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 17:18:08 +0000
Message-Id: <20260817171809.1F0241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The devres registration order for the backlight device and the LED=
 disable action is reversed, creating a TOCTOU race condition on device rem=
oval that allows the hardware to be improperly turned back on.
- [Medium] Hardcoding `dev_name(dev)` as the backlight device name prevents=
 a single device from registering multiple LED-backed backlights.

Pre-existing issues:
- [High] Dereferencing a potentially NULL `supplier` pointer inside `dev_na=
me()` during an error path causes a kernel panic.
--

--- Patch [1]: [PATCH 1/2] backlight: led_bl: Add devm_led_backlight_regist=
er() helper ---
commit 9866a4a9924f34ae7a659947d01fcc9dc9744ec2
Author: Alexander Sverdlin <alexander.sverdlin@siemens.com>

backlight: led_bl: Add devm_led_backlight_register() helper

This commit factors out the backlight registration into a led_bl_register()
helper and adds devm_led_backlight_register(). This allows self-contained
LED providers to expose a backlight interface. It also switches to
devres-managed functions to handle teardown, removing the explicit .remove
callback.

> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/l=
ed_bl.c
> index f7ab9b3607313..f87a48f74186a 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c

[ ... ]

> @@ -203,24 +200,28 @@ static int led_bl_probe(struct platform_device *pde=
v)
>  	props.brightness =3D priv->default_brightness;
>  	props.power =3D (priv->default_brightness > 0) ? BACKLIGHT_POWER_OFF :
>  		      BACKLIGHT_POWER_ON;
> -	priv->bl_dev =3D backlight_device_register(dev_name(&pdev->dev),
> -			&pdev->dev, priv, &led_bl_ops, &props);
> -	if (IS_ERR(priv->bl_dev)) {
> -		dev_err(&pdev->dev, "Failed to register backlight\n");
> -		return PTR_ERR(priv->bl_dev);
> -	}
> +	priv->bl_dev =3D devm_backlight_device_register(dev, dev_name(dev), dev,
> +						      priv, &led_bl_ops, &props);

[Severity: Medium]
Since dev_name(dev) is used for the backlight device name, will this prevent
a single device from registering multiple LED-backed backlights?

If a single controller driver calls devm_led_backlight_register() more than
once for different LEDs, it seems the second call will fail due to a sysfs
naming collision (-EEXIST) because the name is hardcoded to the parent
device's name.

> +	if (IS_ERR(priv->bl_dev))
> +		return dev_err_probe(dev, PTR_ERR(priv->bl_dev),
> +				     "Failed to register backlight\n");
> =20
>  	for (i =3D 0; i < priv->nb_leds; i++) {
> +		struct device *supplier =3D priv->leds[i]->dev->parent;
>  		struct device_link *link;
> =20
> -		link =3D device_link_add(&pdev->dev, priv->leds[i]->dev->parent,
> -				       DL_FLAG_AUTOREMOVE_CONSUMER);
> -		if (!link) {
> -			dev_err(&pdev->dev, "Failed to add devlink (consumer %s, supplier %s)=
\n",
> -				dev_name(&pdev->dev), dev_name(priv->leds[i]->dev->parent));
> -			backlight_device_unregister(priv->bl_dev);
> -			return -EINVAL;
> -		}
> +		/*
> +		 * BL and the LED are the same device if instantiated via
> +		 * devm_led_backlight_register()
> +		 */
> +		if (supplier =3D=3D dev)
> +			continue;
> +
> +		link =3D device_link_add(dev, supplier, DL_FLAG_AUTOREMOVE_CONSUMER);
> +		if (!link)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Failed to add devlink (consumer %s, supplier %s)\n",
> +					     dev_name(dev), dev_name(supplier));

[Severity: High]
This is a pre-existing issue, but could this dev_name(supplier) call trigge=
r a
NULL pointer dereference?

If an LED classdev without a parent device (where parent =3D NULL) is passed
to devm_led_backlight_register(), supplier becomes NULL.

Since device_link_add() unconditionally returns NULL when the supplier is
NULL, the error path will execute and dev_name(supplier) will panic by
dereferencing NULL.

>  	}
> =20
>  	for (i =3D 0; i < priv->nb_leds; i++) {
> @@ -229,26 +230,68 @@ static int led_bl_probe(struct platform_device *pde=
v)
>  		mutex_unlock(&priv->leds[i]->led_access);
>  	}
> =20
> +	ret =3D devm_add_action_or_reset(dev, led_bl_disable, priv);
> +	if (ret)
> +		return ret;

[Severity: High]
Does registering the led_bl_disable action here create a race condition
during device removal?

Because devres actions execute in LIFO order (reverse of registration),
led_bl_disable() will run before the backlight device is unregistered.

This means led_bl_disable() turns off the LED, but the backlight sysfs nodes
are still active. Could userspace write to the backlight's sysfs brightness
attribute during this window, turning the LED back on just before the driver
is removed, thus leaving the hardware powered on?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817170817.1933=
046-1-alexander.sverdlin@siemens.com?part=3D1
