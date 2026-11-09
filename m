Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252466;
	b=RQMh1ocBwDWAyKb9ClKKXkQWQ18l3pcrTWzyp2yyJt1D79zhJWdmD8GYiVcgfQ3ssPPS
	 4YFvyvuoNwcVQksFA8dv8E9GDZer3gay/0YZ5PjM6KeQChn0bhlF1mmx3TYr1tM/UBZu4
	 epMOwkKKeh8jDSd576O0c1hCAORRMTzSJ2apXZy1SSQSSwKwQ8+a16xeRWm/ElHCGF96i
	 asZf0gYXSR1GbcdE/O133fF7cY5xj2EjNU0h67NBzJDlSV4X1H4t3YhqCb/O8O3Y16alV
	 B3CMQYpAXpmI10uz8vTG9Ts0X8gDmvVNHdok6PrN9NuIFNnARcwnvJm4PCttwDm+DGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252466;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uriScN78VzvWNY4VdEYdXeq5I6rRjJP3krNe3/6VD0E=;
	b=v3pCC1wMQ4PF1R/XKqX70a5pEi7k0K6tsU2Pe1U6QDfdci64J6SwuNr3bIgbWz2rra9V
	 VBrY3CJrMwJLDLieSyFtnVrqrOyJcZuiUBOLZp6Dm8owlsMuumINKKVINcRPqR58XAVLk
	 4k2oiMK25ZUnvXTkx2W4YCIVz+J1t2rT/FylxoA4IuiHmjXvbJHSkFmlEGgqUhIkKX1Xt
	 Qi5tvm7ktyOkTfdTs5QeX5stALCorweXTSPtZoVDJt4u9P1SM8eg6fJplq7q3XtwARiMp
	 2AP3352O9YqlqO/88m+KiJ0yK+ze2WClwf5xRVdP7p1kTZH48hS2p6wWVtpGZfpwNbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KMpnmk/Z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6DE606A31C;
	Mon,  9 Nov 2026 19:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMpnmk/Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA031F008A1;
	Mon,  9 Nov 2026 19:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794252465;
	bh=uriScN78VzvWNY4VdEYdXeq5I6rRjJP3krNe3/6VD0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KMpnmk/Z9ae1gVBbwutqLEwvydAjDbTQdPpKqL61DJVKICpkzejdki+S/W2T5vXew
	 5mx5Qqs1jaeGF0bAsafxcbV7ycIzD1Xj8pQprzsWvVorjSoOHXzPVg8Imz3WaYPydP
	 lCVGciKik9lOYoIQGrZmUHuKFQQMzl4a1CUCIWqOSTVOxz+kFA/imB2mVvW9CIIv4b
	 /Dv+zPVe0vfKqBT/1Y2zhFbSHZzJpcDMXPNijD2w4kZDy1zBCe3my0ux9MeCJ1Q+Nl
	 ESN/nVCEgz4b1VXVsj4S3wP60lJ5++Z8oyRRn2BCHuqcR4vmbhwB8ElnM2UfH5qNMC
	 gMrqPrfa59F9w==
Message-ID: <sashiko-outbox-205493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/11] leds: rgb: ktd202x: Don't let a blinking LED
 retime another one
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261109-ktd202x-et6326-v2-11-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-11-56e97c226658@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:27:44 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] leds: rgb: ktd202x: on_timer cleared in
  ktd202x_brightness_set() when dimmed
- [Medium] leds: rgb: ktd202x: unlocked cdev->brightness race in
  ktd202x_blink_*_set()
--

commit 2bb78bf782d05191c786ef675dcadd7bc9160236
Author: Joseph Telaak <joseph@telaak.dev>

leds: rgb: ktd202x: Don't let a blinking LED retime another one

This commit tracks which LEDs use the shared PWM1 flash timer so that
starting a blink or hardware pattern on another LED with different timings
returns -EBUSY instead of retiming the active LEDs.

> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd2=
02x.c
> index 0cc2ec3f6a7f6..e2f389d8888c9 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
[ ... ]
> @@ -212,24 +227,13 @@ static int ktd202x_brightness_set(struct ktd202x_le=
d *led,
>  			return ret;
>  	}
> =20
> -	ret =3D regmap_read(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL, &state=
);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * In multicolor case, assume blink mode if PWM is set for at least one
> -	 * channel because another channel cannot be in state ON at the same ti=
me
> -	 */
> +	/* A LED that is turned off stops blinking and leaves the timer */
>  	for (i =3D 0; i < num_channels; i++) {
> -		int channel_state;
> -
> -		channel =3D subleds[i].channel;
> -		channel_state =3D (state >> 2 * channel) & KTD202X_CHANNEL_CTRL_MASK(0=
);
> -		if (channel_state =3D=3D KTD202X_CHANNEL_CTRL_OFF)
> -			continue;
> -		mode_blink =3D channel_state =3D=3D KTD202X_CHANNEL_CTRL_PWM1(0);
> -		break;
> +		if (subleds[i].brightness)
> +			lit =3D true;
>  	}
> +	if (!lit)
> +		led->on_timer =3D false;

[Severity: Medium]
Can this clear led->on_timer while a multicolor LED's overall brightness is
still non-zero?

In __ktd202x_brightness_mc_set(), led_mc_calc_color_components() scales
each subled[i].brightness with DIV_ROUND_CLOSEST(value * intensity,
max_brightness).  When a blinking or breathing multicolor LED is dimmed to
a small non-zero brightness where every channel rounds down to 0, or when
multi_intensity is set to 0 0 0, the LED core keeps the trigger active
because brightness is not LED_OFF, yet !lit clears led->on_timer.  A later
brightness or multi_intensity increase then programs
KTD202X_CHANNEL_CTRL_ON instead of KTD202X_CHANNEL_CTRL_PWM1, leaving the
LED steadily on and letting another LED overwrite the shared timer.

Conversely, ktd202x_timer_set() sets led->on_timer =3D true even when all
subleds[i].brightness are 0.

[ ... ]

> @@ -424,10 +522,26 @@ static int ktd202x_blink_single_set(struct led_clas=
sdev *cdev,
>  	if (!*delay_on)
>  		return ktd202x_brightness_single_set(cdev, LED_OFF);
> =20
> +	mutex_lock(&led->chip->mutex);
> +
> +	/*
> +	 * An unlit LED blinks at the brightness of a software blink, which may
> +	 * be in its off phase, or else at full brightness.
> +	 */
> +	if (!cdev->brightness) {
> +		ret =3D __ktd202x_brightness_single_set(led, cdev->blink_brightness ?:
> +						      cdev->max_brightness);
> +		if (ret)
> +			goto out;
> +	}
> +
>  	info.brightness =3D cdev->brightness;
>  	info.channel =3D led->index;
> =20
> -	return ktd202x_blink_set(led, delay_on, delay_off, &info, 1);
> +	ret =3D ktd202x_blink_set(led, delay_on, delay_off, &info, 1);
> +out:
> +	mutex_unlock(&led->chip->mutex);
> +	return ret;
>  }
> =20
>  static int ktd202x_blink_mc_set(struct led_classdev *cdev,
> @@ -438,12 +552,6 @@ static int ktd202x_blink_mc_set(struct led_classdev =
*cdev,
>  	struct ktd202x_led *led =3D container_of(mc, struct ktd202x_led, mcdev);
>  	int ret;
> =20
> -	if (!cdev->brightness) {
> -		ret =3D ktd202x_brightness_mc_set(cdev, KTD202X_MAX_BRIGHTNESS);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	/* If no blink specified, default to 1 Hz. */
>  	if (!*delay_off && !*delay_on) {
>  		*delay_off =3D 500;
> @@ -454,8 +562,24 @@ static int ktd202x_blink_mc_set(struct led_classdev =
*cdev,
>  	if (!*delay_on)
>  		return ktd202x_brightness_mc_set(cdev, LED_OFF);
> =20
> -	return ktd202x_blink_set(led, delay_on, delay_off, mc->subled_info,
> -				 mc->num_colors);
> +	mutex_lock(&led->chip->mutex);
> +
> +	/*
> +	 * An unlit LED blinks at the brightness of a software blink, which may
> +	 * be in its off phase, or else at full brightness.
> +	 */
> +	if (!cdev->brightness) {
> +		ret =3D __ktd202x_brightness_mc_set(led, cdev->blink_brightness ?:
> +						  KTD202X_MAX_BRIGHTNESS);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	ret =3D ktd202x_blink_set(led, delay_on, delay_off, mc->subled_info,
> +				mc->num_colors);
> +out:
> +	mutex_unlock(&led->chip->mutex);
> +	return ret;
>  }

[Severity: Medium]
Can reading cdev->brightness in ktd202x_blink_single_set() and
ktd202x_blink_mc_set() still race with led_set_brightness_nosleep()?

Because this driver uses brightness_set_blocking,
led_set_brightness_nosleep() updates cdev->brightness without holding
chip->mutex and defers the hardware update to set_brightness_work:

CPU0 (<softirq> / sysfs)          CPU1
led_set_brightness_nosleep()
  cdev->brightness =3D val
  queue_work(set_brightness_work)
                                  ktd202x_blink_mc_set()
                                    mutex_lock(&led->chip->mutex)
                                    if (!cdev->brightness) -> false
                                    ktd202x_blink_set()
                                      ktd202x_timer_set()  <-- chip disabled

When the LED was off in hardware (such as after the off phase of software
blinking), skipping __ktd202x_brightness_mc_set() or
__ktd202x_brightness_single_set() leaves the chip disabled when no other
LED is lit and leaves mc->subled_info[i].brightness at 0, so
ktd202x_timer_set() writes registers to a powered-down chip and leaves the
channels off while setting led->on_timer =3D true.

In ktd202x_blink_single_set(), cdev->brightness is also read a second time
for info.brightness, so a concurrent led_set_brightness_nosleep(cdev,
LED_OFF) can set cdev->brightness =3D 0 in between and pass info.brightness=
 =3D
0 to ktd202x_blink_set().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ktd202x-et=
6326-v2-0-56e97c226658@telaak.dev?part=3D11
