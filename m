Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529738;
	b=coBljQRB6oHSi04Gtz4lJWs28PxpMLU1JhvXdZAAV4OViQJvgiLKytEHwL27A4sY1dvt
	 XaXjPGwl7DccEayBn+EKYrd5geWSZaKn0IgTVtG4nBqna/dAwdZVAXGHKrCfcutgXbPlN
	 asdEEgtn2Vf2gDQTPPezZcOeJ0uVKAyTffTvl8CCcarBdG9zZqTufrwJBwcs90F4eWDSP
	 Vr7pDOLKfMAUrLAODZLOGpP7Hiqq4xzoZ6uUlynxX+LFqzovSMk5TcxDITy+zre/l/UWw
	 TJrjbLd79YVmQTOCw0y3gtLxjOmg7GRgySouMzwEBzdCpofUHUdNhJsc04XxE765neQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529738;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=th2IL9xxCPq3bTRsFII2wVSUii9kajOFxTPm0EWznG0=;
	b=0TWczlPl9hsknZjI6e4Stq7zhcBLSNLRIzVVJzg2YAJTWweEWPlrneONvxcs93kWvp2j
	 I7b0FUyBR3PwitT43ctjFXvXnv9L4hfyA8SxzgN6yNEWWu8hTgYvb9kXpOguj2yUj0WYJ
	 Y2whc4ufPJYPhdma4rgBecTyHaZvCQkoz0LhFzW93hmhKLFtfgAuKKRomcpCkMhuJ6abU
	 6Vnrjs09zOpZ9C4edtFjTPpTrSFQoj09bk9jX3TI+ymZbxMWa6RUdTIXHQHjQqjOPWCxT
	 03a/8P8sm2VhcBUd9NSGuWykQEHUBey1svM3kuX87POyAFvlnDhJAHGxEk7+5wnF9qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=fRlFSiZC;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03B7606A319;
	Tue, 20 Oct 2026 20:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03B7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=fRlFSiZC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792529729; x=1793134529; i=w_armin@gmx.de;
	bh=th2IL9xxCPq3bTRsFII2wVSUii9kajOFxTPm0EWznG0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fRlFSiZCynNf6n437QwAn1kNzoC7iKaREXpF3tNxNEWf/weE4K21z9QmiZ13D4qr
	 088G3tOzMiwBiNwqWyTY57Qb4CdgFMUs9LCnp16Qe5hSqfmuyA2eBhpKqVIkLDBKc
	 a62b0e8BnJA3+Agzt7l/myI4OIH3qW1JMfhFHgZiVzEto3GBDLpYupNDJurqo5hYc
	 Wq1YaDzrFrDFx85XpZ8OxvVj8Tw08ejrJbaq3tUqAIifEEt+sB1JG5feYGFwvkQiO
	 Xi/+yOlmH3Gu+FaXGNlLBaX/dyL60EFg7qsb4X1yF+pHYR0hYHrKX6Ulyau+xbtV6
	 bdtC+d1U8Fx03VxgDQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwZ4-1wTNAi3Bym-0120SB; Tue, 20
 Oct 2026 22:55:28 +0200
Message-ID: <948e6923-b544-4242-99d8-a01cb65ff1d9@gmx.de>
Date: Tue, 20 Oct 2026 22:55:28 +0200
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
Subject: Re: [PATCH 04/10] leds: class: Create "brightness_hw_changed"
 attribute atomically
To: Rong Zhang <i@rong.moe>, lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-5-W_Armin@gmx.de>
 <fbb6a7b4b674d11dab0acc2b855f59a68fae6346.camel@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <fbb6a7b4b674d11dab0acc2b855f59a68fae6346.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rnFwrS1hAq6J1dz2ZFY7T8GV6hPIU3aC2J3u0XZ7uNH500331m1
 Y6ErRFTXswRmr4xvQ19GSRjjoWjmddVMnjc+JOILcDImq+JZcH3WsORa3U2LS9e4Bf2G8z1
 sgFMviN28FeI4FqYY7Ln9EVPD+Jkc+mteGFdzGRP3z5EE9kIt86OS26dRfokO14ColeZ15s
 IdiJJGfcENaBvSOQWhJ3w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DxYLCRjjm7Q=;5ghmX2wxfG1z/K93HXCfVzlw95Z
 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
 /HcSkUTDBZA=

Am 19.10.26 um 13:51 schrieb Rong Zhang:

> Hi Armin,
>
> Nice refactor!
>
> On Sun, 2026-10-18 at 15:46 +0200, Armin Wolf wrote:
>> Using device_create_file() might cause userspace applications
>> listening for uevents to inspect a new LED device before the kernel
>> has registered all sysfs attributes for it. This might cause those
>> applications to incorrectly assume that the new LED device does not
>> support the "brightness_hw_changed" attribute.
>>
>> Fix this by letting the device core create the sysfs attribute before
>> the uevent is being send to userspace.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/leds/led-class.c | 85 +++++++++++++++------------------------=
-
>>   include/linux/leds.h     |  2 -
>>   2 files changed, 31 insertions(+), 56 deletions(-)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index 3775ad13762f..d460f041ed86 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -17,6 +17,7 @@
>>   #include <linux/property.h>
>>   #include <linux/slab.h>
>>   #include <linux/spinlock.h>
>> +#include <linux/sysfs.h>
>>   #include <linux/timer.h>
>>   #include <uapi/linux/uleds.h>
>>   #include <linux/of.h>
>> @@ -101,14 +102,6 @@ static const struct attribute_group led_group =3D =
{
>>   	.attrs_const =3D led_class_attrs,
>>   };
>>  =20
>> -static const struct attribute_group *const led_groups[] =3D {
> This is a back-and-forth change. How about moving led_groups to the righ=
t
> place in PATCH 1 beforehand?
>
> Other than that, FWIW:
>
>     Reviewed-by: Rong Zhang <i@rong.moe>
>
> Thanks,
> Rong

I would prefer moving led_groups[] in patch 4, because patch 1 deals with =
an entirely
different topic.

Sashiko has also found a major issue in this patch, so i will have to rewo=
rk it
quite a bit for the v2 revision. I will therefore not include your Reviewe=
d-by tag
just yet, because the changes are quite substantial.

Thanks,
Armin Wolf

>> -	&led_group,
>> -#ifdef CONFIG_LEDS_TRIGGERS
>> -	&led_trigger_group,
>> -#endif
>> -	NULL,
>> -};
>> -
>>   #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>>   static ssize_t brightness_hw_changed_show(struct device *dev, const s=
truct device_attribute *attr,
>>   					  char *buf)
>> @@ -123,51 +116,48 @@ static ssize_t brightness_hw_changed_show(struct =
device *dev, const struct devic
>>  =20
>>   static const DEVICE_ATTR_RO(brightness_hw_changed);
>>  =20
>> -static int led_add_brightness_hw_changed(struct led_classdev *led_cdev=
)
>> -{
>> -	struct device *dev =3D led_cdev->dev;
>> -	int ret;
>> +static const struct attribute *const led_brightness_hw_changed_attrs[]=
 =3D {
>> +	&dev_attr_brightness_hw_changed.attr,
>> +	NULL,
>> +};
>>  =20
>> -	ret =3D device_create_file(dev, &dev_attr_brightness_hw_changed);
>> -	if (ret) {
>> -		dev_err(dev, "Error creating brightness_hw_changed\n");
>> -		return ret;
>> -	}
>> +static umode_t led_brightness_hw_changed_is_visible(struct kobject *ko=
bj,
>> +						    const struct attribute *attr, int n)
>> +{
>> +	struct device *dev =3D kobj_to_dev(kobj);
>> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>>  =20
>> -	led_cdev->brightness_hw_changed_kn =3D
>> -		sysfs_get_dirent(dev->kobj.sd, "brightness_hw_changed");
>> -	if (!led_cdev->brightness_hw_changed_kn) {
>> -		dev_err(dev, "Error getting brightness_hw_changed kn\n");
>> -		device_remove_file(dev, &dev_attr_brightness_hw_changed);
>> -		return -ENXIO;
>> -	}
>> +	if (attr =3D=3D &dev_attr_brightness_hw_changed.attr &&
>> +	    led_cdev->flags & LED_BRIGHT_HW_CHANGED)
>> +		return attr->mode;
>>  =20
>>   	return 0;
>>   }
>>  =20
>> -static void led_remove_brightness_hw_changed(struct led_classdev *led_=
cdev)
>> -{
>> -	sysfs_put(led_cdev->brightness_hw_changed_kn);
>> -	device_remove_file(led_cdev->dev, &dev_attr_brightness_hw_changed);
>> -}
>> +static const struct attribute_group led_brightness_hw_changed_group =
=3D {
>> +	.is_visible_const =3D led_brightness_hw_changed_is_visible,
>> +	.attrs_const =3D led_brightness_hw_changed_attrs,
>> +};
>> +#endif	/* CONFIG_LEDS_BRIGHTNESS_HW_CHANGED */
>>  =20
>> +static const struct attribute_group *const led_groups[] =3D {
>> +	&led_group,
>> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>> +	&led_brightness_hw_changed_group,
>> +#endif
>> +#ifdef CONFIG_LEDS_TRIGGERS
>> +	&led_trigger_group,
>> +#endif
>> +	NULL,
>> +};
>> +
>> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>>   void led_classdev_notify_brightness_hw_changed(struct led_classdev *l=
ed_cdev, unsigned int brightness)
>>   {
>> -	if (WARN_ON(!led_cdev->brightness_hw_changed_kn))
>> -		return;
>> -
>>   	led_cdev->brightness_hw_changed =3D brightness;
>> -	sysfs_notify_dirent(led_cdev->brightness_hw_changed_kn);
>> +	sysfs_notify(&led_cdev->dev->kobj, NULL, "brightness_hw_changed");
>>   }
>>   EXPORT_SYMBOL_GPL(led_classdev_notify_brightness_hw_changed);
>> -#else
>> -static int led_add_brightness_hw_changed(struct led_classdev *led_cdev=
)
>> -{
>> -	return 0;
>> -}
>> -static void led_remove_brightness_hw_changed(struct led_classdev *led_=
cdev)
>> -{
>> -}
>>   #endif
>>  =20
>>   /**
>> @@ -544,16 +534,6 @@ int led_classdev_register_ext(struct device *paren=
t,
>>   	if (init_data && init_data->fwnode)
>>   		device_set_node(led_cdev->dev, init_data->fwnode);
>>  =20
>> -	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
>> -		ret =3D led_add_brightness_hw_changed(led_cdev);
>> -		if (ret) {
>> -			device_unregister(led_cdev->dev);
>> -			led_cdev->dev =3D NULL;
>> -			mutex_unlock(&led_cdev->led_access);
>> -			return ret;
>> -		}
>> -	}
>> -
>>   	led_cdev->work_flags =3D 0;
>>   #ifdef CONFIG_LEDS_TRIGGERS
>>   	init_rwsem(&led_cdev->trigger_lock);
>> @@ -626,9 +606,6 @@ void led_classdev_unregister(struct led_classdev *l=
ed_cdev)
>>  =20
>>   	flush_work(&led_cdev->set_brightness_work);
>>  =20
>> -	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
>> -		led_remove_brightness_hw_changed(led_cdev);
>> -
>>   	device_unregister(led_cdev->dev);
>>  =20
>>   	down_write(&leds_list_lock);
>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>> index beaf23993063..6f975078cc14 100644
>> --- a/include/linux/leds.h
>> +++ b/include/linux/leds.h
>> @@ -21,7 +21,6 @@ struct attribute_group;
>>   struct device_node;
>>   struct fwnode_handle;
>>   struct gpio_desc;
>> -struct kernfs_node;
>>   struct led_pattern;
>>   struct platform_device;
>>  =20
>> @@ -237,7 +236,6 @@ struct led_classdev {
>>  =20
>>   #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>>   	int			 brightness_hw_changed;
>> -	struct kernfs_node	*brightness_hw_changed_kn;
>>   #endif
>>  =20
>>   #ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
