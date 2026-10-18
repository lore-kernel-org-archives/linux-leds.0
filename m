Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EEE3A6EEE
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 17:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343655; cv=none; b=fyPdrSnSPmxLyq2nv0/Ippz7wyZOAD8fo44GA9rz5UwNQjNU1FhCNOGWaBP1Sd4CExQ3kk/KlKj+E5RMkHcUP3ppuxrQk8dSeE4So3i74Z4BT7mU4rReRNV6aGJKIY34mli1HZvYNAP5n2V/wFX4MtAwqQ/DUCqShPLjSB8ruQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343655; c=relaxed/simple;
	bh=weqY7AhufxbcFnVqw7pPzoZ2tooQABm3Rw+jQeb1KdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIU+8vkFs/jhPBK5EiH8+K79Nju1SDaFakWCNmHVoOGjS2axUy0cxKpu+g3vhIYi0+7owNtFJh+xX9k3ZmuY1rf5lYH+bkgcpNlMfGeM8FlkJxiIwfMeNL/RcZmdmI8LwJTNPpc8h13KcTEYGgebTtvPZHbasm6FWU6jw0ERABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=dyb3dhni; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="dyb3dhni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792343647; x=1792948447; i=w_armin@gmx.de;
	bh=GX1d/WZHSJ2c9hgP25Lrn3U02tJ9qkI4WYklZwKdIH4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dyb3dhniLUcBhFOTGarzC4OVswjDyXI69WoAxHwPso8ngGxcG6OwlZSwFkUN4tXd
	 ojSmK5rzlpAzR9hsysdYjRUcP0b1JZrGA/bV1d9kGmIM5p9PyMwnWKje89BjPj0vv
	 bw6FquTem43Vwip3FZjrDZzfwD+KzeKfVwBCSwnQ91eUt4W85wGg67i8jpJuUrHgA
	 N8EJRLRVo+ygsk274WaD2Glp7m4Cl/MebkoFlAQ3BWn0HuZwbDHE+4WeXVJHDSMQo
	 KP7M+YwiXsIfOb0hDOpuoS7KW35O1r2MmI0mnLjp6y9dF72CtfHFSYDvAb9l2/3DC
	 jGDHsHamIgSeaQUypA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQe9s-1wvqhN0jF0-00VR8m; Sun, 18
 Oct 2026 19:14:07 +0200
Message-ID: <bc1371ba-1355-4e45-be2c-d3e806c485a9@gmx.de>
Date: Sun, 18 Oct 2026 19:14:06 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] leds: class: Split led_classdev_register_ext()
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-9-W_Armin@gmx.de> <sashiko-outbox-176189@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <sashiko-outbox-176189@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vaiuelS+XCliXjB2dJEY4GMeuZUxHh4VmMaZthsWw/VnsCBLq2L
 m85P/lv8LLwhEItPadBup6RJa1MxNospdWpzmNc2NJ7ViOnJZLnW6pFO7uKSzdWWdZrNijq
 oP0Tw/tMZa4k0pkFror7bu99/inNLWE8wmGLge2tyZTAzpKjh+FHwYjhbthAZ6lz+WZJu+E
 1yh6gy4TU2Gct0rFuRqXg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T5z+gAxlyv4=;OGISG3Vg/LqSjtN9DON1uqk/4/v
 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
 gWIsdMz7Q3nRbf0DIMlA=

Am 18.10.26 um 16:15 schrieb sashiko-bot@kernel.org:

> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
> - [High] leds: dangling led_cdev->dev pointer on error in led_classdev_i=
nit()
> - [High] leds: premature device_set_node() in led_classdev_init() breaks=
 fw_devlink
> --
>
> commit 7efb333e9420ea13e705d9a114384e841e92d2b2
> Author: Armin Wolf <W_Armin@gmx.de>
>
> leds: class: Split led_classdev_register_ext()
>
> This commit splits led_classdev_register_ext() into led_classdev_init() =
and
> led_classdev_add() so that LED class devices can be initialized before
> being added to the subsystem.
>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index 77a0fce039528..ace417a2388e0 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
> [ ... ]
>
>> @@ -539,23 +550,54 @@ int led_classdev_register_ext(struct device *pare=
nt,
>>   	if (!led_cdev->max_brightness)
>>   		led_cdev->max_brightness =3D LED_FULL;
>>  =20
>> -	mutex_lock(&led_cdev->led_access);
>> -	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0, l=
ed_cdev,
>> -						  led_cdev->groups, "%s", final_name);
>> -	if (IS_ERR(led_cdev->dev)) {
>> -		mutex_unlock(&led_cdev->led_access);
>> -		return PTR_ERR(led_cdev->dev);
>> +	led_cdev->dev =3D kzalloc_obj(*led_cdev->dev);
>> +	if (!led_cdev->dev)
>> +		return -ENOMEM;
>> +
>> +	device_initialize(led_cdev->dev);
>> +	led_cdev->dev->class =3D &leds_class;
>> +	led_cdev->dev->parent =3D parent;
>> +	led_cdev->dev->groups =3D led_cdev->groups;
>> +	dev_set_drvdata(led_cdev->dev, led_cdev);
>> +	ret =3D kobject_set_name(&led_cdev->dev->kobj, "%s", final_name);
>> +	if (ret < 0)
>> +	{
>> +		put_device(led_cdev->dev);
>> +		return ret;
>>   	}
> [Severity: High]
> Does this leave led_cdev->dev as a dangling pointer when kobject_set_nam=
e()
> fails here, or when led_classdev_add() fails in led_classdev_register_ex=
t()
> below?
>
> Previously, led_cdev->dev was assigned the return value of
> device_create_with_groups(), so on any failure it remained either NULL o=
r an
> ERR_PTR(). Commit 1dbb9fb4082ce2 ("leds: Allow to call
> led_classdev_unregister() unconditionally") added an IS_ERR_OR_NULL() ch=
eck
> to led_classdev_unregister() so drivers can call it unconditionally in t=
heir
> error and removal paths:
>
> drivers/leds/led-class.c:led_classdev_unregister() {
> 	if (IS_ERR_OR_NULL(led_cdev->dev))
> 		return;
> ...
> 	led_stop_software_blink(led_cdev);
> ...
> 	flush_work(&led_cdev->set_brightness_work);
>
> 	device_unregister(led_cdev->dev);
>
> 	down_write(&leds_list_lock);
> 	list_del(&led_cdev->node);
> 	up_write(&leds_list_lock);
> ...
> }
>
> Many drivers rely on this guarantee during error unwind or removal, such=
 as
> asus_wmi_led_init() -> asus_wmi_led_exit() in drivers/platform/x86/asus-=
wmi.c,
> asus_led_init() -> asus_led_exit() in drivers/platform/x86/asus-laptop.c=
, and
> samsung_leds_init() -> samsung_leds_exit() in
> drivers/platform/x86/samsung-laptop.c.
>
> With this change, put_device(led_cdev->dev) frees the device via
> led_classdev_release(), but led_cdev->dev is not reset to NULL. A subseq=
uent
> call to led_classdev_unregister() will bypass the IS_ERR_OR_NULL(led_cde=
v->dev)
> check, operate on uninitialized blink_timer and set_brightness_work stru=
ctures
> if kobject_set_name() failed before led_init_core(), trigger a use-after=
-free
> and double-free in device_unregister(led_cdev->dev), and crash in
> list_del(&led_cdev->node).
>
>>  =20
>>   	if (init_data && init_data->fwnode)
>>   		device_set_node(led_cdev->dev, init_data->fwnode);
> [Severity: High]
> Could calling device_set_node() in led_classdev_init() before device_add=
() is
> called in led_classdev_add() break fw_devlink for child LED nodes?
>
> Previously, device_create_with_groups() called device_add() while
> led_cdev->dev->fwnode was still NULL, and device_set_node() was only cal=
led
> after device_add() returned. When the parent LED controller finished pro=
bing,
> device_links_driver_bound() -> fw_devlink_pickup_dangling_consumers() ma=
rked
> the child LED fwnodes with FWNODE_FLAG_NOT_DEVICE and attached consumer =
links
> to the parent LED controller device.
>
> Now that led_cdev->dev->fwnode is populated before led_classdev_add() ca=
lls
> device_add(led_cdev->dev), this block in device_add() will trigger durin=
g the
> parent driver's probe:
>
> drivers/base/core.c:device_add() {
> ...
> 	if (dev->fwnode && !dev->fwnode->dev) {
> 		dev->fwnode->dev =3D dev;
> 		fw_devlink_link_device(dev);
> 	}
> ...
> }
>
> Because led_cdev->dev is a class device that never binds to a driver:
>
> 1. __fw_devlink_link_to_consumers(led_cdev->dev) converts consumer fwnod=
e_links
>     on init_data->fwnode into managed device links with led_cdev->dev as=
 the
>     supplier instead of the parent LED controller. During boot (while
>     fw_devlink_drv_reg_done is false), consumers remain blocked with
>     -EPROBE_DEFER until fw_devlink_drivers_done() runs, and are never li=
nked to
>     the parent controller for runtime PM, suspend/resume, or unbind orde=
ring.
>
> 2. __fw_devlink_link_to_suppliers(led_cdev->dev, fwnode) creates managed=
 device
>     links with led_cdev->dev as the consumer for any supplier properties=
 on the
>     child LED node (such as gpios in gpio-leds or pwms in pwm-leds). Sin=
ce
>     led_cdev->dev never probes a driver, those links stay in DL_STATE_AV=
AILABLE
>     and prevent the GPIO or PWM suppliers from reaching sync_state().

I have no experience with devicetree, so i cannot verify if this is true, =
why do we call
device_set_node() in the first place after having already registered the d=
evice?

Thanks,
Armin Wolf

>> -
>> -	led_update_brightness(led_cdev);
>> -
>>   	led_cdev->wq =3D leds_wq;
>>  =20
>>   	led_init_core(led_cdev);
>>  =20
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(led_classdev_init);
>> +
>> +/**
>> + * led_classdev_add - Add a new LED class device to the subsystem.
>> + * @led_cdev: the led_classdev structure for this device.
>> + *
>> + * Adds a new LED class device to the subsystem, allowing userspace ap=
plications
>> + * and/or kernel consumers to access it.
>> + *
>> + * Returns: Zero on success or a negative error code on failure.
>> + */
>> +int led_classdev_add(struct led_classdev *led_cdev)
>> +{
>> +	int ret;
>> +
>> +	guard(mutex)(&led_cdev->led_access);
>> +
>> +	ret =3D device_add(led_cdev->dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	led_update_brightness(led_cdev);
>> +
>>   	/* add to the list of leds */
>>   	down_write(&leds_list_lock);
>>   	list_add_tail(&led_cdev->node, &leds_list);
>> @@ -565,13 +607,36 @@ int led_classdev_register_ext(struct device *pare=
nt,
>>   	led_trigger_set_default(led_cdev);
>>   #endif
>>  =20
>> -	mutex_unlock(&led_cdev->led_access);
>> -
>> -	dev_dbg(parent, "Registered led device: %s\n",
>> -			led_cdev->name);
>> +	dev_dbg(led_cdev->dev->parent, "Registered led device: %s\n", led_cde=
v->name);
>>  =20
>>   	return 0;
>>   }
>> +EXPORT_SYMBOL_GPL(led_classdev_add);
>> +
>> +/**
>> + * led_classdev_register_ext - register a new object of led_classdev c=
lass
>> + *                             with init data.
>> + *
>> + * @parent: parent of LED device.
>> + * @led_cdev: the led_classdev structure for this device.
>> + * @init_data: LED class device initialization data.
>> + */
>> +int led_classdev_register_ext(struct device *parent,
>> +                              struct led_classdev *led_cdev,
>> +                              struct led_init_data *init_data)
>> +{
>> +	int ret;
>> +
>> +	ret =3D led_classdev_init(parent, led_cdev, init_data);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D led_classdev_add(led_cdev);
>> +	if (ret < 0)
>> +		put_device(led_cdev->dev);
>> +
>> +	return ret;
>> +}
>>   EXPORT_SYMBOL_GPL(led_classdev_register_ext);
> [ ... ]
>
>> --=20
>> 2.51.2
>>
