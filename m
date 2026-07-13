Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F953446B9
	for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2026 20:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973711; cv=none; b=AshG68kJqBH0+GcOIBsKkNt6PAwtOBKflUcQawNsvBxWNzerhAZwEoC/tS0XwFdklccXUTW9tFQ/zuh4mU19TnpotZr5+Vs4hxedmJY1dsKvuRCYTA6pYXlRSbsFok2nIM8RAe9AMGXi1EYFkYs2qoLWed2BSPmWbrbU/xJOfEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973711; c=relaxed/simple;
	bh=mI0v/YNMJ+i+xqr84E9wXFrovpAD/GMIIfQd94M9kak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LiG2cXeRkJvFBWWVtOydLd1gHG8EL6wKT8V8sVjIcfev2FIPrqIxdiOAyVD6Cz4FcZ98j/DNXrOOPQqYyvH2Pr07HQ/K/gPBvJrC2RN48xx2PlZ7e0E0tU6S0vy1grCg8P6Xx1kprVKoKZN4NrkFAgThe+r1P7m514EhoSTwAzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koVlrFMI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koVlrFMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426191F000E9;
	Mon, 13 Jul 2026 20:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783973708;
	bh=r5eDDMNCrObAduanMoLu5mAEjAb9pdjhyH0ilehmNZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=koVlrFMIWm6kdrhzGCl0TNmvJihzE7BH9DbQbwgJXCgoeG7CvCpxrdjh2xxVP9epO
	 YhEnMLRTOQFYaucy2OQYa8Ee7XX0YjIi70u24ndwK3AErdp086u6PGk1htvRVVoO7a
	 pAiXk3kvRfVwnqiB+pUAZYOAwWcw5RMl8yidsjR6VOoXV9r5wZF8DC39n65Zu1ShAB
	 ha7NvbKQ6Mw2it2aXNvLZbdXBp1znK5bGb9Yg8oFiS2ebqsDQVgozuyboN5w4ts1Ze
	 aARnDZLOBCwY8U+vmMFIAEM63gHXUyu1gXJJDykYNC2zjXDJroWKaUBz2hbYFhy5/v
	 r9Mr1GoWs5WVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: bcm63138: Use %pe to print pinctrl error instead
 of %ld
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ninad Naik" <ninadnaik07@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260713200732.2470666-1-ninadnaik07@gmail.com>
References: <20260713200732.2470666-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 20:15:07 +0000
Message-Id: <20260713201508.426191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver ignores `-EPROBE_DEFER` from `devm_pinctrl_get_select_d=
efault()`, failing to properly defer probe when the pinctrl driver is not y=
et ready.
- [High] Hardware initialization occurs without holding the required spinlo=
ck after the LED is exposed to user space, causing a data race on shared ha=
rdware registers.
--

--- Patch [1]: [PATCH] leds: bcm63138: Use %pe to print pinctrl error inste=
ad of %ld ---
commit 11674fcbe14b4d4811e6f7f83c90fb13ea7bf5ac
Author: Ninad Naik <ninadnaik07@gmail.com>

leds: bcm63138: Use %pe to print pinctrl error instead of %ld

Pass the pinctrl error pointer directly to %pe to print the
symbolic error name. Detected by Coccinelle. Tested by compiling.

> diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds=
-bcm63138.c
> index 2cf2761e49145..78a87e1df4d7c 100644
> --- a/drivers/leds/blink/leds-bcm63138.c
> +++ b/drivers/leds/blink/leds-bcm63138.c
> @@ -237,8 +237,8 @@ static void bcm63138_leds_create_led(struct bcm63138_=
leds *leds,
> =20
>  	pinctrl =3D devm_pinctrl_get_select_default(led->cdev.dev);
>  	if (IS_ERR(pinctrl) && PTR_ERR(pinctrl) !=3D -ENODEV) {
> -		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %ld\n",
> -			 np, PTR_ERR(pinctrl));
> +		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %pe\n",
> +			 np, pinctrl);
>  	}

[Severity: High]
This is a pre-existing issue, but does this code ignore -EPROBE_DEFER from
devm_pinctrl_get_select_default()?

If the pinctrl provider is probed after this LED driver, it would return
-EPROBE_DEFER. Because the driver merely logs a warning and continues inste=
ad
of returning the error (e.g. via dev_err_probe), the LED device registers
successfully but remains physically non-functional since its pins are never
multiplexed.

> =20
>  	bit =3D BIT(led->pin);
>  	bcm63138_leds_update_bits(leds, BCM63138_PARALLEL_LED_POLARITY, bit,
>  				  led->active_low ? 0 : bit);
>  	bcm63138_leds_update_bits(leds, BCM63138_HW_LED_EN, bit, 0);
>  	bcm63138_leds_set_flash_rate(leds, led, 0);
>  	bcm63138_leds_enable_led(leds, led, led->cdev.brightness);

[Severity: High]
This is also a pre-existing issue, but is it safe to initialize the hardware
without holding the required spinlock after the LED is exposed to user spac=
e?

bcm63138_leds_update_bits() performs a non-atomic read-modify-write on shar=
ed
hardware registers. Calling it locklessly here can race with
bcm63138_leds_brightness_set() from another CPU, which locks leds->lock and
performs its own read-modify-write on the same registers, corrupting the
hardware state of previously registered LEDs.

User space can concurrently write to sysfs attributes of this or other LEDs
during this lockless initialization sequence because
devm_led_classdev_register_ext() was already called earlier in this functio=
n.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713200732.2470=
666-1-ninadnaik07@gmail.com?part=3D1
