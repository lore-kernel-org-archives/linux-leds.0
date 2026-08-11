Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A56D46EC6C;
	Tue, 11 Aug 2026 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786475624; cv=none; b=hvLNiS7wEcUp8WCheYb91HleYORddx1uBIJVck6+YuSQslG8OjMb69U0EBRFZRJq0uiqfUdQWq+TKGKCpqU7zMpuvXvXw7AdPG9F/AG4YDS65d/kEZIAVhfUKSl5l00AKUpCj2Vs1TAsuYsoNWnbQJKgvyf0qU7MhMbt5ivIX7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786475624; c=relaxed/simple;
	bh=V5RwdF+sXBsK2q17W44zvYAKz6WPfrbdqPANwizPAak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6hFZrSFbAHFNns3w3YGfesERSfPRODITz4z7t7bNNWECP9zonnM63GXxXGwQdd7IP9JaQ1JW+TDo35UA6vFprznur91LMJ7JKDI0pah9zRPdsrXDNi0jBtHIHBIOxWT8zx95ZERYJO04YddvbQK/+Bndx8lc7I6VtHr/1tNPZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoUjYQzd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoUjYQzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC221F000E9;
	Tue, 11 Aug 2026 19:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786475622;
	bh=KNyxyn8ozpUumARXsrqS03j1tXJsd2DCWe5VYWBcFS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PoUjYQzdIEW7aevl01zrKOpzBG/pzomLT5PoCKJ3ZWRukq/T3EQnzqVx+OAf69zdN
	 Gd0K3VPtfvVFBxQWd0HO4Via44Ad1/gWK8doFIozWph9kPk+Nm840JDvQaOzp6e0dk
	 SZFUHwvYJ1Nr5mHElcqGE4K2D6jHiXF+S9dAYvccI1aIuT5uow3RQffScNDDRB47DE
	 4RmtNSzExe84gM5SzYxxnAHuT5wC0UnYPOCS33eANx5OZqRvQIDLDv0dITsfkjvbU+
	 jBrCkvqiogevZIbBzsOXBpwQwvyPu7EPkVCsG1YQuZiC7Fc7S6NJXgjnahybIpyRTT
	 RZEvupKisjlDQ==
Date: Tue, 11 Aug 2026 20:13:38 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Rong Zhang <i@rong.moe>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 09/12] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
Message-ID: <20260811191338.GC1072730@google.com>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-9-f97e2ca976fe@rong.moe>
 <20260802173152.4F94A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260802173152.4F94A1F00A3D@smtp.kernel.org>

On Sun, 02 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `led_trigger_notify_hw_control_changed()` API performs sleepable operations without an internal deferral mechanism, creating a trap for driver authors who might call it directly from hardware interrupt handlers.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> --- Patch [9]: [PATCH v4 09/12] leds: trigger: Add led_trigger_notify_hw_control_changed() interface ---
> commit 21d51858b3771f2be6da6b9704657f9342549cfc
> Author: Rong Zhang <i@rong.moe>
> 
> leds: trigger: Add led_trigger_notify_hw_control_changed() interface
> 
> This commit introduces a new interface, led_trigger_notify_hw_control_changed(),
> allowing LED drivers to notify the LED core about autonomous hardware
> control transitions. The core will then transition the trigger between
> "none" and the device's private trigger.
> 
> > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > index 64bc95d0bfeb7..2db9fcd1350b8 100644
> > --- a/drivers/leds/led-triggers.c
> > +++ b/drivers/leds/led-triggers.c
> [ ... ]
> > @@ -471,6 +492,63 @@ int devm_led_trigger_register(struct device *dev,
> [ ... ]
> > +void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev, bool activate)
> > +{
> > +	struct led_trigger *trig;
> > +
> > +	/* Restricted to private triggers. */
> > +	if (WARN_ON(!(led_cdev->flags & LED_TRIG_HW_CHANGED) ||
> > +		    !led_cdev->hw_control_trigger || !led_cdev->trigger_type))
> > +		return;
> > +
> > +	scoped_guard(rwsem_read, &triggers_list_lock) {
> 
> [Severity: Medium]
> Will driver authors likely call this API directly from hardware interrupt
> handlers when an autonomous hardware control transition occurs?
> 
> This function acquires a sleepable rw_semaphore (triggers_list_lock) and
> can subsequently call __led_trigger_set() which uses synchronize_rcu().
> Calling this from an atomic context like a hardirq handler would trigger a
> 'sleeping in atomic context' bug or a deadlock.
> 
> Since there is no internal workqueue deferral mechanism (unlike
> led_trigger_event()) and no might_sleep() annotation, could this become a
> trap for driver authors?
> 
> > +		list_for_each_entry(trig, &trigger_list, next_trig) {
> > +			if (trig->trigger_type == led_cdev->trigger_type &&
> > +			    !strcmp(trig->name, led_cdev->hw_control_trigger)) {
> > +				guard(rwsem_write)(&led_cdev->trigger_lock);
> > +
> > +				led_trigger_do_hw_control_transition(led_cdev, activate, trig);
> > +				return;
> > +			}
> > +		}
> > +	}
> > +
> > +	dev_err(led_cdev->dev,
> > +		"%s() is called, but the private trigger (%s) is not properly registered\n",
> > +		__func__, led_cdev->hw_control_trigger);
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=9
> 

-- 
Lee Jones
