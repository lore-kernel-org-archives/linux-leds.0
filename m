Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E9530EF8F
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 21:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792358881; cv=none; b=C4N15/NTs/Huref3c+IuY6BFlXTbNP6F7bZfAycLKliqXimbS44d5UXbpE56EmPZs8akK5Z4jMCmkRxuMYrazCi+D+3HnFfj2/76Fhry1oq2mZYcgTo7dg0uMDw/qzCagZCgSLzoqoCfX/YMrXJeQQbrb2KNCcXOWJyBafq25dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792358881; c=relaxed/simple;
	bh=Isltyist3IVeyWy0wfRKYE6k9Nev7wzTmqDnbihR6Tw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=m2uCiiCX/V0LMC6oWYCIc+c2wl+Sl5UadJKpboRex3EFYO8w56iDjhGpi0Il0wGuPBU8DQLCGfNaDSXDGEQzar6mlM5qxxM9WGHjNa78bD5QPaVx95UL8B8HivkzAka0PDDd9namdVX0r6jF88EgNPs1jeXuPqxG7cz/wdTHkzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xg3fZoCw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xg3fZoCw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62C51F000C4;
	Sun, 18 Oct 2026 21:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792358879;
	bh=7yyXde/2bjTNk6FE8wA6ujFFHjkuAp0EGVTKrsbmdDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xg3fZoCwjP6QR2fs2nEDITWwkq4vMg8pTRsM/hSHA0GCC9Djd0HGLSVolR6mLBpw7
	 7O8KsUNGOv/2If82MC0XibhTxQ/5LDhszsB4DFOIX3fJPKmJIh6FR9sHodcdW0oZYY
	 JWilBtattF53JeU2v1opLVXljYN5V5lV86v/Xsgv3EnPu0IjzpM+Qzvzam7uSG2oVJ
	 FDdZbZQNNfVk1Sv//6y/kp50sQSDtowN4rnpWAJVUIKWqC4BEyk6EZ+xgRx17jND6n
	 EKjTj6W9v7mrQSKFTarWK6CmfFj3q31a4NJENNfENFUPEdoPxjajq95GGqUIcXcWQ7
	 +QE8VgVLvQdxQ==
Message-ID: <sashiko-outbox-176402@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: flash: leds-qcom-flash: Release all V4L2 flash
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Neacsu" <geocausa@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018-qcom-flash-v4l2-release-v2-1-8e2297844d9f@gmail.com>
References: <20261018-qcom-flash-v4l2-release-v2-1-8e2297844d9f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 21:27:59 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] leds: qcom-flash: mutex_destroy() called before devm LED unregister
--

commit a8ffc86d81428f44e3211062ba0e1f32e17c9078
Author: George Neacsu <geocausa@gmail.com>

leds: flash: leds-qcom-flash: Release all V4L2 flash devices

This commit fixes the V4L2 flash release loop in both the probe error path
and qcom_flash_led_remove() so that all registered entries from
leds_count - 1 down to 0 are properly released. It also moves mutex_init()
after the early probe checks, destroys the mutex on the failure path, and
routes a torch-clamp register write failure through the release label.

Link: https://sashiko.dev/#/patchset/20261016-qcom-flash-v4l2-release-v1-1-=
0e92aa7c9327@gmail.com?part=3D1

> diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/le=
ds-qcom-flash.c
> index b03a6833e3e3a..35646c4b839dd 100644
> --- a/drivers/leds/flash/leds-qcom-flash.c
> +++ b/drivers/leds/flash/leds-qcom-flash.c
> @@ -923,7 +923,6 @@ static int qcom_flash_led_probe(struct platform_devic=
e *pdev)
>  	devm_kfree(dev, regs); /* devm_regmap_field_bulk_alloc() makes copies */
> =20
>  	platform_set_drvdata(pdev, flash_data);
> -	mutex_init(&flash_data->lock);
> =20
>  	count =3D device_get_child_node_count(dev);
>  	if (count =3D=3D 0 || count > flash_data->max_channels) {
> @@ -936,6 +935,8 @@ static int qcom_flash_led_probe(struct platform_devic=
e *pdev)
>  	if (!flash_data->v4l2_flash)
>  		return -ENOMEM;
> =20
> +	mutex_init(&flash_data->lock);
> +
>  	device_for_each_child_node_scoped(dev, child) {
>  		led =3D devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>  		if (!led) {
> @@ -951,10 +952,16 @@ static int qcom_flash_led_probe(struct platform_dev=
ice *pdev)
>  		flash_data->leds_count++;
>  	}
> =20
> -	return regmap_field_write(flash_data->r_fields[REG_TORCH_CLAMP], flash_=
data->torch_clamp);
> +	rc =3D regmap_field_write(flash_data->r_fields[REG_TORCH_CLAMP],
> +				flash_data->torch_clamp);
> +	if (rc)
> +		goto release;
> +
> +	return 0;
>  release:
> -	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->le=
ds_count)
> -		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
> +	while (flash_data->leds_count)
> +		v4l2_flash_release(flash_data->v4l2_flash[--flash_data->leds_count]);
> +	mutex_destroy(&flash_data->lock);
>  	return rc;
>  }
> =20
> @@ -962,8 +969,8 @@ static void qcom_flash_led_remove(struct platform_dev=
ice *pdev)
>  {
>  	struct qcom_flash_data *flash_data =3D platform_get_drvdata(pdev);
> =20
> -	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->le=
ds_count)
> -		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
> +	while (flash_data->leds_count)
> +		v4l2_flash_release(flash_data->v4l2_flash[--flash_data->leds_count]);
> =20
>  	mutex_destroy(&flash_data->lock);
>  }

[Severity: High]
Does calling mutex_destroy(&flash_data->lock) in the qcom_flash_led_probe()
error path and in qcom_flash_led_remove() destroy the mutex while managed
LED class devices can still acquire it?

In qcom_flash_register_led_device(), each LED registers a managed flash
classdev before qcom_flash_v4l2_init() is called:

    flash->led_cdev.brightness_set_blocking =3D qcom_flash_led_brightness_s=
et;
    ...
    rc =3D devm_led_classdev_flash_register_ext(dev, flash, &init_data);

Because devm_led_classdev_flash_register_ext() is devres-managed, its
cleanup runs during devres_release_all(), which happens after
qcom_flash_led_probe() returns an error or after qcom_flash_led_remove()
completes.

When devres_release_all() unregisters the LED via
devm_led_classdev_flash_release() -> led_classdev_flash_unregister() ->
led_classdev_unregister(), it turns off the LED and flushes
set_brightness_work:

    if (!(led_cdev->flags & LED_RETAIN_AT_SHUTDOWN))
        led_set_brightness(led_cdev, LED_OFF);

    flush_work(&led_cdev->set_brightness_work);

Flushing set_brightness_work invokes qcom_flash_led_brightness_set() ->
set_flash_module_en() and update_allowed_flash_current(), both of which
call mutex_lock(&flash_data->lock) and mutex_unlock(&flash_data->lock) on
the mutex that was already destroyed.

Would using devm_mutex_init(dev, &flash_data->lock) before the child node
registration loop (and dropping the manual mutex_destroy() calls) ensure
the mutex is destroyed by devres only after all managed LED devices have
been unregistered?

=D1=82=D0=B8=D1=82=D1=8C=D1=81=D1=8F

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-qcom-flash=
-v4l2-release-v2-1-8e2297844d9f@gmail.com?part=3D1
