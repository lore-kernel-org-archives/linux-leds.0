Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C358630ACE6;
	Tue, 13 Oct 2026 18:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916276; cv=none; b=Tc5u2cts0qeWxuGWkhgxWmHdVEBcoV4duLjBb5GWz2KJftY2cZ3TJ8uz516oMz8czAVxSna6x088+uzbF/O0WCh7Lc5zKHJCwiT17LHIrRlepKs/4M8A7St7QFkdgydPCKImCKgkN47EpY7RKo5wIQdY1ZiZSOVKO2s2TB7vUq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916276; c=relaxed/simple;
	bh=HAsqerMy66RWJ0icDBk2PGI/8gYEIGV/wIA/+L61Ee4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bffJ7yxWqa209Cha5JVGwqrRFzdQMgxXnenaPHkiKBFj/RjhiLPFcfGoNsbSZCQyNggMrqrtwFH6EMkmuRMlrTtWURZf8mHu6V5i7kCR5y7qvF87Zub9GObBdZ7w3d50o8kFI1KfupYeypQamkdUMrpG9nETOlRs0q8dDVfxA3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJCv4mSB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJCv4mSB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EFB1F000FF;
	Tue, 13 Oct 2026 18:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791916275;
	bh=yXHWn0aOXH8cWaxCHfy8ULHo4B5DD/tEBXSesuVupKA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JJCv4mSBEunAcm13eMC3GQzMHNM5hClfDAXxohCfXjotg341uci+pyEhPGTaaO5+w
	 NlNoCMGS6U2FtKc4qqmI2H/l3ZZvW0MC+iwey6sK18fVAcDw4hGkPFpQ8E7BpMPkOH
	 DxJnbKnTJgFwDerFkwDtu2C5uPNjTithxtycR27oZofdVeWBygDyLF3rPSpvH9AoZx
	 Xeha6BwfQGWDIobyKVIpAs5mwMrUthk/lUzgs9mwX5sPjvaEwRrjHNHO6tt/aFsbKx
	 h5RbTUZ/qF9I8WklwwF/zTMHQaJvM99QD7BMJ55+rInuMTy989RYdk+76DkuC1MISE
	 AqEWZmCF2cSgQ==
Message-ID: <sashiko-outbox-170331@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] leds: aat1290: Add support for AAT1270 Current
 Regulator for Flash LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261013181803.496627-4-clamor95@gmail.com>
References: <20261013181803.496627-1-clamor95@gmail.com>
 <20261013181803.496627-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:31:14 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] leds: aat1290: division by zero due to unvalidated flash-max-timeo=
ut-us
- [Medium] leds: aat1290: missing T_OFF reset pulse for AAT1270 SSC protocol
--

commit edf7870e4592e0289f95e937e9de77118e50731c
Author: Svyatoslav Ryhel <clamor95@gmail.com>

leds: aat1290: Add support for AAT1270 Current Regulator for Flash LEDs

The AAT1270 is quite similar to the AAT1290, but it does not support the
Advanced Simple Serial Control (AS2C) used in the AAT1290. The AAT1270
uses an earlier version of AS2C, namely Simple Serial Control, which lacks
address-sending capabilities.

> diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/leds-=
aat1290.c
> --- a/drivers/leds/flash/leds-aat1290.c
> +++ b/drivers/leds/flash/leds-aat1290.c
> @@ -101,15 +113,17 @@ static void aat1290_as2cwire_write(struct aat1290_l=
ed *led, int addr, int value)
> =20
>  	udelay(AAT1290_FLEN_OFF_DELAY_TIME_US);

[Severity: Medium]
Is this delay sufficient to reset the AAT1270? The EN/SET pin is pulled
low for only 10us (AAT1290_FLEN_OFF_DELAY_TIME_US) before sending pulses.
For the AAT1270 SSC protocol, wouldn't a T_OFF duration of >500us be
required to reset the internal counter to 0?

If a user changes the brightness of the AAT1270 LED via sysfs while it is
already on, the driver directly calls aat1290_as2cwire_write() without fully
turning the device off first. Will the Simple Serial Control counter fail
to reset, causing new pulses to accumulate or be ignored?

> -	/* write address */
> -	for (i =3D 0; i < addr; ++i) {
> -		udelay(AAT1290_EN_SET_TICK_TIME_US);
> -		gpiod_direction_output(led->gpio_en_set, 0);
> -		udelay(AAT1290_EN_SET_TICK_TIME_US);
> -		gpiod_direction_output(led->gpio_en_set, 1);
> -	}
> +	if (led->info->as2c) {
> +		/* write address */
> +		for (i =3D 0; i < addr; ++i) {
> +			udelay(AAT1290_EN_SET_TICK_TIME_US);
> +			gpiod_direction_output(led->gpio_en_set, 0);
> +			udelay(AAT1290_EN_SET_TICK_TIME_US);
> +			gpiod_direction_output(led->gpio_en_set, 1);
> +		}

[ ... ]

> @@ -360,7 +379,12 @@ static void aat1290_init_flash_timeout(struct aat129=
0_led *led,
> =20
>  	/* Init flash timeout setting */
>  	setting =3D &fled_cdev->timeout;
> -	setting->min =3D cfg->max_flash_tm / AAT1290_FLASH_TM_NUM_LEVELS;
> +
> +	if (!led->info->fixed_timeout)
> +		setting->min =3D cfg->max_flash_tm / AAT1290_FLASH_TM_NUM_LEVELS;
> +	else
> +		setting->min =3D cfg->max_flash_tm;
> +
>  	setting->max =3D cfg->max_flash_tm;
>  	setting->step =3D setting->min;

[Severity: High]
Could this lead to a division by zero in led_clamp_align()?

If the device tree provides a flash-max-timeout-us less than 16 for the
AAT1290, or 0 for the AAT1270, setting->min evaluates to 0. Since
setting->step is assigned setting->min right below this, step also becomes =
0.

When user-space writes to the flash_timeout sysfs attribute or triggers a
strobe, will led_clamp_align() compute v % s->step and crash the kernel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013181803.4966=
27-1-clamor95@gmail.com?part=3D3
