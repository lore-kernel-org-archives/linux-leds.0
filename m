Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863DE46D542
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394453; cv=none; b=J+UPo1TDGI6PQfW7iSNMwavT2+cYH0jsGRkXmaPInCQVYZ/i11YclVFlx0QMr55fdSo09O8dDbidmbVj28l5PdHF3FUAsdXHxvH+EIsYp5++bZcnmfkS+myoRZHOswqCb33epkR8pLQHdDOnV1PfrlTbjK4zbtHrXvFTQw3OLs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394453; c=relaxed/simple;
	bh=rBNIq4AOU7UqSyxcKktkgszWO60ApjgyvN9LW+sPa/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EUyeGBvZNduio2Af5u6roDkZeWAuhFVmFDCGVO5vPdXPfOxBaIl4WQx38+wNM+CF6oObVqPtMUHkLaDXlggUoBuZS5hZa4/nwuHDU7szcXZx0jiEzDuc5fLjZ2BQ2B5Jb258P6UEWdkkzETOz4qNUQKb7tqg45j30wTCw6ISk5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loPi18N2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loPi18N2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F4C1F000FF;
	Mon, 14 Sep 2026 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789394446;
	bh=tE9icCBy9wiBSsyNOzAO13q86fgwl8K6tn2WLBRwH5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=loPi18N2QIiZ9ZKny87kbqbUsTaGw6J2E0nI9WdXvbdfgc81JAvIbK2adBQ3VoTDY
	 V2FwLBD4kOMZ1BiP50gA59ZESM7EBY/Mz657sIKC4oAVLFrHue646kglOCcr0mFWF+
	 yujI/bWMN8RSN6dGtCtoPVy9+zIp27dCmaLDxEsrNR6fKAgZIA84CKYkCFFNF6Qtai
	 my5nKrYShYVyhD9E6jPq9R/UJdN+D9MOU8bC/D0iHA8FQoi5RbWIq7YSSHIIE9hc80
	 HQjqNVma8Deut4CNtRUomPy/lIbGUnh/kLFwK1ZT1U3q1YBpetyn/7wDgQnbM5enaR
	 Fq5djJrU8utlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] leds: trigger: netdev: fix sysfs_update_group() vs
 led_trigger_set() races
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260914132356.807004-3-alexander.sverdlin@siemens.com>
References: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
 <20260914132356.807004-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:00:45 +0000
Message-Id: <20260914140045.B8F4C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Memory leak of `net_device` reference on error paths in `netdev_tr=
ig_activate()`.
--

commit 8000797f0bcd86f582cb708cea2c7a3ec07a48c4
Author: Alexander Sverdlin <alexander.sverdlin@siemens.com>

leds: trigger: netdev: fix sysfs_update_group() vs led_trigger_set() races

The netdev LED trigger is reworked to own the link_speed attribute group
lifecycle instead of letting the LED core manage it. This is achieved by
creating and removing the group in the activate and deactivate callbacks,
fixing sysfs race conditions during concurrent link-up events.

> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger=
/ledtrig-netdev.c
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c

[ ... ]

> @@ -784,10 +795,29 @@ static int netdev_trig_activate(struct led_classdev=
 *led_cdev)
> =20
>  	led_set_trigger_data(led_cdev, trigger_data);
> =20
> +	/*
> +	 * Own the link_speed attribute group here instead of listing it in
> +	 * netdev_led_trigger.groups, so its later sysfs_update_group() refresh=
es
> +	 * cannot race with the LED core's device_add_groups() /
> +	 * device_remove_groups().  Create it before registering the notifier so
> +	 * that a NETDEV_CHANGE cannot refresh a not-yet-created group.
> +	 */
> +	rc =3D sysfs_create_group(&led_cdev->dev->kobj,
> +				&netdev_trig_link_speed_attrs_group);
> +	if (rc)
> +		goto err_free;
> +
>  	rc =3D register_netdevice_notifier(&trigger_data->notifier);
>  	if (rc)
> -		kfree(trigger_data);
> +		goto err_remove_group;
> =20
> +	return 0;
> +
> +err_remove_group:
> +	sysfs_remove_group(&led_cdev->dev->kobj,
> +			   &netdev_trig_link_speed_attrs_group);
> +err_free:
> +	kfree(trigger_data);
>  	return rc;
>  }

[Severity: High]
This is a pre-existing issue, but this patch adds a new, realistically
reachable failure point (sysfs_create_group) that triggers it.

Earlier in netdev_trig_activate(), if hw control is supported, the driver
calls set_device_name() which can acquire a network device reference via
dev_get_by_name() and store it in trigger_data->net_dev.

If sysfs_create_group() or register_netdevice_notifier() subsequently fail,
the code jumps to the err_free label. It frees trigger_data but misses
calling dev_put(trigger_data->net_dev) to release the acquired reference.

Could this missing dev_put() leak the reference and cause subsequent calls =
to
unregister_netdevice() to hang indefinitely while waiting for the network
device to become free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914132356.8070=
04-1-alexander.sverdlin@siemens.com?part=3D2
