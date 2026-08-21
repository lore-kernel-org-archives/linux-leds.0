Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052A32F7EE1
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333260; cv=none; b=j3/dsrCi9IvkqLsRgR+b4HAPf+A0LMzyu0IRmKKxLRdUbVFiVH9LFTk2jEBmVUDlDnq5brv/YUthWvq8pjRpoELNA/FrmlmWoACoPFAvCxxVR97a5YG+KI3xozylyH4OnMln8S42NNyt6O3QKYi7x1jaqWOF5efKK7F+hpditSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333260; c=relaxed/simple;
	bh=WsIMuRkKnOrssFSQK4exCQeHLRak3u+C+kfeegbpSCk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I0iyWy03LC6Zm+Yvougp4QJY6ZkL2VZ6p6ev3T/nzy+dPK3Q68vnfrjzaPxVu5Np4xzscwAwhu70CKvne6Xp8PnM64Gp54GagTdQhgeCtDjTJIzwsRPHALXWxON8XlyXs5+4TcewkaXw6Y+RWkjq9M18PDPYPxgqgZYGNRHSqao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBvkfFLL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBvkfFLL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6001F00A3E;
	Fri, 21 Aug 2026 17:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333258;
	bh=plVHZrGREaxQGSMzMY10lFaahC4vt18pfvtZ9uHt09c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GBvkfFLLeBmIzJf6/7RiOyMRJi7Bsqd7zHDBFhz0lbzHnc3iQJpKU75T0ZChOwoMP
	 wevLrLPhyYfb7ihs2CoHBPAgOvzLGCG7ZD2MTNzfSg+khXe03scIdYkTOudivq5N5y
	 JRt7wCnFDvhafHYPqn4Ts/9OzQ2MjW23ps2YuXQGlXI4nhVvjleNnNgHFFrqy9LIJh
	 HnKXZpOyaT0iKrqDhRLhmRhirHXbUi5/OrdjHXaJvFpAWQQ0MLy3XFNRjX1+pZ14AV
	 huaFCub05hlSrmO/cgMztVmeSjrI6NIXcBUbBTJCr8FVZqufSXbXDD7dBGcPCKwnUY
	 rpmkBcG152X5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/12] leds: trigger: Do not attach trigger to a
 removing LED
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-8-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-8-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:38 +0000
Message-Id: <20260821172738.AE6001F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch attempts to fix a data race on `led_cdev->flags` by wrap=
ping the `LED_UNREGISTERING` update in `trigger_lock`. However, this is an =
incomplete fix because `flags` is an `int` modified via non-atomic bitwise =
operations (`|=3D`, `&=3D ~`), and other modifiers (such as `led_classdev_s=
uspend` and `led_sysfs_disable`) do not hold `trigger_lock`. A concurrent u=
pdate from these paths will still cause a data race that can drop the `LED_=
UNREGISTERING` flag, exposing the same Use-After-Free bug.
- [High] `led_classdev_unregister()` flushes the brightness workqueue befor=
e unregistering the sysfs device, creating a race condition where concurren=
t sysfs writes can queue new work that executes after the LED is freed.
--

--- Patch [8]: [PATCH v5 08/12] leds: trigger: Do not attach trigger to a r=
emoving LED ---
commit 9ab2868504159e735891fdf50fc3354c0c88c1c8
Author: Rong Zhang <i@rong.moe>

leds: trigger: Do not attach trigger to a removing LED

This patch attempts to fix a race condition where a trigger may be attached
to a removing LED by setting the LED_UNREGISTERING flag under the
trigger_lock in led_classdev_unregister().

> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 2460fcf0c4690..771a6e6c659be 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -633,12 +633,13 @@ void led_classdev_unregister(struct led_classdev *l=
ed_cdev)
> =20
>  #ifdef CONFIG_LEDS_TRIGGERS
>  	down_write(&led_cdev->trigger_lock);
> +	led_cdev->flags |=3D LED_UNREGISTERING;

[Severity: High]
This is a pre-existing issue, but does this fully resolve the data race on
the flags bitmask?

While this update is now protected by trigger_lock, other paths like PM
suspend or V4L2 flash release modify led_cdev->flags using non-atomic
bitwise operations without holding trigger_lock.

If a concurrent update occurs without the lock, could the non-atomic
read-modify-write drop the LED_UNREGISTERING flag?

If the flag is lost, a subsequent sysfs trigger write might see it unset
and attach a trigger to the unregistering LED, leading to a use-after-free
when the trigger later fires.

[ ... ]

>  	/* Stop blinking */
>  	led_stop_software_blink(led_cdev);
>=20
> 	if (!(led_cdev->flags & LED_RETAIN_AT_SHUTDOWN))
> 		led_set_brightness(led_cdev, LED_OFF);
>=20
> 	flush_work(&led_cdev->set_brightness_work);

[Severity: High]
This is also a pre-existing issue, but is there a race condition between
flushing the workqueue and unregistering the device?

In led_classdev_unregister(), flush_work() is called before
device_unregister() removes the device from sysfs.

Could a user-space thread writing to the sysfs brightness attribute in the
window between these two calls queue new work?

sysfs brightness_store() -> led_set_brightness_nopm() -> queue_work()

Since device_unregister() hasn't been called yet, the sysfs write can
succeed, leaving pending work that will execute after the device memory is
freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D8
