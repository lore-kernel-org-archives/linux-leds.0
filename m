Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7EC4C9E09
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 14:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332198; cv=none; b=J9tVqKloFdosF9fSz9u3277/9ftydjIVngwUNoj6Y7XYuCYv2qrFpcYRKmD9q70voCtYVN8JjLXOk4Ng2fC8PG70cNh+7U+u/6kZIhHPqhEvSTDV6ZMRPnW0mZEL2/dmJ0syYiBCsa5FsB9WvdByMhQ9kLD+KaBsRX6Ym+NEqUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332198; c=relaxed/simple;
	bh=kY3RGD1yyHclWe6WevH8rQ5PNjEKoXKzE9WWRE5tY2o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=B4IckA+G9YzssZdzWxOTUnMcHTntgbsfBrtnaYD8FH2VOCfCeLOq5mexsQAukstGlU3SBVZwpqK0btIQlIt5e/sULYtRwiE8KBfa4uW0kKYGi05oHnxH+/TAb5Q0gmbaBchduEWRATuYpPnegpG/BL8LPD9s/BiVgg9p+ZSRtMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6Vq5U3t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6Vq5U3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F881F000C4;
	Sun, 18 Oct 2026 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792332194;
	bh=2h+W9g82glmpR+WfJ1Y4FW/Gw5CgOUCHxldYfVoNsjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l6Vq5U3tYoZ9TN6dfgNd5iS7iCL++5BZwBVkkUz198FLBcoYeYUgSu2Y77KkBMWjS
	 CljysuGfB7JT1aoE7bsbQDYCH1Ms/mwl94s7q9GBELMkrObR7iAz30pqznEGgXEHnF
	 IrnZSig+PLJE/t3FnJdKw9K76UG8VzXtnPMtptGxoJaJgWQkNOoZxNYpIUD7Ch5vg5
	 tb8WejKnGYMF4ixF8cv77ugCaQFqmfvhvLgYiAdr6jb3sS9IXE5270DVax3RjQ73Pz
	 93qpQPuvcniaS2h754J+xfcnFoxa//BcMDN5vYdLxktfncW4ezTajMXKKr2IpL7qu6
	 IE1iP4ygq/slg==
Message-ID: <sashiko-outbox-176178@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] leds: class: Take the LED access lock when
 reading brightness_hw_changed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018135339.1109271-7-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-7-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 14:03:14 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] leds: one-sided locking in brightness_hw_changed_show()
--

commit ef875f7f46dcbf0a55900c763a37bd3cfcb02775
Author: Armin Wolf <W_Armin@gmx.de>

leds: class: Take the LED access lock when reading brightness_hw_changed

This patch acquires the led_cdev->led_access mutex in
brightness_hw_changed_show() to guard reading brightness_hw_changed
against concurrent updates by led_classdev_notify_brightness_hw_changed().

> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index e1f1b710536b0..77a0fce039528 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
[ ... ]
> @@ -102,11 +103,15 @@ static ssize_t brightness_hw_changed_show(struct de=
vice *dev, const struct devic
>  					  char *buf)
>  {
>  	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +	unsigned int brightness_hw_changed;
> =20
> -	if (led_cdev->brightness_hw_changed =3D=3D -1)
> +	scoped_guard(mutex, &led_cdev->led_access)
> +		brightness_hw_changed =3D led_cdev->brightness_hw_changed;
> +
> +	if (brightness_hw_changed =3D=3D -1)
>  		return -ENODATA;
> =20
> -	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
> +	return sysfs_emit(buf, "%u\n", brightness_hw_changed);
>  }
> =20
>  static const DEVICE_ATTR_RO(brightness_hw_changed);

[Severity: Medium]
Does taking led_cdev->led_access here actually synchronize against
led_classdev_notify_brightness_hw_changed()?

Looking at drivers/leds/led-class.c, the writer updates
led_cdev->brightness_hw_changed without holding led_cdev->led_access:

void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_cde=
v, unsigned int brightness)
{
	led_cdev->brightness_hw_changed =3D brightness;
	sysfs_notify(&led_cdev->dev->kobj, NULL, "brightness_hw_changed");
}

In addition, most callers invoke led_classdev_notify_brightness_hw_changed()
without holding led_cdev->led_access, such as t14s_kbd_bl_update() in
drivers/platform/arm64/lenovo-thinkpad-t14s.c:

static void t14s_kbd_bl_update(struct t14s_ec *ec)
{
	enum led_brightness brightness =3D t14s_kbd_bl_get(&ec->kbd_backlight);

	led_classdev_notify_brightness_hw_changed(&ec->kbd_backlight, brightness);
}

Some callers also run in atomic context where a sleeping mutex cannot be
taken, such as lg_g15_raw_event() -> lg_g13_event() in
drivers/hid/hid-lg-g15.c:

	if (backlight_disabled ^ g15->backlight_disabled) {
		led_classdev_notify_brightness_hw_changed(
			&g15->leds[LG_G15_KBD_BRIGHTNESS].mcdev.led_cdev,
			backlight_disabled
			? 0 : g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
		g15->backlight_disabled =3D backlight_disabled;
	}

Meanwhile, uniwill_ec_notify() in drivers/platform/x86/uniwill/uniwill-acpi=
.c
already holds led_cdev->led_access across the call:

	guard(mutex)(&led_cdev->led_access);

	/* Sync the LED brightness with the actual hardware state */
	ret =3D led_update_brightness(led_cdev);
	if (ret < 0)
		return ret;

	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);

Since the writer side does not consistently hold led_cdev->led_access (and
cannot take it inside led_classdev_notify_brightness_hw_changed() without
sleeping in atomic context or deadlocking uniwill_ec_notify()), should
brightness_hw_changed_show() and led_classdev_notify_brightness_hw_changed()
use READ_ONCE() and WRITE_ONCE() instead, similar to how trigger_hw_changed
is handled in drivers/leds/led-triggers.c?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018135339.1109=
271-1-W_Armin@gmx.de?part=3D6
