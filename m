Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01783793DF
	for <linux-leds@vger.kernel.org>; Thu,  6 Aug 2026 17:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786038172; cv=none; b=CrrwQRv1xVzpZLFeVfNhIMNv/1Ti4UpuQ6KE0fPo1DiZhLr6As3p4Dnn7psppxVNQL9VO+SFm6dvvB38jiu4XNFEdsjVArf14bF2t8/jUElKIt+chd667wGSfKXrWA7r9Zl4ftv7CKQhNW/R2ApBN/CRVX9BXjlWjFsxyVH/+m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786038172; c=relaxed/simple;
	bh=MjJI3Mw/66aNkMiOj/iorEhlCWXBZdpc3Iy17Nxwq3g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OnfmYmAPWronf5xZJ3OJ4lPw9Lk5hqJB/eRLJr/PpT++V9I4yrffJy5QZ/VsC127tpjYtP+ylgxGGko4wt2qLwMqBGCxXuFrwIM7cDM347P+WnAf6U+YCfgvASCRjnZF/gRvRRHGV4f2y8D8ffq843KQc9CrtJcGaLpdP4OZlqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+FmcLgt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+FmcLgt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1771E1F000E9;
	Thu,  6 Aug 2026 17:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786038170;
	bh=42H/00RWG0kzAqEWZhDn9PzXv236cDlKmAquIATw4Ik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T+FmcLgtoZPrIF/SimdL83NtusHe0VKLjrglk6/bp62eoEuWQfDjwHe3kWfgl+QWD
	 w3vbYf8Y08j9KTUYJVT5oM552eRjSIhX47QyoGv8ekQLmkce6xY5uJ8xZotyAe9nWZ
	 yZpw3s0+gyBTi9Qyrv3FuztYxGLST/X4q64Ut//ZxEto8b5EAiKhzvY6CMWuxeiIIx
	 9MGQqdMJ5Cd+7POQQNp44BSCffVvLX9qpxbGCYIpERXoTM4CeD3B4pUHQ7RZwdJYXr
	 fPfTwoM6tmfSTy6X7aaVjq1qXU6kKJSMumfp+RUXNfm9wu6JIWpFn4MU79MrW3p66R
	 lYs+50iVrwHdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/1] leds: st1202: Add hardware-accelerated blink
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497362791595D5C0197701DC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84977DA9A154D7186B6EA2CBC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497362791595D5C0197701DC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:42:49 +0000
Message-Id: <20260806174250.1771E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Hardware blinking destructively overwrites the PWM state of all ot=
her active LEDs, forcing them permanently off.
- [Medium] Hardware blink forces maximum brightness, ignoring user-configur=
ed brightness.

Pre-existing issues:
- [High] The driver improperly assigns a sleeping function to the led_cdev-=
>brightness_set callback, causing a 'sleeping in atomic' bug.
- [High] A dangling fwnode pointer is stored in `led->fwnode` due to a drop=
ped reference count, leading to a UAF upon dereference.
--

--- Patch [1]: [PATCH v6 1/1] leds: st1202: Add hardware-accelerated blink =
support ---
commit d3cba330dd18edf23569d762b5d09a2ae91bdf35
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Add hardware-accelerated blink support

This commit implements blink_set() to enable hardware-accelerated blinking
via the timer trigger on the ST1202 LED driver. The pattern engine is used
to produce a two-step sequence with delays clamped to hardware limits.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 168df5ecf27b7..ea019d03ad907 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> @@ -275,6 +276,89 @@ static int st1202_led_pattern_set(struct led_classde=
v *ldev,
[ ... ]
> +	/* Zero out PWM for all other active channels to prevent them from blin=
king */
> +	for (int i =3D 0; i < ST1202_MAX_LEDS; i++) {
> +		if (!chip->leds[i].is_active || i =3D=3D led->led_num)
> +			continue;
> +		ret =3D st1202_pwm_pattern_write(chip, i, 0, LED_OFF);

[Severity: High]
Does this loop permanently overwrite the PWM configuration for other active
LEDs?

If another LED was previously configured to be statically on, it looks like
this forces it to be permanently dark. When the hardware blink is stopped,
the original PWM configurations for these LEDs are never restored, which
would leave them completely desynchronized from their software
led_cdev->brightness state.

> +		if (ret)
> +			return ret;
> +		ret =3D st1202_pwm_pattern_write(chip, i, 1, LED_OFF);
> +		if (ret)
> +			return ret;
> +	}
[ ... ]
> +	for (int pattern =3D 2; pattern < ST1202_MAX_PATTERNS; pattern++) {
> +		ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + pattern, 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D st1202_write_reg(chip, ST1202_PATTERN_REP, U8_MAX);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);

[Severity: Medium]
Does this force the LED to maximum brightness during a blink, ignoring the
currently configured led_cdev->brightness or led_cdev->blink_brightness?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D __st1202_channel_set(chip, led->led_num, true);
[ ... ]
> @@ -301,6 +385,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
>  		led->led_cdev.pattern_set =3D st1202_led_pattern_set;
>  		led->led_cdev.pattern_clear =3D st1202_led_pattern_clear;
>  		led->led_cdev.default_trigger =3D "pattern";
> +		led->led_cdev.blink_set =3D st1202_blink_set;
>  		led->led_cdev.brightness_set =3D st1202_brightness_set;

[Severity: High]
This is a pre-existing issue, but does assigning st1202_brightness_set() to
the non-blocking brightness_set callback cause a "sleeping in atomic" panic?

The LED subsystem requires that brightness_set not sleep, as it is called
from atomic contexts like software timers. Looking at
st1202_brightness_set(), it takes a mutex and performs I2C operations which
can sleep:

st1202_brightness_set()
    guard(mutex)(&chip->lock);
    ...
    st1202_write_reg() -> i2c_smbus_write_byte_data()

Should this be assigned to brightness_set_blocking instead?

>  		led->led_cdev.brightness_get =3D st1202_brightness_get;
>  	}

[Severity: High]
This is a pre-existing issue, but I noticed a potential use-after-free
relating to how led->fwnode is stored earlier in st1202_dt_init().

The driver iterates over child nodes using
for_each_available_child_of_node_scoped(), which automatically decrements
the child node's reference count at the end of each iteration.

Inside this loop, the fwnode is stored without incrementing its refcount:

    led->fwnode =3D of_fwnode_handle(child);

Since fwnode_handle_get() is not called, does led->fwnode become a dangling
pointer when the loop finishes? This pointer is later passed to the LED
core during registration in st1202_probe(), which could cause a UAF if the
memory is reclaimed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497362791=
595D5C0197701DC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D1
