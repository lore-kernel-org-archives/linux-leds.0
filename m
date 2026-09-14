Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD814457CF
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 13:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393830; cv=none; b=J+mnWertNGCIfl9lbkdl5lMf/kG+g44EZGaUTYBcgNjDRqpxUBIFVCuluZotfd5thDSxhCunsWqS12R4tdtZO0VbMAQF72JU6Rq7+knIyl3wDO91EQo045viyTW/xnmqRlDq1nzl7rAs3EzUlLRNqDFcZ5Q76X/SJQ7RtGU8ccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393830; c=relaxed/simple;
	bh=ZstIFM36D66ZoZETxyhl55T5sKDq5n3K+8yYTMX/jf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PahReK5FUmoUfzZxkZWgJOs20l6czyadwVzvFCkOQ0NaRQHZJ8XK5VTi4HZrFVUxi5DEhvitdWu1m7vbRu3K2WT8HBFFHvWdRlbUvVfJGSrtwEERd49SiwpWhxHlyO50LYwLX47bqj2v0HjstHsnABEteJtPWlEL6h8mCnwmROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyFIF41t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyFIF41t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976D31F000FF;
	Mon, 14 Sep 2026 13:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789393828;
	bh=nsC18raq9tFakBg8E75xx2HnxpgDG3nJ3i01CzjX0EY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oyFIF41t+S2jZ2rNLmnT2k7TUCLw7l0sQgLjEDfNK82dEn+W+9ME/7LPjXo7Gxjzy
	 KxbQSUGV9kINNClCkPiXpduqWkLFzOaEPtNkHFb8eg0sZJ+WYwXLohP9/nZGKDqMpb
	 RJjhrY3oxcCKQuNsur0sLPPbFCPIbbm/+LVOPlhUyr8ptuJuM03siw77WMMfUKTPGx
	 6rXs33GIZ0viEws3HUygj4Gud2IA6FK5Q+SDRNHHpEehTCh1TUm+lDVX+DaUBAdHh4
	 dm4OCFQLHS1BVMhBysT3QGkQerMZ1/BwYIGe5rp41OSlFARZgYzdQRJKYZPwUYugqx
	 xBbzm05jXFkSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] leds: trigger: netdev: hold lock across
 sysfs_update_group() in device_name_store()
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260914132356.807004-2-alexander.sverdlin@siemens.com>
References: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
 <20260914132356.807004-2-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 13:50:28 +0000
Message-Id: <20260914135028.976D31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Cementing the anti-pattern of calling `sysfs_update_group()` under=
 `trigger_data->lock` creates an architectural deadlock trap with sysfs cal=
lbacks.
- [Low] The commit message description is not capitalized, violating LED su=
bsystem guidelines.

Pre-existing issues:
- [High] Missing `dev_put()` in the error path of `netdev_trig_activate` ca=
uses a permanent reference leak of the network device.
--

commit afc39a712420509489f8fd34d9ef514cdf8ed25a
Author: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: leds: trigger: netdev: hold lock across sysfs_update_group() in de=
vice_name_store()

This patch attempts to resolve a race condition between device_name_store()=
 and
netdev_trig_notify() by holding trigger_data->lock around sysfs_update_grou=
p()
in device_name_store(). The intent is to match the locking context already =
used
in netdev_trig_notify() to protect concurrent reads of supported_link_modes.

> leds: trigger: netdev: hold lock across sysfs_update_group() in device_na=
me_store()

[Severity: Low]
This isn't a bug introduced by this patch, but the commit message descripti=
on
isn't capitalized. Should it be "Hold lock..." to match the LED subsystem
guidelines?

> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger=
/ledtrig-netdev.c
> index 5b4e92c14dbb4..354d3b640fa53 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -336,8 +336,14 @@ static ssize_t device_name_store(struct device *dev,
>  	if (ret < 0)
>  		return ret;
> =20
> -	/* Refresh link_speed visibility */
> +	/*
> +	 * Refresh link_speed visibility, serialized against netdev_trig_notify=
()
> +	 * which may concurrently call sysfs_update_group() on the same group
> +	 * while reading supported_link_modes via netdev_trig_link_speed_visibl=
e().
> +	 */
> +	mutex_lock(&trigger_data->lock);
>  	sysfs_update_group(&dev->kobj, &netdev_trig_link_speed_attrs_group);
> +	mutex_unlock(&trigger_data->lock);
> =20
>  	return size;
>  }

[Severity: High]
Does expanding this lock coverage to include sysfs_update_group() create a
lock inversion deadlock with sysfs active references?

If a user thread writes to a sysfs attribute (like link_10), the kernfs core
acquires an active reference on that attribute before calling the store
callback. The callback then waits for trigger_data->lock:

netdev_led_attr_store()
    guard(mutex)(&trigger_data->lock);

If concurrently, a network link change processes in netdev_trig_notify(), it
acquires trigger_data->lock and then calls sysfs_update_group().

sysfs_update_group() must drain all active references on the sysfs group be=
fore
it can proceed, so it will block waiting for the user thread to finish its
write.

Since netdev_trig_notify() holds the rtnl lock, could this deadlock freeze
the entire network stack?

While reviewing this file, I noticed a pre-existing issue in the activation
sequence:

drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_activate() {
    ...
    if (supports_hw_control(led_cdev)) {
        dev =3D led_cdev->hw_control_get_device(led_cdev);
        if (dev) {
            const char *name =3D dev_name(dev);
            ...
            set_device_name(trigger_data, name, strlen(name));
            ...
        }
    }
    ...
    rc =3D register_netdevice_notifier(&trigger_data->notifier);
    if (rc)
        kfree(trigger_data);

    return rc;
}

[Severity: High]
This is a pre-existing issue, but is there a missing dev_put() on the netwo=
rk
device in the error path for register_netdevice_notifier()?

When hardware control is supported, set_device_name() acquires a reference =
to
the network device via dev_get_by_name(). If register_netdevice_notifier()
fails later, the error path frees trigger_data but seems to leave the netwo=
rk
device reference held.

Would this permanent reference leak prevent network interfaces from being t=
orn
down or block network namespace destruction?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914132356.8070=
04-1-alexander.sverdlin@siemens.com?part=3D1
