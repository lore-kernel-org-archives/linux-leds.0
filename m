Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324419;
	b=1ZG8sf8Qep2NtWLKtB+gK1+2NTp8PH+dDGcr9mluctbZJnPCDdck2Af4bhZ8l/JEZeJ7
	 NGC0wwAL0HbAAlkINyuQiUB9Mx7PCoEUs55hBJ6xmrryyJynZGoXXajTa9H2I6iWpJAq3
	 30MviP/WC92ZmuTfBgTDv0EASnAwDPIHL9aT7gpoM630Kpce+HvDSmruQO3gOrKwzF1fG
	 NT1dZJOGW/chLzqRkbmfiZRFuWVNajITix2Ia8stsZJGns1nlDKPMy6dXUb6Jp6+0cyV1
	 0dec1xSRNWxfCXd1nqMl9FvtpP0cJ4cx0AzGB9cf41/2odMPUvyKRnl6duxXhFQqg6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324419;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=pTUT7AzDh2H/DCL2n4u5fT+Ydav8M/1ajCl3Fod0vfc=;
	b=d8RMD8Zom92j3zzunW+qhwo3ww0qbuQQgA1mB45gC+5cRdHmcV5EncY8nDlbUIMwn7dg
	 JHD76KXgtYqvNY93oVwi2bImlaJa4GgPjj6hZEJ2aDnxVRL0MjnhOhMfDTdxPxux/+fug
	 A308MUbwI5sY0HyB0f48ydZw31bxPu39dVN9EKMKqfAu1JKg0Tc0q29PyttZDfmkNhDH4
	 iZ7VY4HY7iLhlk7vXFDkIIC6KcVr6XFuoKgswkopzjiy/nH3qQNezMT25MEPmHrsioZQt
	 94y3GwmrXQE7YAjZoKdmub990VcRk+EJ8VkfFaNlkyj0VYHs/FNXJv4I762WxVB86MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=L4NYMe+g;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471A606A320
	for <linux-leds@vger.kernel.org>; Tue, 10 Nov 2026 15:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0471A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=L4NYMe+g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794324412; x=1794929212; i=w_armin@gmx.de;
	bh=pTUT7AzDh2H/DCL2n4u5fT+Ydav8M/1ajCl3Fod0vfc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=L4NYMe+gleGYaU18nEbL4XRvJehz7g4cqieDM3xMvQWCoAVM+9Qh/gMGvgq9FIgQ
	 B2Z8t1vKDRQKbi1/7aEUTWIEASj1FPYoJY+bXsuw0CvqqbgUv8Cl6YdiVVuR6GeTm
	 LhY5WmPEQVUMPR8dQSIhERycmxlayObduYzKsdr4DmpCnUwRpJTMHzZvrwIIu+4cr
	 DQbvgs4X7riu3eGP1daXhEam6G7dOWBSvZrIHP3OJ7+vOltLInvNNLE5OiYhnQj28
	 pTbD0Rr6HuYoLmn/dNSfKP3XB7b0lNjmjZYkiqsoAiaQaG9/VUZXsuzAX3mNZe3c2
	 ssBpHiAZPxLdg2JQdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mk0Ne-1wl7C81BQu-00kNb6; Tue, 10
 Nov 2026 16:26:52 +0100
Message-ID: <22dad689-4a80-4e41-9b42-c2d696643e0d@gmx.de>
Date: Tue, 10 Nov 2026 16:26:51 +0100
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
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-9-W_Armin@gmx.de> <sashiko-outbox-176189@kernel.org>
 <bc1371ba-1355-4e45-be2c-d3e806c485a9@gmx.de>
 <4d9e01c3-acaf-4f5c-bbc1-fc4c78582571@gmx.de>
 <20261110090711.GC6323@joneslee-macbookpro.roam.internal>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261110090711.GC6323@joneslee-macbookpro.roam.internal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S7wr+E8gjKbWmFzA+Kk6rufqn/YMy1jv57msvAaBcQ3xxXbTeG4
 WCQ+5Sw5FN//HMDZNhJWEGL0rf2iaMjmZEjOBDjzV0wOOaDCOEwL45pW7BJF4Xk/W2f3Gp7
 xk5xMY2Jh7f8f1fLHSrKF7pwh0GQszdwdtnTvnw1JnlT9W9eBGmNI082eUv4GXFQE8/Mwrd
 T1nC/PVH9tJMdUeu7WK9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ms+vMf7HkY8=;ctlzuWOM3NxCJrMDhsOUeHm6qD+
 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

Am 10.11.26 um 10:07 schrieb Lee Jones:
> On Sat, 07 Nov 2026, Armin Wolf wrote:
>=20
>> Am 18.10.26 um 19:14 schrieb Armin Wolf:
>>
>>> Am 18.10.26 um 16:15 schrieb sashiko-bot@kernel.org:
>>>
>>>> Thank you for your contribution! Sashiko AI review found 2 potential
>>>> issue(s) to consider:
>>>> - [High] leds: dangling led_cdev->dev pointer on error in
>>>> led_classdev_init()
>>>> - [High] leds: premature device_set_node() in led_classdev_init()
>>>> breaks fw_devlink
>>>> --=20
>>>>
>>>> commit 7efb333e9420ea13e705d9a114384e841e92d2b2
>>>> Author: Armin Wolf <W_Armin@gmx.de>
>>>>
>>>> leds: class: Split led_classdev_register_ext()
>>>>
>>>> This commit splits led_classdev_register_ext() into
>>>> led_classdev_init() and
>>>> led_classdev_add() so that LED class devices can be initialized befor=
e
>>>> being added to the subsystem.
>>>>
>>>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>>>> index 77a0fce039528..ace417a2388e0 100644
>>>>> --- a/drivers/leds/led-class.c
>>>>> +++ b/drivers/leds/led-class.c
>>>> [ ... ]
>>>>
>>>>> @@ -539,23 +550,54 @@ int led_classdev_register_ext(struct
>>>>> device *parent,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!led_cdev->max_brightness)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_cdev->ma=
x_brightness =3D LED_FULL;
>>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 mutex_lock(&led_cdev->led_access);
>>>>> -=C2=A0=C2=A0=C2=A0 led_cdev->dev =3D device_create_with_groups(&led=
s_class,
>>>>> parent, 0, led_cdev,
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 led_cdev->groups, "%s", final_name);
>>>>> -=C2=A0=C2=A0=C2=A0 if (IS_ERR(led_cdev->dev)) {
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&led_cdev->=
led_access);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(led_cdev-=
>dev);
>>>>> +=C2=A0=C2=A0=C2=A0 led_cdev->dev =3D kzalloc_obj(*led_cdev->dev);
>>>>> +=C2=A0=C2=A0=C2=A0 if (!led_cdev->dev)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 device_initialize(led_cdev->dev);
>>>>> +=C2=A0=C2=A0=C2=A0 led_cdev->dev->class =3D &leds_class;
>>>>> +=C2=A0=C2=A0=C2=A0 led_cdev->dev->parent =3D parent;
>>>>> +=C2=A0=C2=A0=C2=A0 led_cdev->dev->groups =3D led_cdev->groups;
>>>>> +=C2=A0=C2=A0=C2=A0 dev_set_drvdata(led_cdev->dev, led_cdev);
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D kobject_set_name(&led_cdev->dev->kobj, "=
%s", final_name);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 put_device(led_cdev->dev=
);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> [Severity: High]
>>>> Does this leave led_cdev->dev as a dangling pointer when
>>>> kobject_set_name()
>>>> fails here, or when led_classdev_add() fails in
>>>> led_classdev_register_ext()
>>>> below?
>>>>
>>>> Previously, led_cdev->dev was assigned the return value of
>>>> device_create_with_groups(), so on any failure it remained either
>>>> NULL or an
>>>> ERR_PTR(). Commit 1dbb9fb4082ce2 ("leds: Allow to call
>>>> led_classdev_unregister() unconditionally") added an
>>>> IS_ERR_OR_NULL() check
>>>> to led_classdev_unregister() so drivers can call it unconditionally
>>>> in their
>>>> error and removal paths:
>>>>
>>>> drivers/leds/led-class.c:led_classdev_unregister() {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR_OR_NULL(led_cdev->dev))
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> ...
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0led_stop_software_blink(led_cdev);
>>>> ...
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0flush_work(&led_cdev->set_brightness_work);
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0device_unregister(led_cdev->dev);
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0down_write(&leds_list_lock);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0list_del(&led_cdev->node);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0up_write(&leds_list_lock);
>>>> ...
>>>> }
>>>>
>>>> Many drivers rely on this guarantee during error unwind or removal,
>>>> such as
>>>> asus_wmi_led_init() -> asus_wmi_led_exit() in
>>>> drivers/platform/x86/asus-wmi.c,
>>>> asus_led_init() -> asus_led_exit() in
>>>> drivers/platform/x86/asus-laptop.c, and
>>>> samsung_leds_init() -> samsung_leds_exit() in
>>>> drivers/platform/x86/samsung-laptop.c.
>>>>
>>>> With this change, put_device(led_cdev->dev) frees the device via
>>>> led_classdev_release(), but led_cdev->dev is not reset to NULL. A
>>>> subsequent
>>>> call to led_classdev_unregister() will bypass the
>>>> IS_ERR_OR_NULL(led_cdev->dev)
>>>> check, operate on uninitialized blink_timer and set_brightness_work
>>>> structures
>>>> if kobject_set_name() failed before led_init_core(), trigger a
>>>> use-after-free
>>>> and double-free in device_unregister(led_cdev->dev), and crash in
>>>> list_del(&led_cdev->node).
>>>>
>>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (init_data && init_data->f=
wnode)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_set_n=
ode(led_cdev->dev, init_data->fwnode);
>>>> [Severity: High]
>>>> Could calling device_set_node() in led_classdev_init() before
>>>> device_add() is
>>>> called in led_classdev_add() break fw_devlink for child LED nodes?
>>>>
>>>> Previously, device_create_with_groups() called device_add() while
>>>> led_cdev->dev->fwnode was still NULL, and device_set_node() was only
>>>> called
>>>> after device_add() returned. When the parent LED controller finished
>>>> probing,
>>>> device_links_driver_bound() ->
>>>> fw_devlink_pickup_dangling_consumers() marked
>>>> the child LED fwnodes with FWNODE_FLAG_NOT_DEVICE and attached
>>>> consumer links
>>>> to the parent LED controller device.
>>>>
>>>> Now that led_cdev->dev->fwnode is populated before
>>>> led_classdev_add() calls
>>>> device_add(led_cdev->dev), this block in device_add() will trigger
>>>> during the
>>>> parent driver's probe:
>>>>
>>>> drivers/base/core.c:device_add() {
>>>> ...
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0if (dev->fwnode && !dev->fwnode->dev) {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->fwnode->dev =3D dev;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fw_devlink_link_device(de=
v);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0}
>>>> ...
>>>> }
>>>>
>>>> Because led_cdev->dev is a class device that never binds to a driver:
>>>>
>>>> 1. __fw_devlink_link_to_consumers(led_cdev->dev) converts consumer
>>>> fwnode_links
>>>>  =C2=A0=C2=A0=C2=A0 on init_data->fwnode into managed device links wi=
th
>>>> led_cdev->dev as the
>>>>  =C2=A0=C2=A0=C2=A0 supplier instead of the parent LED controller. Du=
ring boot (while
>>>>  =C2=A0=C2=A0=C2=A0 fw_devlink_drv_reg_done is false), consumers rema=
in blocked with
>>>>  =C2=A0=C2=A0=C2=A0 -EPROBE_DEFER until fw_devlink_drivers_done() run=
s, and are
>>>> never linked to
>>>>  =C2=A0=C2=A0=C2=A0 the parent controller for runtime PM, suspend/res=
ume, or unbind
>>>> ordering.
>>>>
>>>> 2. __fw_devlink_link_to_suppliers(led_cdev->dev, fwnode) creates
>>>> managed device
>>>>  =C2=A0=C2=A0=C2=A0 links with led_cdev->dev as the consumer for any =
supplier
>>>> properties on the
>>>>  =C2=A0=C2=A0=C2=A0 child LED node (such as gpios in gpio-leds or pwm=
s in pwm-leds).
>>>> Since
>>>>  =C2=A0=C2=A0=C2=A0 led_cdev->dev never probes a driver, those links =
stay in
>>>> DL_STATE_AVAILABLE
>>>>  =C2=A0=C2=A0=C2=A0 and prevent the GPIO or PWM suppliers from reachi=
ng sync_state().
>>>
>>> I have no experience with devicetree, so i cannot verify if this is
>>> true, why do we call
>>> device_set_node() in the first place after having already registered t=
he
>>> device?
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>> Any thoughts on this?
>=20
> You're talking to an AI.  =3D:-)

My question was directed at you and Pavel, but it seems that Sashiko has=
=20
removed some people from the CC.

I will resend my question as a reply to the original patch.

Thanks,
Armin Wolf
