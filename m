Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678018;
	b=G0TzL3ix/kbc57etFtayJhTxyCaaIeaUAE0NXvj/VvNRN0k7qD7/242J6hsabbh9UM1U
	 QvfpyURNOQ+mHsk3IhfLNRE7KLh4+PL3/XJv31bic1In8AyMax0IE1YpTRlFgixm/owkj
	 3gq35eXfhy5XgyM3WLCGrXRB6ISmhqbQ45Bdv6br2En0ET0SuwPrWNnZ0vEE1dzZ6fFA0
	 HUqh3glXI3yRy//U00LKRa+ttuF4YqKaMtFJg+FnAC36Id90ezl1yRu1K8wXElllhGKOG
	 BNZY3Co4XjjFJCz/aa5XavYENtfHr6v5i3h2xqWv21nRMAIpJxCYFTxCpVwDe35QRuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678018;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sM3GW1AexIKtlERHr17ooXNtAnZUUAS+RHEopAND2Uc=;
	b=1GeAI1pBTMkB0m3gaMkg/kTEbSWZK4IimvmtuEFRsyB3Wncd1b8O4ST1e+rWcwW2o46y
	 lujLtyb4YVeNkM3HPxPXtdcLz1w/zrrgljM/dMhFaYzfBsWastvCE/aCaKHlSFMg4APXX
	 5zkJtABhliK2WqNF6AuIsTOZNtegR2G8g5XjnRQZByJgzh1/P9s0bY7FWDFIdkz4rcsuQ
	 KG+kHvo9ljztlmvtIHhGbvumlm3XN4Cj/X0rCRKSXlkDEQ1p9nqLyOK7aEQC0kBy6/HXy
	 OXNi5SxxgB11vGxyIzQaqPCMFe1JBAigKjJaMXKV/ju+2SiBlS2Us/YkWBFlTVbesKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbvwdPY2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AC0606A331
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 17:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbvwdPY2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA3C1F000C4;
	Sat, 14 Nov 2026 17:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794678017;
	bh=sM3GW1AexIKtlERHr17ooXNtAnZUUAS+RHEopAND2Uc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fbvwdPY2cw8tSD/8OzR9XQLA4GRN7MPLkmJjXN8J+1KWOEI7d/JzhvhRsTsCcbigf
	 tikfm1Lg9oPg5Lz7bPDB/tssP4xDlCzB3PZPzv3iBwSFu2kFof0XBJLjnGnvX3rHFu
	 OVLbVT36oVNW/XJIaAixR3zLewpm0gFnSXYsXvuur9QC50Q9U2lhZAc4l8Krib6I/H
	 GTWqEdMhBhLBBXzdYXp0kVtO5Q/SQvessq17jeGhsItiOTfx3oI+1oTdcsmwRjKwyz
	 Sxn4oA8DA9LXOCoGHtrTeipN0i59K/GpjBSuexGkdbKFF1gfmbO33vu84aR0DjLAc4
	 4ZXsraO/OkNbw==
Message-ID: <sashiko-outbox-214848@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: pca9532: Propagate I2C errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniil Demakov" <t3127430@gmail.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261114172431.11075-1-t3127430@gmail.com>
References: <20261114141926.92737-1-t3127430@gmail.com>
 <20261114172431.11075-1-t3127430@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 17:40:17 +0000
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
- [Medium] leds: pca9532: u8 duty-cycle truncation in
  pca9532_update_hw_blink()
- [Medium] leds: pca9532: unlocked state updates and rollbacks outside
  update_lock
- [Low] leds: pca9532: LED registered before hardware init in
  pca9532_configure()
--

commit 97438085718f3f15d211a12a646ef74e8799f047
Author: Daniil Demakov <t3127430@gmail.com>

leds: pca9532: Propagate I2C errors

This commit checks SMBus read and write return values across LED, PWM,
blink, GPIO, and initialization paths, and restores the previous LED state
when I2C transfers fail.

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index c8085427696ff..0856c06657071 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c

[ ... ]

> @@ -223,17 +273,32 @@ static int pca9532_update_hw_blink(struct pca9532_l=
ed *led,
>  		}
>  	}
> =20
> -	psc =3D ((delay_on + delay_off) * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
> -	if (psc > U8_MAX) {
> -		/* Blink period too long to be handled by hardware */
> +	if (delay_on > ULONG_MAX - delay_off)
> +		return -EINVAL;
> +
> +	period =3D delay_on + delay_off;
> +
> +	if (!period)
> +		return -EINVAL;
> +
> +	if (period > ((U8_MAX + 1) * 1000) /
> +		     PCA9532_PWM_PERIOD_DIV) {
>  		return -EINVAL;
>  	}
> =20
> -	led->state =3D PCA9532_PWM1;
> +	psc =3D (period * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
> +
>  	data->psc[PCA9532_PWM_ID_1] =3D psc;
> -	data->pwm[PCA9532_PWM_ID_1] =3D (delay_on * PCA9532_PWM_DUTY_DIV) / (de=
lay_on + delay_off);
> +	data->pwm[PCA9532_PWM_ID_1] =3D
> +		(delay_on * PCA9532_PWM_DUTY_DIV) / period;

[Severity: Medium]
Does this truncate the duty cycle to 0 in u8 data->pwm[PCA9532_PWM_ID_1]
when delay_off is 0?

pca9532_set_blink() already replaces (0, 0) with (500, 500) and overflow
is rejected above, so period is never 0 here and the !period check is
unreachable.  When a caller such as delay_off_store() sets delay_off to 0
with a non-zero delay_on, period equals delay_on and the quotient is
PCA9532_PWM_DUTY_DIV (256), which wraps to 0 in u8 and turns the LED off
instead of returning -EINVAL so led_set_software_blink() can handle a
zero delay.  Conversely, when delay_on is 0 and delay_off > 0, this
programs a 0% duty cycle and places the LED into PCA9532_PWM1, causing
subsequent non-zero pca9532_set_brightness() calls to return early at
led->state =3D=3D PCA9532_PWM1.

Checking if (!delay_on || !delay_off) instead of if (!period) would reject
both cases for software fallback.

> +
> +	ret =3D pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
> +	if (ret < 0)
> +		return ret;
> =20
> -	return pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
> +	led->state =3D PCA9532_PWM1;
> +
> +	return 0;
>  }
> =20
>  static int pca9532_set_blink(struct led_classdev *led_cdev,
> @@ -242,6 +307,7 @@ static int pca9532_set_blink(struct led_classdev *led=
_cdev,
>  	struct pca9532_led *led =3D ldev_to_led(led_cdev);
>  	struct i2c_client *client =3D led->client;
>  	struct pca9532_data *data =3D i2c_get_clientdata(client);
> +	int old_state =3D led->state;
>  	int err;
> =20
>  	if (!data->hw_blink)
> @@ -257,16 +323,17 @@ static int pca9532_set_blink(struct led_classdev *l=
ed_cdev,
>  	if (err)
>  		return err;
> =20
> -	pca9532_setled(led);
> +	err =3D pca9532_setled(led);
> +	if (err < 0)
> +		led->state =3D old_state;
> =20
> -	return 0;
> +	return err;
>  }

[Severity: Medium]
Can updating and rolling back led->state and data->pwm[]/data->psc[]
outside data->update_lock race across concurrent brightness, blink, and
GPIO calls?

data->update_lock is only held inside the leaf helpers pca9532_setpwm()
and pca9532_setled(), while pca9532_set_brightness(),
pca9532_update_hw_blink(), pca9532_set_blink(), and
pca9532_gpio_set_value() read old_state, mutate led->state and shared PWM
parameters, sleep on I2C transfers, and write back old_state without the
lock:

CPU0                                  CPU1
pca9532_set_brightness(led0)
  old_state =3D led0->state
  led0->state =3D PCA9532_PWM0
  pca9532_setpwm()
                                      pca9532_gpio_set_value(led0)
                                        old_state =3D PCA9532_PWM0
                                        led0->state =3D PCA9532_ON
                                        pca9532_setled(led0)
  pca9532_setled(led0) -> fails
  led0->state =3D old_state  <-- clobbers CPU1's state

Moving led->state =3D PCA9532_PWM1 to after the sleeping pca9532_setpwm()
call in pca9532_update_hw_blink() also allows two concurrent
pca9532_set_blink() calls on different LEDs with conflicting delays to
both pass the other->state =3D=3D PCA9532_PWM1 check and overwrite
data->psc[PCA9532_PWM_ID_1] and data->pwm[PCA9532_PWM_ID_1].  In addition,
if pca9532_setled() fails in pca9532_set_brightness() or
pca9532_set_blink(), restoring only led->state leaves data->pwm[],
data->psc[], and the hardware PWM/PSC registers modified.

[ ... ]

> @@ -435,6 +531,7 @@ static int pca9532_configure(struct i2c_client *clien=
t,
>  			led->ldev.brightness_set_blocking =3D
>  						pca9532_set_brightness;
>  			led->ldev.blink_set =3D pca9532_set_blink;
> +
>  			err =3D led_classdev_register(&client->dev, &led->ldev);
>  			if (err < 0) {
>  				dev_err(&client->dev,
> @@ -442,19 +539,35 @@ static int pca9532_configure(struct i2c_client *cli=
ent,
>  					led->name);
>  				goto exit;
>  			}
> -			pca9532_setled(led);
> +
> +			err =3D pca9532_setled(led);
> +			if (err < 0) {
> +				dev_err(&client->dev,
> +					"couldn't set LED %s state\n",
> +					led->name);
> +				led_classdev_unregister(&led->ldev);
> +				goto exit;
> +			}

[Severity: Low]
Should pca9532_setled() be called before led_classdev_register(), as
PCA9532_TYPE_N2100_BEEP does below?

led_classdev_register() exposes sysfs attributes and activates
default_trigger before pca9532_setled() writes the initial state, and if
pca9532_setled() fails, led_classdev_unregister() calls
led_set_brightness(LED_OFF) and flushes set_brightness_work, issuing a
second pca9532_setled() transfer on the failing I2C device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114172431.1107=
5-1-t3127430@gmail.com?part=3D1
