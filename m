Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899058;
	b=QHzpLKIuEzoNfwXaUFJy/yeozdc847J4knismxGibsguhNvzYhI1Dyy8Bwtq+VeWYRHK
	 Ng1Gxet1Qflbs33GQ+b6B/BAFe0XHIv8dZCXR5ZnwHRdSt7wJa71bc+4OmXx9PZZSLMWq
	 UjeFOvc8PAJ4MStMLY6nwZrN07FQ401a2FPsurc8YrC0z9wxkn5s3fNMtjCC/hS8qqurw
	 OkuSkjDGGUNo/SgWqtGiGixAkukR4ywDZ3gvXJEXohMOOuNYIKEeBPG6sUL3UwRr8L8hG
	 DdfWQFTqSIeIUkaOhsSuiUbWl3zc1P/3rZONvINF6dI9ca+FEdf5+AQjCA1oB1GvA9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899058;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FLswGgyEuZxsAV2GUkkrZhqK8+Y4ZLYLvp0qMPPw6C0=;
	b=SDGyO8dicg5l7wV4HhTwMF2XA6sVYzh0EL+fdvhddC0CkbfvKyZBnZ8Q4LcIdG0f8JW3
	 6tvuMyi8fFtnJBbjFJomwicTxsk9cSlbe57gNWMoAqY/XErbdVbQr5xSjh/6tfyhmGK6s
	 kazgdbctbyjO+L4wIvhPHuBt5oL/Rg91tVUhiO3PwKpWz1uvMlvLqA2SsQj4aXn+uTTgC
	 qMK8eARC5Pa9S4RmevhHBXavRKkxV0PUGju5sdWMc2CNYs3hMIEDo2YLegKedROfuIjPR
	 FMEAXHB5ku/jrLzbEBmmd5rdfJjMgT7kR5OSY6lj5iMryDXOQO14Mtc5cgS5akBEz8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ldy0+psu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBCA606A31C
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ldy0+psu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A74A1F000C4;
	Tue, 17 Nov 2026 07:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794899057;
	bh=FLswGgyEuZxsAV2GUkkrZhqK8+Y4ZLYLvp0qMPPw6C0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ldy0+psuZBnBKXNhuEQD9DCS2RhisDBhCzd/K9985U9PK4AWBcJT1f/x/r912iQYs
	 ESQp4FdrfMUOw46cYmq9KLQISgdm3RCFZYlraEAQBe2oOHhX4oo3HHeaN9Jekz/Va9
	 h5a0f25b5yH4D2I3BRy0QvoedWLmuTjcodlOXtoDmQ5C57j+WMi13yWrVXgvoEtfkq
	 i+sSnFiWJz9Xmo08GjEmZ6K+IWC7UPHMIIGCM775hFUsVzXei6TyDpBwobp247koZB
	 lbTPEsNZC0OM3TB01ApberiQgEGYdpLt0VeiZA1F8I71145vh0Nz8YPq2DCoKT9Lkj
	 omflBkZy5BnkA==
Message-ID: <sashiko-outbox-218290@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] leds: tps6131x: cancel torch refresh on flash mode
 switch
Reply-To: sashiko-reviews@lists.linux.dev
To: jiegu <jie.gu@leica-geosystems.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117064328.4096518-2-jie.gu@leica-geosystems.com>
References: <20261117064328.4096518-1-jie.gu@leica-geosystems.com>
 <20261117064328.4096518-2-jie.gu@leica-geosystems.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:04:17 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] leds: tps6131x: username handle used in Signed-off-by trailer
- [Medium] leds: tps6131x: torch_refresh_work race in
  tps6131x_strobe_set()
- [Low] leds: tps6131x: missing Fixes trailer for commit b338a2ae9b31
- [Low] leds: tps6131x: uncapitalized commit subject description
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] leds: tps6131x: use-after-free in
  tps6131x_torch_refresh_handler() [1]
--

commit eca7ab46a5d8dad2ca9e23fede2225cbcb7e5c34
Author: gujie <jie.gu@leica-geosystems.com.cn>

> leds: tps6131x: cancel torch refresh on flash mode switch

[Severity: Low]
In the LED subsystem, the commit subject description after the prefix
should be capitalized:

  leds: tps6131x: Cancel torch refresh on flash mode switch

>
> The TPS6131X torch mode uses a delayed work item to refresh the watchdog
> timer and keep torch mode active when driven over I2C. If userspace enabl=
es
> torch and then the camera stack switches the LED into flash or external
> strobe mode, the pending refresh work can still run later and force the
> device back into torch mode.
>
> Cancel the pending torch refresh work before switching into flash mode fr=
om
> both the LED flash class strobe path and the V4L2 external strobe path.
>
> Signed-off-by: gujie <jie.gu@leica-geosystems.com.cn>

[Severity: High]
The Author header and Signed-off-by trailer use an account handle (gujie)
rather than a full real human name (for example, Jie Gu
<jie.gu@leica-geosystems.com.cn>), which is required for Developer's
Certificate of Origin compliance.

[Severity: Low]
Since this fixes a bug in the initial driver commit, should it include a
Fixes tag?

  Fixes: b338a2ae9b31 ("leds: tps6131x: Add support for Texas Instruments T=
PS6131X flash LED driver")

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
Can tps6131x_brightness_set() still re-arm torch_refresh_work after
tps6131x_strobe_set() or tps6131x_flash_external_strobe_set() cancels it?

tps6131x_brightness_set() is registered as brightness_set_blocking, so
writing to the brightness sysfs attribute queues set_brightness_work and
returns before tps6131x_brightness_set() runs.  Inside
tps6131x_brightness_set(), torch_refresh_work is scheduled at the end of
the tps6131x->lock critical section after blocking I2C writes:

drivers/leds/flash/leds-tps6131x.c:tps6131x_brightness_set() {
    ...
	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
    ...
	guard(mutex)(&tps6131x->lock);
    ...
	if (brightness)
		schedule_delayed_work(&tps6131x->torch_refresh_work,
				      TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
}

Because the strobe callbacks call cancel_delayed_work_sync() before
acquiring tps6131x->lock, they can interleave with an in-flight
tps6131x_brightness_set():

CPU0 (leds_wq)                    CPU1 (strobe)
tps6131x_brightness_set()
  mutex_lock(&tps6131x->lock)
  tps6131x_set_mode(..., TORCH)
                                  tps6131x_strobe_set()
                                    cancel_delayed_work_sync()
                                    mutex_lock(&tps6131x->lock)
  schedule_delayed_work()
  mutex_unlock(&tps6131x->lock)
                                    tps6131x_set_mode(..., FLASH)
                                    mutex_unlock(&tps6131x->lock)
                                  tps6131x_torch_refresh_handler()
                                    tps6131x_set_mode(..., TORCH)
                                      <-- forces LED back into torch mode

When torch_refresh_work fires 10 seconds later,
tps6131x_torch_refresh_handler() unconditionally switches the controller
back to TPS6131X_MODE_TORCH and re-schedules itself.

[Severity: Critical]
This problem wasn't introduced by this patch, but can torch_refresh_work
cause a use-after-free in tps6131x_torch_refresh_handler() during device
removal [1]?

tps6131x_remove() calls cancel_delayed_work_sync() before returning, while
the LED class device is registered with
devm_led_classdev_flash_register_ext() and therefore stays exposed in
sysfs until devres runs after tps6131x_remove():

drivers/leds/flash/leds-tps6131x.c:tps6131x_remove() {
	struct tps6131x *tps6131x =3D i2c_get_clientdata(client);

	v4l2_flash_release(tps6131x->v4l2_flash);

	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
}

A sysfs brightness write during that window can re-arm torch_refresh_work:

CPU0                              CPU1
tps6131x_remove()
  cancel_delayed_work_sync()
                                  tps6131x_brightness_set()
                                    schedule_delayed_work()
devres_release_all()
  led_classdev_unregister()
  kfree(tps6131x)
                                  tps6131x_torch_refresh_handler()
                                    <-- use-after-free

The same issue occurs if tps6131x_v4l2_setup() fails in tps6131x_probe(),
which returns without canceling torch_refresh_work before devres frees
tps6131x.  Registering torch_refresh_work with devm_delayed_work_autocancel=
()
after devm_led_classdev_flash_register_ext() would ensure the work is
canceled after the LED class device is unregistered.

[1] https://sashiko.dev/#/bug/linux-fe5d04b6-6727-4f3e-ba44-48a355c973f5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117064328.4096=
518-1-jie.gu@leica-geosystems.com?part=3D1
