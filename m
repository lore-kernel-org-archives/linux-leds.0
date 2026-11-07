Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010994;
	b=faPUL3JCPyVKQABizjQQSEtpA0FM1mPtWqXsUzmX7bBLRawHdpzfRXhBUGkdqeKw465V
	 g+xyoZLuFRmQWsI+X6nG46eNG8pT3Dmnr5JmTlG/772Glf6hrVitu9BnWnDSrBbmXCKcW
	 bmauwIrHdokWtCm6o83KzHHJf0JrMKWufaQvH2TMp6nh43S5oZQl4SJICpWy7dwg6VCvZ
	 eDd0Fv2J3HzHUklJz52yrMUo25Nf2zctfxwR+4CJL9XcMB89Te4MPMkeufHyhI6IxH41B
	 cptmnwW19plMQxhl+EMl5yAME7AsLi9qLYz7HWINh0Cv2RO6mFO36lZJ87Ci/Mgr7cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010994;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=DZcTUC7HyY88np719h1R6oqCELaOfB64Wq0l2BBsuGo=;
	b=FcKd65YADmDKlPhwrRe65xKL9CHuzTcRyYlSaCOMRr7RzzHw2cFd2Si0GCnuz4rmArbI
	 fDqUfnXYwEoxCuyHrCEwoQFat3Mp/i5TLvNMVv5WtbvDZZWhMtgTYMIHSCAE+gbWSJr+N
	 IXkrNih+1WMAXudWyKDJhBdRFJbJUv9M7CV01RUIdhVv5+AsGuiPcxB1GYiRGRZM20jfV
	 gN7jmScPm7oQYJIKhcwwucyTxr2LIXYPhIQtP1+nA+NRaliFH0hgsccUaIV5JrEeRvyol
	 nDjRkRT1uS7tihRJJeMEBEPTVvqvhTuO9HuK3CymoJbfomyW6W+XQch46uxRvqIx09Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="mLGn/L63";
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FF6606A326
	for <linux-leds@vger.kernel.org>; Sat,  7 Nov 2026 00:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FF6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=mLGn/L63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794010991; x=1794615791; i=w_armin@gmx.de;
	bh=DZcTUC7HyY88np719h1R6oqCELaOfB64Wq0l2BBsuGo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mLGn/L63EgK9/n/aL6JJCDdi0guCQx4ho6hf014UsYMb32F/Zy/anaxGXJBb5XdP
	 Z5QJVpuxyyqp3lJAAgEeJE1chHLSszZW0TgzHx8w/zX7Ph6D9wVbPtsYjaMwIaGZF
	 84iXb7T9N1VzDym+O0EtJcudbwH6W3gXl9Hv1JiGzHyOKyphm6OW7dZapqJKpxXK2
	 7PqhX94UDuFMudkVogKOdlcdgCh9dOzEEdsIy9KRxVga7NhGw7OSkurMJix3cdIJm
	 /+Hrk2gD9cBPd/mCXHb4A9eXzL8M64wTBI6i0LseGqdvmNfzarXJM3effkaMoY1tA
	 6ZCvzekiu/8bBcp4Lg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOGU-1wUtTl0WHm-00vfVG; Sat, 07
 Nov 2026 01:23:11 +0100
Message-ID: <4d9e01c3-acaf-4f5c-bbc1-fc4c78582571@gmx.de>
Date: Sat, 7 Nov 2026 01:23:10 +0100
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] leds: class: Split led_classdev_register_ext()
From: Armin Wolf <W_Armin@gmx.de>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-9-W_Armin@gmx.de> <sashiko-outbox-176189@kernel.org>
 <bc1371ba-1355-4e45-be2c-d3e806c485a9@gmx.de>
Content-Language: en-US
In-Reply-To: <bc1371ba-1355-4e45-be2c-d3e806c485a9@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vFycZ4kxzWoEGAvAy6C34+dCZ5MG/Ec36bii1OkE+8leA3sm2G7
 peRECUHiXiwq8CZt6dib+oiVtchk0t7ODqHyoJ7aVaropyj51Kju0xIsqXH5dAPDXAqdxgP
 9XZnrwTONFmgpHBmOyCg+aSed44Ce1QUIk18Hs0N7wTVXTYJUlFkYISkPTs1vWlnCPEU95u
 E2RjQTCT2+zr6uAmWJ5ew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X+xp+bBQ9ac=;+zX97mvtMsPyoYFYTHfO8ZXucqg
 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

Am 18.10.26 um 19:14 schrieb Armin Wolf:

> Am 18.10.26 um 16:15 schrieb sashiko-bot@kernel.org:
>
>> Thank you for your contribution! Sashiko AI review found 2 potential=20
>> issue(s) to consider:
>> - [High] leds: dangling led_cdev->dev pointer on error in=20
>> led_classdev_init()
>> - [High] leds: premature device_set_node() in led_classdev_init()=20
>> breaks fw_devlink
>> --=20
>>
>> commit 7efb333e9420ea13e705d9a114384e841e92d2b2
>> Author: Armin Wolf <W_Armin@gmx.de>
>>
>> leds: class: Split led_classdev_register_ext()
>>
>> This commit splits led_classdev_register_ext() into=20
>> led_classdev_init() and
>> led_classdev_add() so that LED class devices can be initialized before
>> being added to the subsystem.
>>
>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>> index 77a0fce039528..ace417a2388e0 100644
>>> --- a/drivers/leds/led-class.c
>>> +++ b/drivers/leds/led-class.c
>> [ ... ]
>>
>>> @@ -539,23 +550,54 @@ int led_classdev_register_ext(struct device=20
>>> *parent,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!led_cdev->max_brightness)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_cdev->max_b=
rightness =3D LED_FULL;
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 mutex_lock(&led_cdev->led_access);
>>> -=C2=A0=C2=A0=C2=A0 led_cdev->dev =3D device_create_with_groups(&leds_=
class, parent,=20
>>> 0, led_cdev,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 led_cdev->groups, "%s", final_name);
>>> -=C2=A0=C2=A0=C2=A0 if (IS_ERR(led_cdev->dev)) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&led_cdev->le=
d_access);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(led_cdev->d=
ev);
>>> +=C2=A0=C2=A0=C2=A0 led_cdev->dev =3D kzalloc_obj(*led_cdev->dev);
>>> +=C2=A0=C2=A0=C2=A0 if (!led_cdev->dev)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 device_initialize(led_cdev->dev);
>>> +=C2=A0=C2=A0=C2=A0 led_cdev->dev->class =3D &leds_class;
>>> +=C2=A0=C2=A0=C2=A0 led_cdev->dev->parent =3D parent;
>>> +=C2=A0=C2=A0=C2=A0 led_cdev->dev->groups =3D led_cdev->groups;
>>> +=C2=A0=C2=A0=C2=A0 dev_set_drvdata(led_cdev->dev, led_cdev);
>>> +=C2=A0=C2=A0=C2=A0 ret =3D kobject_set_name(&led_cdev->dev->kobj, "%s=
", final_name);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 put_device(led_cdev->dev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> [Severity: High]
>> Does this leave led_cdev->dev as a dangling pointer when=20
>> kobject_set_name()
>> fails here, or when led_classdev_add() fails in=20
>> led_classdev_register_ext()
>> below?
>>
>> Previously, led_cdev->dev was assigned the return value of
>> device_create_with_groups(), so on any failure it remained either=20
>> NULL or an
>> ERR_PTR(). Commit 1dbb9fb4082ce2 ("leds: Allow to call
>> led_classdev_unregister() unconditionally") added an IS_ERR_OR_NULL()=
=20
>> check
>> to led_classdev_unregister() so drivers can call it unconditionally=20
>> in their
>> error and removal paths:
>>
>> drivers/leds/led-class.c:led_classdev_unregister() {
>> =C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR_OR_NULL(led_cdev->dev))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> ...
>> =C2=A0=C2=A0=C2=A0=C2=A0led_stop_software_blink(led_cdev);
>> ...
>> =C2=A0=C2=A0=C2=A0=C2=A0flush_work(&led_cdev->set_brightness_work);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0device_unregister(led_cdev->dev);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0down_write(&leds_list_lock);
>> =C2=A0=C2=A0=C2=A0=C2=A0list_del(&led_cdev->node);
>> =C2=A0=C2=A0=C2=A0=C2=A0up_write(&leds_list_lock);
>> ...
>> }
>>
>> Many drivers rely on this guarantee during error unwind or removal,=20
>> such as
>> asus_wmi_led_init() -> asus_wmi_led_exit() in=20
>> drivers/platform/x86/asus-wmi.c,
>> asus_led_init() -> asus_led_exit() in=20
>> drivers/platform/x86/asus-laptop.c, and
>> samsung_leds_init() -> samsung_leds_exit() in
>> drivers/platform/x86/samsung-laptop.c.
>>
>> With this change, put_device(led_cdev->dev) frees the device via
>> led_classdev_release(), but led_cdev->dev is not reset to NULL. A=20
>> subsequent
>> call to led_classdev_unregister() will bypass the=20
>> IS_ERR_OR_NULL(led_cdev->dev)
>> check, operate on uninitialized blink_timer and set_brightness_work=20
>> structures
>> if kobject_set_name() failed before led_init_core(), trigger a=20
>> use-after-free
>> and double-free in device_unregister(led_cdev->dev), and crash in
>> list_del(&led_cdev->node).
>>
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (init_data && init_data->fwno=
de)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_set_node=
(led_cdev->dev, init_data->fwnode);
>> [Severity: High]
>> Could calling device_set_node() in led_classdev_init() before=20
>> device_add() is
>> called in led_classdev_add() break fw_devlink for child LED nodes?
>>
>> Previously, device_create_with_groups() called device_add() while
>> led_cdev->dev->fwnode was still NULL, and device_set_node() was only=20
>> called
>> after device_add() returned. When the parent LED controller finished=20
>> probing,
>> device_links_driver_bound() -> fw_devlink_pickup_dangling_consumers()=
=20
>> marked
>> the child LED fwnodes with FWNODE_FLAG_NOT_DEVICE and attached=20
>> consumer links
>> to the parent LED controller device.
>>
>> Now that led_cdev->dev->fwnode is populated before led_classdev_add()=
=20
>> calls
>> device_add(led_cdev->dev), this block in device_add() will trigger=20
>> during the
>> parent driver's probe:
>>
>> drivers/base/core.c:device_add() {
>> ...
>> =C2=A0=C2=A0=C2=A0=C2=A0if (dev->fwnode && !dev->fwnode->dev) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->fwnode->dev =3D dev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fw_devlink_link_device(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0}
>> ...
>> }
>>
>> Because led_cdev->dev is a class device that never binds to a driver:
>>
>> 1. __fw_devlink_link_to_consumers(led_cdev->dev) converts consumer=20
>> fwnode_links
>> =C2=A0=C2=A0=C2=A0 on init_data->fwnode into managed device links with =
led_cdev->dev=20
>> as the
>> =C2=A0=C2=A0=C2=A0 supplier instead of the parent LED controller. Durin=
g boot (while
>> =C2=A0=C2=A0=C2=A0 fw_devlink_drv_reg_done is false), consumers remain =
blocked with
>> =C2=A0=C2=A0=C2=A0 -EPROBE_DEFER until fw_devlink_drivers_done() runs, =
and are never=20
>> linked to
>> =C2=A0=C2=A0=C2=A0 the parent controller for runtime PM, suspend/resume=
, or unbind=20
>> ordering.
>>
>> 2. __fw_devlink_link_to_suppliers(led_cdev->dev, fwnode) creates=20
>> managed device
>> =C2=A0=C2=A0=C2=A0 links with led_cdev->dev as the consumer for any sup=
plier=20
>> properties on the
>> =C2=A0=C2=A0=C2=A0 child LED node (such as gpios in gpio-leds or pwms i=
n pwm-leds).=20
>> Since
>> =C2=A0=C2=A0=C2=A0 led_cdev->dev never probes a driver, those links sta=
y in=20
>> DL_STATE_AVAILABLE
>> =C2=A0=C2=A0=C2=A0 and prevent the GPIO or PWM suppliers from reaching =
sync_state().
>
> I have no experience with devicetree, so i cannot verify if this is=20
> true, why do we call
> device_set_node() in the first place after having already registered=20
> the device?
>
> Thanks,
> Armin Wolf
>
Any thoughts on this?

Thanks,
Armin Wolf

>>> -
>>> -=C2=A0=C2=A0=C2=A0 led_update_brightness(led_cdev);
>>> -
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_cdev->wq =3D leds_wq;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_init_core(led_cdev);
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(led_classdev_init);
>>> +
>>> +/**
>>> + * led_classdev_add - Add a new LED class device to the subsystem.
>>> + * @led_cdev: the led_classdev structure for this device.
>>> + *
>>> + * Adds a new LED class device to the subsystem, allowing userspace=
=20
>>> applications
>>> + * and/or kernel consumers to access it.
>>> + *
>>> + * Returns: Zero on success or a negative error code on failure.
>>> + */
>>> +int led_classdev_add(struct led_classdev *led_cdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 guard(mutex)(&led_cdev->led_access);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D device_add(led_cdev->dev);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 led_update_brightness(led_cdev);
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* add to the list of leds */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 down_write(&leds_list_lock);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_add_tail(&led_cdev->node, &leds_li=
st);
>>> @@ -565,13 +607,36 @@ int led_classdev_register_ext(struct device=20
>>> *parent,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_trigger_set_default(led_cdev);
>>> =C2=A0 #endif
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 mutex_unlock(&led_cdev->led_access);
>>> -
>>> -=C2=A0=C2=A0=C2=A0 dev_dbg(parent, "Registered led device: %s\n",
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le=
d_cdev->name);
>>> +=C2=A0=C2=A0=C2=A0 dev_dbg(led_cdev->dev->parent, "Registered led dev=
ice: %s\n",=20
>>> led_cdev->name);
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> +EXPORT_SYMBOL_GPL(led_classdev_add);
>>> +
>>> +/**
>>> + * led_classdev_register_ext - register a new object of=20
>>> led_classdev class
>>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with init data.
>>> + *
>>> + * @parent: parent of LED device.
>>> + * @led_cdev: the led_classdev structure for this device.
>>> + * @init_data: LED class device initialization data.
>>> + */
>>> +int led_classdev_register_ext(struct device *parent,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct led_classdev *led_cdev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct led_init_data *init_data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D led_classdev_init(parent, led_cdev, init_d=
ata);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D led_classdev_add(led_cdev);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 put_device(led_cdev->dev);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>> +}
>>> =C2=A0 EXPORT_SYMBOL_GPL(led_classdev_register_ext);
>> [ ... ]
>>
>>> --=20
>>> 2.51.2
>>>
