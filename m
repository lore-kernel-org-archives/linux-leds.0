Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587185;
	b=fkfXIbUMFW6wbWQJC1zRHgAOtg5FXtg7AG71leCBn75SU+PpJwycrlLSWCy8lWccGPHc
	 JU3exuugk1jhlagBSvurcrpD60pdeymW+8TBbhoXoO0uE8tAkkPQDHkc+1XVFoCrbeZpz
	 9P7l5hNZM5l5NimVx8VAOvfYRdK42Kr26w0bEKeY7dGogCMEDC0CLMSujxKDYY6KzkDLu
	 C4i5aamvBBjseyPK+OMI4+gouwImKEdybstYOWdBzvGZ0PchAHlcl5A9y4stSCtO3/UXm
	 l2tzHiBScrTvCUWTvmkbM+dl7o+fBwLYA3S/uBU+yhyANrLCyHu2PMLZF/Z1SrObkPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587185;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YN7CAHQYrEiziv0650ee/SxosGntzQQ4OAR8LVoeTrE=;
	b=QO2f17bt09Dtjjy2FFUlDUT3sQJvLPpH6Jica+AAOvieZgJm2b+tu/80sn2/mINKShtR
	 QiE3vfDyKbebcx8yJ+unGoa0qkEzXLa+G+VqsXPOKXDbL3FHy6YvUFyyVmfOZ75GAzm1Q
	 M19l6JO9PRoEfy6bc41ZhkbVADqegcSJrjzfvZQLd8fujWjxinhneWM+lcqjLcyZnFk6k
	 h7JniHCzeSyKMqbZLauGvE2I/3IOQ7sE5fALfZAEvEbLvxFub/HAKID/VG+CW7yccwKs4
	 JG8HVyAnnquB1sIo2KeyqOGnNjXsKfI1wKNUOLA0NI+8RNpqrR5QeSY60hEh6+0JcMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jRE7ZxC0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C73B606A324;
	Mon,  2 Nov 2026 02:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jRE7ZxC0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DDF1F000C1;
	Mon,  2 Nov 2026 02:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793587184;
	bh=YN7CAHQYrEiziv0650ee/SxosGntzQQ4OAR8LVoeTrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jRE7ZxC0ue2DmB8TxQJC8ZhFbWEF1EAJTK00+WlqZZQv2UXBsybT8++YVIcfSfO3c
	 mtpjHxdzQSxS6NzZPA1P9/d/zrpBXDhRU5iGyBf8Xcf6KCny9EmlDWlCG0CPn+bf4z
	 4HeupAL2lW62bLQA/SfYJoJXIJ3IPzTbR7NIwJVnqePR1iLeIV0/4ClmQgKhLVqA6S
	 4nCUe3b3dgLLv1Qyld41ajd6b2Dn4pS0LbxUVuC2jpH/99ch9LS8Zj8+69IbtFXq5+
	 cmkHsbOwTd1yVeyYRQbBP1AE5CDPfVLSRycjGaoVll5aVU8nzinVNnb0DIXp7Lt450
	 ulRr9kSmsKNVw==
Message-ID: <sashiko-outbox-192842@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] leds: rgb: ktd202x: Don't let a blinking LED
 retime another one
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261101-ktd202x-et6326-v1-10-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-10-eb51eddad08c@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 02:39:44 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Medium] leds: ktd202x: double truncation in ktd202x_blink_set() breaks t=
imer sharing
- [Medium] leds: ktd202x: ktd202x_timer_set() leaves on_timer set on regist=
er write error
- [Medium] leds: ktd202x: regmap_update_bits() skips timer setup after regu=
lator disable
- [Medium] leds: rgb: ktd202x: race on cdev.brightness in ktd202x_brightnes=
s_set()
- [Medium] leds: rgb: ktd202x: blink_set() clobbers brightness after -EBUSY=
 fallback
- [Medium] leds: ktd202x: race and glitch from unlocked gap before ktd202x_=
timer_set()
- [Low] leds: ktd202x: pattern_set turns LED on in hardware before timer bu=
sy check
--

commit 06fc1f38dbec3466d62b49ae0ee28d54bc03cc75
Author: Joseph Telaak <joseph@telaak.dev>

leds: rgb: ktd202x: Don't let a blinking LED retime another one

This commit tracks which LEDs are actively using the shared PWM1 hardware
flash timer so that a newly blinking or breathing LED only joins the hardwa=
re
timer if it is unused or already configured with the same period, on time,
and ramp timings, returning -EBUSY otherwise.

> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd2=
02x.c
> index 5f51df9930cb2..f4544ba337d17 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
[ ... ]
> @@ -212,24 +225,9 @@ static int ktd202x_brightness_set(struct ktd202x_led=
 *led,
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
> -	for (i =3D 0; i < num_channels; i++) {
> -		int channel_state;
> -
> -		channel =3D subleds[i].channel;
> -		channel_state =3D (state >> 2 * channel) & KTD202X_CHANNEL_CTRL_MASK(0=
);
> -		if (channel_state =3D=3D KTD202X_CHANNEL_CTRL_OFF)
> -			continue;
> -		mode_blink =3D channel_state =3D=3D KTD202X_CHANNEL_CTRL_PWM1(0);
> -		break;
> -	}
> +	/* A LED that is turned off stops blinking and leaves the timer */
> +	if (!led->cdev.brightness)
> +		led->on_timer =3D false;

[Severity: Medium]
Can checking led->cdev.brightness here race with concurrent brightness
updates and fail to clear led->on_timer?

In ktd202x_brightness_single_set() and ktd202x_brightness_mc_set(),
cdev->brightness is written before acquiring led->chip->mutex:

ktd202x_brightness_single_set()
    cdev->brightness =3D value;
    mutex_lock(&led->chip->mutex);
    info.brightness =3D value;
    info.channel =3D led->index;
    ret =3D ktd202x_brightness_set(led, &info, 1);

In addition, the LED core updates led_cdev->brightness synchronously in
led_set_brightness_nosleep() before scheduling set_brightness_work. When a
blinking LED is turned off and immediately set to a new steady brightness
(for example via LED_SET_BRIGHTNESS_OFF followed by LED_SET_BRIGHTNESS in
set_brightness_delayed(), or two concurrent updates), led->cdev.brightness
can already be non-zero by the time ktd202x_brightness_set() runs for the
LED_OFF transition.

In that case, subleds[i].brightness is 0, yet led->cdev.brightness is
non-zero, so led->on_timer stays true and the subsequent non-zero brightness
write puts the channel back into KTD202X_CHANNEL_CTRL_PWM1 instead of steady
KTD202X_CHANNEL_CTRL_ON.

Also, because led_set_brightness(cdev, LED_OFF) defers brightness_set_block=
ing
to set_brightness_work, turning off a blinking LED and immediately setting a
blink or pattern on a second LED can still see other->on_timer set in
ktd202x_timer_busy() before the work item runs. Should ktd202x_brightness_s=
et()
determine whether all channels are off from the subled brightness values
passed under led->chip->mutex?

[ ... ]
> @@ -320,6 +315,89 @@ static unsigned long ktd202x_flash_period_ms(const s=
truct ktd202x_info *info,
>  	return num_steps * KTD202X_FLASH_PERIOD_STEP_MS + info->flash_period_mi=
n_ms;
>  }
> =20
[ ... ]
> +/* Called with the chip mutex held */
> +static int ktd202x_timer_set(struct ktd202x_led *led, struct mc_subled *=
subleds,
> +			     unsigned int num_channels, u8 flash_period, u8 flash_on,
> +			     u8 ramp_times)
> +{
> +	struct ktd202x *chip =3D led->chip;
> +	u8 ctrl_mask =3D 0;
> +	u8 ctrl_mode =3D 0;
> +	bool busy;
> +	int ret;
> +	int i;
> +
> +	busy =3D ktd202x_timer_busy(led, flash_period, flash_on, ramp_times);
> +	led->on_timer =3D !busy;
> +
> +	for (i =3D 0; i < num_channels; i++) {
> +		int channel =3D subleds[i].channel;
> +
> +		ctrl_mask |=3D KTD202X_CHANNEL_CTRL_MASK(channel);
> +		ctrl_mode |=3D ktd202x_channel_mode(led, channel);
> +	}
> +
> +	/* Without the timer, leave the LED steadily on */
> +	if (busy) {
> +		ret =3D regmap_update_bits(chip->regmap, KTD202X_REG_CHANNEL_CTRL,
> +					 ctrl_mask, ctrl_mode);
> +		return ret ? ret : -EBUSY;
> +	}
> +
> +	chip->flash_period =3D flash_period;
> +	chip->flash_on =3D flash_on;
> +	chip->ramp_times =3D ramp_times;
> +
> +	/*
> +	 * Update the timer registers only when they change, so that the
> +	 * blink of another LED on the timer is not restarted.
> +	 */
> +	ret =3D regmap_update_bits(chip->regmap, KTD202X_REG_FLASH_PERIOD, 0xff,
> +				 flash_period);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(chip->regmap, KTD202X_REG_PWM1_TIMER, 0xff,
> +				 flash_on);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(chip->regmap, KTD202X_REG_TRISE_FALL, 0xff,
> +				 ramp_times);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(chip->regmap, KTD202X_REG_CHANNEL_CTRL,
> +				  ctrl_mask, ctrl_mode);
> +}

[Severity: Medium]
If one of the four regmap_update_bits() calls in the !busy path of
ktd202x_timer_set() fails, won't led->on_timer remain true?

When called from ktd202x_blink_set(), returning a negative error code causes
led_blink_setup() in the LED core to fall back to software blinking without
first setting brightness to LED_OFF. With led->on_timer left set to true,
each software blink ON tick in ktd202x_brightness_set() will program
KTD202X_CHANNEL_CTRL_PWM1 instead of KTD202X_CHANNEL_CTRL_ON, and
ktd202x_timer_busy() will treat this LED as occupying the hardware timer
with the partially updated chip->flash_period, chip->flash_on, and
chip->ramp_times values.

Should led->on_timer and the chip timer fields only be committed once the
register writes succeed (or rolled back on error)?

[Severity: Medium]
Also in ktd202x_timer_set(), could switching KTD202X_REG_FLASH_PERIOD,
KTD202X_REG_PWM1_TIMER, and KTD202X_REG_TRISE_FALL from regmap_write() to
regmap_update_bits() skip programming the hardware timer after the chip has
been powered down?

When all LEDs are turned off, ktd202x_brightness_set() calls
ktd202x_chip_disable(), which disables the vin and vio regulators without
invalidating the REGCACHE_FLAT cache:

ktd202x_brightness_set()
    ktd202x_chip_disable()
        regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_ENABL=
E_CTRL_SLEEP);
        regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulato=
rs);

If disabling the regulators removes power from the chip, the hardware timer
registers reset to their power-on defaults, while REGCACHE_FLAT retains the
last values written before power-down. Previously regmap_write() always
transmitted the timer registers over I2C, whereas regmap_update_bits() skips
the write when the cached value matches. If an LED is later set to blink or
breathe with the same timings as before the chip was disabled, won't
regmap_update_bits() elide the register writes and leave the chip running at
its reset defaults?

> @@ -363,28 +440,19 @@ static int ktd202x_blink_set(struct ktd202x_led *le=
d, unsigned long *delay_on,
>  	on =3D mul_u64_u64_div_u64(*delay_on, KTD202X_FLASH_ON_MAX, delay_total=
_ms);
>  	on =3D clamp(on, 1, KTD202X_FLASH_ON_MAX - 1);
> =20
> +	/*
> +	 * Without the ramps a hardware pattern may have set. On -EBUSY the
> +	 * LED core falls back to software blinking.
> +	 */
> +	ret =3D ktd202x_timer_set(led, subleds, num_channels, num_steps, on,
> +				KTD202X_RAMP_TIMES_2_MS);
> +	if (ret)
> +		goto out;
> +
>  	/* Actually used delay_{on,off} values */
>  	delay_total_ms =3D ktd202x_flash_period_ms(info, num_steps);
>  	*delay_on =3D (delay_total_ms * on) / KTD202X_FLASH_ON_MAX;
>  	*delay_off =3D delay_total_ms - *delay_on;

[Severity: Medium]
Documentation/leds/leds-ktd202x.rst notes:

"To share the timer, give the second LED the delays that the first one reads
back."

Does round-tripping the read-back delay_on and delay_off values through
ktd202x_blink_set() actually produce the same flash_on value when both
(delay_total_ms / 128) and on are odd?

Because delay_total_ms is a multiple of 128 ms (128 * k) and
KTD202X_FLASH_ON_MAX is 256, computing the read-back delay_on on the first
LED truncates towards zero:

    *delay_on =3D (delay_total_ms * on) / KTD202X_FLASH_ON_MAX;

which is (k * on) / 2. Whenever k and on are both odd (for example, the
default 500 ms / 500 ms blink on KTD2026/KTD2027 gives num_steps =3D 5,
delay_total_ms =3D 896 ms with k =3D 7, and any odd on step such as on =3D =
129
reads back as delay_on =3D 451 ms, delay_off =3D 445 ms), *delay_on truncat=
es
to (k * on - 1) / 2.

When those read-back delays are written to the second LED,
ktd202x_blink_set() computes:

    on =3D mul_u64_u64_div_u64(*delay_on, KTD202X_FLASH_ON_MAX, delay_total=
_ms);

which evaluates to ((k * chip->flash_on - 1) / 2 * 256) / (128 * k) =3D
chip->flash_on - 1. That causes ktd202x_timer_busy() to see flash_on !=3D
chip->flash_on and reject the second LED with -EBUSY. Should the conversion
from *delay_on to on (or both conversions) round to nearest instead of
truncating twice?

[Severity: Medium]
When ktd202x_timer_set() returns -EBUSY here and the LED core falls back to
software blinking, can a subsequent update to delay_on or delay_off clobber
the LED's configured brightness?

In drivers/leds/led-core.c, led_blink_setup() falls back to
led_set_software_blink(), where led_timer_function() alternates
cdev->brightness between cdev->blink_brightness and LED_OFF (0). If the user
later writes delay_on or delay_off via sysfs while the software blink timer
happens to be in its OFF half-cycle (so cdev->brightness is 0 while
cdev->blink_brightness holds the configured brightness),
ktd202x_blink_single_set() and ktd202x_blink_mc_set() do:

ktd202x_blink_single_set()
    if (!cdev->brightness) {
        ret =3D ktd202x_brightness_single_set(cdev, cdev->max_brightness);
        if (ret)
            return ret;
    }

Wouldn't this overwrite a lower configured brightness with max_brightness (=
or
KTD202X_MAX_BRIGHTNESS in ktd202x_blink_mc_set()) instead of preserving
cdev->blink_brightness?

[ ... ]
> @@ -556,7 +601,11 @@ static int ktd202x_pattern_single_set(struct led_cla=
ssdev *cdev,
> =20
>  	info.channel =3D led->index;
> =20
> -	return ktd202x_pattern_program(led, pattern, &info, 1);
> +	ret =3D ktd202x_pattern_program(led, pattern, &info, 1);
> +	if (ret)
> +		ktd202x_brightness_single_set(cdev, LED_OFF);
> +
> +	return ret;
>  }
> =20
>  static int ktd202x_pattern_single_clear(struct led_classdev *cdev)
> @@ -580,8 +629,12 @@ static int ktd202x_pattern_mc_set(struct led_classde=
v *cdev,
>  	if (ret)
>  		return ret;
> =20
> -	return ktd202x_pattern_program(led, pattern, mc->subled_info,
> -				       mc->num_colors);
> +	ret =3D ktd202x_pattern_program(led, pattern, mc->subled_info,
> +				      mc->num_colors);
> +	if (ret)
> +		ktd202x_brightness_mc_set(cdev, LED_OFF);
> +
> +	return ret;
>  }

[Severity: Low]
In ktd202x_pattern_single_set() and ktd202x_pattern_mc_set(),
ktd202x_brightness_single_set() or ktd202x_brightness_mc_set() is called
before ktd202x_pattern_program().

When another LED is already using the timer with different parameters, won't
this turn the LED physically on in hardware over I2C at pattern[1].brightne=
ss
(and write KTD202X_CHANNEL_CTRL_ON again in the busy branch of
ktd202x_timer_set()), only to turn it back off over I2C when
ktd202x_pattern_program() returns -EBUSY, causing a brief flash on an off L=
ED
(or turning off an LED that was previously lit)?

[Severity: Medium]
Relatedly, because ktd202x_brightness_single_set() and
ktd202x_brightness_mc_set() release led->chip->mutex before
ktd202x_blink_set() or ktd202x_pattern_program() re-acquires it to call
ktd202x_timer_set(), can an intervening LED_OFF update race in that unlocked
window?

For example, if a queued set_brightness_work item (from a prior software
blink or software pattern timer tick, or multi_intensity_store() when
brightness is 0) or a concurrent delay_on=3D0 write runs
ktd202x_brightness_set() with LED_OFF between the brightness call and
ktd202x_timer_set():

CPU0                                     CPU1
ktd202x_pattern_single_set()
  ktd202x_brightness_single_set()
    mutex_lock(&chip->mutex)
    ...
    mutex_unlock(&chip->mutex)
                                         set_brightness_delayed()
                                           ktd202x_brightness_single_set(cd=
ev, LED_OFF)
                                             mutex_lock(&chip->mutex)
                                             led->on_timer =3D false;
                                             /* channel OFF, chip disabled =
*/
                                             mutex_unlock(&chip->mutex)
  ktd202x_pattern_program()
    mutex_lock(&chip->mutex)
    ktd202x_timer_set()
      led->on_timer =3D true;
      /* sets channel to PWM1 */
    mutex_unlock(&chip->mutex)

Wouldn't ktd202x_timer_set() set led->on_timer =3D true and enable PWM1 on =
the
channel even though cdev->brightness is now 0 (and the chip may have been
disabled by ktd202x_chip_disable())?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-ktd202x-et=
6326-v1-0-eb51eddad08c@telaak.dev?part=3D10
