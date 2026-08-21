Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4679493638
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333256; cv=none; b=irQPg9/WoUwHmqSrS6sJQE3bsU+BytFg5IUEz63Y0phwU9rn43iMXcD04bas6XTvZSdiyyfyzVCbIv0BcJnDm2g01A0cserss+dMd0NN3/7oSu2dqJ6vbhC/pSsSlvWte0earCmSpkGCASDs8WarYQQvprnubnTUmk28gRDgf4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333256; c=relaxed/simple;
	bh=2XC9KCpBuALbR1CdwUP6xDgfIoQOZn/blyxNnEFnAjw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WMTH+HGiWfAIH8FNX07j4O1n9ahC8DPfy9zV8K0QpKoUaGtPt3f2PAxxsmga/Ow4MNQ6uIpJxmZXb9Ek8THLO2LeHNMPNclvpl9EaEZApNFiA/X5LML+uE9D3zoM0gggUjE1Ri/md5fVnEhNrpKAHFHjB0RzeFKmT4W/qQgLk2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omoPzP5w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omoPzP5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4041F000E9;
	Fri, 21 Aug 2026 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333254;
	bh=3IWIOHQr71/zPOvZQkZ3qvapkuX25dH37bntgPIhBvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=omoPzP5wzROIEKdOLu96NOpR4DYSdi2E4V5b/j5ZPydUpu6DBMhZqwGJShl3o9p6i
	 F/1XL5ARST/T5u5A9SuE5KMWRDnP48UX+4CZ1Lbf9h6EBOlFw/hB4LD6G1or49LIu1
	 Wz5jiYKObJwEMBOOsal5Uct2i+rpXri/k+5kkbWSoQgCILa94UDI3oQ4FqR/u4guq0
	 MOL06E4IkjX3NwdWwua+pyQykAps+f/v07RLytUZD3sPkWt9CUKqftmikidwgP+t1K
	 1njHcLCE4ZjAwGZ+9NjeglYoH5pjEWH5i1eWKGGaHReIxnUV9s7fLJMar+DaSf1maZ
	 l+ikCansy3TyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/12] leds: trigger: netdev: Implement offloaded()
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-6-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-6-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:33 +0000
Message-Id: <20260821172734.2E4041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Unprotected lockless read of shared state in `netdev_trig_offloa=
ded()`

Pre-existing issues:
- [High] Resource leak of `net_device` in `netdev_trig_activate()` error pa=
th
--

--- Patch [6]: [PATCH v5 06/12] leds: trigger: netdev: Implement offloaded(=
) callback ---
commit d8144f7505ed647e0e3c94f8c01b2ef2b0814005
Author: Rong Zhang <i@rong.moe>

leds: trigger: netdev: Implement offloaded() callback

This commit implements the offloaded callback for the netdev trigger,
providing its hardware control state to the LED core. It also updates the
sysfs ABI documentation to clarify the relationship between the custom and
generic offload attributes.

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

[Severity: Medium]
Is it possible for hw_control to be read while it is being updated?

When userspace reads the trigger_may_offload sysfs attribute, it calls
netdev_trig_offloaded() holding only the led_cdev->trigger_lock, which is a
read lock.

Concurrently, a network event can invoke netdev_trig_notify() which
acquires trigger_data->lock and mutates trigger_data->hw_control.

Does this code need to hold trigger_data->lock or use the READ_ONCE() macro
to prevent a data race when reading trigger_data->hw_control here?

> +}
> +
>  static struct led_trigger netdev_led_trigger =3D {
>  	.name =3D "netdev",
>  	.activate =3D netdev_trig_activate,
>  	.deactivate =3D netdev_trig_deactivate,
> +	.offloaded =3D netdev_trig_offloaded,
>  	.groups =3D netdev_trig_groups,
>  };

[Severity: High]
This is a pre-existing issue, but does netdev_trig_activate() leak a
net_device reference in its error path?

If hardware control is supported, set_device_name() is called, which
acquires a net device reference via dev_get_by_name() and saves it to
trigger_data->net_dev.

If the subsequent call to register_netdevice_notifier() fails, the error
path executes:

drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_activate() {
    ...
	rc =3D register_netdevice_notifier(&trigger_data->notifier);
	if (rc)
		kfree(trigger_data);

	return rc;
}

Since trigger_data is freed without calling dev_put(trigger_data->net_dev),
does this leave a permanent reference count leak on the net_device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D6
