Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBEB234973
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691913; cv=none; b=hG2y2v7crI69WummT7n+Lpy1TeRkPoqeCE5A6FECpv/tb+WQKT76FEylS1xnRfKNq/k+WVfFzIggser6xJdYDxLHCtaZcAS6wjhHiHnd8CZbyzTWuSLaVuPErmIzvCxoiJthSgqXDElqz16y5w28Th5aKEMMjZH7OEOKvBRVzUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691913; c=relaxed/simple;
	bh=vi2gElYF4laW/uge8wQg09YrYwebb0ZD2rJ9ugfNNbg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VGpLxfv8q43OyCBQkF/5hxqO53GiwoKoSjs42dLn5YH5Y/o6ChvM3vuriz+E6ddUDderMycNxtmr8YMBoNNPJqCvLql09UT+e+LIMJGu0PIyZqI+Wx2JKXes8yj33lvUsAy+Ck9q3U0Ze6hntF3V7l3+hpGPaqfeXTfGoLjXghI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gH4+kKJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gH4+kKJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F94A1F00A3D;
	Sun,  2 Aug 2026 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691912;
	bh=N2MOm6fYK/dVk9wuqXAlstI3dqHDrjFHySAflS5gZZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gH4+kKJ12hDMUQgvlz1pw6CpOJxIv7N6d8OijQo0xV+AFvHMTE10p9K1qHyJovXn+
	 fBR2QXUN9Cp6+N0ZOP6fUk8mWgpTrgQgAnQ1O+HbgANLC4Pe7DKrPv1AHRnxWdx1gt
	 jFD5e2mwMKhDmQen71P0CK+PoAQHvY/k/QbMuEdjO2cxWa3JH2O4thwYOb8CoZGYTv
	 6A8xMtsO3APgBnzaVGAF88Bw007e6IlnwWm+6dOc0G5qwpjQlRqHo3QRtSXLiVSZkh
	 Mm8uv7j8poPDkZXDa51PfGUbPAaGSVXo3QtN3czKSrwcwF3jSLPOip0wqvfkVbbolR
	 iJ2ui3TnBi97w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/12] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-9-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-9-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:52 +0000
Message-Id: <20260802173152.4F94A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `led_trigger_notify_hw_control_changed()` API performs sleep=
able operations without an internal deferral mechanism, creating a trap for=
 driver authors who might call it directly from hardware interrupt handlers.
--

--- Patch [9]: [PATCH v4 09/12] leds: trigger: Add led_trigger_notify_hw_co=
ntrol_changed() interface ---
commit 21d51858b3771f2be6da6b9704657f9342549cfc
Author: Rong Zhang <i@rong.moe>

leds: trigger: Add led_trigger_notify_hw_control_changed() interface

This commit introduces a new interface, led_trigger_notify_hw_control_chang=
ed(),
allowing LED drivers to notify the LED core about autonomous hardware
control transitions. The core will then transition the trigger between
"none" and the device's private trigger.

> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 64bc95d0bfeb7..2db9fcd1350b8 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
[ ... ]
> @@ -471,6 +492,63 @@ int devm_led_trigger_register(struct device *dev,
[ ... ]
> +void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev=
, bool activate)
> +{
> +	struct led_trigger *trig;
> +
> +	/* Restricted to private triggers. */
> +	if (WARN_ON(!(led_cdev->flags & LED_TRIG_HW_CHANGED) ||
> +		    !led_cdev->hw_control_trigger || !led_cdev->trigger_type))
> +		return;
> +
> +	scoped_guard(rwsem_read, &triggers_list_lock) {

[Severity: Medium]
Will driver authors likely call this API directly from hardware interrupt
handlers when an autonomous hardware control transition occurs?

This function acquires a sleepable rw_semaphore (triggers_list_lock) and
can subsequently call __led_trigger_set() which uses synchronize_rcu().
Calling this from an atomic context like a hardirq handler would trigger a
'sleeping in atomic context' bug or a deadlock.

Since there is no internal workqueue deferral mechanism (unlike
led_trigger_event()) and no might_sleep() annotation, could this become a
trap for driver authors?

> +		list_for_each_entry(trig, &trigger_list, next_trig) {
> +			if (trig->trigger_type =3D=3D led_cdev->trigger_type &&
> +			    !strcmp(trig->name, led_cdev->hw_control_trigger)) {
> +				guard(rwsem_write)(&led_cdev->trigger_lock);
> +
> +				led_trigger_do_hw_control_transition(led_cdev, activate, trig);
> +				return;
> +			}
> +		}
> +	}
> +
> +	dev_err(led_cdev->dev,
> +		"%s() is called, but the private trigger (%s) is not properly register=
ed\n",
> +		__func__, led_cdev->hw_control_trigger);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D9
