Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD55E555
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375194; cv=pass; b=Dqrzcy0163a3iwi/u22la8jvXgsubJY8Yi14MAXaEcBDibW2H46hybfyqAlo/BUIDjWnXCBLcKwQmsWCgI4sP/wdtXFytST3acOPaIMH2TsBGR14m/hB+1d8GcSS/cBy8/X+gGT4LfOd1kFfWMhhF9ul6La7e5YEzcZddxdUepI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375194; c=relaxed/simple;
	bh=3HzMz6cpOVxDpNPk12kmD4iOuPDxMaY7EWtOzXlikGc=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LnY3vmEfGRZ7EkcF0AZmbOV3zBrYvdbovEPHXqnnB9yAdmgfKe62TlVh5UNVJEty4DlNV0sEioOcognQfGMhlVQ0Xj64CtOP85HoceyeryuNQLP3Ocad6F7kJwMgImOX+bnJOvCCjRMkmHfjGzIu0QUqPY+PZOHB4CBFAmTaFZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ZtPG67kZ; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ZtPG67kZ"
ARC-Seal: i=1; a=rsa-sha256; t=1788375187; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZJKpxIzyTYz6P8azkOgShxjRGvfyvDC9S/nIzANZtwYCpfz2Y5wiEjVRoc28SGX0VYu+nXez4Grv69R9GKpKMk5UOnyBNwW+5ascapNHJtb6dAGlqmHktV9B3ZZShRt7OEE6b14N4XoCMyXuFSA6W5SfP6fJASIUjpowObfczU4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788375187; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tSVIRVzo2G9NDGNpxpVkhQf6nKFH1i5GvQikg87nwnM=; 
	b=f5BdIgM5G8Yqlsdcszh/0H5HnnggiAA9CeHV7q4znUCp4PKCiwfdSbjD16TroWLClNx+9AuYWmRfzO8dCKsjz3fKbqQt0pMcTm8B3Rqz7Ka0nKNQguuvzUR+zT/68Kfk8E4R10deKHw3cwGnpk9D3dOCIK6XpIUyjzhA/7ooyJc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788375187;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=tSVIRVzo2G9NDGNpxpVkhQf6nKFH1i5GvQikg87nwnM=;
	b=ZtPG67kZIaTPZiZ0AZHG0Y+2vCvxVujOpp8uLEE5ZYETdJav7bs2d6/hyu5dwISw
	7Kv2qIh7ebSgaczkau8ghh9M1ie6H+roYWnKdY78pHedEB+TD8D9r8q95A02MF9Dorv
	M5MeUO6TpzbGeCyikwhfAYFgxX543c9BiHu/+MqGdoIwHU/Mo4AfQWw1c7zTMh7DY3m
	yu3K2NZ+/E44CQMtRcQeipv7+43s/XXOif7swusfAb9sUyEWToOWaW3iSlsIPpuvHe8
	5Q04g9P31h9IpDRuMOhGTIEshfyvGgUvf1FIk63KDUqef6O9henH89DGfvyg92dsaNO
	PWgBgVj4Rg==
Received: by mx.zohomail.com with SMTPS id 1788375184816506.92234216563656;
	Wed, 2 Sep 2026 11:53:04 -0700 (PDT)
Message-ID: <d25a81519d383e3cc05b72e188e8f038abf842e4.camel@rong.moe>
Subject: Re: [PATCH v6 07/12] leds: trigger: netdev: Implement offloaded()
 callback
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902181553.C40091F00A3A@smtp.kernel.org>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
	 <20260902-leds-trigger-hw-changed-v6-7-55693cd78877@rong.moe>
	 <20260902181553.C40091F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 02:47:13 +0800
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
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] Resource leak of `net_device` in `netdev_trig_activate()` error =
path.
> - [High] Race condition in `netdev_led_attr_store()` leading to lost conf=
iguration updates and a Use-After-Free of `net_device`.

The series has nothing to do with these issues. Therefore, fixing them is
out of the scope of the series.

Thanks,
Rong

> --
>=20
> commit 2e9edb75c55c3a99bfaf5dc0eea11b9a95851115
> Author: Rong Zhang <i@rong.moe>
>=20
> leds: trigger: netdev: Implement offloaded() callback
>=20
> "netdev" can run in hardware control according to hardware capabilities
> and trigger options. Implement offloaded() callback to provide its hardwa=
re
> control state to the LED core, and document the relation between the cust=
om
> "offloaded" attribute and the generic "trigger_may_offload" attribute.
>=20
> [ ... ]
>=20
> > diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigg=
er/ledtrig-netdev.c
> > index 5b4e92c14dbb4..2e9af48a74dbf 100644
> > --- a/drivers/leds/trigger/ledtrig-netdev.c
> > +++ b/drivers/leds/trigger/ledtrig-netdev.c
>=20
> [ ... ]
>=20
> > @@ -798,10 +798,18 @@ static void netdev_trig_deactivate(struct led_cla=
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
> > +}
> > +
> >  static struct led_trigger netdev_led_trigger =3D {
> >  	.name =3D "netdev",
> >  	.activate =3D netdev_trig_activate,
>=20
> [Severity: High]
> This is a pre-existing issue, but does netdev_trig_activate() leak the
> net_device reference on its error path?
>=20
> When supports_hw_control is true, setting the device name acquires a
> reference to the net_device via dev_get_by_name():
>=20
> drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_activate() {
>     ...
>     if (supports_hw_control(led_cdev)) {
>         ...
>         set_device_name(trigger_data, name, strlen(name));
>         ...
>     }
>     ...
>=20
> If register_netdevice_notifier() subsequently fails, the error path frees
> trigger_data but does not drop the net_device reference:
>=20
>     rc =3D register_netdevice_notifier(&trigger_data->notifier);
>     if (rc)
>         kfree(trigger_data);
>     ...
> }
>=20
> Can this leak prevent the network interface from being completely unregis=
tered,
> causing operations like network namespace destruction or module removal t=
o hang
> indefinitely in the netdev_wait_allrefs loop?
>=20
> [Severity: High]
> This is a pre-existing issue, but is there a race condition in
> netdev_led_attr_store() that leads to lost configuration updates and a
> use-after-free of net_device?
>=20
> netdev_led_attr_store() executes concurrently with
> netdev_trig_notify(NETDEV_UNREGISTER). Since the sysfs store function
> doesn't acquire trigger_data->lock, it can schedule trigger_data->work
> locklessly after the notifier has called cancel_delayed_work_sync():
>=20
> drivers/leds/trigger/ledtrig-netdev.c:netdev_led_attr_store() {
>     ...
>     cancel_delayed_work_sync(&trigger_data->work);
>     ...
>     set_baseline_state(trigger_data); // Schedules delayed work outside l=
ock
>     ...
> }
>=20
> If netdev_trig_notify() drops the net_device reference and sets it to NUL=
L:
>=20
> drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_notify() {
>     ...
>     case NETDEV_UNREGISTER:
>         dev_put(trigger_data->net_dev);
>         trigger_data->net_dev =3D NULL;
>     ...
> }
>=20
> If the scheduled delayed work (netdev_trig_work()) runs concurrently, it
> reads trigger_data->net_dev locklessly. Could it read the pointer before
> the notifier sets it to NULL, but execute dev_get_stats() after the notif=
ier
> has called dev_put(), resulting in a use-after-free?
>=20
> >  	.deactivate =3D netdev_trig_deactivate,
> > +	.offloaded =3D netdev_trig_offloaded,
> >  	.groups =3D netdev_trig_groups,
> >  };
