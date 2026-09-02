Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2373F3DDDDD
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372959; cv=none; b=pCsLN1yzToKOcq4qJyDrgs2QnYwBr6dm1yIgPJI/tnHUAk88tpF6RwFW9CNupgIzCKBqW2cDkQudMJAjR31nTQGjdUst7BYBgGf+aLbkIRotrex1SgV2DyknQWWQFKnP6cSmH5TCUZb/anjKfS+mVfq1ltVymNa5GY10iTuT9xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372959; c=relaxed/simple;
	bh=OB+ut24CZFllGKfJbo6SmTXZsCAkXp0dMc3bawZRmsw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SZa/pNdR3h2nmtp/qxdYBgDHS0AmppROvpTYNxIq3hKRda1+wGdIHivX6hupNXyTY4zJtLJJwC0dHro1er9z9LrwoFVwlSCTqkNOBiRQMFCEK46GEya4sUUhjMTxUP8vRW0R7Ur3VAFhKCm2xG8tLX+poRUoAkyPNEnRDsG1Re8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guJB4UkZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guJB4UkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB481F00A3A;
	Wed,  2 Sep 2026 18:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372956;
	bh=kQNjL1kulDXSRmqG4R8bVeW7nIZ1zyHnRR9eQC30WV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=guJB4UkZLi1+L+Kc2CtgvH0JJZURSqzxk9F7HNQYnS+BCYG7WB72gMYw2t/87biDs
	 eMQp0Pcyz1DbJiG3yoFEBa5G4LNZVfnlxtpwPxKBv4xq8CkVRuxNE2KSF5V8jj1mWr
	 gom1ozDfjQ8BTEFij1lT71t31oIaT7X+4JwT1cDbevCFvmAAxrf76kL0sM0HWJahyz
	 ONyF/2kBvrWW7nctrFiTgFRjAwzK0l0YtExFLxH6tG+AtLLqKwB2NfUzKOyuBBiJil
	 9hj3vCv5SrsOchFXrAuctMFYHJX/srVOAUvHpCbeEy3V7tyLEvcsGmzSHR0oSUL97h
	 eGMVVPl1Oyqog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/12] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-9-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-9-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:56 +0000
Message-Id: <20260902181556.9BB481F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Uninitialized work_struct leads to NULL pointer dereference
--

commit b9b9203cb3b45eb3bbf3490673a89b53a7df12ae
Author: Rong Zhang <i@rong.moe>

leds: trigger: Add led_trigger_notify_hw_control_changed() interface

This commit introduces a new interface to notify the LED core about
hardware-initiated trigger transitions. It adds a workqueue deferral
mechanism to safely handle these transitions.

> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 7e571bd1de5b3..3b438d8da5e0c 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c

[ ... ]

> @@ -611,6 +611,9 @@ int led_classdev_register_ext(struct device *parent,
>  	led_trigger_set_default(led_cdev);
>  #endif
> =20
> +	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
> +		led_trigger_init_hw_changed(led_cdev);
> +

[Severity: High]
Is it safe to initialize the work_struct after activating the default
trigger?

By the time led_trigger_init_hw_changed() is called,
led_trigger_set_default() has already run and the device is active. If a
hardware interrupt or userspace action fires in this small window, it could
invoke the notification before the work_struct is fully initialized.

>  	mutex_unlock(&led_cdev->led_access);

[ ... ]

> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index cb49a02a8b3cf..a9d992a886161 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c

[ ... ]

> +void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev=
, bool activate)
> +{
> +	/* Restricted to private triggers. */
> +	if (WARN_ON(!(led_cdev->flags & LED_TRIG_HW_CHANGED) ||
> +		    !led_cdev->hw_control_trigger || !led_cdev->trigger_type))
> +		return;
> +
> +	WRITE_ONCE(led_cdev->triggers_hw_changed, activate);
> +
> +	schedule_work(&led_cdev->triggers_hw_changed_work);

[Severity: High]
If this notification is triggered during the registration window mentioned
above, will this schedule an uninitialized work_struct?

Scheduling a zero-initialized work_struct means the function pointer is NUL=
L,
which will cause a kernel panic when the worker thread attempts to execute =
it.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D9
