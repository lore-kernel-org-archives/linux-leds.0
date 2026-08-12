Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B043433038
	for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539004; cv=pass; b=p8898dKppPOjw+WZzLa7Z4IUFUijZGw53WuzZFPtn4Y0R7jgYXzPFq3ncWQxJv1DxV3eho8juVkCCso1+PxYdKm49HkLfd7+HThPGS3wxL89f1eIf/eeytTuOROWmODjDOYu1lRWjKbNPxhXysnp0il5JiMUe5Eik5GkMXDK9lY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539004; c=relaxed/simple;
	bh=ZWvw6MH+XBXH6aZV7sbj5eBcaP0ivuFeObBSz93+TXg=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NeJjT7cswOAS88zh7iGrc61vbpODMRKV/LDdv0DC+IC2d0WGLLql0SnLE1RQoaHg+xUfzrsnnpR7ssWI8J5UofJDnrGnGV0DYjcg9srdTaFG1xJhZ2yCk7EQBDAJ0+0Imr9nj1phM/xEUarulP5rlNJZQIDzzyf+abVeidW0arQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=cbwcbc9R; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="cbwcbc9R"
ARC-Seal: i=1; a=rsa-sha256; t=1786538987; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DZabFFoVoMR+K4/FgssBCKlpmo8ToC7tm9DEMq6vwcJ/MomyGOSZxas1IYUlzxWSXAw7BHHpcI9OBmK3MU1JjSLrIfhN9iLDldGbwAPa3Uf8P9f+haJh9DIird1jRqopTepQtCaI1lgayhu/Zg9gxlE7QLnO2yBoyuImIgHPMU4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786538987; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3VtInDbKgR6nW8B3kF8oIDWTRpQdtOCFQPwptScwssA=; 
	b=YSyng+RYfUvL3ybn5ni6E+Ex/m6mYeybd57Oxhchq8DKXoZlugyKni8s9sdrq1dR1TCRn8lBsRIPcbM1DLy8cJDHnX5SmXH6FVXLgevHGdbG6PUeasxjyqQzJ3+M2doX2LNmiTtH1WDiNHAjH3IPr9XFR0J+2u9ctZyOmPozNwY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786538987;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=3VtInDbKgR6nW8B3kF8oIDWTRpQdtOCFQPwptScwssA=;
	b=cbwcbc9RIpdKhsiDUifkx8Ve9MIEgFYjaZUDCYhf2DLKdMfdxoHVA60SYVnX2NIe
	RhNoNEaLJUyYAze5eZuo8ByDQaj49b4y7lF9t+WhpoSVN8ApvYABccZIdpxbsbsp8e3
	owpPbEZldySjP8nsQnk1T4bVJDxJB/eeH1YBp7r0IiN6lTZqImebuTzMj9hfvdlh1wj
	kuXHq/Uw7iRRatDAGNeq4MrER+DjP6YE3MMj68oZOzVoCrpR52XzUm2xbEdROAUGvaN
	gWUMwM84qDWyHRiWpXANKpa0xDzaEGJYIeD/ZGy0MuUxLzuGCAFr77ikrFzjRXjtymI
	/Kd0MP9s9A==
Received: by mx.zohomail.com with SMTPS id 1786538985774643.5768978556791;
	Wed, 12 Aug 2026 05:49:45 -0700 (PDT)
Message-ID: <45400b78b5749704e5ab74af809f978629f1bd57.camel@rong.moe>
Subject: Re: [PATCH v4 09/12] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org
In-Reply-To: <20260811191338.GC1072730@google.com>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
	 <20260802-leds-trigger-hw-changed-v4-9-f97e2ca976fe@rong.moe>
	 <20260802173152.4F94A1F00A3D@smtp.kernel.org>
	 <20260811191338.GC1072730@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 20:43:52 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Lee,

On Tue, 2026-08-11 at 20:13 +0100, Lee Jones wrote:
> On Sun, 02 Aug 2026, sashiko-bot@kernel.org wrote:
>=20
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The `led_trigger_notify_hw_control_changed()` API performs s=
leepable operations without an internal deferral mechanism, creating a trap=
 for driver authors who might call it directly from hardware interrupt hand=
lers.
>=20
> Please review, explain or fix the Sashiko review(s).
>=20
> If this is a set, this request includes the other patches too.

For PATCH 4 & 5, what Sashiko found were pre-existing bugs on probe,
i.e., non-idempotent trigger registration. Since both cros_ec and turris-
omnia are very platform-specific and the relevant platforms never have
more than one such device, the bug is never triggered in reality. Thus,
fixing them is far beyond the scope of the series.

For PATCH 8, I've replied there.

For PATCH 9 (this), please see below.

>=20
> > --
> >=20
> > --- Patch [9]: [PATCH v4 09/12] leds: trigger: Add led_trigger_notify_h=
w_control_changed() interface ---
> > commit 21d51858b3771f2be6da6b9704657f9342549cfc
> > Author: Rong Zhang <i@rong.moe>
> >=20
> > leds: trigger: Add led_trigger_notify_hw_control_changed() interface
> >=20
> > This commit introduces a new interface, led_trigger_notify_hw_control_c=
hanged(),
> > allowing LED drivers to notify the LED core about autonomous hardware
> > control transitions. The core will then transition the trigger between
> > "none" and the device's private trigger.
> >=20
> > > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.=
c
> > > index 64bc95d0bfeb7..2db9fcd1350b8 100644
> > > --- a/drivers/leds/led-triggers.c
> > > +++ b/drivers/leds/led-triggers.c
> > [ ... ]
> > > @@ -471,6 +492,63 @@ int devm_led_trigger_register(struct device *dev=
,
> > [ ... ]
> > > +void led_trigger_notify_hw_control_changed(struct led_classdev *led_=
cdev, bool activate)
> > > +{
> > > +	struct led_trigger *trig;
> > > +
> > > +	/* Restricted to private triggers. */
> > > +	if (WARN_ON(!(led_cdev->flags & LED_TRIG_HW_CHANGED) ||
> > > +		    !led_cdev->hw_control_trigger || !led_cdev->trigger_type))
> > > +		return;
> > > +
> > > +	scoped_guard(rwsem_read, &triggers_list_lock) {
> >=20
> > [Severity: Medium]
> > Will driver authors likely call this API directly from hardware interru=
pt
> > handlers when an autonomous hardware control transition occurs?
> >=20
> > This function acquires a sleepable rw_semaphore (triggers_list_lock) an=
d
> > can subsequently call __led_trigger_set() which uses synchronize_rcu().
> > Calling this from an atomic context like a hardirq handler would trigge=
r a
> > 'sleeping in atomic context' bug or a deadlock.
> >=20
> > Since there is no internal workqueue deferral mechanism (unlike
> > led_trigger_event()) and no might_sleep() annotation, could this become=
 a
> > trap for driver authors?

For the very first users of the interface, i.e., ideapad-laptop and
(supposedly) thinkpad_acpi, it's not an issue as ACPI notifier handlers
are executed in work contexts.

To implement an internal workqueue deferral mechanism for atomic
contexts, we will have to introduce:
- a work_struct
- an atomic_t storing the last value of the `activate' argument
- extra synchronization on unregistration

It makes things more unnecessarily tedious just to take care of (yet)
non-existent atomic callers.

In fact, 9 out of 11 callers of the similar interface for hardware
brightness change, i.e., led_classdev_notify_brightness_hw_changed(), are
platform/x86 drivers and call it from sleepable contexts.

Therefore, I personally prefer adding a might_sleep() annotation, and we
could reconsider when an atomic caller emerges. If you prefer the other
way, I am also glad to implement it.

Thanks,
Rong

> >=20
> > > +		list_for_each_entry(trig, &trigger_list, next_trig) {
> > > +			if (trig->trigger_type =3D=3D led_cdev->trigger_type &&
> > > +			    !strcmp(trig->name, led_cdev->hw_control_trigger)) {
> > > +				guard(rwsem_write)(&led_cdev->trigger_lock);
> > > +
> > > +				led_trigger_do_hw_control_transition(led_cdev, activate, trig);
> > > +				return;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	dev_err(led_cdev->dev,
> > > +		"%s() is called, but the private trigger (%s) is not properly regi=
stered\n",
> > > +		__func__, led_cdev->hw_control_trigger);
> > > +}
> >=20
> > --=20
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-t=
rigger-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D9
> >=20
