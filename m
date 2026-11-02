Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586046;
	b=3J2HQTAeP3RsIU8ILTl1jEPlHfvakh0yNTg/WbJAnenLIhFoSDVlYnTkZx+jd8EaSewk
	 oba5NvIMCoX44StbB1zrCpIp5eZMVXGsn5K0KMPFphD98rS+2sEKqo/HkDAbuGw9IVwo8
	 5UXs27hiODMm9J0VrHT89tY4aXFyWk+PUoalLHGQLrhiyNG6hBBWo+13uujBgSUhNoD1e
	 2aBxxJnhHQKXtaFQIxWKlaU4TxMZjUWs3Vv8Apc1SjBfG6UfTDeaJ5BCG/WLLCtEQSOgN
	 XV5CGnbzCJjiGOGNAZ770e/Xpkw4JKL9XH45VJOQTT/IibroCzleGHnMLPXzSxTByiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586046;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eZAh8bmYYo3lV58kJbc4nd/uT5KMYYMTo/QYww1LYl0=;
	b=pv5NA7VetDmvVd+AkGbB2lI6aZtHzR6oEwvzX1g5XOx70kzEo7VlFSHr15f4M0f4ZZPp
	 zxAtwqhhYKriTX2it5eMlvDFC+YjB5yvhbGoG6B99e08wpz0xoUtuznOy2/Zmpvzz6eNr
	 +t5lHjic8gbZvHohbVag4pI/jBAJgI5Qh8OUgnM/Su/g0YfTOB8pjE7t3+FVK25scrWJ9
	 SlWdtqZ0CD3HgmwL5g+bxE9YIKWpNnceL1JSPvGP+hNijnxTlO+sZKbvAg1mePqjzGedd
	 NMLQdmw1d12XuCMAQ1zyIyL6Eej90UkWtwvxe82w4Aph2+oSMe9alQnsH1UDDSBc4Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zrozr9Zh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DBD606A326;
	Mon,  2 Nov 2026 02:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zrozr9Zh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678B51F00919;
	Mon,  2 Nov 2026 02:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793586045;
	bh=eZAh8bmYYo3lV58kJbc4nd/uT5KMYYMTo/QYww1LYl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zrozr9ZhHXIGKSo0j/2gopTuLPfEZLAbjXsF8T8MoIxYnmR0yfaqSSk7SgSHOvlQ3
	 MGwhpiiQSsfk0/KItionLgefA68YxM2gyJ2UH3H1M7OBmUC58qNJp+M2+il9qBM9da
	 6m0FOxmigVEZVjeSpnpPSfwTPRYW7QYbfn+mU+VutDq1RkSs8R7l7/MT+Z9G8usw9K
	 jCWYGAlvzxhLnmclM42AlCtk7B8KcTqoJhCAJHwQ7LFwGiQlsbwVl7x6IJVglC3LWA
	 jf/yUxdyV3UQ66psnq+teQmt5tnYTXIgvIEsHmVz13O20FLlu38q6CjiSGPMs1VjhN
	 sm88dKghpjz4g==
Message-ID: <sashiko-outbox-192832@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] leds: rgb: ktd202x: Add Etek ET6326 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261101-ktd202x-et6326-v1-6-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-6-eb51eddad08c@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 02:20:45 +0000
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
- [Medium] leds: ktd202x: delay_on truncation to 0 in ktd202x_blink_set() o=
n ET6326
--

commit 7c2c5ad9958f725ed6f4b50a7cb2208921d4f6b4
Author: Joseph Telaak <joseph@telaak.dev>

leds: rgb: ktd202x: Add Etek ET6326 support

This commit moves the LED count and flash period parameters into per-chip
match data and adds support for the Etek ET6326 LED controller.

Link: https://www.etekmicro.com/wp-content/uploads/datasheets/ET6326_datash=
eet.pdf

> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd2=
02x.c
> index feea33b7e8856..67e65c1fcb5fb 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
[ ... ]
> @@ -86,6 +85,33 @@ static const struct reg_default ktd202x_reg_defaults[]=
 =3D {
>  	{ KTD202X_REG_LED_IOUT(3), KTD202X_LED_CURRENT_10_mA },
>  };
> =20
> +struct ktd202x_info {
> +	unsigned long num_leds;
> +	/* Flash period encoded by a Reg1 value of 0 */
> +	unsigned int flash_period_min_ms;
> +	unsigned int flash_period_max_steps;
> +};
[ ... ]
> +/* The ET6326 flash period is (Reg1 + 1) * 128 ms, up to 16.38 s */
> +static const struct ktd202x_info et6326_info =3D {
> +	.num_leds =3D KTD2026_NUM_LEDS,
> +	.flash_period_min_ms =3D 128,
> +	.flash_period_max_steps =3D 127,
> +};
[ ... ]
> @@ -300,11 +328,11 @@ static int ktd202x_blink_set(struct ktd202x_led *le=
d, unsigned long *delay_on,
>  	/* Integer representation of time of flash period */
>  	if (check_add_overflow(*delay_on, *delay_off, &delay_total_ms))
>  		delay_total_ms =3D ULONG_MAX;
> -	if (delay_total_ms < KTD202X_FLASH_PERIOD_MIN_MS)
> +	if (delay_total_ms < info->flash_period_min_ms)
>  		num_steps =3D 0;
>  	else
> -		num_steps =3D min_t(unsigned long, KTD202X_FLASH_PERIOD_MAX_STEPS,
> -				  (delay_total_ms - KTD202X_FLASH_PERIOD_MIN_MS) /
> +		num_steps =3D min_t(unsigned long, info->flash_period_max_steps,
> +				  (delay_total_ms - info->flash_period_min_ms) /
>  				  KTD202X_FLASH_PERIOD_STEP_MS);
> =20
>  	/*
> @@ -315,7 +343,7 @@ static int ktd202x_blink_set(struct ktd202x_led *led,=
 unsigned long *delay_on,
>  	on =3D clamp(on, 1, KTD202X_FLASH_ON_MAX - 1);
> =20
>  	/* Actually used delay_{on,off} values */
> -	delay_total_ms =3D num_steps * KTD202X_FLASH_PERIOD_STEP_MS + KTD202X_F=
LASH_PERIOD_MIN_MS;
> +	delay_total_ms =3D num_steps * KTD202X_FLASH_PERIOD_STEP_MS + info->fla=
sh_period_min_ms;
>  	*delay_on =3D (delay_total_ms * on) / KTD202X_FLASH_ON_MAX;

[Severity: Medium]
Can this integer division truncate *delay_on to 0 on the ET6326?

On the KTD2026 and KTD2027, flash_period_min_ms is 256, which matches
KTD202X_FLASH_ON_MAX (256), so (delay_total_ms * on) / KTD202X_FLASH_ON_MAX
is always at least 1 when on is clamped to a minimum of 1.

With et6326_info setting flash_period_min_ms to 128, if a user configures
a short period where num_steps is 0 (delay_total_ms < 256 ms) and on is
clamped to 1 (for example, writing delay_on =3D 1 and delay_off =3D 127 via
the timer trigger), ktd202x_blink_set() computes:

	delay_total_ms =3D 0 * 128 + 128;
	*delay_on =3D (128 * 1) / 256;

which sets *delay_on to 0 while still programming the hardware to blink
with on =3D 1.

When led_blink_setup() stores blink_delay_on =3D 0, any subsequent write to
delay_off in sysfs calls led_delay_off_store() -> led_blink_set() with
*delay_on =3D=3D 0, hitting the !*delay_on check in ktd202x_blink_single_se=
t()
or ktd202x_blink_mc_set():

	/* Never on - just set to off */
	if (!*delay_on)
		return ktd202x_brightness_single_set(cdev, LED_OFF);

and turning the LED off instead of updating the blink period, which breaks
the invariant from commit fb5b897c7d3f ("leds: rgb: ktd202x: Never program
an on time of zero").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-ktd202x-et=
6326-v1-0-eb51eddad08c@telaak.dev?part=3D6
