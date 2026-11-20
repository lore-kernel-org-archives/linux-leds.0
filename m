Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162172;
	b=b5+kWoS4hej5t/pnAREiR5AWOld34mr6XEb9hfsUe0IfEUhVV0NBtoV9PKKuiHDRyUTO
	 M0/yCzU681D1XiMdT10xLqAbOGXCPq364+5zDY0Lth/FHrceuS77OJp67HrepUHwTCh1s
	 CO6Cc11U+UQgJvoL1b0kqPPB/ZIGN2exYUpnsLM5hJI/R8GjeL+xXPtrzj2k33YTNoUCw
	 YpWoBuzeviXyyERMq9dE7AuqsF70lbdnYlOO7W3NpiABrgmB53FCVLfsu7UEE9hmnw33O
	 mW6eCQ3iy6E6YFv0knoohzB9aXalxLvh7xV1wugzxUT2OdOxtE67Y2vc2BwVWQ/1JxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162172;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mQpEJ3SKblBleD6wbvkCxkPdsG/OfH4sPlVVe67evO0=;
	b=kan1v3mbSa9v/TdhQU77YafTLFboQzAm8WHBNnVtFFqzgH3ny81R6HlSOqL9bvJo5jmu
	 NP37fJH48jQQ8QY11XTIjQgXoa2WLkTj0lMzTtB8eqUfx+TqLSKlnYwvc0Y2ERpch0KTV
	 TrhfgBeDb5bimLYXCaEXand1BGoix2jh6yK4M8XkvpM0Sq2d1ganL56Qa4dxbxJ/svnTl
	 MEG2cuqsZmLzSPrvqeZJa3mDtJUmfYnZ2jXuTfu7IVmQggOHxoGF+lowvyZuBShC1fuDM
	 94z6gDCyzuyyGib021f8ma/8LaHMkg2jT1BBQiZ8Dx23L9+aPRqZQoUrd8ORXxTITjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ag9CbeAa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D805D606A32A
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 08:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ag9CbeAa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872DC1F000D2;
	Fri, 20 Nov 2026 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162172;
	bh=mQpEJ3SKblBleD6wbvkCxkPdsG/OfH4sPlVVe67evO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ag9CbeAa6CoYSROCYUrQy8l6OC4QvLhALXVrn46M9XZLNLea7JJSTLpjex8vuWSNB
	 y8P8pu3Xb8/umX8X7v5G23WnG8byFvHJDrkkRUkAdXGVWShEnTRHYuOpMhQPw4x3wb
	 UeRX8mMdHPD5XxznjB2PPGGHE6MRKGBZr5NDpcfyprF9xUx9MF7VfkSRbS9r72YwCG
	 mp1JmE7uXGt3Dgx9NcfJ2wcNxIGJpXPUAVtD7HwJ235gESV6Xja50MH8MwBe7wISI5
	 Elogr5bd1YoUeQBkEBYPcQTiuN7/D9XN8FicMbjylYUpGabFoUpoy7QS+1SMJAH26t
	 BEH79Usq7Bjeg==
Message-ID: <sashiko-outbox-224684@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] leds: tps6131x: Clear torch brightness cache on
 flash takeover
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gu" <jie.gu@leica-geosystems.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120075859.731257-3-jie.gu@leica-geosystems.com>
References: <20261120075859.731257-1-jie.gu@leica-geosystems.com>
 <20261120075859.731257-3-jie.gu@leica-geosystems.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 08:09:32 +0000
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
- [Medium] leds: tps6131x: race between torch brightness work and flash
  takeover
- [Low] leds: tps6131x: stale torch brightness on error in
  tps6131x_strobe_set()
--

commit 97db4f98d0889a2079f12eddeb42ef27c0ba097d
Author: Jie Gu <jie.gu@leica-geosystems.com.cn>

leds: tps6131x: Clear torch brightness cache on flash takeover

This commit resets fled_cdev->led_cdev.brightness to LED_OFF when
switching to flash or shutdown mode in tps6131x_strobe_set() and
tps6131x_flash_external_strobe_set().

> diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds=
-tps6131x.c
> index 704c3e7dfcda0..76f452842f1bd 100644
> --- a/drivers/leds/flash/leds-tps6131x.c
> +++ b/drivers/leds/flash/leds-tps6131x.c
> @@ -398,6 +398,8 @@ static int tps6131x_strobe_set(struct led_classdev_fl=
ash *fled_cdev, bool state)
>  	if (ret)
>  		return ret;
> =20
> +	fled_cdev->led_cdev.brightness =3D LED_OFF;
> +
>  	return 0;
>  }
> =20

[Severity: Low]
Can fled_cdev->led_cdev.brightness remain stale if one of the subsequent
TPS6131X_REG_3 writes in tps6131x_strobe_set() fails?

tps6131x_set_mode() has already switched the hardware out of
TPS6131X_MODE_TORCH before the TPS6131X_REG_3_SFT updates run, so an early
return on those writes leaves the torch off while brightness still reports
the old non-zero value.  In addition, both tps6131x_strobe_set() and
tps6131x_flash_external_strobe_set() cancel torch_refresh_work before
calling tps6131x_set_mode(), so if tps6131x_set_mode() itself fails, the
13-second hardware watchdog will shut the torch down without brightness
being cleared.

> @@ -697,12 +699,19 @@ static int tps6131x_flash_external_strobe_set(struc=
t v4l2_flash *v4l2_flash, boo
>  {
>  	struct led_classdev_flash *fled_cdev =3D v4l2_flash->fled_cdev;
>  	struct tps6131x *tps6131x =3D fled_cdev_to_tps6131x(fled_cdev);
> +	int ret;
> =20
>  	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
>  	guard(mutex)(&tps6131x->lock);
> =20
> -	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS61=
31X_MODE_SHUTDOWN,
> -				 false);
> +	ret =3D tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6=
131X_MODE_SHUTDOWN,
> +			       false);
> +	if (ret)
> +		return ret;
> +
> +	fled_cdev->led_cdev.brightness =3D LED_OFF;
> +
> +	return 0;
>  }
> =20
>  static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops =3D {

[Severity: Medium]
Can a concurrent torch brightness update re-enable TPS6131X_MODE_TORCH
after tps6131x_strobe_set() or tps6131x_flash_external_strobe_set() sets
fled_cdev->led_cdev.brightness to LED_OFF?

Because tps6131x uses brightness_set_blocking, led_set_brightness_nosleep()
updates led_cdev->brightness and queues set_brightness_work asynchronously.
In addition, cancel_delayed_work_sync(&tps6131x->torch_refresh_work) runs
before acquiring tps6131x->lock, while tps6131x_brightness_set() schedules
torch_refresh_work under tps6131x->lock:

CPU0 (leds_wq)                    CPU1 (strobe / v4l2_flash)
tps6131x_brightness_set()
  guard(mutex)(&tps6131x->lock)
  tps6131x_set_mode(...,
    TPS6131X_MODE_TORCH, true)
                                  tps6131x_strobe_set()
                                    cancel_delayed_work_sync(
                                      &tps6131x->torch_refresh_work)
  schedule_delayed_work(
    &tps6131x->torch_refresh_work,
    ...)
                                    guard(mutex)(&tps6131x->lock)
                                    tps6131x_set_mode(...,
                                      TPS6131X_MODE_FLASH, true)
                                    fled_cdev->led_cdev.brightness =3D LED_=
OFF

tps6131x_torch_refresh_handler()
  tps6131x_set_mode(...,
    TPS6131X_MODE_TORCH, true)  <-- forces torch back on while brightness i=
s 0

Similarly, if set_brightness_work was already queued with a non-zero
delayed_set_value before the strobe callback ran, set_brightness_delayed()
can execute tps6131x_brightness_set() right after the strobe callback
clears fled_cdev->led_cdev.brightness, turning the hardware torch on while
sysfs brightness stays at LED_OFF.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120075859.7312=
57-1-jie.gu@leica-geosystems.com?part=3D2
