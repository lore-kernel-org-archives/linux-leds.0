Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162173;
	b=0iDScr4VX1mKY4qCE3BRJUb96n1z8dpo+nYY1KHoH01HkkeFSGKM9lW4O22HaDXMRSDe
	 sa+2kf7nX76O8zEaMZyKv9Gmi5sCv+YTfpFbbtDi2ODjw7NzxHYyuHG0GmXxySkIF4KTP
	 b89ELHhiwtOfn3Ao92p405wAA+MO5bGwbRQ2V6Zvupt1IV4ahcW9mZ9b2K2ghy4XeoVh0
	 kazoqmtL/B948tFlgqaHVabnkse7FFNDxZChSMyMh5bC1sxfdMqmnvkea0Iv6F5ITGk4w
	 Q74LbWWCWtGYBbQ7yOe9g6pxkSBI2o6VWZI5PoIy/MAI2IGSB9t0tAvNBGVF/eZo6HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162173;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9yOviL/Bz0PhYwX8WZ3xJSSAemosewJCSHT/ABm3XF4=;
	b=zOz7kOAOw+JdOoJwDxyADhrTU6N6a/AzOH9i22f3daa3MQa1y3gZZlYOci8fH2ZWyLdh
	 HjTkkQWl55EpIMPAgIm+/mR+nBMLK65Vbv0DBtB1PrwQ7fpzVDbinyYqhGVyfCbHE60vs
	 SE1oeqJncEOfUZcAi+zMy9vwd4zHfZLo2F6JpUDA9Y+UTuC2jvMWjigNhrdvPUzoegrTK
	 Gm2tTuDE3e2tX+z3ti25cFVzn5TyAsw4CPie3XAuWvQvgL/kPwW0PlU+5rVQ9RZ0Th66d
	 1KXWmw+niYfgciOxUZjOL9oiTLzuMdarfqpv8ehJEL+Ywph4i8EBdU/78A5/NP7HM6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LOaM5ch7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA00606A325
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 08:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LOaM5ch7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF3E1F000D2;
	Fri, 20 Nov 2026 08:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162173;
	bh=9yOviL/Bz0PhYwX8WZ3xJSSAemosewJCSHT/ABm3XF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LOaM5ch7jZq6uDMhRptYJug1d88gswGOa8D4tWIxSfOrOzTrGId2ufhcR9dmu78py
	 J+oII58kvOv4nH3+zgM8B0/Z+Y0fb4s6wnc4SfZh7OJA/e6srk2PeiViewpfhscKXO
	 RDuTyiDiutpVjECowBvBji/F+L88S0GDB/EOlgR8IPLHEes0mAXfOckhFMTPoaDUHW
	 6StdwjOrGAxbWTv2P+Vl2UT6kxx+eRd3VegOtpo+OlbRDUxOadQjzvOOIEFt5+trpZ
	 0vVLSjcdK1Yq+W5Nm2zXmyjjqtGtZzUiW5B88RvZg0HdjWAoDQb9bmyW6g//tFB9du
	 TInMTsmfn0kzA==
Message-ID: <sashiko-outbox-224685@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] leds: tps6131x: Cancel torch refresh on flash
 mode switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gu" <jie.gu@leica-geosystems.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120075859.731257-2-jie.gu@leica-geosystems.com>
References: <20261120075859.731257-1-jie.gu@leica-geosystems.com>
 <20261120075859.731257-2-jie.gu@leica-geosystems.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] leds: tps6131x: torch_refresh_work race with
  tps6131x_brightness_set()
--

commit 7abce202322d69429cb0363b0f5444e8321b3409
Author: Jie Gu <jie.gu@leica-geosystems.com.cn>

leds: tps6131x: Cancel torch refresh on flash mode switch

This commit cancels pending torch_refresh_work before switching the
TPS6131X mode in tps6131x_strobe_set() and
tps6131x_flash_external_strobe_set().

> diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds=
-tps6131x.c
> index 7f2c3895e6e98..704c3e7dfcda0 100644
> --- a/drivers/leds/flash/leds-tps6131x.c
> +++ b/drivers/leds/flash/leds-tps6131x.c
> @@ -378,6 +378,7 @@ static int tps6131x_strobe_set(struct led_classdev_fl=
ash *fled_cdev, bool state)
>  	struct tps6131x *tps6131x =3D fled_cdev_to_tps6131x(fled_cdev);
>  	int ret;
> =20
> +	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
>  	guard(mutex)(&tps6131x->lock);
> =20
>  	ret =3D tps6131x_set_mode(tps6131x, state ? TPS6131X_MODE_FLASH : TPS61=
31X_MODE_SHUTDOWN,
> @@ -697,6 +698,7 @@ static int tps6131x_flash_external_strobe_set(struct =
v4l2_flash *v4l2_flash, boo
>  	struct led_classdev_flash *fled_cdev =3D v4l2_flash->fled_cdev;
>  	struct tps6131x *tps6131x =3D fled_cdev_to_tps6131x(fled_cdev);
> =20
> +	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
>  	guard(mutex)(&tps6131x->lock);
> =20
>  	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS61=
31X_MODE_SHUTDOWN,

[Severity: Medium]
Can an in-flight tps6131x_brightness_set() still re-arm
torch_refresh_work after cancel_delayed_work_sync() returns in
tps6131x_strobe_set() or tps6131x_flash_external_strobe_set()?

tps6131x_brightness_set() runs asynchronously on leds_wq via
led_cdev->set_brightness_work without holding led_cdev->led_access, and
neither flash_strobe_store() nor v4l2_flash_open() flushes
set_brightness_work:

kworker (leds_wq)                 CPU1
set_brightness_delayed()
  tps6131x_brightness_set()
    cancel_delayed_work_sync(...)
    guard(mutex)(&tps6131x->lock)
    regmap_update_bits(...)
                                  tps6131x_strobe_set()
                                    cancel_delayed_work_sync(...)
                                    guard(mutex)(&tps6131x->lock)
    schedule_delayed_work(...)
    /* unlock tps6131x->lock */
                                    tps6131x_set_mode(...,
                                      TPS6131X_MODE_FLASH, ...)
                                    /* unlock tps6131x->lock */
tps6131x_torch_refresh_handler()
  tps6131x_set_mode(...,
    TPS6131X_MODE_TORCH, true)  <-- forces device back into torch mode

When torch_refresh_work fires later, tps6131x_torch_refresh_handler()
unconditionally writes TPS6131X_MODE_TORCH and re-arms itself.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120075859.7312=
57-1-jie.gu@leica-geosystems.com?part=3D1
