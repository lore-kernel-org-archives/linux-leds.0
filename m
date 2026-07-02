Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9AA381EB6
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015100; cv=none; b=NmmbBCKtdJiEL/86O5VmCJyjplAoAUlSzRWzEDs5NPeN80jAQgmtuulh3zRa+UidnbHsO7xL/Gk+Lx04TdtKTt2GyAEIX7zbmuiA2Q3XFyxkVt9/A8Vgn9WSiDn+zBIsiya+FsKZOJ/uv9ISSzhYIwEAKwCS2U48tjO9fFc0zT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015100; c=relaxed/simple;
	bh=MLQQMnZYLgvWZPpWiJbNA6B3rClxHKt+UKZ6pppnT7Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t4sQq1bmlGnjrc3Md3lUm/GMU06RDKRQcHVSmAFQ/yRd5YapeZ0EgauKcBf4CbF2mQL32WMjH5tq0c/S4UuNy9C51yGtEsw2U6GXDNUOdcZ4FCC7Rvq2o5kvJ4A/P0BHyQQ/WMpSohFx4b42jVew6yA5DwY3yy5gx6A2F+MuXpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlXQ7B0r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlXQ7B0r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F221F000E9;
	Thu,  2 Jul 2026 17:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015099;
	bh=6uXym3GOXUzZKDxtMuE4vE7hZMg58inWXFsbguJnSD4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IlXQ7B0rzIdLf4abxsp3heA1iF7ZWc0MDiMk4sYcfn1K5jc1z6SqNMwU7HZrIvOY1
	 wKa35aVra7Jw7OAslvZLTMIcpQgXzmQxxx9/UwgvioCWkzRBH/MConwquR/NYY5v+o
	 ZF9f47CkblQP2ENQw4OxRqUrgeHPCSaaSh14aFzPt/vG/61vRuLujE0UOPyYPsiYmF
	 0pRTkzRD+O805VyVF54tw9H+x+z/lzCzF+/iANHZHOVaaJemo54kOmvMDf328qzA42
	 m7Ik9h5MO8xKHbnjQIMKWth3HCuFNKV9derFaan2R4L0n5+7OQR/6xZ2aksuqy9j7c
	 zh1DYbc/KgvCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/9] leds: st1202: disable channel when brightness is
 set to zero
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB84973C517D12B589ECA77649C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84973C517D12B589ECA77649C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 17:58:19 +0000
Message-Id: <20260702175819.65F221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver incorrectly registers a sleeping function for the non-b=
locking `brightness_set` callback, leading to 'scheduling while atomic' pan=
ics.
- [High] `st1202_led_set` (mapped to `brightness_set_blocking`) fails to ap=
ply the requested brightness level.
- [High] The driver saves `fwnode` pointers from a scoped device tree itera=
tor without incrementing their reference counts.
- [High] The `pattern_set` implementation fails to clear unused pattern slo=
ts when a pattern sequence shorter than 8 steps is provided.
--

commit 8a281666b5378bc7bda3d6eddc8d9626baa87b6e
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: disable channel when brightness is set to zero

When brightness_set() is called with LED_OFF, only the ILED register is
zeroed; the channel enable bit is left set from probe time. A hardware
channel enabled with ILED=3D0 still draws a small residual current, causing
a dim glow even when the LED is supposed to be off.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 4909985ade04b..2ecd36aae336a 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> @@ -188,6 +160,40 @@ static int st1202_channel_set(struct st1202_chip *ch=
ip, int led_num, bool active
[ ... ]
> +static void st1202_brightness_set(struct led_classdev *led_cdev,
> +				enum led_brightness value)
> +{
> +	struct st1202_led *led =3D cdev_to_st1202_led(led_cdev);
> +	struct st1202_chip *chip =3D led->chip;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	for (int patt =3D 0; patt < ST1202_MAX_PATTERNS; patt++)
> +		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_=
FULL);
> +	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
> +	__st1202_channel_set(chip, led->led_num, !!value);
> +}

[Severity: High]
This isn't a bug introduced by this patch, but this function sleeps by
acquiring a mutex and performing I2C operations.

Since this function is assigned to led_cdev.brightness_set (which is expect=
ed
to be non-blocking and can be called from atomic contexts like software bli=
nk
timers), will this lead to a scheduling while atomic panic? Should this be
assigned to brightness_set_blocking instead?

[ ... ]
>  static int st1202_led_set(struct led_classdev *ldev, enum led_brightness=
 value)
>  {
>  	struct st1202_led *led =3D cdev_to_st1202_led(ldev);

[Severity: High]
This is a pre-existing issue, but st1202_led_set() discards the requested
brightness level.

Based on the surrounding code, this function only toggles the channel boole=
an:

    return st1202_channel_set(led->chip, led->led_num, !!value);

Since this function is mapped to the brightness_set_blocking callback,
wouldn't this mean sysfs writes fail to apply the actual requested brightne=
ss
to the hardware register, effectively breaking brightness control?

> @@ -257,6 +263,10 @@ static int st1202_led_pattern_set(struct led_classde=
v *ldev,
>  	if (ret !=3D 0)
>  		return ret;
> =20
> +	ret =3D __st1202_channel_set(chip, led->led_num, true);
> +	if (ret !=3D 0)
> +		return ret;
> +
>  	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, (ST1202_CONFIG_REG_PA=
TSR |
>  							ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT));
>  	if (ret !=3D 0)
>  		return ret;

[Severity: High]
This is a pre-existing issue, but does st1202_led_pattern_set() fail to cle=
ar
unused pattern slots?

If a pattern sequence shorter than 8 steps (ST1202_MAX_PATTERNS) is provide=
d,
the loop writes up to len but doesn't explicitly write a 0 duration to the
remaining pattern slots. If a longer sequence was previously set, will the
hardware continue executing leftover uninitialized steps using stale data a=
nd
cause erratic flashing?

[Severity: High]
Additionally, there is a pre-existing use-after-free issue in
st1202_dt_init() which isn't shown in this diff.

When saving fwnode pointers from a scoped device tree iterator:

    for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
        ...
        led->fwnode =3D of_fwnode_handle(child);
    }

The scoped iterator automatically drops the reference to the child node when
advancing or exiting. Since fwnode_handle_get() is not called, are we stori=
ng
dangling pointers that could be freed before being passed to
devm_led_classdev_register_ext() later in the probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84972A16ED=
557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D7
