Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A83F390615
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 19:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375675; cv=pass; b=cjZQwDrN9fVpEtQ4cwt6/eflve1c78fmu1iXeDUEf9kus5Q0O3IcxiHzPdPxfP7suMTSEY4UzS32K4NUiPwqdcjY0tt0flEQjpWhlW+A0ijol4o1IxrEQJQznu/OM8pp6IEMSDgq/+9IW5+xQOQGXfUT8rotl3cGdSRg2hj+XLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375675; c=relaxed/simple;
	bh=AZeXCAXSxyA+r1whZeXSB0tEx+2h7yVQTltpmLt+cgU=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pK1XmU/sKb13XbJYMOktpyS6E5W2OVOUKEq5g/tiKdjDsHeOXSqUtwRomA0IpnywvKPt1VfinWW4Fq0IgYSfcwLpwds3B5MFmjg62SAc2tqXdtob9EBWYOsB+J/VfUA/am6mN9ZMTbKO5vNUOy3JBeGuonh+/POVPKVcYSnvZCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=jCACT9Ra; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="jCACT9Ra"
ARC-Seal: i=1; a=rsa-sha256; t=1788375669; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Boh6a1yphSqrIPCCi8E7ZvmCOLEzzZoSaJF+2Uf+eoku0eiXq2LjbxdaCpVqPHp8EToaNFKKJ+aTHsskmAZsfoLjqSbBTu05FQ2LpP9aJIgpC1lCcUK/L8oDvkxQG34fVUgBZJo+PChLZqPuGGAMNfBg44MoZyG1PdgKcY0NOwg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788375669; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T3LrZ5YU9HVJNF/itFRT31JE/x7CGcQ2B9zuc++xBLg=; 
	b=PwBLgfsrS+jCGMJWY8ijh1d9jWnch/vXjMTdHOkGv9cO9sANlrvRMULhCps+hGILU86MO4dfcLrHGdbi7sK8Z/gbhO8TayRb8ul1b715UyyAQvoR1GgsqC8jcalGVElVRB/p7KEIw3bF0vNZ+/1rzvpnoxcc470j9iR0PTZwFns=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788375669;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=T3LrZ5YU9HVJNF/itFRT31JE/x7CGcQ2B9zuc++xBLg=;
	b=jCACT9RaA7TiZl9p73KtD+Ez1RdWOihrfXPBkdNCVIItwGRRzpwhX4MXPsb8U1y/
	rYra/g1fdV6GmROqTS5/aK6C4pCXd4hf8fyyJthby1DC+KIumvYduy0V8OWwQREZuRy
	iwqDt+WQ8MD5SwlShVo8OmC20pe1n/X4e6lDLS66nm67NVoyUZRNKtcAYHChxJ4bX91
	kvBNDfwbIseYM+/k4xkyeXK5QeDrFXwtk+5xspSYFbiyEd2DpP5CP8oplUx7Jy2+bMO
	a20Qo2SLod2oQodyOus34xxw5sJUvF+aoDB33yLI0MV8YfYKAUnPrGHLNBhUNLv8Kyk
	qLNEE6qfWQ==
Received: by mx.zohomail.com with SMTPS id 1788375667697804.0882437888594;
	Wed, 2 Sep 2026 12:01:07 -0700 (PDT)
Message-ID: <0b2f92a242002f22dfabfda546dc14e8df4f1162.camel@rong.moe>
Subject: Re: [PATCH v6 09/12] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902181556.9BB481F00A3A@smtp.kernel.org>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
	 <20260902-leds-trigger-hw-changed-v6-9-55693cd78877@rong.moe>
	 <20260902181556.9BB481F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 02:56:04 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Lee,

On Wed, 2026-09-02 at 18:15 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Uninitialized work_struct leads to NULL pointer dereference

I believe this is an LLM hallucination. See below.

> --
>=20
> commit b9b9203cb3b45eb3bbf3490673a89b53a7df12ae
> Author: Rong Zhang <i@rong.moe>
>=20
> leds: trigger: Add led_trigger_notify_hw_control_changed() interface
>=20
> This commit introduces a new interface to notify the LED core about
> hardware-initiated trigger transitions. It adds a workqueue deferral
> mechanism to safely handle these transitions.
>=20
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 7e571bd1de5b3..3b438d8da5e0c 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
>=20
> [ ... ]
>=20
> > @@ -611,6 +611,9 @@ int led_classdev_register_ext(struct device *parent=
,
> >  	led_trigger_set_default(led_cdev);
> >  #endif
> > =20
> > +	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
> > +		led_trigger_init_hw_changed(led_cdev);
> > +
>=20
> [Severity: High]
> Is it safe to initialize the work_struct after activating the default
> trigger?
>=20
> By the time led_trigger_init_hw_changed() is called,
> led_trigger_set_default() has already run and the device is active. If a
> hardware interrupt or userspace action fires in this small window, it cou=
ld
> invoke the notification before the work_struct is fully initialized.
>=20
> >  	mutex_unlock(&led_cdev->led_access);
>=20
> [ ... ]
>=20
> > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > index cb49a02a8b3cf..a9d992a886161 100644
> > --- a/drivers/leds/led-triggers.c
> > +++ b/drivers/leds/led-triggers.c
>=20
> [ ... ]
>=20
> > +void led_trigger_notify_hw_control_changed(struct led_classdev *led_cd=
ev, bool activate)
> > +{
> > +	/* Restricted to private triggers. */
> > +	if (WARN_ON(!(led_cdev->flags & LED_TRIG_HW_CHANGED) ||
> > +		    !led_cdev->hw_control_trigger || !led_cdev->trigger_type))
> > +		return;
> > +
> > +	WRITE_ONCE(led_cdev->triggers_hw_changed, activate);
> > +
> > +	schedule_work(&led_cdev->triggers_hw_changed_work);
>=20
> [Severity: High]
> If this notification is triggered during the registration window mentione=
d
> above, will this schedule an uninitialized work_struct?

The LED driver apparently cannot call anything on the LED device during
the registration. If the driver lost its sanity and did so, it would
break tons of things, not limited to the "concern" here.

Therefore, this is not a valid concern and should be considered as an LLM
hallucination.

Thanks,
Rong

>=20
> Scheduling a zero-initialized work_struct means the function pointer is N=
ULL,
> which will cause a kernel panic when the worker thread attempts to execut=
e it.
>=20
> > +}
