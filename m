Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0293347FC8;
	Sun, 13 Sep 2026 02:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789267831; cv=none; b=Z0ZBvClGteQ3TrD4zvrK41ynhyolAUDB/qZZPMnIwdaguw4xzIxuBsD474RrC+84hrQx4ngpMn5j2g4uQPG29a1oTqSne+oWYkrXSq77HXDTRF+wbUy6NxISyXQV37swKdg7KZM9KKF0BAONmK+2IXo5Shmhygq/ECzMKqQrhBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789267831; c=relaxed/simple;
	bh=aiJYGs+FMH5OX2hy/Awvd2CVN5Lo6RJ5O2JYJzhTpF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QyOoxoFJacxddUt9Oevj2LpB+9yT36Ydqden0cFDtgH8stYc4k4LmByTaVNnWPZvYNt8dtZDYJX7m2bHBxs38pgbmvnMV2VWLOSyx+KpfrpWhEE61XPq9wuZcZtVI3CBPmlODJVBW3wZH0aYVfMyyknHUhCdJFrz76+IbZbLdVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gju1W8I0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gju1W8I0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B121F000FF;
	Sun, 13 Sep 2026 02:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789267829;
	bh=x4tXlspaB6dbevCYfLGiva4ONe6D7VD0ImAfngX/g0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gju1W8I0QAselA4+Cnj8LlmI2aikwx5+I3LyPqjLNjB+z+q9gMSTeCE1lqRKghaGp
	 yh/zjrg2/Z8hR1YopC+x/YNGGg7SqBDBR7usTD7+fiHYQ4RQXW7WtEC3lm6PNeZikc
	 rM3SvjnwOOTIJHJt9+zoJzbFr5TBxYw1w9Bq14ieJorqxnL3MNQB87XHbMHyRMXQux
	 ERqM7T+0Nhhc7ShiYL7z+tSMsYUhyt58kufSDfuFgvMFCofDA5Bf3YALgnSqlXD2qQ
	 2b49AQ+D8HeHnECZ06QFl7yWyu5RTIxDj0Du8bHjcDbbf29V1BNk80kk0eIPce/cmu
	 gvwpLGJYfQXbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] leds: flash: rt8515: Support single-GPIO flash
 ICs with vin supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rudraksha Gupta" <guptarud@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260912-expressatt_camera_flash-v7-2-e1fd2edc8d84@gmail.com>
References: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
 <20260912-expressatt_camera_flash-v7-2-e1fd2edc8d84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 02:50:28 +0000
Message-Id: <20260913025029.34B121F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Regulator is not enabled when requesting maximum torch brightness,=
 preventing the LED from turning on.
- [High] Replacing mod_timer with schedule_delayed_work silently drops upda=
tes to the strobe timeout and causes premature LED power down.
- [Medium] Unbalanced regulator disable due to reliance on the global/physi=
cal regulator state instead of the driver's consumer enable count.

Pre-existing issues:
- [Critical] Premature destruction of mutex and cancellation of workqueue d=
uring device removal while the LED class device is still registered, leadin=
g to a Use-After-Free.
--

commit 6a964f82a818f57f5a1a31366f614609bc9c5008
Author: Rudraksha Gupta <guptarud@gmail.com>

leds: flash: rt8515: Support single-GPIO flash ICs with vin supply

This commit extends the RT8515 driver to support flash ICs that use
only a single GPIO for both flash and torch modes, alongside an
optional vin regulator that gates power to the flash IC.

> diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-r=
t8515.c
> index 00904cc90ed6e..541f61e13f018 100644
> --- a/drivers/leds/flash/leds-rt8515.c
> +++ b/drivers/leds/flash/leds-rt8515.c
[ ... ]
> @@ -62,27 +66,50 @@ static struct rt8515 *to_rt8515(struct led_classdev_f=
lash *fled)
>  	return container_of(fled, struct rt8515, fled);
>  }
> =20
> -static void rt8515_gpio_led_off(struct rt8515 *rt)
> +static int rt8515_gpio_led_off(struct rt8515 *rt)
>  {
> -	gpiod_set_value(rt->enable_flash, 0);
> -	gpiod_set_value(rt->enable_torch, 0);
> +	gpiod_set_value(rt->enable_flash, RT8515_OFF);
> +	gpiod_set_value(rt->enable_torch, RT8515_OFF);
> +
> +	if (!rt->reg)
> +		return 0;
> +
> +	return regulator_is_enabled(rt->reg) > 0 ? regulator_disable(rt->reg) :=
 0;

[Severity: Medium]
Since regulator_is_enabled() returns the global physical state rather than
the per-consumer enable count, could this lead to an unbalanced disable if
the regulator is marked always-on or shared with another consumer?

Because rt8515_gpio_led_off() is reachable from user-controllable sysfs
attributes via rt8515_led_brightness_set(), repeated calls when the driver
has not enabled the regulator might cause the regulator core to throw a
warning and return -EIO. Should the driver maintain its own boolean state
to track whether it has enabled the regulator?

>  }
[ ... ]
> @@ -91,23 +118,37 @@ static int rt8515_led_brightness_set(struct led_clas=
sdev *led,
>  {
>  	struct led_classdev_flash *fled =3D lcdev_to_flcdev(led);
>  	struct rt8515 *rt =3D to_rt8515(fled);
> +	int ret =3D 0;
> =20
>  	mutex_lock(&rt->lock);
> =20
>  	if (brightness =3D=3D LED_OFF) {
> -		/* Off */
> -		rt8515_gpio_led_off(rt);
> +		ret =3D rt8515_gpio_led_off(rt);
> +		if (ret)
> +			goto out;
>  	} else if (brightness < RT8515_TORCH_MAX) {
> -		/* Step it up to movie mode brightness using the flash pin */
> -		rt8515_gpio_brightness_commit(rt->enable_torch, brightness);
> +		/*
> +		 * Step it up to movie mode brightness.
> +		 * If there is no separate torch pin, use the flash pin
> +		 * for torch as well.
> +		 */
> +		ret =3D rt8515_gpio_brightness_commit(rt,
> +				rt->enable_torch ?: rt->enable_flash, brightness);
> +		if (ret)
> +			goto out;
>  	} else {
> -		/* Max torch brightness requested */
> -		gpiod_set_value(rt->enable_torch, 1);
> +		/*
> +		 * Max torch brightness requested.
> +		 * If there is no separate torch pin, use the flash pin
> +		 * for torch as well.
> +		 */
> +		gpiod_set_value(rt->enable_torch ?: rt->enable_flash, RT8515_ON);

[Severity: High]
If a transition is made from LED_OFF directly to max torch brightness, the
optional vin regulator remains disabled because
rt8515_gpio_brightness_commit() is completely bypassed here. Does this mean
the max torch state might silently fail to power the IC?

>  	}
> =20
> +out:
>  	mutex_unlock(&rt->lock);
> =20
> -	return 0;
> +	return ret;
>  }
> =20
>  static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
> @@ -116,27 +157,35 @@ static int rt8515_led_flash_strobe_set(struct led_c=
lassdev_flash *fled,
[ ... ]
> -	if (state) {
> -		/* Enable LED flash mode and set brightness */
> -		rt8515_gpio_brightness_commit(rt->enable_flash, brightness);
> -		/* Set timeout */
> -		mod_timer(&rt->powerdown_timer,
> -			  jiffies + usecs_to_jiffies(timeout->val));
> -	} else {
> -		timer_delete_sync(&rt->powerdown_timer);
> -		/* Turn the LED off */
> -		rt8515_gpio_led_off(rt);
> -	}
> +	/* Enable LED flash mode and set brightness */
> +	ret =3D rt8515_gpio_brightness_commit(rt, rt->enable_flash, brightness);
> +	if (ret)
> +		goto out;
> +
> +	/* Set timeout */
> +	schedule_delayed_work(&rt->powerdown_work, usecs_to_jiffies(timeout->va=
l));

[Severity: High]
Does schedule_delayed_work() correctly handle consecutive flash strobe
commands? Unlike mod_timer(), schedule_delayed_work() silently ignores
updates if the work is already pending. This could cause consecutive V4L2
flash strobes to fail to extend the timeout, shutting down the flash
prematurely.

Additionally, if the delayed work is actively executing and blocked waiting
on rt->lock, its pending bit is cleared. In that scenario, could
schedule_delayed_work() queue a duplicate instance of the work that
immediately shuts down the LED as soon as the lock is released? Would using
mod_delayed_work() resolve these state management issues?

> =20
>  	fled->led_cdev.brightness =3D LED_OFF;
>  	/* After this the torch LED will be disabled */
> =20
> +out:
>  	mutex_unlock(&rt->lock);
> =20
> -	return 0;
> +	return ret;
>  }
[ ... ]
> @@ -327,12 +389,17 @@ static int rt8515_probe(struct platform_device *pde=
v)
[ ... ]
>  	platform_set_drvdata(pdev, rt);
> =20
>  	ret =3D devm_led_classdev_flash_register_ext(dev, fled, &init_data);

[Severity: Critical]
This is a pre-existing issue, but registering the LED class device via the
devm API schedules its sysfs interfaces to be unregistered after
rt8515_remove() returns.

[ ... ]
> @@ -371,7 +438,7 @@ static void rt8515_remove(struct platform_device *pde=
v)
>  	struct rt8515 *rt =3D platform_get_drvdata(pdev);
> =20
>  	rt8515_v4l2_flash_release(rt);
> -	timer_delete_sync(&rt->powerdown_timer);
> +	cancel_delayed_work_sync(&rt->powerdown_work);
>  	mutex_destroy(&rt->lock);

Because devres destroys the sysfs interfaces after this function returns,
could a concurrent user-space write to sysfs (like triggering a flash
strobe) occur during this window? This would cause the sysfs handler to
attempt to lock the destroyed mutex and queue work on the freed device
structure, leading to a use-after-free. Should devm_add_action_or_reset()
be used here instead to ensure the work and mutex are only destroyed after
the devm-managed LED registration is cleanly torn down?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-expressatt=
_camera_flash-v7-0-e1fd2edc8d84@gmail.com?part=3D2
