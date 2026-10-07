Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D775247607C;
	Wed,  7 Oct 2026 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363935; cv=none; b=c3ohNEBqlAfKXVp7C2tCdsbrX6SxKUqZ4AN/JO8myGWxVhWEKx+UH2ahFO5Ad15zUWQbtBlHZSpSVzbiZl9HzYIkTIxR+Ac7OeIEsRdM8DV+fEgIhHa9w3MDT+dbu6BD/puIsNaR3+ZTsEw6E8z9FlTWsNXlkd2gDwLbqz/O3vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363935; c=relaxed/simple;
	bh=CYBsxr2IwJA1wCxDoMiuZLUDgGhKOHwyR7+gFg1+dLk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=chfsmGdlFonooHwGwnykA+e0sWOsTkDWGzfzKIZaNEy/ShWHAfC8GIAtgop6DRh8aYaRbzsXhrdwb7TVg/Bb2WGfymHAHC+ofqk37Uf0unyuKpY018QOENTximgDfA/bwXHh/dfQHpDpdpoRiL/Ax129oysi3GMSE6g1zUIOvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9TcxAi8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9TcxAi8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DE71F0089B;
	Wed,  7 Oct 2026 09:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791363905;
	bh=hzC7U8bLRfIHJnmJn7lk5G12sd0Tm8xJmGUwEdKI2Ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P9TcxAi8PjQSrLEN01gtBlhTT8vzD03CC2XBUOiFP9ejqA8giWEyOTVGH1MAV3fNt
	 Mv7gsmeYoIL4Rhibf7SjtoKYovWYxBRipxUpO/h6qGP03SGMStomoclMj0ZzpftOmV
	 sbAVML4jXDlKwWb+z05DAli5O7Ikx90MAJdEsAAMGyBKgXdPzAmWWfVz9qxYNLrU2n
	 KkEzROZjhMB5TjNC7NDPHH65fm4PxNNTlXZFiH/ZHaICf5aac/y8kFSFqsSssXaxTD
	 VKYcEr9r+P/P8y01P3pIMVw0ea1x705hmjPEAbmIJCFiuKR+6VlISiJQ2oitjYVXpX
	 UYosf7xBylv7A==
Message-ID: <sashiko-outbox-162772@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] leds: aat1290: Add support for AAT1270 Current
 Regulator for Flash LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261007085457.98762-4-clamor95@gmail.com>
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:05:04 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] leds: aat1270: silently ignores flash timeout while exposing sys=
fs attribute
--

commit 74189882b25371dce0e983ebf15bb883544c3cfd
Author: Svyatoslav Ryhel <clamor95@gmail.com>

leds: aat1290: Add support for AAT1270 Current Regulator for Flash LEDs

This commit adds support for the AAT1270 flash LED controller. It
differentiates it from the AAT1290 by introducing a chip description struct=
ure
that flags whether the Advanced Simple Serial Control (AS2C) interface is
supported, and gates AS2C-specific features accordingly.

> diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/leds-=
aat1290.c
> index 49251cfd33509..773cdcc73a9e1 100644
> --- a/drivers/leds/flash/leds-aat1290.c
> +++ b/drivers/leds/flash/leds-aat1290.c
[ ... ]
> @@ -178,7 +190,8 @@ static int aat1290_led_flash_strobe_set(struct led_cl=
assdev_flash *fled_cdev,
>  	mutex_lock(&led->lock);
> =20
>  	if (state) {
> -		aat1290_set_flash_safety_timer(led, timeout->val);
> +		if (led->info->as2c)
> +			aat1290_set_flash_safety_timer(led, timeout->val);

[Severity: Medium]
Can this regression silently ignore the flash timeout for the AAT1270 chip
while still exposing the sysfs attribute?

The patch bypasses programming the hardware flash safety timer here for chi=
ps
without AS2C support (like the AAT1270). However, the driver unconditionally
populates the fled_cdev->timeout bounds for all chips in
aat1290_init_flash_timeout():

drivers/leds/flash/leds-aat1290.c:aat1290_init_flash_timeout() {
	...
	/* Init flash timeout setting */
	setting =3D &fled_cdev->timeout;
	setting->min =3D cfg->max_flash_tm / AAT1290_FLASH_TM_NUM_LEVELS;
	setting->max =3D cfg->max_flash_tm;
	setting->step =3D setting->min;
	setting->val =3D setting->max;
}

As a result, the LED subsystem will expose a writable flash_timeout sysfs
attribute to userspace. Userspace can configure a timeout value, believing
it provides safety bounds, but the driver will silently discard it during
the actual flash strobe for the AAT1270.

Could this violate the API contract and mislead userspace into overestimati=
ng
thermal safety margins?

>  		gpiod_direction_output(led->gpio_fl_en, 1);
>  	} else {
>  		gpiod_direction_output(led->gpio_fl_en, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007085457.9876=
2-1-clamor95@gmail.com?part=3D3
