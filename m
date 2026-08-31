Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED543905EF
	for <linux-leds@vger.kernel.org>; Mon, 31 Aug 2026 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187836; cv=none; b=bJkJuX/9bVPBd+57J7DiUOtbekPKFAYWASHWIKRqax0cZX28d0h94JJL+PBZFZR78Sec301wC7dj7fCkLPWSeFXnqou8rx9QuY23Gb+Mer54gx94JfCs9pUi48xBRprsz2Eomb/jnM/0lIlWLHqwieSBQm23IouApaDF/ZogtSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187836; c=relaxed/simple;
	bh=wZIjQ5yQBSgk0FXFr9dGnjmmVvqPczXigNJMHMGHw5A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K/Opmo4DTXn5JiV35xlNfZXGmYtMexzUSbW4aGMggQeAKwIRcMTRF3SvRQUbfAz3l/zQN6NKp4dGjny2U5V23T2z6sveGyf1fOM0SdGklX/Sy7ildUuMInXCYnxYEtNI73i6wjQ+kgRAKMM0zcR2wipNNCqJZoSQveV5vmgclE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9WcMVjA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9WcMVjA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11CA1F000E9;
	Mon, 31 Aug 2026 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788187835;
	bh=AeTSBS9mBmkQ40Uu0hAxohDLIXO9Fvqwm/kMEEcr3nE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C9WcMVjAVI72+r6ZeEg5jfmceVoBEi2HCPjjM+gRDkqUBaPabVFpgOm58FProa08q
	 waVDi0wEgB3LV09F57a8TTqsgiikdAb0+jDLGAmyWL6IUl5iA4s23vkjiFDGM3Mmh2
	 ikMQEHGE2FANaRqkIPih/QEhUUzChqR+iYxP0inyfvRscacOrYELJRlXkYdE0edj1p
	 BdyNp4lPaqxTwfRf34cvRQL1NmlR9beBC/iz75MOa0+zk3ixWUp5QDTyql6CHZJRYv
	 YI3mY9I073UsmnVaJeg9YVPJw/2P/5ing7JAtbvqAWo/p0JDzN146ZQxBRFckLT7Ub
	 KXiR7Bnx1/pdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] leds: core: Fix race condition for
 software blink
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260831133314.4125787-161-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-161-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 14:50:34 +0000
Message-Id: <20260831145034.B11CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Missing `smp_mb__before_atomic()` before `set_bit()` allows the CP=
U or compiler to reorder the memory write, leading to lost brightness updat=
es.
- [High] The newly added early-return path bypasses max_brightness clamping=
 and state updates, exposing hardware drivers to arbitrary values and causi=
ng software state inconsistency.

Pre-existing issues:
- [Critical] A race condition during LED device unregistration can lead to =
a Use-After-Free of the `led_classdev` structure because background tasks a=
re flushed before the sysfs interface is removed.
- [High] Incomplete fix for software blink race condition leaves a TOCTOU w=
indow where brightness changes are permanently lost during `led_stop_softwa=
re_blink()`.
--

commit 27c103cf78e9f98bb6d9bdb9ae011c1befedc295
Author: Craig McQueen <craig@mcqueen.au>

leds: core: Fix race condition for software blink

led_set_brightness() function: Change handling of software blink to
avoid race conditions when stopping blink and setting brightness.

Triggers may call led_set_brightness(LED_OFF),
led_set_brightness(LED_FULL) in quick succession to disable blinking and
turn the LED on. If the delayed work task has not yet disabled blinking
by the time the second call occurs, then the brightness also needs to be
changed in the delayed work task.

Link: https://patch.msgid.link/20260423113638.2079302-1-craig@mcqueen.au

> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 59473f286b31f..eeb36e50c285c 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -304,24 +304,31 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
> =20
>  void led_set_brightness(struct led_classdev *led_cdev, unsigned int brig=
htness)
>  {
> -	/*
> -	 * If software blink is active, delay brightness setting
> -	 * until the next timer tick.
> -	 */
> -	if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
> +	if (brightness) {
>  		/*
> -		 * If we need to disable soft blinking delegate this to the
> -		 * work queue task to avoid problems in case we are called
> -		 * from hard irq context.
> +		 * If software blink disable is pending, also queue brightness setting.
> +		 * If software blink is active, delay brightness setting
> +		 * until the next timer tick.
>  		 */
> -		if (!brightness) {
> -			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
> +		if (test_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags) ||
> +		    test_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
> +			led_cdev->delayed_set_value =3D brightness;
> +			set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);

[Severity: High]
Is it possible for the CPU or compiler to reorder this non-atomic write
and the atomic set_bit() operation?

If a worker thread executes test_and_clear_bit(LED_SET_BRIGHTNESS) after
the bit is set but before the data store to delayed_set_value is committed,
could it read a stale delayed_set_value? A subsequent execution of the
worker triggered by the queue_work() would then see the bit cleared and do
nothing, permanently discarding the brightness update.

Would it be better to add an smp_mb__before_atomic() before setting the bit?

[Severity: High]
Does this newly added early return path bypass the clamping of the brightne=
ss
value?

By directly storing the unvalidated brightness into delayed_set_value and
returning, this seems to bypass the min(value, led_cdev->max_brightness) ch=
eck
normally performed in led_set_brightness_nosleep().

If the background worker passes this unvalidated delayed_set_value directly
into the hardware driver's brightness_set callback, could this expose backe=
nd
hardware drivers to out-of-bounds values up to ULONG_MAX?

>  			queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> -		} else {
> -			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
> -				&led_cdev->work_flags);
> +			return;
> +		} else if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
>  			led_cdev->new_blink_brightness =3D brightness;
> +			set_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags);

[Severity: High]
Would this also require an smp_mb__before_atomic() before setting the bit
for the same reordering reasons?

[Severity: High]
This is a pre-existing issue, but does this incomplete fix leave a TOCTOU
window where brightness changes can be permanently lost?

In set_brightness_delayed(), if test_and_clear_bit() clears LED_BLINK_DISAB=
LE
before led_stop_software_blink() completes and clears LED_BLINK_SW, could
a concurrent led_set_brightness(LED_FULL) see LED_BLINK_DISABLE as cleared
but LED_BLINK_SW as still set?

If so, it would fall into this branch, recording the new brightness into
new_blink_brightness and setting LED_BLINK_BRIGHTNESS_CHANGE. But since the
timer is actively being deleted by the worker, it will never fire again,
permanently losing the brightness request.

> +			return;
>  		}

[ ... ]

[Severity: Critical]
This is a pre-existing issue, but is there a use-after-free race condition
during LED device unregistration?

Looking at led_classdev_unregister() in drivers/leds/led-class.c, it appears
flush_work(&led_cdev->set_brightness_work) is called before
device_unregister(led_cdev->dev).

Because device_unregister() is what removes the sysfs attributes, the
brightness sysfs interface remains fully active during and after flush_work=
().
Could a concurrent sysfs write execute led_set_brightness() and queue the
worker again on the global leds_wq?

When device_unregister() completes and led_cdev is freed, the previously
queued work would execute and access the freed memory. Should this use
cancel_work_sync() after the sysfs node has been fully removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-161-sashal@kernel.org?part=3D1
