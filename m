Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324764;
	b=Mb4HEOXL+krgAYy25/P29auSIXGjt0TDcgddOVkrCpiF0NiNBjfd2+OG/E34qTMCe4HP
	 xlS8wK4qxw6t1i3TLsFcmHlFcLraNNi7nP43saAFhRBM/qg2wyzOV4tKZpRIL7aUkV+X+
	 yMjG5HFG5CD6SfOgPsz0HpEre0Fh4uwempc7/GI/x9ujizDuQ94UFtAj9T8x/zsqBVAnO
	 tnu89xcvTmtAjx4ocBiCFYPgtziRMZ6wE2McgmWVgWrKSqAHshOxx4zIv+mW05gSC611g
	 1ylGNlo6QcDXpVbdHV26RrkAj2lUPKt0M1voM57zGK1rSNuaC8bSGbujPSALVTBFysA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324764;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=8Jc28mt7CBz7Trdeso/0E0+lGXcH1tj1jqsPPdmxr4E=;
	b=k4vP4ynprVD/JhJI9bhDoTHJA9ysiNahaJWPWS1BG9JrpFuI5DUiMwM4r8froH846c0f
	 JlxgZS0nRGRQ5a8xUNCDYAQT4cvUbaSdufcUUbSPrAdbwtYkYAt/wxFZk+SRs7spJAVNr
	 5S8Ho5XWhAZvKWqee53H2BAlWvm7Obc7A4o9cgC2pWDknhsSGu9/kOMB6sDoMc3pcgRnr
	 Ys6+eXiJViTvqunUAcRBDYXeNdRyqIuAV8t20tHC3WevYIiOW6Xec3VMz4aLi1G9iNbiK
	 WqoR6sR9LBwZBoVyX5yOHiuiYeyroRFWhJoEnZzo60sx7kM2b0V7IJpLWKLkZWv/ztA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=CQHUi08U;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE751606A320;
	Tue, 10 Nov 2026 15:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE751606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=CQHUi08U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794324757; x=1794929557; i=w_armin@gmx.de;
	bh=8Jc28mt7CBz7Trdeso/0E0+lGXcH1tj1jqsPPdmxr4E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CQHUi08UYIJUm34i99LMf/GGxR5zlOH6N5gkxXSWMZIStIsIidJNBNwrdvGqEtuH
	 /b/DSSX2MI0picNK6Lgv4sVJCsSEFxurn0W5heyAx9Kk0mVKl9Lz8+S6WMQp7QvDf
	 HG2J6rzeAAMKaxopqRSmY4B8Zgwb5IWlKWZao/Q7ThYGNECzKtuev2gPFnFlfTohL
	 ZUJiTQHmIIUJ/vUIfqalF4Bz+06EPQjI7RtMQIHB7lt+CQ8gyo/cmCZQATzaEHtQJ
	 txLowDp/iRRxqtGTZhuw6pBJ6JvaFdXprCE19/RkHuThXZEv+ZlFgp1+AF7EDeUCv
	 b8LG2Ilp6z91/CeDow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1x7bUR0cW6-00Iyf6; Tue, 10
 Nov 2026 16:32:37 +0100
Message-ID: <983f521e-0e83-4600-b59b-08675a8d0d70@gmx.de>
Date: Tue, 10 Nov 2026 16:32:36 +0100
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
To: lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-9-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20261018135339.1109271-9-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:z978PI3HclIqBbwl2wXDJf7t6DV2b/WaxqqHCFwH/oNhhy7/dvx
 9QTUVIW6nV4I67QhYG0bI2GELgXtkUhyEll6E2YztjRMTMeY0CL/Oks5JT/Y5dqZCNKhDYR
 Z5iDFgMA75wXBJ6RHs0z98AIdjIgEwNnBkguXlXF83vNjzIjp/ZLHbs7FCQFawLM4aiQKiV
 g/jp9MLDVRMddZ7AxGtpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LCxY9tapRnc=;Js2qzHs65vu6S+Y708PxnTvWTv1
 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

Am 18.10.26 um 15:46 schrieb Armin Wolf:
> Split led_classdev_register_ext() into two seperate internal functions
> to prepare for future changes around LED class device initialization.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/leds/led-class.c | 105 +++++++++++++++++++++++++++++++--------
>   drivers/leds/leds.h      |   3 ++
>   2 files changed, 88 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 77a0fce03952..ace417a2388e 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -228,9 +228,15 @@ static struct led_classdev *led_module_get(struct d=
evice *led_dev)
>   	return led_cdev;
>   }
>  =20
> +static void led_classdev_release(struct device *dev)
> +{
> +	kfree(dev);
> +}
> +
>   static const struct class leds_class =3D {
>   	.name =3D "leds",
>   	.dev_groups =3D led_groups,
> +	.dev_release =3D led_classdev_release,
>   	.pm =3D &leds_class_dev_pm_ops,
>   };
>  =20
> @@ -465,16 +471,21 @@ static int led_classdev_next_name(const char *init=
_name, char *name,
>   }
>  =20
>   /**
> - * led_classdev_register_ext - register a new object of led_classdev cl=
ass
> - *			       with init data.
> - *
> - * @parent: parent of LED device
> + * led_classdev_init - Initialize a new LED class device.
> + * @parent: parent of LED device.
>    * @led_cdev: the led_classdev structure for this device.
> - * @init_data: LED class device initialization data
> + * @init_data: LED class device initialization data.
> + *
> + * Initializes a new LED class device, but does not register with the
> + * subsystem yet. Useful for performing additional initialization befor=
e
> + * adding the LED class device to the subsystem using led_classdev_add(=
).
> + * After calling this function put_device() needs to be called on the d=
ev
> + * field inside the LED class device in order to dispose it.
> + *
> + * Return: Zero on success or a negative error code on failure.
>    */
> -int led_classdev_register_ext(struct device *parent,
> -			      struct led_classdev *led_cdev,
> -			      struct led_init_data *init_data)
> +int led_classdev_init(struct device *parent, struct led_classdev *led_c=
dev,
> +		      struct led_init_data *init_data)
>   {
>   	char composed_name[LED_MAX_NAME_SIZE];
>   	char final_name[LED_MAX_NAME_SIZE];
> @@ -539,23 +550,54 @@ int led_classdev_register_ext(struct device *paren=
t,
>   	if (!led_cdev->max_brightness)
>   		led_cdev->max_brightness =3D LED_FULL;
>  =20
> -	mutex_lock(&led_cdev->led_access);
> -	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0, le=
d_cdev,
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
>   	}
>  =20
>   	if (init_data && init_data->fwnode)
>   		device_set_node(led_cdev->dev, init_data->fwnode);

Sashiko has the following complain about this:

Because led_cdev->dev is a class device that never binds to a driver:

1. __fw_devlink_link_to_consumers(led_cdev->dev) converts consumer
fwnode_links
     on init_data->fwnode into managed device links with
led_cdev->dev as the
     supplier instead of the parent LED controller. During boot (while
     fw_devlink_drv_reg_done is false), consumers remain blocked with
     -EPROBE_DEFER until fw_devlink_drivers_done() runs, and are
never linked to
     the parent controller for runtime PM, suspend/resume, or unbind
ordering.

2. __fw_devlink_link_to_suppliers(led_cdev->dev, fwnode) creates
managed device
     links with led_cdev->dev as the consumer for any supplier
properties on the
     child LED node (such as gpios in gpio-leds or pwms in pwm-leds).
Since
     led_cdev->dev never probes a driver, those links stay in
DL_STATE_AVAILABLE
     and prevent the GPIO or PWM suppliers from reaching sync_state().

I have no experience with devicetree, so i cannot verify if this is
true, why do we call device_set_node() in the first place after having=20
already registered the device?

Thanks,
Armin Wolf

>  =20
> -	led_update_brightness(led_cdev);
> -
>   	led_cdev->wq =3D leds_wq;
>  =20
>   	led_init_core(led_cdev);
>  =20
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(led_classdev_init);
> +
> +/**
> + * led_classdev_add - Add a new LED class device to the subsystem.
> + * @led_cdev: the led_classdev structure for this device.
> + *
> + * Adds a new LED class device to the subsystem, allowing userspace app=
lications
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
>   	/* add to the list of leds */
>   	down_write(&leds_list_lock);
>   	list_add_tail(&led_cdev->node, &leds_list);
> @@ -565,13 +607,36 @@ int led_classdev_register_ext(struct device *paren=
t,
>   	led_trigger_set_default(led_cdev);
>   #endif
>  =20
> -	mutex_unlock(&led_cdev->led_access);
> -
> -	dev_dbg(parent, "Registered led device: %s\n",
> -			led_cdev->name);
> +	dev_dbg(led_cdev->dev->parent, "Registered led device: %s\n", led_cdev=
->name);
>  =20
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(led_classdev_add);
> +
> +/**
> + * led_classdev_register_ext - register a new object of led_classdev cl=
ass
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
>   EXPORT_SYMBOL_GPL(led_classdev_register_ext);
>  =20
>   /**
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index 6d00e6f44126..2d977c5a3520 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -18,6 +18,9 @@ static inline int led_get_brightness(struct led_classd=
ev *led_cdev)
>   }
>  =20
>   void led_init_core(struct led_classdev *led_cdev);
> +int led_classdev_init(struct device *parent, struct led_classdev *led_c=
dev,
> +		      struct led_init_data *init_data);
> +int led_classdev_add(struct led_classdev *led_cdev);
>   void led_stop_software_blink(struct led_classdev *led_cdev);
>   void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned i=
nt value);
>   void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigne=
d int value);

