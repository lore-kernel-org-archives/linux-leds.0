Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5478B3AB29D
	for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2026 17:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481195; cv=none; b=d+SLK3mjzE8RYcIFgX/KDVLdvbdGXrTcAaZRenJ6+vrpDZXPbxvGWUTApuQnwQISzoSkck0pStmRnFcUPLH9FTNa6dCJYAjTaScd9rkNxfr18o08u94fQNfBsqKNVfXq+cXL8pvqPcElT0QyzIw8yijkuZiKP4Jj3eYwJDH8wsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481195; c=relaxed/simple;
	bh=tRBebeywZimYSZ6rTkadfaWSUxznpHpiOwFATQMUa4Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ar/DTvmbqfZkEZG9ewLf3g41LFD3FbUqC3VFwNxoQE7E6YKDiMLfHBk9RJFNGrN+vNJhJbLeDzeaDwQZqZejhYwXfxyJPtNITojscMfUTTSirWYzwFU3Jo9QmDLN67FeTDaHmYH+E7qGYtzCU6Mqe2GrqdRSxFz/Ixt6qksOg20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yc+h88eI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yc+h88eI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75C81F00A3D;
	Sun, 19 Jul 2026 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481190;
	bh=DorrKHwIA4F8M02qr/AJATvCxiNLaH/HBl6h0jloihk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yc+h88eIX11GttWB6PKbI8z8TJLJm3nkZLC5rrkm/0pfqZIVJBUZ7mPeGjlQVFNUb
	 KMRXYKuFXTjvKVxvMySFzOiZY5Xd4USgbMjyZ5ltUIAfK/fV+8/8o4XHpKmNkbU8EK
	 zUn+G2RXQv42TiaMAyBBQaaJzZfVS88nZaGvLCaFqPM1cDGI4RC9iQmijEog54ilWV
	 2d8c9Lm/EY7J/DaUlgRrDvQasgTGQn/n5CE2rtO9g4z4FLNNckC4niKuiXmuBhebId
	 MKQmn+G635qxWiFP3+4Fy150tUYBfhDdwuF1pHE1v1HT6/na1MOyUWumzi5YvU2VCh
	 2jGOj/iprMdNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 08/11] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-8-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
 <20260719-leds-trigger-hw-changed-v3-8-5fb55722e36e@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:13:09 +0000
Message-Id: <20260719171309.E75C81F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition between asynchronous hardware notification (or sysf=
s writes) and LED unregistration leads to a Use-After-Free of the led_class=
dev.
--

--- Patch [8]: [PATCH RFC v3 08/11] leds: trigger: Add led_trigger_notify_h=
w_control_changed() interface ---
commit 9103c7dadab6a0041a92ad3edeff977ceadf9820
Author: Rong Zhang <i@rong.moe>

leds: trigger: Add led_trigger_notify_hw_control_changed() interface

This commit adds a new interface led_trigger_notify_hw_control_changed() to
allow LED drivers to notify the LED core about hardware-initiated control
transitions. It handles switching between "none" and a private trigger based
on autonomous hardware state changes.

> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 726fa7bf88cfd..6ae28cbd1c778 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c

[ ... ]

> @@ -467,6 +488,63 @@ int devm_led_trigger_register(struct device *dev,

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
> +		list_for_each_entry(trig, &trigger_list, next_trig) {
> +			if (trig->trigger_type =3D=3D led_cdev->trigger_type &&
> +			    !strcmp(trig->name, led_cdev->hw_control_trigger)) {
> +				guard(rwsem_write)(&led_cdev->trigger_lock);
> +
> +				led_trigger_do_hw_control_transition(led_cdev, activate, trig);

[Severity: High]
This isn't a bug introduced by this patch, but could this new API expose a
race condition with device unregistration?

Looking at led_classdev_unregister() in drivers/leds/led-class.c, the
trigger_lock is released before the LED_UNREGISTERING flag is set:

led_classdev_unregister(struct led_classdev *led_cdev) {
    ...
    led_trigger_set(led_cdev, NULL);
    up_write(&led_cdev->trigger_lock);
    ...
    led_cdev->flags |=3D LED_UNREGISTERING;
}

If device removal (like a USB unplug or sysfs unbind) happens concurrently
with a hardware transition event, could led_trigger_notify_hw_control_chang=
ed()
acquire the trigger_lock here and successfully attach a trigger to the dying
LED device?

If led_classdev_unregister() then finishes and the LED memory is freed,
wouldn't this leave a dangling pointer in the trigger's led_cdevs list,
leading to a use-after-free memory corruption when the trigger later fires?

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
> +EXPORT_SYMBOL_GPL(led_trigger_notify_hw_control_changed);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-leds-trigg=
er-hw-changed-v3-0-5fb55722e36e@rong.moe?part=3D8
