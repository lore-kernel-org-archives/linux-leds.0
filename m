Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853748;
	b=yYMHWYGAP77cSTfw9dtDX3EVvEArTM78KbE9/XwLAtbC0NZKTQ44q1LIwDvxgiACnrok
	 x9zWLgnZccGI4AnS/kDTZPYzCClv/W1sWpKrD7DgKI170UHxxli0l0rqMnmkS8EGRgel7
	 jfDkEx4pXA3ZUXqx5VMMQtT9tbndhBXL6YripSZdv3NB0mc4ot8ry8+A1d4gxYZG/lcZR
	 lvzDixXx05OUaUdGqIWnuVeu08lKplUFWw3hcE7JFqSKUoFhF6kOUh4uKeVvIqLPW9oe4
	 Wz8oGsJBIHu9ySqsJJsWUxhJVw8IAbjeKmq9Bshaxwum7SE7auxQ7NoPc+r385lSbpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853748;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=snrvhFHrAqhSq5GdQzi6Gq6y1Z2tM6xIcxPthZfPnaE=;
	b=PeGZx6YFOusGQHDZKTutBqNHv3uykKoUS/VOXgRdaRdH0b541hVmnvgc9ClP5kkUFIyx
	 k0n9ldc4xfvYDmiXt3OihOYFEjjncJggIBw6KgTd7j9VJnIotqqVqCRu/1So0FfgmJCX5
	 VkkN6ap6bFFi3ZH1nlEnP8JzRitiz98wNgX63T+QhGGnwKZhNhpR4VGe56tjzl4Q9X7yY
	 7Wp3gQ29DXQoE/mX/ll/e0BQMUnwjdCiyF7FdPAfPn9hbG4RXaMmCHxhcUsu0qxYbfhb9
	 lGaB6a488tMam+VP5h4g+0gi7zUnM+MAMzhKCA94zcxRSXKCnhXaSukWb9TkHO6QRhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qllz/j+K";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3508606A31C
	for <linux-leds@vger.kernel.org>; Mon, 16 Nov 2026 18:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qllz/j+K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A131F000C4;
	Mon, 16 Nov 2026 18:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853747;
	bh=snrvhFHrAqhSq5GdQzi6Gq6y1Z2tM6xIcxPthZfPnaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qllz/j+KCuqgjFLhQWhnSGx1ndcag9Exv9Fcu1IN2Zp4Vpj8xqQ5GEid2WF3uqX/O
	 yNkmYWov8HdSOoGvzKNFff2u5sc+QKrZnePJqn5LNuytDSLHLPRo8KZBV6dqtPNh0Y
	 XjOWjf9UsfHJ1lMICC+CeVeoXyUPu7QbbqcpWeyFdgaU0WuZUt9umW6dCF/WEPtbU7
	 GWRMnxQBeXIUlkw/PBO2HybeRTJZlgHMeahIWdMmMJgdH5JwxImgte9TLGc3sc8bDC
	 /lMNGMWXvbmqRLVx36PXMmGS0HdpK3JH+f3rzHORIRG3xzaVA0rgzFQSQE9NYWV23j
	 leWyw5kerzmXw==
Message-ID: <sashiko-outbox-217499@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: flash: Add driver for the TI LM3554
Reply-To: sashiko-reviews@lists.linux.dev
To: "Volodymyr Chapman" <volodymyrchapman@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116180809.26946-1-volodymyrchapman@gmail.com>
References: <20261116180809.26946-1-volodymyrchapman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 18:29:07 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] leds: lm3554: torch state desynchronization in
  lm3554_strobe_set()
- [Medium] leds: lm3554: enable GPIO left high on regmap init failure in
  lm3554_probe()
- [Low] leds: lm3554: unupdated brightness.val in
  lm3554_flash_brightness_set()
--

commit 4af70dcd92412fb10987222afa3600daf61a796e
Author: Volodymyr Chapman <volodymyrchapman@gmail.com>

leds: flash: Add driver for the TI LM3554

This commit adds an I2C flash LED class driver for the Texas Instruments
LM3554 flash LED controller used on the Lenovo ThinkPad 10.

> diff --git a/drivers/leds/flash/leds-lm3554.c b/drivers/leds/flash/leds-l=
m3554.c
> new file mode 100644
> index 0000000000000..70c526df35827
> --- /dev/null
> +++ b/drivers/leds/flash/leds-lm3554.c

[ ... ]

> +static int lm3554_flash_brightness_set(struct led_classdev_flash *fled_c=
dev,
> +				       u32 brightness)
> +{
> +	struct lm3554 *lm3554 =3D fled_cdev_to_lm3554(fled_cdev);
> +	unsigned int i;
> +
> +	/* Use the highest setting which does not exceed the requested current =
*/
> +	for (i =3D ARRAY_SIZE(lm3554_flash_ua) - 1; i > 0; i--)
> +		if (lm3554_flash_ua[i] <=3D brightness)
> +			break;
> +
> +	guard(mutex)(&lm3554->lock);
> +
> +	return regmap_update_bits(lm3554->regmap, LM3554_REG_FLASH,
> +				  LM3554_FLASH_CURRENT,
> +				  FIELD_PREP(LM3554_FLASH_CURRENT, i));
> +}

[Severity: Low]
Should lm3554_flash_brightness_set() also update fled_cdev->brightness.val
to lm3554_flash_ua[i]?

Because lm3554_probe() sets fled_cdev.brightness.step to 1 and
lm3554_flash_ops does not implement flash_brightness_get, led_clamp_align()
leaves fled_cdev->brightness.val at the unrounded value written by
userspace, so reading flash_brightness from sysfs returns the requested
microamp value rather than the discrete current programmed into the chip.

[ ... ]

> +static int lm3554_strobe_set(struct led_classdev_flash *fled_cdev, bool =
state)
> +{
> +	struct lm3554 *lm3554 =3D fled_cdev_to_lm3554(fled_cdev);
> +	unsigned int flags;
> +	int ret;
> +
> +	guard(mutex)(&lm3554->lock);
> +
> +	if (!state)
> +		return lm3554_set_mode(lm3554, LM3554_MODE_SHUTDOWN);
> +
> +	/* Clear old flags, the timeout flag would otherwise stay set */
> +	ret =3D regmap_read(lm3554->regmap, LM3554_REG_FLAGS, &flags);
> +	if (ret)
> +		return ret;
> +
> +	return lm3554_set_mode(lm3554, LM3554_MODE_FLASH);
> +}

[Severity: Medium]
Can writing flash_strobe while the torch is active leave
fled_cdev->led_cdev.brightness out of sync with the hardware state?

LM3554_MODE is shared between shutdown, torch and flash modes.  Calling
lm3554_strobe_set() while the torch is on turns the torch off (immediately
when state is false, or when the flash timeout expires and clears the mode
bits to shutdown when state is true), but led_cdev.brightness remains
non-zero.  Sysfs brightness reads then report the stale torch level while
the LED is off, and a subsequent suspend/resume cycle via
LED_CORE_SUSPENDRESUME restores led_cdev.brightness and turns the torch
back on.

[ ... ]

> +	lm3554->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(lm3554->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(lm3554->enable_gpio),
> +				     "getting enable GPIO\n");
> +
> +	lm3554->regmap =3D devm_regmap_init_i2c(client, &lm3554_regmap_config);
> +	if (IS_ERR(lm3554->regmap))
> +		return PTR_ERR(lm3554->regmap);
> +
> +	ret =3D devm_add_action_or_reset(dev, lm3554_power_off, lm3554);

[Severity: Medium]
Does an error from devm_regmap_init_i2c() leave enable_gpio asserted high?

devm_gpiod_get() drives enable_gpio high before devm_regmap_init_i2c(),
while lm3554_power_off() is only registered afterwards.  If
devm_regmap_init_i2c() fails, devres releases the GPIO descriptor without
driving the line low, leaving the chip powered on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116180809.2694=
6-1-volodymyrchapman@gmail.com?part=3D1
