Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5812E62B7
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332959; cv=none; b=ff7xFTn1OO0gYejwPpz1+2zM1P4NvFQW6hqcA9TbsYwydOz5Cx/dNRMHsLhlwrfuW7wQhHFPiVRagvYjBmLW0MNkScakAm+kATgn9s8yYlvXBpEPFxB+YawH0Hmf4Naqqd40Baqp+T7THECPMHc3lNddV/6IXBNL7r9ti1pba70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332959; c=relaxed/simple;
	bh=VWisaBkwtTYCPueVRYm/9qIB9W2s7nkxtp3JYOe/0ms=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SRfgBlITY6Uzaw1XPi+N24cf7aMK+e1uDNwqXsj4K0oQ6ZvXCkM7V85IkEK881m6wWjo2MKR4hT81lgysPmwQKBE7uAccLkjATbwmTAOWNkPGTZzkufHcx/5avZmi2KAMJQlm4RMea3wHyH/X3m63+T6gSJyc6kjACfvZeMvOkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZfbbxTa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZfbbxTa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97251F000C4;
	Sun, 18 Oct 2026 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792332956;
	bh=K0IIB2JObPB16U1KqQ+MhhTEGAOfDOD/CYc8HDkHflU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LZfbbxTaQu/jI7UtBKfwVLC3ptdcJb7pw7ZQbtQ5+RQyvV3LuPIIsrpYsiIgDIKPV
	 GPj9WWuy83nYEjjb1tWYrjlZsBRflUo20i2kaqhJmPn5V+wVARMIdaQIYBppfrJNxV
	 au/jsGWhBLh4pOZB8nOqC8CUR8TmT1jI4ZCBleycqac6FOASqcZVEztHFpMf7WQUf2
	 bYj+EN09lJmsfwODeANYtzhYrrMVBvftyp/wquQ15jd5X82YrXfovq8NQTTx4XWTC2
	 ylo273+MY40GXN1buiZNE7rkUvJZUIeWo4N19u1NFu/+/Hr3L/CelWFHQEUitFGfxZ
	 2gL6UTnGJGXhg==
Message-ID: <sashiko-outbox-176189@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] leds: class: Split led_classdev_register_ext()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018135339.1109271-9-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-9-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 14:15:55 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] leds: dangling led_cdev->dev pointer on error in led_classdev_init=
()
- [High] leds: premature device_set_node() in led_classdev_init() breaks fw=
_devlink
--

commit 7efb333e9420ea13e705d9a114384e841e92d2b2
Author: Armin Wolf <W_Armin@gmx.de>

leds: class: Split led_classdev_register_ext()

This commit splits led_classdev_register_ext() into led_classdev_init() and
led_classdev_add() so that LED class devices can be initialized before
being added to the subsystem.

> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 77a0fce039528..ace417a2388e0 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c

[ ... ]

> @@ -539,23 +550,54 @@ int led_classdev_register_ext(struct device *parent,
>  	if (!led_cdev->max_brightness)
>  		led_cdev->max_brightness =3D LED_FULL;
> =20
> -	mutex_lock(&led_cdev->led_access);
> -	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0, led=
_cdev,
> -						  led_cdev->groups, "%s", final_name);
> -	if (IS_ERR(led_cdev->dev)) {
> -		mutex_unlock(&led_cdev->led_access);
> -		return PTR_ERR(led_cdev->dev);
> +	led_cdev->dev =3D kzalloc_obj(*led_cdev->dev);
> +	if (!led_cdev->dev)
> +		return -ENOMEM;
> +
> +	device_initialize(led_cdev->dev);
> +	led_cdev->dev->class =3D &leds_class;
> +	led_cdev->dev->parent =3D parent;
> +	led_cdev->dev->groups =3D led_cdev->groups;
> +	dev_set_drvdata(led_cdev->dev, led_cdev);
> +	ret =3D kobject_set_name(&led_cdev->dev->kobj, "%s", final_name);
> +	if (ret < 0)
> +	{
> +		put_device(led_cdev->dev);
> +		return ret;
>  	}

[Severity: High]
Does this leave led_cdev->dev as a dangling pointer when kobject_set_name()
fails here, or when led_classdev_add() fails in led_classdev_register_ext()
below?

Previously, led_cdev->dev was assigned the return value of
device_create_with_groups(), so on any failure it remained either NULL or an
ERR_PTR(). Commit 1dbb9fb4082ce2 ("leds: Allow to call
led_classdev_unregister() unconditionally") added an IS_ERR_OR_NULL() check
to led_classdev_unregister() so drivers can call it unconditionally in their
error and removal paths:

drivers/leds/led-class.c:led_classdev_unregister() {
	if (IS_ERR_OR_NULL(led_cdev->dev))
		return;
...
	led_stop_software_blink(led_cdev);
...
	flush_work(&led_cdev->set_brightness_work);

	device_unregister(led_cdev->dev);

	down_write(&leds_list_lock);
	list_del(&led_cdev->node);
	up_write(&leds_list_lock);
...
}

Many drivers rely on this guarantee during error unwind or removal, such as
asus_wmi_led_init() -> asus_wmi_led_exit() in drivers/platform/x86/asus-wmi=
.c,
asus_led_init() -> asus_led_exit() in drivers/platform/x86/asus-laptop.c, a=
nd
samsung_leds_init() -> samsung_leds_exit() in
drivers/platform/x86/samsung-laptop.c.

With this change, put_device(led_cdev->dev) frees the device via
led_classdev_release(), but led_cdev->dev is not reset to NULL. A subsequent
call to led_classdev_unregister() will bypass the IS_ERR_OR_NULL(led_cdev->=
dev)
check, operate on uninitialized blink_timer and set_brightness_work structu=
res
if kobject_set_name() failed before led_init_core(), trigger a use-after-fr=
ee
and double-free in device_unregister(led_cdev->dev), and crash in
list_del(&led_cdev->node).

> =20
>  	if (init_data && init_data->fwnode)
>  		device_set_node(led_cdev->dev, init_data->fwnode);

[Severity: High]
Could calling device_set_node() in led_classdev_init() before device_add() =
is
called in led_classdev_add() break fw_devlink for child LED nodes?

Previously, device_create_with_groups() called device_add() while
led_cdev->dev->fwnode was still NULL, and device_set_node() was only called
after device_add() returned. When the parent LED controller finished probin=
g,
device_links_driver_bound() -> fw_devlink_pickup_dangling_consumers() marked
the child LED fwnodes with FWNODE_FLAG_NOT_DEVICE and attached consumer lin=
ks
to the parent LED controller device.

Now that led_cdev->dev->fwnode is populated before led_classdev_add() calls
device_add(led_cdev->dev), this block in device_add() will trigger during t=
he
parent driver's probe:

drivers/base/core.c:device_add() {
...
	if (dev->fwnode && !dev->fwnode->dev) {
		dev->fwnode->dev =3D dev;
		fw_devlink_link_device(dev);
	}
...
}

Because led_cdev->dev is a class device that never binds to a driver:

1. __fw_devlink_link_to_consumers(led_cdev->dev) converts consumer fwnode_l=
inks
   on init_data->fwnode into managed device links with led_cdev->dev as the
   supplier instead of the parent LED controller. During boot (while
   fw_devlink_drv_reg_done is false), consumers remain blocked with
   -EPROBE_DEFER until fw_devlink_drivers_done() runs, and are never linked=
 to
   the parent controller for runtime PM, suspend/resume, or unbind ordering.

2. __fw_devlink_link_to_suppliers(led_cdev->dev, fwnode) creates managed de=
vice
   links with led_cdev->dev as the consumer for any supplier properties on =
the
   child LED node (such as gpios in gpio-leds or pwms in pwm-leds). Since
   led_cdev->dev never probes a driver, those links stay in DL_STATE_AVAILA=
BLE
   and prevent the GPIO or PWM suppliers from reaching sync_state().

> -
> -	led_update_brightness(led_cdev);
> -
>  	led_cdev->wq =3D leds_wq;
> =20
>  	led_init_core(led_cdev);
> =20
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(led_classdev_init);
> +
> +/**
> + * led_classdev_add - Add a new LED class device to the subsystem.
> + * @led_cdev: the led_classdev structure for this device.
> + *
> + * Adds a new LED class device to the subsystem, allowing userspace appl=
ications
> + * and/or kernel consumers to access it.
> + *
> + * Returns: Zero on success or a negative error code on failure.
> + */
> +int led_classdev_add(struct led_classdev *led_cdev)
> +{
> +	int ret;
> +
> +	guard(mutex)(&led_cdev->led_access);
> +
> +	ret =3D device_add(led_cdev->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	led_update_brightness(led_cdev);
> +
>  	/* add to the list of leds */
>  	down_write(&leds_list_lock);
>  	list_add_tail(&led_cdev->node, &leds_list);
> @@ -565,13 +607,36 @@ int led_classdev_register_ext(struct device *parent,
>  	led_trigger_set_default(led_cdev);
>  #endif
> =20
> -	mutex_unlock(&led_cdev->led_access);
> -
> -	dev_dbg(parent, "Registered led device: %s\n",
> -			led_cdev->name);
> +	dev_dbg(led_cdev->dev->parent, "Registered led device: %s\n", led_cdev-=
>name);
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(led_classdev_add);
> +
> +/**
> + * led_classdev_register_ext - register a new object of led_classdev cla=
ss
> + *                             with init data.
> + *
> + * @parent: parent of LED device.
> + * @led_cdev: the led_classdev structure for this device.
> + * @init_data: LED class device initialization data.
> + */
> +int led_classdev_register_ext(struct device *parent,
> +                              struct led_classdev *led_cdev,
> +                              struct led_init_data *init_data)
> +{
> +	int ret;
> +
> +	ret =3D led_classdev_init(parent, led_cdev, init_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D led_classdev_add(led_cdev);
> +	if (ret < 0)
> +		put_device(led_cdev->dev);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL_GPL(led_classdev_register_ext);

[ ... ]

>
> --=20
> 2.51.2
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018135339.1109=
271-1-W_Armin@gmx.de?part=3D8
