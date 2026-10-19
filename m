Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2ED397E8A;
	Mon, 19 Oct 2026 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411224; cv=pass; b=Rastosb0V+renJ/5KRe7+fVgmsp5z2p5W8kjlRlMLFSWnVj9XKRbud1Zew0GVBz1M6pxLfVoCdeBWf0Pl6ZM7vPLAlkD80RehcA+1qoTTBLb4GK7uNFlO/AeFp6AeMNUEnS68eIhcX2SFiypaclPCOzWQB2+aESYUnO2MKG+d4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411224; c=relaxed/simple;
	bh=PATWVlKrzjb0PGT3ztqXOxIB6u7er3lHJ1tpLCabzWw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uS/GE22WmexfJ5vf/G5/dcH8bDZHDk9/2E7cSspFCuCeADr5TkPXArp2y7Lx6Zb3QZOzh71D908ov6b6M9jg6nv4HHpHDa8AmGBQWCRpKCZOJrAoFZ+/a0l/cMbqYwa+ubRRpdnSSYDVknNIwudWwhEpXP5Zo2TTXkhVK0yHugY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=LoBP+aU1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="LoBP+aU1"
ARC-Seal: i=1; a=rsa-sha256; t=1792411216; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VLV/81MEsLy7+ei90hazPNMtl7ZZ3TJHvp5iJo+Kl3ZoVQeFKu74v9oyEQxe6SByZ+vldoe1lhnbeONyrns0niHkilu6VqrVNh0OSQgEjC+pPve/fSJrhtyKGxdwzKcfC7DG5TRoJvDZDbrM3dDJL5FUzTXNLN/z3Q/oxLtn2b4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792411216; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yV0aTz/rJgWkHQQ3Rjlqgig2uJAGeUK6UaGf5txmJ/Q=; 
	b=njtyiwxCeKgsdTagVE+UqYVqVBTTKsTGmjnKpKjP3TdJNYLASwI/HLq9bGwJOraxLq0WFYEl+geRHTXxEDd6zYEOA1X6Gf/EzXUDe+/2+Imm46ZfvEIHg7WB93//XtU/dQqbRDPEiepZBtSL7wA1Dc28s0CH7/Ip+F4+R29SI1c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792411215;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=yV0aTz/rJgWkHQQ3Rjlqgig2uJAGeUK6UaGf5txmJ/Q=;
	b=LoBP+aU1H/0rx1INgHMUTtaC68NAyWrr7jQR+Qp4UccNmoCyMColyVpHWgqF9rBM
	vvReilTsXkSdgkG4fDGT3FvY/nqpilazFEwVTb/vO+HbYbtduy8B43RUVQtvvDumcM2
	2FIfkw1rA1KAJC55NlJACC9NQdc0Xz8qaVWmwZZZlN77NVVZQ/2Z2s9Bt2dzKP0jRor
	GtqbAZh79szrW05esgtcBW0DwSsjOZAhacj/58g8DCunzsNeRrsL8NyB8ifnPl0Z/XX
	VNpmkoGXmzefO8Y2YxL0R6PKuj/UMFCkLZyGEbtdTS6vTXo2QUGJeUaYH72UfJu0XJJ
	GnaPJzYjuA==
Received: by smtp.zohomail.com with SMTPS id 1792411212841473.2564168830039;
	Mon, 19 Oct 2026 05:00:12 -0700 (PDT)
Message-ID: <e6e327c35bc579d9063f2514abab7e59d4d9ed15.camel@rong.moe>
Subject: Re: [PATCH 09/10] leds: Support custom sysfs groups on multicolor
 and flash LEDs
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261018135339.1109271-10-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
	 <20261018135339.1109271-10-W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 19:53:54 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Armin,

Nice refactor!

On Sun, 2026-10-18 at 15:46 +0200, Armin Wolf wrote:
> Drivers registering multicolor/flash LEDs currently cannot use
> led_cdev->groups due to said field being overwritten by the
> multicolor/flash LED registration functions. Fix this by assigning
> each LED type a seperate device type ("multicolor" and "flash")
> that carries the sysfs attributes instead.
>=20
> Also assign a device type for standard LEDs ("standard") for symmetry.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/leds/led-class-flash.c      | 108 ++++++++++++++--------------
>  drivers/leds/led-class-multicolor.c |  18 ++++-
>  drivers/leds/led-class.c            |   5 ++
>  include/linux/led-class-flash.h     |   5 --
>  4 files changed, 73 insertions(+), 63 deletions(-)
>=20
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flas=
h.c
> index 953265fddb7d..e023511cea1c 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
> +#include "leds.h"
> =20
>  #define has_flash_op(fled_cdev, op)				\
>  	(fled_cdev && fled_cdev->ops->op)
> @@ -207,42 +208,56 @@ static ssize_t flash_fault_show(struct device *dev,=
 const struct device_attribut
>  }
>  static const DEVICE_ATTR_RO(flash_fault);
> =20
> -static const struct attribute *const led_flash_strobe_attrs[] =3D {
> +static const struct attribute *const led_flash_attrs[] =3D {
>  	&dev_attr_flash_strobe.attr,
> -	NULL,
> -};
> -
> -static const struct attribute *const led_flash_timeout_attrs[] =3D {
>  	&dev_attr_flash_timeout.attr,
>  	&dev_attr_max_flash_timeout.attr,
> -	NULL,
> -};
> -
> -static const struct attribute *const led_flash_brightness_attrs[] =3D {
>  	&dev_attr_flash_brightness.attr,
>  	&dev_attr_max_flash_brightness.attr,
> -	NULL,
> -};
> -
> -static const struct attribute *const led_flash_fault_attrs[] =3D {
>  	&dev_attr_flash_fault.attr,
>  	NULL,
>  };
> =20
> -static const struct attribute_group led_flash_strobe_group =3D {
> -	.attrs_const =3D led_flash_strobe_attrs,
> -};
> +static umode_t led_flash_is_visible(struct kobject *kobj, const struct a=
ttribute *attr, int n)
> +{
> +	struct device *dev =3D kobj_to_dev(kobj);
> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
> +
> +	if (attr =3D=3D &dev_attr_flash_strobe.attr)
> +		return attr->mode;
> +
> +        if (attr =3D=3D &dev_attr_flash_timeout.attr && fled_cdev->ops->=
timeout_set)
> +                return attr->mode;
> =20
> -static const struct attribute_group led_flash_timeout_group =3D {
> -	.attrs_const =3D led_flash_timeout_attrs,
> +	if (attr =3D=3D &dev_attr_max_flash_timeout.attr && fled_cdev->ops->tim=
eout_set)
> +		return attr->mode;
> +
> +	if (attr =3D=3D &dev_attr_flash_brightness.attr && fled_cdev->ops->flas=
h_brightness_set)
> +		return attr->mode;
> +
> +	if (attr =3D=3D &dev_attr_max_flash_brightness.attr && fled_cdev->ops->=
flash_brightness_set)
> +		return attr->mode;
> +
> +	if (attr =3D=3D &dev_attr_flash_fault.attr && fled_cdev->ops->fault_get=
)
> +		return attr->mode;
> +
> +        return 0;
> +}
> +
> +static const struct attribute_group led_flash_group =3D {
> +	.is_visible_const =3D led_flash_is_visible,
> +	.attrs_const =3D led_flash_attrs,
>  };
> =20
> -static const struct attribute_group led_flash_brightness_group =3D {
> -	.attrs_const =3D led_flash_brightness_attrs,
> +static const struct attribute_group *led_flash_groups[] =3D {
> +	&led_flash_group,
> +	NULL,
>  };
> =20
> -static const struct attribute_group led_flash_fault_group =3D {
> -	.attrs_const =3D led_flash_fault_attrs,

Hmm, a bunch of back-and-forth changes. I suppose the is_visible_const
changes can be merged into PATCH 3, right?

Thanks,
Rong

> +static const struct device_type led_flash_device_type =3D {
> +	.name =3D "flash",
> +	.groups =3D led_flash_groups,
>  };
> =20
>  static void led_flash_resume(struct led_classdev *led_cdev)
> @@ -254,28 +269,6 @@ static void led_flash_resume(struct led_classdev *le=
d_cdev)
>  	call_flash_op(fled_cdev, timeout_set, fled_cdev->timeout.val);
>  }
> =20
> -static void led_flash_init_sysfs_groups(struct led_classdev_flash *fled_=
cdev)
> -{
> -	struct led_classdev *led_cdev =3D &fled_cdev->led_cdev;
> -	const struct led_flash_ops *ops =3D fled_cdev->ops;
> -	const struct attribute_group **flash_groups =3D fled_cdev->sysfs_groups=
;
> -
> -	int num_sysfs_groups =3D 0;
> -
> -	flash_groups[num_sysfs_groups++] =3D &led_flash_strobe_group;
> -
> -	if (ops->flash_brightness_set)
> -		flash_groups[num_sysfs_groups++] =3D &led_flash_brightness_group;
> -
> -	if (ops->timeout_set)
> -		flash_groups[num_sysfs_groups++] =3D &led_flash_timeout_group;
> -
> -	if (ops->fault_get)
> -		flash_groups[num_sysfs_groups++] =3D &led_flash_fault_group;
> -
> -	led_cdev->groups =3D flash_groups;
> -}
> -
>  int led_classdev_flash_register_ext(struct device *parent,
>  				    struct led_classdev_flash *fled_cdev,
>  				    struct led_init_data *init_data)
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
> index 57df0b2e785b..9b8c37f7bdf4 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -12,6 +12,7 @@
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
>  #include <linux/uaccess.h>
> +#include "leds.h"
> =20
>  static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcl=
ed_cdev, size_t index)
>  {
> @@ -159,11 +160,17 @@ static const struct attribute *const led_multicolor=
_attrs[] =3D {
>  };
>  ATTRIBUTE_GROUPS(led_multicolor);
> =20
> +static const struct device_type led_multicolor_device_type =3D {
> +	.name =3D "multicolor",
> +	.groups =3D led_multicolor_groups,
> +};
> +
>  int led_classdev_multicolor_register_ext(struct device *parent,
>  				     struct led_classdev_mc *mcled_cdev,
>  				     struct led_init_data *init_data)
>  {
>  	struct led_classdev *led_cdev;
> +	int ret;
> =20
>  	if (!mcled_cdev)
>  		return -EINVAL;
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
> =20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index ace417a2388e..49b321b3d863 100644
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
> diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-fl=
ash.h
> index 775a96217518..5204ef60dc4b 100644
> --- a/include/linux/led-class-flash.h
> +++ b/include/linux/led-class-flash.h
> @@ -28,8 +28,6 @@ struct led_classdev_flash;
>  #define LED_FAULT_LED_OVER_TEMPERATURE	(1 << 8)
>  #define LED_NUM_FLASH_FAULTS		9
> =20
> -#define LED_FLASH_SYSFS_GROUPS_SIZE	5
> -
>  struct led_flash_ops {
>  	/* set flash brightness */
>  	int (*flash_brightness_set)(struct led_classdev_flash *fled_cdev,
> @@ -79,9 +77,6 @@ struct led_classdev_flash {
> =20
>  	/* flash timeout value in microseconds along with its constraints */
>  	struct led_flash_setting duration;
> -
> -	/* LED Flash class sysfs groups */
> -	const struct attribute_group *sysfs_groups[LED_FLASH_SYSFS_GROUPS_SIZE]=
;
>  };
> =20
>  static inline struct led_classdev_flash *lcdev_to_flcdev(
