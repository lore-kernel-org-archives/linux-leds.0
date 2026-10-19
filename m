Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB953E558D;
	Mon, 19 Oct 2026 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411008; cv=pass; b=F/GiIApasE+vvAP1XLkNWfwqL3VcnLMQ5IemR9ovTQgwcNiSQbHuF+/Kq8mCOeVxwQz1ifmtTj7NL9seiARbW+FblaH9SZ1SEho8/Pb20i2OSd69k6uIWr42RB/W+9rHJg4UlCIBALOuqBF0KIFn+0VDBDq+v/wTGRgvVY43+dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411008; c=relaxed/simple;
	bh=GmvXdHlBbJQ42OnAwy60xRNtTG+wMpW25E4bM7I76AY=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WraU0PFbzC8GE5/TkQ4lc9aoM+RIvbvu+ezgxMi6b9nYlo+ujZDYuB8YTZ9m/Mv5YJ5taUZmW/ykhYl/oxk7pJHTcadXlu1VXsc8jmjcZEZXGKBqTmwVWO8gWEiURa/RLXlaX+uwki1YyvQdtWypxC5t98oiitolkd4gwFTOONU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=l79MFJOg; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="l79MFJOg"
ARC-Seal: i=1; a=rsa-sha256; t=1792411002; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZGGOlWD9PbrELfxgx9STRVG7S3e5pVE8YE1OD9dHRYi7Lh3tpTN4EmshV5tPtQhOKyzn3783beUXQ4fW2Io1RemAy/rBLvZktMuU/5zH+8C9PJtsHuoxN9pzolzV0e4URlUw+9UIMkJrh0vBdh7qm3h48Ql9CcGo+RHy9Z3JQTk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792411002; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VBYs3UcJ7j0jMgAB5kvc4W88NduOOIiQftkEb+hzZr4=; 
	b=WO9lXl0vYV5Dju+wGfqMwB9cVhZzchdOZW+iJGRmUpHHLOQVYHGUXAh81H1W6K+G2Qq8pO0AAGW6mS9hGAVSmNMK68c3V/QloHD118PSctRa80QPkH/WVkZeEPYZ8c3jpqB/77RRA2e9Onma3txS3vcjAsYi9Wpzal4/VEVryX0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792411002;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=VBYs3UcJ7j0jMgAB5kvc4W88NduOOIiQftkEb+hzZr4=;
	b=l79MFJOgNTIliQ6lVApJCec/sJw/va1expSTUNmECTVNv4U4FAGtAAaoAv5dvFoe
	Hc/3ja/yq/fF7awIzZpT3lVrlkixW5FkyES45YAgQouGycpEAXzvaYmU+DUgqEbZnsV
	pKGy5HqfBslwz9kiDt9KTh0x7UYwFEjU7f59CZOrYIZlYX6+VTDQJW5yrgKc20SQtb1
	N/vmJCHnu3mlfOd1i31Z04ajSNyysR2sD19wovQFcJdjVhhVIIvKoKZCGbrf6uQv9Lu
	Mg3mKCSP+uOBIjoJF+jo7seLYTufZHx1M20LvfgqVuR6aom0QitKOgLVyAqHn//A5OI
	IewZiUJApA==
Received: by smtp.zohomail.com with SMTPS id 1792410998921572.21201724772;
	Mon, 19 Oct 2026 04:56:38 -0700 (PDT)
Message-ID: <fbb6a7b4b674d11dab0acc2b855f59a68fae6346.camel@rong.moe>
Subject: Re: [PATCH 04/10] leds: class: Create "brightness_hw_changed"
 attribute atomically
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261018135339.1109271-5-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
	 <20261018135339.1109271-5-W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 19:51:33 +0800
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
> Using device_create_file() might cause userspace applications
> listening for uevents to inspect a new LED device before the kernel
> has registered all sysfs attributes for it. This might cause those
> applications to incorrectly assume that the new LED device does not
> support the "brightness_hw_changed" attribute.
>=20
> Fix this by letting the device core create the sysfs attribute before
> the uevent is being send to userspace.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/leds/led-class.c | 85 +++++++++++++++-------------------------
>  include/linux/leds.h     |  2 -
>  2 files changed, 31 insertions(+), 56 deletions(-)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 3775ad13762f..d460f041ed86 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -17,6 +17,7 @@
>  #include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/sysfs.h>
>  #include <linux/timer.h>
>  #include <uapi/linux/uleds.h>
>  #include <linux/of.h>
> @@ -101,14 +102,6 @@ static const struct attribute_group led_group =3D {
>  	.attrs_const =3D led_class_attrs,
>  };
> =20
> -static const struct attribute_group *const led_groups[] =3D {

This is a back-and-forth change. How about moving led_groups to the right
place in PATCH 1 beforehand?

Other than that, FWIW:

   Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> -	&led_group,
> -#ifdef CONFIG_LEDS_TRIGGERS
> -	&led_trigger_group,
> -#endif
> -	NULL,
> -};
> -
>  #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>  static ssize_t brightness_hw_changed_show(struct device *dev, const stru=
ct device_attribute *attr,
>  					  char *buf)
> @@ -123,51 +116,48 @@ static ssize_t brightness_hw_changed_show(struct de=
vice *dev, const struct devic
> =20
>  static const DEVICE_ATTR_RO(brightness_hw_changed);
> =20
> -static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
> -{
> -	struct device *dev =3D led_cdev->dev;
> -	int ret;
> +static const struct attribute *const led_brightness_hw_changed_attrs[] =
=3D {
> +	&dev_attr_brightness_hw_changed.attr,
> +	NULL,
> +};
> =20
> -	ret =3D device_create_file(dev, &dev_attr_brightness_hw_changed);
> -	if (ret) {
> -		dev_err(dev, "Error creating brightness_hw_changed\n");
> -		return ret;
> -	}
> +static umode_t led_brightness_hw_changed_is_visible(struct kobject *kobj=
,
> +						    const struct attribute *attr, int n)
> +{
> +	struct device *dev =3D kobj_to_dev(kobj);
> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> =20
> -	led_cdev->brightness_hw_changed_kn =3D
> -		sysfs_get_dirent(dev->kobj.sd, "brightness_hw_changed");
> -	if (!led_cdev->brightness_hw_changed_kn) {
> -		dev_err(dev, "Error getting brightness_hw_changed kn\n");
> -		device_remove_file(dev, &dev_attr_brightness_hw_changed);
> -		return -ENXIO;
> -	}
> +	if (attr =3D=3D &dev_attr_brightness_hw_changed.attr &&
> +	    led_cdev->flags & LED_BRIGHT_HW_CHANGED)
> +		return attr->mode;
> =20
>  	return 0;
>  }
> =20
> -static void led_remove_brightness_hw_changed(struct led_classdev *led_cd=
ev)
> -{
> -	sysfs_put(led_cdev->brightness_hw_changed_kn);
> -	device_remove_file(led_cdev->dev, &dev_attr_brightness_hw_changed);
> -}
> +static const struct attribute_group led_brightness_hw_changed_group =3D =
{
> +	.is_visible_const =3D led_brightness_hw_changed_is_visible,
> +	.attrs_const =3D led_brightness_hw_changed_attrs,
> +};
> +#endif	/* CONFIG_LEDS_BRIGHTNESS_HW_CHANGED */
> =20
> +static const struct attribute_group *const led_groups[] =3D {
> +	&led_group,
> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
> +	&led_brightness_hw_changed_group,
> +#endif
> +#ifdef CONFIG_LEDS_TRIGGERS
> +	&led_trigger_group,
> +#endif
> +	NULL,
> +};
> +
> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>  void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_=
cdev, unsigned int brightness)
>  {
> -	if (WARN_ON(!led_cdev->brightness_hw_changed_kn))
> -		return;
> -
>  	led_cdev->brightness_hw_changed =3D brightness;
> -	sysfs_notify_dirent(led_cdev->brightness_hw_changed_kn);
> +	sysfs_notify(&led_cdev->dev->kobj, NULL, "brightness_hw_changed");
>  }
>  EXPORT_SYMBOL_GPL(led_classdev_notify_brightness_hw_changed);
> -#else
> -static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
> -{
> -	return 0;
> -}
> -static void led_remove_brightness_hw_changed(struct led_classdev *led_cd=
ev)
> -{
> -}
>  #endif
> =20
>  /**
> @@ -544,16 +534,6 @@ int led_classdev_register_ext(struct device *parent,
>  	if (init_data && init_data->fwnode)
>  		device_set_node(led_cdev->dev, init_data->fwnode);
> =20
> -	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
> -		ret =3D led_add_brightness_hw_changed(led_cdev);
> -		if (ret) {
> -			device_unregister(led_cdev->dev);
> -			led_cdev->dev =3D NULL;
> -			mutex_unlock(&led_cdev->led_access);
> -			return ret;
> -		}
> -	}
> -
>  	led_cdev->work_flags =3D 0;
>  #ifdef CONFIG_LEDS_TRIGGERS
>  	init_rwsem(&led_cdev->trigger_lock);
> @@ -626,9 +606,6 @@ void led_classdev_unregister(struct led_classdev *led=
_cdev)
> =20
>  	flush_work(&led_cdev->set_brightness_work);
> =20
> -	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
> -		led_remove_brightness_hw_changed(led_cdev);
> -
>  	device_unregister(led_cdev->dev);
> =20
>  	down_write(&leds_list_lock);
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index beaf23993063..6f975078cc14 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -21,7 +21,6 @@ struct attribute_group;
>  struct device_node;
>  struct fwnode_handle;
>  struct gpio_desc;
> -struct kernfs_node;
>  struct led_pattern;
>  struct platform_device;
> =20
> @@ -237,7 +236,6 @@ struct led_classdev {
> =20
>  #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>  	int			 brightness_hw_changed;
> -	struct kernfs_node	*brightness_hw_changed_kn;
>  #endif
> =20
>  #ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
