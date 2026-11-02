Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586681;
	b=ieVJ72/e4ICI0hQNeowFZnMSL5bWR93+LlmT3uH2/wYj5vDaMpQaKlUs8PwlgnZPkMEc
	 v3RvYMsSj3ZAXnQGcKHHLJqgrmTbssdDtoGMK17FotWYD2n3sNqHbdzjpwiPK+n7zdLDI
	 1Jq61Hs/dlWrvX5bskp3QFyP54ef0vl0pky0gVGhecgXqkUimd42pGbAUxGNNTSGPIiRE
	 GDKdRpM1eLxz4SojkymqtwRMxCok/jw6EdkYPr04E/jfq/47WfBPkgXrlF8jF3BYZeils
	 ncwovhQMZB1D5yKeFJY1Qhlyx8NUXiVgHcW6fM3CfI+4bdkv8UCkDJ1k4Sqy/ROYWjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586681;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u5MNJlEIQfQn127qhQo2IR1UqQtyiCSnhtJ4iQCGshc=;
	b=paaK2F/9QUGA+oh6+G3djjcLiMRMxKBnPmAaQyhs2x37W2RTesyLxmaDp/DnKzWJ7CBm
	 LcokwWBUdOU/2SZyxZFHiT8KCYdyAUgMda8186Go5J0MfxLK4ZSG6eN65b1QYPXxBjIU+
	 gu5fvPfKYrcVA+s6Vv4nD0Y5z9FIi5atZ6yV7u8ruBu4vNON6LbL2FgNZ93PhQI1fXMPN
	 v9xTT6WqauAEyMV6jsQ0WhBVVSjndUXRVNf757drdpyWJ3+UXnbbKW6YTLiEhNbbAEwmm
	 5ko3OXAvS6qAMAb9GTbK6TPe+b8askm1gft3vORReJGt/xkracZFwS+KDZND9eGEZDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVnBXWhi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B598606A324;
	Mon,  2 Nov 2026 02:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVnBXWhi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBCD1F000C1;
	Mon,  2 Nov 2026 02:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793586680;
	bh=u5MNJlEIQfQn127qhQo2IR1UqQtyiCSnhtJ4iQCGshc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jVnBXWhiu5Grrz0NOfawNKyJCNaldJXjXhoSqJwmcZs3fiT2hy3vKmpBQXnif9pWP
	 EOgq59A3O9BwzV6v1OkRX72+FPGy4okTUEvNGAr5RBbaeqXthcl1mdgaPL1Yrz50Db
	 7vJWt9e8D9LfodW2zKqIubebG1GkV01N16uLM02LccBrf9wdxdioJwTatP2YDak6WN
	 CsxkltmA0lu4IeO/a9YVtkVOZkdY4TvyhSQJTQunyBHz09J7loohmK2L7TNh8EqyOp
	 /O6dFaxyUyBywZb/ziS0EugEQbCXWoe4V7ldj6VTm4ikbvkh60PyT/UTlNR5Y7BFso
	 zYYJZrdqVc1ig==
Message-ID: <sashiko-outbox-192836@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] leds: rgb: ktd202x: Add hardware pattern support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261101-ktd202x-et6326-v1-7-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-7-eb51eddad08c@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 02:31:20 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] leds: ktd202x: ktd202x_pattern_program() enables PWM1 on 0-brigh=
tness channels
--

commit cb2ed015f23bfa814b09df784ba07474c986d4de
Author: Joseph Telaak <joseph@telaak.dev>

leds: rgb: ktd202x: Add hardware pattern support

This commit adds hardware pattern support to the ktd202x LED driver by
implementing the pattern_set and pattern_clear callbacks using the chip's
hardware flash timer and rise/fall ramp registers.

> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd2=
02x.c
> index 67e65c1fcb5fb..ed0e8e74c9eab 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
[ ... ]
> @@ -420,6 +446,148 @@ static int ktd202x_blink_mc_set(struct led_classdev=
 *cdev,
[ ... ]
> +static int ktd202x_pattern_program(struct ktd202x_led *led,
> +				   struct led_pattern *pattern,
> +				   struct mc_subled *subleds,
> +				   unsigned int num_channels)
> +{
> +	const struct ktd202x_info *info =3D led->chip->info;
> +	unsigned int t[KTD202X_PATTERN_LEN];
> +	unsigned int rise, fall, num_steps, on;
> +	unsigned long period_ms, ton_ms;
> +	u8 ctrl_mask =3D 0;
> +	u8 ctrl_pwm1 =3D 0;
> +	int ret;
> +	int i;
> +
> +	for (i =3D 0; i < num_channels; i++) {
> +		int channel =3D subleds[i].channel;
> +
> +		ctrl_mask |=3D KTD202X_CHANNEL_CTRL_MASK(channel);
> +		ctrl_pwm1 |=3D KTD202X_CHANNEL_CTRL_PWM1(channel);
> +	}
> +
> +	for (i =3D 0; i < KTD202X_PATTERN_LEN; i++)
> +		t[i] =3D min_t(u32, pattern[i].delta_t, KTD202X_PATTERN_MAX_MS);
> +
> +	rise =3D min_t(unsigned int, KTD202X_RAMP_MAX_STEPS,
> +		     DIV_ROUND_CLOSEST(t[0], KTD202X_RAMP_STEP_MS));
> +	fall =3D min_t(unsigned int, KTD202X_RAMP_MAX_STEPS,
> +		     DIV_ROUND_CLOSEST(t[2], KTD202X_RAMP_STEP_MS));
> +
> +	/* Round the period up so that the fall ramp is not cut short */
> +	period_ms =3D t[0] + t[1] + t[2] + t[3];
> +	num_steps =3D ktd202x_flash_period_steps(info, period_ms +
> +					       KTD202X_FLASH_PERIOD_STEP_MS - 1);
> +	period_ms =3D ktd202x_flash_period_ms(info, num_steps);
> +
> +	/* The on time includes the rise time */
> +	ton_ms =3D t[0] + t[1];
> +	on =3D clamp_t(unsigned long,
> +		     DIV_ROUND_CLOSEST(ton_ms * KTD202X_FLASH_ON_MAX, period_ms),
> +		     1, KTD202X_FLASH_ON_MAX - 1);
> +
> +	mutex_lock(&led->chip->mutex);
> +
> +	ret =3D regmap_write(led->chip->regmap, KTD202X_REG_FLASH_PERIOD, num_s=
teps);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D regmap_write(led->chip->regmap, KTD202X_REG_PWM1_TIMER, on);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D regmap_write(led->chip->regmap, KTD202X_REG_TRISE_FALL,
> +			   KTD202X_RAMP_TFALL(fall) | KTD202X_RAMP_TRISE(rise));
> +	if (ret)
> +		goto out;
> +
> +	ret =3D regmap_update_bits(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL,
> +				 ctrl_mask, ctrl_pwm1);
> +out:
> +	mutex_unlock(&led->chip->mutex);
> +	return ret;
> +}
> +
> +static int ktd202x_pattern_single_set(struct led_classdev *cdev,
> +				      struct led_pattern *pattern, u32 len,
> +				      int repeat)
> +{
> +	struct ktd202x_led *led =3D container_of(cdev, struct ktd202x_led, cdev=
);
> +	struct mc_subled info;
> +	int ret;
> +
> +	ret =3D ktd202x_pattern_check(cdev, pattern, len, repeat);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ktd202x_brightness_single_set(cdev, pattern[1].brightness);
> +	if (ret)
> +		return ret;
> +
> +	info.channel =3D led->index;
> +
> +	return ktd202x_pattern_program(led, pattern, &info, 1);
> +}
> +
> +static int ktd202x_pattern_single_clear(struct led_classdev *cdev)
> +{
> +	return ktd202x_brightness_single_set(cdev, LED_OFF);
> +}
> +
> +static int ktd202x_pattern_mc_set(struct led_classdev *cdev,
> +				  struct led_pattern *pattern, u32 len,
> +				  int repeat)
> +{
> +	struct led_classdev_mc *mc =3D lcdev_to_mccdev(cdev);
> +	struct ktd202x_led *led =3D container_of(mc, struct ktd202x_led, mcdev);
> +	int ret;
> +
> +	ret =3D ktd202x_pattern_check(cdev, pattern, len, repeat);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ktd202x_brightness_mc_set(cdev, pattern[1].brightness);
> +	if (ret)
> +		return ret;
> +
> +	return ktd202x_pattern_program(led, pattern, mc->subled_info,
> +				       mc->num_colors);
> +}

[Severity: Medium]
When a hardware pattern is set on a multicolor LED where one or more color
channels have a computed brightness of 0 (for example, via multi_intensity),
won't ktd202x_pattern_program() turn those 0-brightness channels on at their
previous or reset-default (10 mA) current?

In ktd202x_pattern_mc_set(), the call to ktd202x_brightness_mc_set() comput=
es
per-channel brightness into mc->subled_info[i].brightness and calls
ktd202x_brightness_set():

drivers/leds/rgb/leds-ktd202x.c:ktd202x_brightness_set() {
	...
	for (i =3D 0; i < num_channels; i++) {
		enum led_brightness brightness;
		int mode;

		brightness =3D subleds[i].brightness;
		channel =3D subleds[i].channel;

		if (brightness) {
			/* Register expects brightness between 0 and MAX_BRIGHTNESS - 1 */
			ret =3D regmap_write(led->chip->regmap, KTD202X_REG_LED_IOUT(channel),
					   brightness - 1);
			...
		} else {
			mode =3D KTD202X_CHANNEL_CTRL_OFF;
		}
		ret =3D regmap_update_bits(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL,
					 KTD202X_CHANNEL_CTRL_MASK(channel), mode);
		...
	}
}

Because KTD202X_REG_LED_IOUT(channel) encodes currents starting at 0.125 mA
(brightness - 1) and cannot encode 0 mA, channels with brightness =3D=3D 0 =
do not
update KTD202X_REG_LED_IOUT(channel) and instead rely on
KTD202X_CHANNEL_CTRL_OFF in KTD202X_REG_CHANNEL_CTRL to remain off.

However, ktd202x_pattern_program() then loops over all num_channels and
unconditionally sets KTD202X_CHANNEL_CTRL_PWM1(channel) in ctrl_pwm1 for ev=
ery
channel regardless of subleds[i].brightness, overwriting
KTD202X_REG_CHANNEL_CTRL so that the 0-brightness channels also breathe on
PWM1.

Also note that ktd202x_pattern_single_set() leaves info.brightness
uninitialized on the stack before passing &info to ktd202x_pattern_program(=
),
and ktd202x_pattern_program() builds ctrl_pwm1 before acquiring
led->chip->mutex (after ktd202x_brightness_mc_set() has already dropped it).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-ktd202x-et=
6326-v1-0-eb51eddad08c@telaak.dev?part=3D7
