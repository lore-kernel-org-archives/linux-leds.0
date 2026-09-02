Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796CE372EF0
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372955; cv=none; b=F2oSR6SsGh5BQepH9DdWXRoy9Tv1h9ovEy7wrdty8GRPd8+BzrVqqKXLNSiHF3Y9lFpEzB+n8KaTONNNTi0IXtVLQyhNrFaof5O4naoDnXecx0BM1KKCujk3MOfo6/oWfbdDhkwMhKwMvETkZliuLDddSsXy1xhDRQJOPBOxtg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372955; c=relaxed/simple;
	bh=bm62ir42u3bRuWn8CbrHXngm0oBg2JNtIjPYVc/iJ5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RFneenYBFnYCwv7qCboCR8mnJS+aROElPdfMK/D86t5tannyqNKimYzR8eoFLmhlXbJYPFAbvo0rH0wri97PExJayLD70f4UEaU8e8O/Hs6wHPlGlubxZWPaKGNS7BjcfyLwA7XWJROp3vKvAnX/akgB4+60Kto6ySnSMaId+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCCcvuJc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCCcvuJc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40091F00A3A;
	Wed,  2 Sep 2026 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372954;
	bh=54yNXrZO1P2zGtjrxq2kNvn4g7nARF35Hk5SyKf1HWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XCCcvuJchUvCXLTAGibSv7gQPdvn+D62m4jT4TsbEF5E9UhW7WyPddIgQVDZCJpfD
	 P8T/J4Ng7uxdaB+0Uu4cab5K8H5gnq38koeE5l5WeBixDfsYO/Q0NWfrh6YIi3stBh
	 qaCodGZ9rYfjyjgJ0fpUix2vRj0bHEmi9auHPSs98ERmyFGvm2DCprhRxfiotB2ZNr
	 AJoAZ7b9OAOPorP8LK8gWUpfDRmYBTkpre5c5rA9SYBkni7PPTxMPjlyoAHT1+/MJ3
	 SPReVScL5AR5QvCbqVrIzYKWqoL29t/FUA5jMdBcsLJI3ru2VLacJTE63CFcmIBXNl
	 IWK/QxxjKQlWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/12] leds: trigger: netdev: Implement offloaded()
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-7-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-7-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:53 +0000
Message-Id: <20260902181553.C40091F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Resource leak of `net_device` in `netdev_trig_activate()` error pa=
th.
- [High] Race condition in `netdev_led_attr_store()` leading to lost config=
uration updates and a Use-After-Free of `net_device`.
--

commit 2e9edb75c55c3a99bfaf5dc0eea11b9a95851115
Author: Rong Zhang <i@rong.moe>

leds: trigger: netdev: Implement offloaded() callback

"netdev" can run in hardware control according to hardware capabilities
and trigger options. Implement offloaded() callback to provide its hardware
control state to the LED core, and document the relation between the custom
"offloaded" attribute and the generic "trigger_may_offload" attribute.

[ ... ]

> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger=
/ledtrig-netdev.c
> index 5b4e92c14dbb4..2e9af48a74dbf 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c

[ ... ]

> @@ -798,10 +798,18 @@ static void netdev_trig_deactivate(struct led_class=
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
This is a pre-existing issue, but does netdev_trig_activate() leak the
net_device reference on its error path?

When supports_hw_control is true, setting the device name acquires a
reference to the net_device via dev_get_by_name():

drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_activate() {
    ...
    if (supports_hw_control(led_cdev)) {
        ...
        set_device_name(trigger_data, name, strlen(name));
        ...
    }
    ...

If register_netdevice_notifier() subsequently fails, the error path frees
trigger_data but does not drop the net_device reference:

    rc =3D register_netdevice_notifier(&trigger_data->notifier);
    if (rc)
        kfree(trigger_data);
    ...
}

Can this leak prevent the network interface from being completely unregiste=
red,
causing operations like network namespace destruction or module removal to =
hang
indefinitely in the netdev_wait_allrefs loop?

[Severity: High]
This is a pre-existing issue, but is there a race condition in
netdev_led_attr_store() that leads to lost configuration updates and a
use-after-free of net_device?

netdev_led_attr_store() executes concurrently with
netdev_trig_notify(NETDEV_UNREGISTER). Since the sysfs store function
doesn't acquire trigger_data->lock, it can schedule trigger_data->work
locklessly after the notifier has called cancel_delayed_work_sync():

drivers/leds/trigger/ledtrig-netdev.c:netdev_led_attr_store() {
    ...
    cancel_delayed_work_sync(&trigger_data->work);
    ...
    set_baseline_state(trigger_data); // Schedules delayed work outside lock
    ...
}

If netdev_trig_notify() drops the net_device reference and sets it to NULL:

drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_notify() {
    ...
    case NETDEV_UNREGISTER:
        dev_put(trigger_data->net_dev);
        trigger_data->net_dev =3D NULL;
    ...
}

If the scheduled delayed work (netdev_trig_work()) runs concurrently, it
reads trigger_data->net_dev locklessly. Could it read the pointer before
the notifier sets it to NULL, but execute dev_get_stats() after the notifier
has called dev_put(), resulting in a use-after-free?

>  	.deactivate =3D netdev_trig_deactivate,
> +	.offloaded =3D netdev_trig_offloaded,
>  	.groups =3D netdev_trig_groups,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D7
