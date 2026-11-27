Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772761;
	b=KNEh22ce7zn5NvWIAPT82Ih75zIouSn0PZhz1FjZhPxyoklF3pBfF5H56loNRcD6/+lA
	 1nBHYUCN0PNVLh2QFzUwtP8YjQDpedNs3YN3ktbx6JiqU6hGe85XXNtxMp8RINzhkAErx
	 wY46FqyN4cd0pvjQsBMH9OqtZCnMtbkDRlA+Z8bqbmnwpsCcweqIP1RRji05fowiTZ1jJ
	 etyb7NHHzBscQFc/hAfyBBi/bu432sBx4AXS7V/eCC/tAGZGlYP+z/y8jOgUdUqZTfmq2
	 rFlR+zTvOjAxkG4uHtnxFATFHp6GnYzr5Pesx/BDA3YCcnkDggK+OwKG72H1PbFQJ/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772761;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=QC0QzxkgWrukfqa+ChUmXMw54bTxFKinhEDwptFUhRg=;
	b=B6tOfx+Kxx8zCM/Nuj3n8R3gOOjSPuBM5T/vQkE9I06DXAc4BEX1G0NiBhL7oUbx9No8
	 GZsxOQWh8YI+u7uichafbBwN7wasM5fL44L3ued1s5dh3GAQwa2VpOD9Xjgso983tsDt5
	 7OHrKrn9620nsk+Uq2lLltyyCr3eP34P0LLdvKr1Yz+f8gMQTB2hNmk79cv+WxQE3Fh9c
	 116kJ6MjQEO6taZCK2xoOwksCUCyrmahfAkTyu156fvDRifoH/7Aed9dCYpRauT+3U+42
	 K+em7hCdOGSINaQn2wFusI70EtcT3lPMmk9twvRrKEcAxPHsVn4MMRM18cJqAkYjU6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qm7y7PGi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237E606A31C;
	Fri, 27 Nov 2026 09:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qm7y7PGi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35B01F00898;
	Fri, 27 Nov 2026 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772761;
	bh=QC0QzxkgWrukfqa+ChUmXMw54bTxFKinhEDwptFUhRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qm7y7PGiF5oxu9SYlr3A02ZrS3CS5WUY+eI4lxbaXRlKHuFf4QGCfSJumK/Z2d8/Z
	 zEkAVHt7TGsiUzkuSqaLdqor2rHa9vaLyZ644Qbn6Shr9tPvW9HsV/scNEAccix2z0
	 JN5ga3Uv/DkxFzvSjga4uv+IaeJerI77cGz0Qrgzfh/rUur2k3Za9gaL7Vck+PKDyA
	 kDE0FYRf9zsWiJM10F1VEj9FFK6XfvBUmjkDj/eCez2KpOD+x3m/iNxXOqg1NijYhV
	 qCyE/0EwlUmuVcDsO9SCCGPHfOETo62r+ycSJBvHQInepc9ojcoqXMQoOUnKeg0HpA
	 nXCc+Wgq/YM+g==
Date: Fri, 27 Nov 2026 09:45:58 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jie Gu <jie.gu@leica-geosystems.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/2] leds: tps6131x: Cancel torch refresh on flash
 mode switch
Message-ID: <20261127094558.GQ38590@joneslee-macbookpro.roam.internal>
References: <20261120075859.731257-1-jie.gu@leica-geosystems.com>
 <20261120075859.731257-2-jie.gu@leica-geosystems.com>
 <sashiko-outbox-224685@kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-224685@kernel.org>

On Fri, 20 Nov 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] leds: tps6131x: torch_refresh_work race with
>   tps6131x_brightness_set()

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> commit 7abce202322d69429cb0363b0f5444e8321b3409
> Author: Jie Gu <jie.gu@leica-geosystems.com.cn>
> 
> leds: tps6131x: Cancel torch refresh on flash mode switch
> 
> This commit cancels pending torch_refresh_work before switching the
> TPS6131X mode in tps6131x_strobe_set() and
> tps6131x_flash_external_strobe_set().
> 
> > diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
> > index 7f2c3895e6e98..704c3e7dfcda0 100644
> > --- a/drivers/leds/flash/leds-tps6131x.c
> > +++ b/drivers/leds/flash/leds-tps6131x.c
> > @@ -378,6 +378,7 @@ static int tps6131x_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
> >  	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> >  	int ret;
> >  
> > +	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
> >  	guard(mutex)(&tps6131x->lock);
> >  
> >  	ret = tps6131x_set_mode(tps6131x, state ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
> > @@ -697,6 +698,7 @@ static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, boo
> >  	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> >  	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> >  
> > +	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
> >  	guard(mutex)(&tps6131x->lock);
> >  
> >  	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
> 
> [Severity: Medium]
> Can an in-flight tps6131x_brightness_set() still re-arm
> torch_refresh_work after cancel_delayed_work_sync() returns in
> tps6131x_strobe_set() or tps6131x_flash_external_strobe_set()?
> 
> tps6131x_brightness_set() runs asynchronously on leds_wq via
> led_cdev->set_brightness_work without holding led_cdev->led_access, and
> neither flash_strobe_store() nor v4l2_flash_open() flushes
> set_brightness_work:
> 
> kworker (leds_wq)                 CPU1
> set_brightness_delayed()
>   tps6131x_brightness_set()
>     cancel_delayed_work_sync(...)
>     guard(mutex)(&tps6131x->lock)
>     regmap_update_bits(...)
>                                   tps6131x_strobe_set()
>                                     cancel_delayed_work_sync(...)
>                                     guard(mutex)(&tps6131x->lock)
>     schedule_delayed_work(...)
>     /* unlock tps6131x->lock */
>                                     tps6131x_set_mode(...,
>                                       TPS6131X_MODE_FLASH, ...)
>                                     /* unlock tps6131x->lock */
> tps6131x_torch_refresh_handler()
>   tps6131x_set_mode(...,
>     TPS6131X_MODE_TORCH, true)  <-- forces device back into torch mode
> 
> When torch_refresh_work fires later, tps6131x_torch_refresh_handler()
> unconditionally writes TPS6131X_MODE_TORCH and re-arms itself.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261120075859.731257-1-jie.gu@leica-geosystems.com?part=1

-- 
Lee Jones
