Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D641347884B
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332569; cv=none; b=JgHbQjb6pcQpjEGHgXptD9CBlroIlrGl6Zcapo7MABQJ4wbPeQlQ4F3cw34RqsKM8b9/8iW69V7VjiH1alxr5dSf9tfcqcjUB3GQfwAPH8E9AedsmbXgtvKV/W2zvzqM2MJwGAqqJGtjhlfAZPA+29HFBgbFFlyWNyLiQzG9ONI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332569; c=relaxed/simple;
	bh=b/uHS79B06i+uFSENiCUdIleSAfs7RkUye5tzM7O/v4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LdRcxd2N/aY9aCNiqtrXDMuxfnrXZDxpbAgQmgMxLOxyU/1mY724YBW6ZZvUeONk4YpsDpEZXqOLkTc6QbP2/KZOy/LwzfVwWoPRK9n5Jp0Ak5iuvn+aIxSF7L4DjHQGPwOI736QYH4yjzVTNFwsaoG3BFJzcGYdceP9b+6DT4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ba5h4v11; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ba5h4v11"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437331F000C4;
	Sun, 18 Oct 2026 14:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792332567;
	bh=BUvwhAs27pdrwl8cQImLhYLmmJ9iKAXgs08OldIYnH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ba5h4v117T8ZdR82Y8zpnqvJiAoLddO2NDbON7kPVHnhibNS31SycL5Law+FYHa2r
	 YuQlyw995M4CezIsTnWE1KNvWp4vr8e8snqMh7eDxgDyv9sQRfAqEfnII1RYZq3j9N
	 fmRw+avPjR9bKIPbgjlrorJ4QXLzCRxAe5WeMuEAEjDoDFnJ8CCQgJ88rmTyvQQouK
	 YRwPuEYPxCPc1Ob3RfsW/uuxJO99Yq0ASuymbalgk69aS/yGFpeKhBHASliL14nA/s
	 vHqnhtlkal2HKhYWeKUYBc4Dap3aSD/wOvBkEx723brPEz+dLxgpWixuetJZG95K3n
	 xfVPl7uxr6V1g==
Message-ID: <sashiko-outbox-176184@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/10] leds: Support custom sysfs groups on multicolor
 and flash LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018135339.1109271-10-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-10-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 14:09:26 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] leds: dangling led_cdev->dev pointer on registration failure cause=
s UAF
--

commit fc841d87d7344c0d4e24b361394ed5d20afd7ffb
Author: Armin Wolf <W_Armin@gmx.de>

leds: Support custom sysfs groups on multicolor and flash LEDs

This commit moves the multicolor and flash LED sysfs attribute groups onto
dedicated device types ("multicolor", "flash", and "standard") so that driv=
ers
can populate led_cdev->groups without having them overwritten during
registration.

> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flas=
h.c
> index 953265fddb7d9..e023511cea1c1 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c

[ ... ]

> @@ -289,26 +282,29 @@ int led_classdev_flash_register_ext(struct device *=
parent,
> =20
>  	led_cdev =3D &fled_cdev->led_cdev;
> =20
> -	if (led_cdev->flags & LED_DEV_CAP_FLASH) {
> -		if (!led_cdev->brightness_set_blocking)
> -			return -EINVAL;
> +	if (!(led_cdev->flags & LED_DEV_CAP_FLASH))
> +		return led_classdev_register_ext(parent, led_cdev, init_data);
> =20
> -		ops =3D fled_cdev->ops;
> -		if (!ops || !ops->strobe_set)
> -			return -EINVAL;
> +	if (!led_cdev->brightness_set_blocking)
> +		return -EINVAL;
> =20
> -		led_cdev->flash_resume =3D led_flash_resume;
> +	ops =3D fled_cdev->ops;
> +	if (!ops || !ops->strobe_set)
> +		return -EINVAL;
> =20
> -		/* Select the sysfs attributes to be created for the device */
> -		led_flash_init_sysfs_groups(fled_cdev);
> -	}
> +	led_cdev->flash_resume =3D led_flash_resume;
> =20
>  	/* Register led class device */
> -	ret =3D led_classdev_register_ext(parent, led_cdev, init_data);
> +	ret =3D led_classdev_init(parent, led_cdev, init_data);
>  	if (ret < 0)
>  		return ret;
> =20
> -	return 0;
> +	led_cdev->dev->type =3D &led_flash_device_type;
> +	ret =3D led_classdev_add(led_cdev);
> +	if (ret < 0)
> +		put_device(led_cdev->dev);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(led_classdev_flash_register_ext);
> =20
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class=
-multicolor.c
> index 57df0b2e785b5..9b8c37f7bdf45 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c

[ ... ]

> @@ -176,9 +183,16 @@ int led_classdev_multicolor_register_ext(struct devi=
ce *parent,
> =20
>  	led_cdev =3D &mcled_cdev->led_cdev;
>  	led_cdev->flags |=3D LED_MULTI_COLOR;
> -	mcled_cdev->led_cdev.groups =3D led_multicolor_groups;
> +	ret =3D led_classdev_init(parent, led_cdev, init_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	led_cdev->dev->type =3D &led_multicolor_device_type;
> +	ret =3D led_classdev_add(led_cdev);
> +	if (ret < 0)
> +		put_device(led_cdev->dev);
> =20
> -	return led_classdev_register_ext(parent, led_cdev, init_data);
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);

[Severity: High]
Could this leave led_cdev->dev as a dangling pointer when registration fail=
s,
leading to a use-after-free in led_classdev_unregister()?

In led_classdev_init(), led_cdev->dev is allocated and initialized via
device_initialize():

drivers/leds/led-class.c:led_classdev_init() {
	...
	led_cdev->dev =3D kzalloc_obj(*led_cdev->dev);
	if (!led_cdev->dev)
		return -ENOMEM;

	device_initialize(led_cdev->dev);
	...
	ret =3D kobject_set_name(&led_cdev->dev->kobj, "%s", final_name);
	if (ret < 0)
	{
		put_device(led_cdev->dev);
		return ret;
	}
	...
}

If kobject_set_name() fails in led_classdev_init(), or if led_classdev_add()
subsequently fails (for example when device_add() fails due to a sysfs group
conflict or -ENOMEM) in led_classdev_flash_register_ext(),
led_classdev_multicolor_register_ext(), or led_classdev_register_ext(),
put_device(led_cdev->dev) releases the final reference and frees the struct
device via led_classdev_release(), but led_cdev->dev is not reset to NULL a=
nd
led_cdev->node is never added to leds_list.

Since commit 1dbb9fb4082ce2 ("leds: Allow to call led_classdev_unregister()
unconditionally"), led_classdev_unregister() permits unconditional teardown=
 by
checking:

drivers/leds/led-class.c:led_classdev_unregister() {
	if (IS_ERR_OR_NULL(led_cdev->dev))
		return;
	...
	device_unregister(led_cdev->dev);
	...
	down_write(&leds_list_lock);
	list_del(&led_cdev->node);
	up_write(&leds_list_lock);
	...
}

Several drivers rely on this contract when cleaning up after failed
registration or on driver removal, such as drivers/leds/leds-blinkm.c:

drivers/leds/leds-blinkm.c:register_multicolor() {
	...
	err =3D led_classdev_multicolor_register(&client->dev, &mc_led->cdev.mcled=
_cdev);
	if (err < 0) {
		dev_err(&client->dev, "couldn't register LED %s\n",
				mc_led->cdev.led_cdev.name);
		sysfs_remove_group(&client->dev.kobj, &blinkm_group);
	}
	return 0;
}

as well as drivers/platform/x86/asus-wmi.c (where asus_wmi_led_init() jumps=
 to
asus_wmi_led_exit() on error), drivers/platform/x86/asus-laptop.c, and
drivers/platform/x86/toshiba_acpi.c.

Because led_cdev->dev still holds a non-NULL, non-ERR_PTR address after
put_device(led_cdev->dev), wouldn't a subsequent call to
led_classdev_unregister() (or its flash and multicolor wrappers) bypass the
IS_ERR_OR_NULL(led_cdev->dev) check, pass the freed pointer to
device_unregister(led_cdev->dev), and dereference NULL in
list_del(&led_cdev->node)?

Should led_cdev->dev be set to NULL after put_device(led_cdev->dev) in the
error paths of led_classdev_init(), led_classdev_register_ext(),
led_classdev_flash_register_ext(), and led_classdev_multicolor_register_ext=
()?

> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index ace417a2388e0..49b321b3d863b 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -613,6 +613,10 @@ int led_classdev_add(struct led_classdev *led_cdev)
>  }
>  EXPORT_SYMBOL_GPL(led_classdev_add);
> =20
> +static const struct device_type led_device_type =3D {
> +	.name =3D "standard",
> +};
> +
>  /**
>   * led_classdev_register_ext - register a new object of led_classdev cla=
ss
>   *                             with init data.
> @@ -631,6 +635,7 @@ int led_classdev_register_ext(struct device *parent,
>  	if (ret < 0)
>  		return ret;
> =20
> +	led_cdev->dev->type =3D &led_device_type;
>  	ret =3D led_classdev_add(led_cdev);
>  	if (ret < 0)
>  		put_device(led_cdev->dev);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018135339.1109=
271-1-W_Armin@gmx.de?part=3D9
