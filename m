Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB25732B10A
	for <linux-leds@vger.kernel.org>; Sat, 22 Aug 2026 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787425648; cv=pass; b=W3Zanq/muIKjb8m2Hx5kBJvjMQf6Mt1ofUV67YhLhv/4D1Gvzg2M/MPGlL5wq2DwDDURKZ7+HSe226Y0U6HGLzeUulis6JRy1hRExyyM4qQt7gSIqDMWQhWvE82v12u19kiKMfrgN53ZPLACZBO7Is/ujKqvEUNLj4fZnSBJIFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787425648; c=relaxed/simple;
	bh=T8f9ahig3YJiXFm64xno1uOVQk2peveJ9Akk1X+gYjw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=H4rs5K+v0/Q6n9DwENILMSxvghvTCYYoY837qN9Vt/OC9PS5JC2Mv5NK7rskfda2dW+UX4XD4TYWGOBQ9dAaJ0xw7T2m/gHwobnve6t3nLvXyM7nkEquyKdkT12SyYP8gvtDn93/F//wfh1fvxiaHoMTZHHtjUfrlqT8WVxPpHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=h/RisHQj; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="h/RisHQj"
ARC-Seal: i=1; a=rsa-sha256; t=1787425640; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DFVeOYZ/5YhP60C6xwUNLVEBtQ1Ms1L1G1inHq6K80hxXFNy3XH95wm0RlOVTLE11ODRnz6fJ7s/5egOz1g4Dv7VurF5rMaj6FrKx9tp6X/TFvyWWTY99bFmKPfQn/bgiNfsGjHAqGxLFSGwwSSUfsYPMFHBqqj7kGx+5On5ahs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787425640; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HbOEOPwKr4YmRneAcPQLCw0SOlfXL1ZPkag9RPgrWGM=; 
	b=N+QDxOIlVTOZzyNkAUG9z8+YWgBSxH6kgGYP1Bd8RycwYmcmisQLJPva7tC2P/1COWSjGDBJ4/bAz0LdeTnn7xFYzKwukumbPvStcOoRPGZLfElUo7g8ckIMI7wmyC8Ah7WeqykvguHenE9LWAYJan63AOhn4SpZ7Q37lhbXYqU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787425640;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=HbOEOPwKr4YmRneAcPQLCw0SOlfXL1ZPkag9RPgrWGM=;
	b=h/RisHQjaJCDqP+7rafld6dO5xoh89b91F/Y1bAZFB0JI0oHD3wb6kSXvpo3agcl
	RXt1fyWqjsK4OadYR9ASYhyqTqUhXxOj+1YRm9JpFInENufnHSXI1LNnvrvF9M5RDRj
	vMonlV0eT+cq0uAGXxm4Cwp9ZOxWGWrhMTMy2aizhJDQEchchUHVbJLsEutzSvBxlyZ
	zhXskUbhdftcXbT2WmicHqSAhIqz9mDeeSlpnDqeohN8imCllUEcxJfkKcZtLiZ6Tf8
	h2yuK+zCwOQGxqSelrnnmIUx/GMbuGLowxzjSnosFsNtuMkL7uXKKeybmAVvDtKe1Im
	HZoaVN+4Uw==
Received: by mx.zohomail.com with SMTPS id 1787425637545219.63814745236243;
	Sat, 22 Aug 2026 12:07:17 -0700 (PDT)
Message-ID: <cccaa0c34692d376b0bcb15dd7ae5a87cb872fbe.camel@rong.moe>
Subject: Re: [PATCH v5 06/12] leds: trigger: netdev: Implement offloaded()
 callback
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260821172734.2E4041F000E9@smtp.kernel.org>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
	 <20260821-leds-trigger-hw-changed-v5-6-3e00d6c4a936@rong.moe>
	 <20260821172734.2E4041F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 03:01:37 +0800
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
> New issues:
> - [Medium] Unprotected lockless read of shared state in `netdev_trig_offl=
oaded()`

This just mimics how the existing "offloaded" attribute does. See
offloaded_show().

This is just an informational hint. It doesn't need to be accurate, so
it's not a bug.

>=20
> Pre-existing issues:
> - [High] Resource leak of `net_device` in `netdev_trig_activate()` error =
path

Fixing it is far beyond the scope of the series.

Thanks,
Rong

> --
>=20
> --- Patch [6]: [PATCH v5 06/12] leds: trigger: netdev: Implement offloade=
d() callback ---
> commit d8144f7505ed647e0e3c94f8c01b2ef2b0814005
> Author: Rong Zhang <i@rong.moe>
>=20
> leds: trigger: netdev: Implement offloaded() callback
>=20
> This commit implements the offloaded callback for the netdev trigger,
> providing its hardware control state to the LED core. It also updates the
> sysfs ABI documentation to clarify the relationship between the custom an=
d
> generic offload attributes.
>=20
> > diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigg=
er/ledtrig-netdev.c
> > index 64c078e997f28..a26109ca4b1c9 100644
> > --- a/drivers/leds/trigger/ledtrig-netdev.c
> > +++ b/drivers/leds/trigger/ledtrig-netdev.c
>=20
> [ ... ]
>=20
> > @@ -754,10 +754,18 @@ static void netdev_trig_deactivate(struct led_cla=
ssdev *led_cdev)
> >  	kfree(trigger_data);
> >  }
> > =20
> > +static bool netdev_trig_offloaded(struct led_classdev *led_cdev)
> > +{
> > +	struct led_netdev_data *trigger_data =3D led_get_trigger_data(led_cde=
v);
> > +
> > +	return trigger_data->hw_control;
>=20
> [Severity: Medium]
> Is it possible for hw_control to be read while it is being updated?
>=20
> When userspace reads the trigger_may_offload sysfs attribute, it calls
> netdev_trig_offloaded() holding only the led_cdev->trigger_lock, which is=
 a
> read lock.
>=20
> Concurrently, a network event can invoke netdev_trig_notify() which
> acquires trigger_data->lock and mutates trigger_data->hw_control.
>=20
> Does this code need to hold trigger_data->lock or use the READ_ONCE() mac=
ro
> to prevent a data race when reading trigger_data->hw_control here?
>=20
> > +}
> > +
> >  static struct led_trigger netdev_led_trigger =3D {
> >  	.name =3D "netdev",
> >  	.activate =3D netdev_trig_activate,
> >  	.deactivate =3D netdev_trig_deactivate,
> > +	.offloaded =3D netdev_trig_offloaded,
> >  	.groups =3D netdev_trig_groups,
> >  };
>=20
> [Severity: High]
> This is a pre-existing issue, but does netdev_trig_activate() leak a
> net_device reference in its error path?
>=20
> If hardware control is supported, set_device_name() is called, which
> acquires a net device reference via dev_get_by_name() and saves it to
> trigger_data->net_dev.
>=20
> If the subsequent call to register_netdevice_notifier() fails, the error
> path executes:
>=20
> drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_activate() {
>     ...
> 	rc =3D register_netdevice_notifier(&trigger_data->notifier);
> 	if (rc)
> 		kfree(trigger_data);
>=20
> 	return rc;
> }
>=20
> Since trigger_data is freed without calling dev_put(trigger_data->net_dev=
),
> does this leave a permanent reference count leak on the net_device?
