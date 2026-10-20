Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529856;
	b=HhLEQbsKYjtLFCsvYVZgCqqhwZzdergiOZpOCbh1mXBuQkrEPdYCYmRLlWSiwrXJlL9O
	 oHCWPxXpn0QcC7XoITpOqSJJaMWbwRMRlWCshEynu7ZYy1L9PfjAI9B2f34HE5ZGEA3LL
	 Gs5HjvfqWhF2cArRBg4HJ1bqk84b2RbuHSdYJgDj4DzMIxC8KK26levhunCrz8AvhbrA2
	 u8I9jvbOzCwiTVf2b0uSdh62PkQ0lgMHa2OSahJGSev3UQfIbYywNnthA1p3fJPHf5PRz
	 L/rwa5P1PmjLH1sL8SNh+r+9ddNNiSi5NQWPYOTLzDZ66YqbesmzpD6SXaY2E+flY4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529856;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=lQWYabSL79a48eCdo2Hf683XHYvxS4R6Um2Db/yDQsA=;
	b=R1EMokZduWyFDU3/2C3Gpmo5/dPvtI0HT+AoqSmYvG0UUHQmA4IPWLff2dVLJS3691/e
	 ONGs3uVgSDHK5xeN9SQu6LZ77jimQDyF+nKqUxGnvlX1Jm68zMMk1O+f3+sK0Ycfpzjsj
	 d6JUrhzwjAvHpsfKYRwhFLyRufJemjP6Cda3IhKWM2Byr95vSRe0i+FEJ8/jxw9kvpK9p
	 SxCdH5g/hfDZ90yztm+qy2zmiU0qQkK2Rr4LP6lAwOOIprzdeAbzNWG/qkIJpJDLZj3dq
	 OU2L13SVaWUt4uRHXGUIjNU7VBPVz3xEKFxPsmRpuWGCoSgJA/hHQpXUs8qU9fcb/Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="S1Oi/zr9";
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D42606A31A;
	Tue, 20 Oct 2026 20:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=S1Oi/zr9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792529853; x=1793134653; i=w_armin@gmx.de;
	bh=lQWYabSL79a48eCdo2Hf683XHYvxS4R6Um2Db/yDQsA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=S1Oi/zr9X+Mgm0wTxyxp76VszLa3uTo9+q7TlSz4+v0DFcKF8YbZMNrQukefV8Bw
	 rBGqS17/vRM3dPOcg4iRaGlPwrVETNUvGrp/hlSyNDAhomGuR2NtoiZIEI3xk5ZWR
	 7Uf6NldgNnenMDliWJZ25khkfU1YZ0F77093fH8IphcTwFKfzT158PiZsKZfqclLf
	 XYwo0jk+eXaJWscoKwlxfuBuEerYlqT1ZGqzW3EfqfONYD/1jAQa7aNfOWaS8Tnho
	 JWt+UlcGYD/Yycq8VMuFmky1KbVeImbLG/qKgEhrOCg1k3MYliAUOeH6FmN0U7gn5
	 +2PdCYuA6TNsvhdemg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8hZD-1xEZvo21L7-00DeFB; Tue, 20
 Oct 2026 22:57:33 +0200
Message-ID: <96bc0a90-2713-407b-960e-10f9485aecf9@gmx.de>
Date: Tue, 20 Oct 2026 22:57:32 +0200
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
Subject: Re: [PATCH 09/10] leds: Support custom sysfs groups on multicolor and
 flash LEDs
To: Rong Zhang <i@rong.moe>, lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-10-W_Armin@gmx.de>
 <e6e327c35bc579d9063f2514abab7e59d4d9ed15.camel@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <e6e327c35bc579d9063f2514abab7e59d4d9ed15.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HItUFuju3rJ/csqMwJsJOfUGOtwxYoe65hUzkODerCmFC3tSD0g
 NuSvHHYB9bWh3qoAC/juHJWO2tQs3oxwAvm3tCUqTHPzbpTraCn1w600uYJAVfF8v8We3tk
 L9xBkTXYIAxmClN2msiAEGaOiVoukrdiNOSQXXd6cFS3mfJnHgdOChhZLK7J+EdrN2YevTa
 4kEJFEEqZcg5aTrgf7WBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f3VaWtDhkvU=;PRwFOd2oI4uMUJO3+u1VcPM/yeT
 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
 =

Am 19.10.26 um 13:53 schrieb Rong Zhang:

> Hi Armin,
>
> Nice refactor!
>
> On Sun, 2026-10-18 at 15:46 +0200, Armin Wolf wrote:
>> Drivers registering multicolor/flash LEDs currently cannot use
>> led_cdev->groups due to said field being overwritten by the
>> multicolor/flash LED registration functions. Fix this by assigning
>> each LED type a seperate device type ("multicolor" and "flash")
>> that carries the sysfs attributes instead.
>>
>> Also assign a device type for standard LEDs ("standard") for symmetry.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/leds/led-class-flash.c      | 108 ++++++++++++++-------------=
-
>>   drivers/leds/led-class-multicolor.c |  18 ++++-
>>   drivers/leds/led-class.c            |   5 ++
>>   include/linux/led-class-flash.h     |   5 --
>>   4 files changed, 73 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-fl=
ash.c
>> index 953265fddb7d..e023511cea1c 100644
>> --- a/drivers/leds/led-class-flash.c
>> +++ b/drivers/leds/led-class-flash.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/module.h>
>>   #include <linux/slab.h>
>>   #include <linux/sysfs.h>
>> +#include "leds.h"
>>  =20
>>   #define has_flash_op(fled_cdev, op)				\
>>   	(fled_cdev && fled_cdev->ops->op)
>> @@ -207,42 +208,56 @@ static ssize_t flash_fault_show(struct device *de=
v, const struct device_attribut
>>   }
>>   static const DEVICE_ATTR_RO(flash_fault);
>>  =20
>> -static const struct attribute *const led_flash_strobe_attrs[] =3D {
>> +static const struct attribute *const led_flash_attrs[] =3D {
>>   	&dev_attr_flash_strobe.attr,
>> -	NULL,
>> -};
>> -
>> -static const struct attribute *const led_flash_timeout_attrs[] =3D {
>>   	&dev_attr_flash_timeout.attr,
>>   	&dev_attr_max_flash_timeout.attr,
>> -	NULL,
>> -};
>> -
>> -static const struct attribute *const led_flash_brightness_attrs[] =3D =
{
>>   	&dev_attr_flash_brightness.attr,
>>   	&dev_attr_max_flash_brightness.attr,
>> -	NULL,
>> -};
>> -
>> -static const struct attribute *const led_flash_fault_attrs[] =3D {
>>   	&dev_attr_flash_fault.attr,
>>   	NULL,
>>   };
>>  =20
>> -static const struct attribute_group led_flash_strobe_group =3D {
>> -	.attrs_const =3D led_flash_strobe_attrs,
>> -};
>> +static umode_t led_flash_is_visible(struct kobject *kobj, const struct=
 attribute *attr, int n)
>> +{
>> +	struct device *dev =3D kobj_to_dev(kobj);
>> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>> +	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
>> +
>> +	if (attr =3D=3D &dev_attr_flash_strobe.attr)
>> +		return attr->mode;
>> +
>> +        if (attr =3D=3D &dev_attr_flash_timeout.attr && fled_cdev->ops=
->timeout_set)
>> +                return attr->mode;
>>  =20
>> -static const struct attribute_group led_flash_timeout_group =3D {
>> -	.attrs_const =3D led_flash_timeout_attrs,
>> +	if (attr =3D=3D &dev_attr_max_flash_timeout.attr && fled_cdev->ops->t=
imeout_set)
>> +		return attr->mode;
>> +
>> +	if (attr =3D=3D &dev_attr_flash_brightness.attr && fled_cdev->ops->fl=
ash_brightness_set)
>> +		return attr->mode;
>> +
>> +	if (attr =3D=3D &dev_attr_max_flash_brightness.attr && fled_cdev->ops=
->flash_brightness_set)
>> +		return attr->mode;
>> +
>> +	if (attr =3D=3D &dev_attr_flash_fault.attr && fled_cdev->ops->fault_g=
et)
>> +		return attr->mode;
>> +
>> +        return 0;
>> +}
>> +
>> +static const struct attribute_group led_flash_group =3D {
>> +	.is_visible_const =3D led_flash_is_visible,
>> +	.attrs_const =3D led_flash_attrs,
>>   };
>>  =20
>> -static const struct attribute_group led_flash_brightness_group =3D {
>> -	.attrs_const =3D led_flash_brightness_attrs,
>> +static const struct attribute_group *led_flash_groups[] =3D {
>> +	&led_flash_group,
>> +	NULL,
>>   };
>>  =20
>> -static const struct attribute_group led_flash_fault_group =3D {
>> -	.attrs_const =3D led_flash_fault_attrs,
> Hmm, a bunch of back-and-forth changes. I suppose the is_visible_const
> changes can be merged into PATCH 3, right?
>
> Thanks,
> Rong

If the LED subsystem maintainers are OK with this then i can gladly introd=
uce
the is_visible_const callback already in patch 3.

Thanks,
Armin Wolf

>> +static const struct device_type led_flash_device_type =3D {
>> +	.name =3D "flash",
>> +	.groups =3D led_flash_groups,
>>   };
>>  =20
>>   static void led_flash_resume(struct led_classdev *led_cdev)
>> @@ -254,28 +269,6 @@ static void led_flash_resume(struct led_classdev *=
led_cdev)
>>   	call_flash_op(fled_cdev, timeout_set, fled_cdev->timeout.val);
>>   }
>>  =20
>> -static void led_flash_init_sysfs_groups(struct led_classdev_flash *fle=
d_cdev)
>> -{
>> -	struct led_classdev *led_cdev =3D &fled_cdev->led_cdev;
>> -	const struct led_flash_ops *ops =3D fled_cdev->ops;
>> -	const struct attribute_group **flash_groups =3D fled_cdev->sysfs_grou=
ps;
>> -
>> -	int num_sysfs_groups =3D 0;
>> -
>> -	flash_groups[num_sysfs_groups++] =3D &led_flash_strobe_group;
>> -
>> -	if (ops->flash_brightness_set)
>> -		flash_groups[num_sysfs_groups++] =3D &led_flash_brightness_group;
>> -
>> -	if (ops->timeout_set)
>> -		flash_groups[num_sysfs_groups++] =3D &led_flash_timeout_group;
>> -
>> -	if (ops->fault_get)
>> -		flash_groups[num_sysfs_groups++] =3D &led_flash_fault_group;
>> -
>> -	led_cdev->groups =3D flash_groups;
>> -}
>> -
>>   int led_classdev_flash_register_ext(struct device *parent,
>>   				    struct led_classdev_flash *fled_cdev,
>>   				    struct led_init_data *init_data)
>> @@ -289,26 +282,29 @@ int led_classdev_flash_register_ext(struct device=
 *parent,
>>  =20
>>   	led_cdev =3D &fled_cdev->led_cdev;
>>  =20
>> -	if (led_cdev->flags & LED_DEV_CAP_FLASH) {
>> -		if (!led_cdev->brightness_set_blocking)
>> -			return -EINVAL;
>> +	if (!(led_cdev->flags & LED_DEV_CAP_FLASH))
>> +		return led_classdev_register_ext(parent, led_cdev, init_data);
>>  =20
>> -		ops =3D fled_cdev->ops;
>> -		if (!ops || !ops->strobe_set)
>> -			return -EINVAL;
>> +	if (!led_cdev->brightness_set_blocking)
>> +		return -EINVAL;
>>  =20
>> -		led_cdev->flash_resume =3D led_flash_resume;
>> +	ops =3D fled_cdev->ops;
>> +	if (!ops || !ops->strobe_set)
>> +		return -EINVAL;
>>  =20
>> -		/* Select the sysfs attributes to be created for the device */
>> -		led_flash_init_sysfs_groups(fled_cdev);
>> -	}
>> +	led_cdev->flash_resume =3D led_flash_resume;
>>  =20
>>   	/* Register led class device */
>> -	ret =3D led_classdev_register_ext(parent, led_cdev, init_data);
>> +	ret =3D led_classdev_init(parent, led_cdev, init_data);
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> -	return 0;
>> +	led_cdev->dev->type =3D &led_flash_device_type;
>> +	ret =3D led_classdev_add(led_cdev);
>> +	if (ret < 0)
>> +		put_device(led_cdev->dev);
>> +
>> +	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(led_classdev_flash_register_ext);
>>  =20
>> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-cla=
ss-multicolor.c
>> index 57df0b2e785b..9b8c37f7bdf4 100644
>> --- a/drivers/leds/led-class-multicolor.c
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/sysfs.h>
>>   #include <linux/uaccess.h>
>> +#include "leds.h"
>>  =20
>>   static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *=
mcled_cdev, size_t index)
>>   {
>> @@ -159,11 +160,17 @@ static const struct attribute *const led_multicol=
or_attrs[] =3D {
>>   };
>>   ATTRIBUTE_GROUPS(led_multicolor);
>>  =20
>> +static const struct device_type led_multicolor_device_type =3D {
>> +	.name =3D "multicolor",
>> +	.groups =3D led_multicolor_groups,
>> +};
>> +
>>   int led_classdev_multicolor_register_ext(struct device *parent,
>>   				     struct led_classdev_mc *mcled_cdev,
>>   				     struct led_init_data *init_data)
>>   {
>>   	struct led_classdev *led_cdev;
>> +	int ret;
>>  =20
>>   	if (!mcled_cdev)
>>   		return -EINVAL;
>> @@ -176,9 +183,16 @@ int led_classdev_multicolor_register_ext(struct de=
vice *parent,
>>  =20
>>   	led_cdev =3D &mcled_cdev->led_cdev;
>>   	led_cdev->flags |=3D LED_MULTI_COLOR;
>> -	mcled_cdev->led_cdev.groups =3D led_multicolor_groups;
>> +	ret =3D led_classdev_init(parent, led_cdev, init_data);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	led_cdev->dev->type =3D &led_multicolor_device_type;
>> +	ret =3D led_classdev_add(led_cdev);
>> +	if (ret < 0)
>> +		put_device(led_cdev->dev);
>>  =20
>> -	return led_classdev_register_ext(parent, led_cdev, init_data);
>> +	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
>>  =20
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index ace417a2388e..49b321b3d863 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -613,6 +613,10 @@ int led_classdev_add(struct led_classdev *led_cdev=
)
>>   }
>>   EXPORT_SYMBOL_GPL(led_classdev_add);
>>  =20
>> +static const struct device_type led_device_type =3D {
>> +	.name =3D "standard",
>> +};
>> +
>>   /**
>>    * led_classdev_register_ext - register a new object of led_classdev =
class
>>    *                             with init data.
>> @@ -631,6 +635,7 @@ int led_classdev_register_ext(struct device *parent=
,
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> +	led_cdev->dev->type =3D &led_device_type;
>>   	ret =3D led_classdev_add(led_cdev);
>>   	if (ret < 0)
>>   		put_device(led_cdev->dev);
>> diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-=
flash.h
>> index 775a96217518..5204ef60dc4b 100644
>> --- a/include/linux/led-class-flash.h
>> +++ b/include/linux/led-class-flash.h
>> @@ -28,8 +28,6 @@ struct led_classdev_flash;
>>   #define LED_FAULT_LED_OVER_TEMPERATURE	(1 << 8)
>>   #define LED_NUM_FLASH_FAULTS		9
>>  =20
>> -#define LED_FLASH_SYSFS_GROUPS_SIZE	5
>> -
>>   struct led_flash_ops {
>>   	/* set flash brightness */
>>   	int (*flash_brightness_set)(struct led_classdev_flash *fled_cdev,
>> @@ -79,9 +77,6 @@ struct led_classdev_flash {
>>  =20
>>   	/* flash timeout value in microseconds along with its constraints */
>>   	struct led_flash_setting duration;
>> -
>> -	/* LED Flash class sysfs groups */
>> -	const struct attribute_group *sysfs_groups[LED_FLASH_SYSFS_GROUPS_SIZ=
E];
>>   };
>>  =20
>>   static inline struct led_classdev_flash *lcdev_to_flcdev(
