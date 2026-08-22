Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB37493634
	for <linux-leds@vger.kernel.org>; Sat, 22 Aug 2026 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787427931; cv=pass; b=t6nXVh9QBb0CCEMhBms5wT4IB1RqShM00wnFZvQGJF+FsRTc7/1KYRFlbEBVDDN07oy0lWXXqpY0PruIboCPdqUgQ97clCDcyQc3AX11w4TYShRA6rMHNex0790g6NxlcwvbrOVY47MEcJvAr+IEcx2ueY+hYwCHGDdUAsqxorw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787427931; c=relaxed/simple;
	bh=CuU0sXsDfzpzkzh7qmJCBA4t3GHYTo++kHPlEwrZ2+I=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WorzU4q93vDE15fyD50Mk1HflbIBqe3gX0hafEOa0oietmo+1m5nbt1suP6BYBZ71tc2HVNMEesGkW7s9zXvlc85XAOREyCWoPZKMYPE9x4IALvwUmuynK12542GwFqC2NcWB166f2RseRJRT6hzqq0cMOqZCl8//fzkf8dw41E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=SBGyLijM; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="SBGyLijM"
ARC-Seal: i=1; a=rsa-sha256; t=1787427923; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NFSxzf/hjuGMsIbBOunZCu9kY27Q23pt6+W9IjPW++a35CXB9KixElkFPUMlooN8fHybefqftWvUcqhURybnTJCnxwVM78oAhB/Uy9l0C+zTP6XF7qZKa8zOUpRjlxoTGeTyF+IjwNpVjAMxIFW7f5z+KWumyjqreIH/9+puF2E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787427923; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xz2MyET6VAU7XnG5wwqqXrSIvoWqD+59VB3JuJXAXVU=; 
	b=AUk5GfKBcGi0ZDALlvsqJOHifNKhBZWSC296xKb5dg1xszK9Iq7wmHAXef/PASisMSwIn21SDwXNZHsnRRaJfGrDf9FW6xwds+owienYG19X1q4IuOmWst/SXCkWhX8Qrj+IxggGAFJoGGtnQU259r9RJbC6Sl5bqlCMfx5GtBk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787427923;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=xz2MyET6VAU7XnG5wwqqXrSIvoWqD+59VB3JuJXAXVU=;
	b=SBGyLijMZaELKYbcvg+20dFX68GCkYMMtX/mBtGAJRbnqpIQ0lR0+OFNvlfubdHW
	3k9azsji7A4Kfz+2R8aGtizfdJ4N3ZeHWMVAzAImw4ONVfUJ3anTO+fP6wyChbpJFBd
	n/QssX0WcLJuWZnwNR57M/japCTsWfqrH6SzOm5ITi4D+ZcBTd70rjHXGxee1/dZL16
	WR5OLMDSRBTlG/QMuEyfpihM+VOtL0mZOzyZg39UU6H2iFLDEuDHH53GtdCt9kQ5u7a
	gmNIqBxZ88BZDpoQWTYSO1NBepmIEduOwfCo/MwE1q2h+WMY7HLc51DgmXapztCTJnM
	8H6b2cWUOA==
Received: by mx.zohomail.com with SMTPS id 1787427920779104.5225546862805;
	Sat, 22 Aug 2026 12:45:20 -0700 (PDT)
Message-ID: <a384b0b2a5318d3a73a0ac7ea07a5091effd6197.camel@rong.moe>
Subject: Re: [PATCH v5 08/12] leds: trigger: Do not attach trigger to a
 removing LED
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260821172738.AE6001F00A3E@smtp.kernel.org>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
	 <20260821-leds-trigger-hw-changed-v5-8-3e00d6c4a936@rong.moe>
	 <20260821172738.AE6001F00A3E@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 03:40:15 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi all,

On Fri, 2026-08-21 at 17:27 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] The patch attempts to fix a data race on `led_cdev->flags` by wr=
apping the `LED_UNREGISTERING` update in `trigger_lock`. However, this is a=
n incomplete fix because `flags` is an `int` modified via non-atomic bitwis=
e operations (`|=3D`, `&=3D ~`), and other modifiers (such as `led_classdev=
_suspend` and `led_sysfs_disable`) do not hold `trigger_lock`. A concurrent=
 update from these paths will still cause a data race that can drop the `LE=
D_UNREGISTERING` flag, exposing the same Use-After-Free bug.
> - [High] `led_classdev_unregister()` flushes the brightness workqueue bef=
ore unregistering the sysfs device, creating a race condition where concurr=
ent sysfs writes can queue new work that executes after the LED is freed.

Fixing them would need a huge series and is far beyond the scope of the
series.

Thank,
Rong

> --
>=20
> --- Patch [8]: [PATCH v5 08/12] leds: trigger: Do not attach trigger to a=
 removing LED ---
> commit 9ab2868504159e735891fdf50fc3354c0c88c1c8
> Author: Rong Zhang <i@rong.moe>
>=20
> leds: trigger: Do not attach trigger to a removing LED
>=20
> This patch attempts to fix a race condition where a trigger may be attach=
ed
> to a removing LED by setting the LED_UNREGISTERING flag under the
> trigger_lock in led_classdev_unregister().
>=20
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 2460fcf0c4690..771a6e6c659be 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -633,12 +633,13 @@ void led_classdev_unregister(struct led_classdev =
*led_cdev)
> > =20
> >  #ifdef CONFIG_LEDS_TRIGGERS
> >  	down_write(&led_cdev->trigger_lock);
> > +	led_cdev->flags |=3D LED_UNREGISTERING;
>=20
> [Severity: High]
> This is a pre-existing issue, but does this fully resolve the data race o=
n
> the flags bitmask?
>=20
> While this update is now protected by trigger_lock, other paths like PM
> suspend or V4L2 flash release modify led_cdev->flags using non-atomic
> bitwise operations without holding trigger_lock.
>=20
> If a concurrent update occurs without the lock, could the non-atomic
> read-modify-write drop the LED_UNREGISTERING flag?
>=20
> If the flag is lost, a subsequent sysfs trigger write might see it unset
> and attach a trigger to the unregistering LED, leading to a use-after-fre=
e
> when the trigger later fires.
>=20
> [ ... ]
>=20
> >  	/* Stop blinking */
> >  	led_stop_software_blink(led_cdev);
> >=20
> > 	if (!(led_cdev->flags & LED_RETAIN_AT_SHUTDOWN))
> > 		led_set_brightness(led_cdev, LED_OFF);
> >=20
> > 	flush_work(&led_cdev->set_brightness_work);
>=20
> [Severity: High]
> This is also a pre-existing issue, but is there a race condition between
> flushing the workqueue and unregistering the device?
>=20
> In led_classdev_unregister(), flush_work() is called before
> device_unregister() removes the device from sysfs.
>=20
> Could a user-space thread writing to the sysfs brightness attribute in th=
e
> window between these two calls queue new work?
>=20
> sysfs brightness_store() -> led_set_brightness_nopm() -> queue_work()
>=20
> Since device_unregister() hasn't been called yet, the sysfs write can
> succeed, leaving pending work that will execute after the device memory i=
s
> freed.
