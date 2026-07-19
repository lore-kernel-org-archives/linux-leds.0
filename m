Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6F33AC0D3
	for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2026 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481188; cv=none; b=gSsiNkSABbvARJ+gAUV26p/YOYmNpQBaM569frJoP3aE2gmXEGTHXEZRhI1eQdviRx66TjIxWBiYtao3uhGOj1GeloiexwQk95/XNJYiwhiQG+g5lf2Ei4UP4MNRt4XOqf5aY7HH5hL2fLks2tnJiYHFMvl9yS9yTOwSbrpt040=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481188; c=relaxed/simple;
	bh=1Asst+Txr5qU5QO+8vORK+PlCu5yuD/8FShNv2N/obI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U1oywTYnvPa4bhQW64yBfxSpgEpCzZkp9zo1uxbNQ+B56afn9jnz/8ziaGzvKe5i9bEW4k9Z3tKgieKLng73y5QeQy3x7IRgENTlOmmROxyKDEGLfpEPzmOMqiWZVQ3DTo0/GT1vvwlQX2TuUho3yR4vtRX1hEBrjdTMCSpVlgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhak5jGV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhak5jGV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9521F00A3A;
	Sun, 19 Jul 2026 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481184;
	bh=aih5YgkN2jXu97ws7YU75XQP239aAO04OFui1Ws1lFM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dhak5jGV36lcHjanXcxKwJfvVz5CfTvnLkuc8cM28BIGUMNfen/3KhCOydisCKy8q
	 uDAF1lQi5cQNnMyp8RJKfTL1D+DdNpC1iJzI8KsgxLRT2B7pbBK8jlgzhBFVQG12H1
	 ZRHu0QzQB5DmtfB3G5Q5fj7ujheHAgsSHOEoZLQAdvniLrOzZ0KDhm4Wr7DQzk3wO8
	 RN5beFtPn7CtDYqb0E+bOxCFoycFQTXGDOTlPQrRdXzh1yN9PJzHqcPaD1ymrvJJUU
	 5wqu27rQZ9npunssVUkxMpPKHa/xh/3Tlf9WCBDyW0Upd5+YQEPt7UBfhfWQRcyles
	 tx7vtZkAVnF4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 06/11] leds: trigger: netdev: Implement
 offloaded() callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-6-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
 <20260719-leds-trigger-hw-changed-v3-6-5fb55722e36e@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:13:03 +0000
Message-Id: <20260719171303.EF9521F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing dev_put() on net_device when register_netdevice_notifier()=
 fails in netdev_trig_activate().
- [High] sysfs store functions modify shared trigger state and call set_bas=
eline_state() without locking, racing with network notifiers.
--

--- Patch [6]: [PATCH RFC v3 06/11] leds: trigger: netdev: Implement offloa=
ded() callback ---
commit 0713a09815032fb80c29f765ff7ef7a8acfbd3d3
Author: Rong Zhang <i@rong.moe>

leds: trigger: netdev: Implement offloaded() callback

This patch adds an offloaded() callback to the netdev LED trigger to
provide its hardware control state to the LED core. It also updates the
documentation to clarify the relationship between the custom offloaded
attribute and the generic trigger_may_offload attribute.

> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger=
/ledtrig-netdev.c
> index 64c078e997f28..a26109ca4b1c9 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c

[ ... ]

> @@ -754,10 +754,18 @@ static void netdev_trig_deactivate(struct led_class=
dev *led_cdev)
>  	kfree(trigger_data);
>  }
> =20
> +static bool netdev_trig_offloaded(struct led_classdev *led_cdev)
> +{
> +	struct led_netdev_data *trigger_data =3D led_get_trigger_data(led_cdev);
> +
> +	return trigger_data->hw_control;
> +}
> +
>  static struct led_trigger netdev_led_trigger =3D {
>  	.name =3D "netdev",
>  	.activate =3D netdev_trig_activate,

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a missing dev_put()
in the error path of netdev_trig_activate(). If register_netdevice_notifier=
()
fails, trigger_data is freed but the net_dev reference is leaked:

drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_activate() {
    ...
    rc =3D register_netdevice_notifier(&trigger_data->notifier);
    if (rc)
        kfree(trigger_data);
    ...
}

Will this permanently leak the network device reference and cause
unregister_netdev() to hang indefinitely?

>  	.deactivate =3D netdev_trig_deactivate,
> +	.offloaded =3D netdev_trig_offloaded,
>  	.groups =3D netdev_trig_groups,

[Severity: High]
This is a pre-existing issue, but while reviewing the netdev trigger groups,
I noticed that the sysfs store functions modify shared state without lockin=
g:

drivers/leds/trigger/ledtrig-netdev.c:netdev_led_attr_store() {
    ...
    trigger_data->mode =3D mode;
    trigger_data->hw_control =3D can_hw_control(trigger_data);
    ...
    set_baseline_state(trigger_data);
    ...
}

drivers/leds/trigger/ledtrig-netdev.c:interval_store() {
    ...
    atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
    set_baseline_state(trigger_data);
    ...
}

Could concurrent sysfs writes overwrite each other's state or race with
asynchronous network events handled by netdev_trig_notify(), leading to data
races on LED hardware control and timer schedules?

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-leds-trigg=
er-hw-changed-v3-0-5fb55722e36e@rong.moe?part=3D6
