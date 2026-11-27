Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790429;
	b=uSodes0FuS4W/hLgyDskI5tGEZbluNGMwFpUoa67EjaHNrVwo3k4qPYCLtrrJgaS3BuK
	 OqKtwn7Tfm/tKfCSNC/VR1VYVd3qlQ3PRAQVjtIF7YeVq68rms2SLZHNFxy2zZ37D8TSG
	 hS89zzKp7CPhIi5BhzMuQ4vb/HXGBA8TjLMzqB2SgF5S6Utb74bTaziuipVDY6znPfFQU
	 j9U+x8KzGZKmneYeaOjswykmdKXubBNsvo78ko96ackxIzy0oG471ZQM8k0CkLx7ETDpT
	 W98lQ1H3YrByxNRaoTY7IxrHt1b7JP8WC7Ki+ra/QbssF56YrU8+1CHmqBGP6B5DP8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790429;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=1fn03CJhJTOUA2jXd7sSKs+mwit/jlaBNxTtGFqUuz0=;
	b=R5iujyQKTU3c4o1YaZ1TNuEdcK+abeLtCiZRz2If7dWbqdLWpkNF5u27QLy8124JYS9a
	 6tRSzhiFdKtTwKSF0wg/JTvvzPqF+dYJX9dzFSflARcQeeQ0NIoAlol9bjBSeX4CkWMI0
	 Bbzr2RCUVe/QNVfTS8EOvOBkk9JglTrg2TANNkc1ODC315A1p9+Fb1txPvWlxtEumFnK/
	 PSxod+SDKXi/dfDwHfh+7Pcwb/JbPQ/HJsSEH+Eoz/ZLxJpo4vwi35PAX77enmKhVN1pt
	 0EzJbv5I8F7MhAE19kHqZGKuiQa2kT96YUEMOCGkndO+g8+uIk7YJ7TOhOqMRvec11w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dTcVypU/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D773606A31F;
	Fri, 27 Nov 2026 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dTcVypU/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9961F000C1;
	Fri, 27 Nov 2026 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795790429;
	bh=1fn03CJhJTOUA2jXd7sSKs+mwit/jlaBNxTtGFqUuz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dTcVypU/93uXZhVhMhAeGqYTbe9VTE0wNI3PWFklkmPipQu2W/iYVX4RjpQMGDL5H
	 TCGC+t4rw/X2OyojA8ws8e+mhwS3f6iYiUyn2jNJXWO9ZjXK/z5uLK3/K56JYttjWu
	 Alqu1cPMOTOUCEqo6f23TiPNIOUbHaBM7X5SfRidmGr8/j0LfbQdzDZUqJdqLni0Al
	 pXMe/lkQlAlueTANdLcP/X7/6h50XxyKHgsciR1eB4aobg2hikoHNqYFJEK0wQGMHG
	 WwIlIVKg3ZYZpti+YhPJF503MivjX/UNHmAsCGMlGFOkQRNVD+2DZlrmrs7/vd6ciB
	 UQB0cq/N4kKOQ==
Date: Fri, 27 Nov 2026 14:40:23 +0000
From: Lee Jones <lee@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, i@rong.moe
Subject: Re: [PATCH v3 09/11] leds: Support custom sysfs groups on multicolor
 and flash LEDs
Message-ID: <179568582911.32537.4009212823876251882@kernel.org>
References: <20261120212431.152081-1-W_Armin@gmx.de>
 <20261120212431.152081-10-W_Armin@gmx.de>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120212431.152081-10-W_Armin@gmx.de>
X-AI-Review-Draft: <20261120212431.152081-10-W_Armin@gmx.de>

--- checkpatch.pl (7 issues) ---
Line 6: WARNING: 'seperate' may be misspelled - perhaps 'separate'?
Line 70: ERROR: code indent should use tabs where possible
Line 70: WARNING: please, no spaces at the start of a line
Line 71: ERROR: code indent should use tabs where possible
Line 71: WARNING: please, no spaces at the start of a line
Line 87: ERROR: code indent should use tabs where possible
Line 87: WARNING: please, no spaces at the start of a line
----------------------------------

???

On Fri, 20 Nov 2026, Armin Wolf wrote:

> Drivers registering multicolor/flash LEDs currently cannot use
> led_cdev->groups due to said field being overwritten by the
> multicolor/flash LED registration functions. Fix this by assigning
> each LED type a seperate device type ("multicolor" and "flash")

"separate"

> that carries the sysfs attributes instead.
>
> Also assign a device type for standard LEDs ("standard") for symmetry.
>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/leds/led-class-flash.c      | 107 +++++++++++++---------------
>  drivers/leds/led-class-multicolor.c |  15 +++-
>  drivers/leds/led-class.c            |   6 ++
>  include/linux/led-class-flash.h     |   5 --
>  4 files changed, 68 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> index 33cfc5d082c1..2e98f030cda6 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
> +#include "leds.h"
>
>  #define has_flash_op(fled_cdev, op)				\
>  	(fled_cdev && fled_cdev->ops->op)
> @@ -207,42 +208,56 @@ static ssize_t flash_fault_show(struct device *dev, const struct device_attribut
>  }
>  static const DEVICE_ATTR_RO(flash_fault);
>
> -static const struct attribute *const led_flash_strobe_attrs[] = {
> +static const struct attribute *const led_flash_attrs[] = {
>  	&dev_attr_flash_strobe.attr,
> -	NULL,
> -};
> -
> -static const struct attribute *const led_flash_timeout_attrs[] = {
>  	&dev_attr_flash_timeout.attr,
>  	&dev_attr_max_flash_timeout.attr,
> -	NULL,
> -};
> -
> -static const struct attribute *const led_flash_brightness_attrs[] = {
>  	&dev_attr_flash_brightness.attr,
>  	&dev_attr_max_flash_brightness.attr,
> -	NULL,
> -};
> -
> -static const struct attribute *const led_flash_fault_attrs[] = {
>  	&dev_attr_flash_fault.attr,
>  	NULL,
>  };
>
> -static const struct attribute_group led_flash_strobe_group = {
> -	.attrs_const = led_flash_strobe_attrs,
> -};
> +static umode_t led_flash_is_visible(struct kobject *kobj, const struct attribute *attr, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
> +
> +	if (attr == &dev_attr_flash_strobe.attr)
> +		return attr->mode;
> +
> +        if (attr == &dev_attr_flash_timeout.attr && fled_cdev->ops->timeout_set)
> +                return attr->mode;
> +
> +	if (attr == &dev_attr_max_flash_timeout.attr && fled_cdev->ops->timeout_set)
> +		return attr->mode;
> +
> +	if (attr == &dev_attr_flash_brightness.attr && fled_cdev->ops->flash_brightness_set)
> +		return attr->mode;
> +
> +	if (attr == &dev_attr_max_flash_brightness.attr && fled_cdev->ops->flash_brightness_set)
> +		return attr->mode;
> +
> +	if (attr == &dev_attr_flash_fault.attr && fled_cdev->ops->fault_get)
> +		return attr->mode;
>
> -static const struct attribute_group led_flash_timeout_group = {
> -	.attrs_const = led_flash_timeout_attrs,
> +        return 0;
> +}
> +
> +static const struct attribute_group led_flash_group = {
> +	.is_visible_const = led_flash_is_visible,
> +	.attrs_const = led_flash_attrs,
>  };
>
> -static const struct attribute_group led_flash_brightness_group = {
> -	.attrs_const = led_flash_brightness_attrs,
> +static const struct attribute_group *led_flash_groups[] = {
> +	&led_flash_group,
> +	NULL,
>  };
>
> -static const struct attribute_group led_flash_fault_group = {
> -	.attrs_const = led_flash_fault_attrs,
> +static const struct device_type led_flash_device_type = {
> +	.name = "flash",
> +	.groups = led_flash_groups,
>  };
>
>  static void led_flash_resume(struct led_classdev *led_cdev)
> @@ -254,30 +269,6 @@ static void led_flash_resume(struct led_classdev *led_cdev)
>  	call_flash_op(fled_cdev, timeout_set, fled_cdev->timeout.val);
>  }
>
> -static void led_flash_init_sysfs_groups(struct led_classdev_flash *fled_cdev)
> -{
> -	struct led_classdev *led_cdev = &fled_cdev->led_cdev;
> -	const struct led_flash_ops *ops = fled_cdev->ops;
> -	const struct attribute_group **flash_groups = fled_cdev->sysfs_groups;
> -
> -	int num_sysfs_groups = 0;
> -
> -	flash_groups[num_sysfs_groups++] = &led_flash_strobe_group;
> -
> -	if (ops->flash_brightness_set)
> -		flash_groups[num_sysfs_groups++] = &led_flash_brightness_group;
> -
> -	if (ops->timeout_set)
> -		flash_groups[num_sysfs_groups++] = &led_flash_timeout_group;
> -
> -	if (ops->fault_get)
> -		flash_groups[num_sysfs_groups++] = &led_flash_fault_group;
> -
> -	flash_groups[num_sysfs_groups] = NULL;
> -
> -	led_cdev->groups = flash_groups;
> -}
> -
>  int led_classdev_flash_register_ext(struct device *parent,
>  				    struct led_classdev_flash *fled_cdev,
>  				    struct led_init_data *init_data)
> @@ -291,26 +282,26 @@ int led_classdev_flash_register_ext(struct device *parent,
>
>  	led_cdev = &fled_cdev->led_cdev;
>
> -	if (led_cdev->flags & LED_DEV_CAP_FLASH) {
> -		if (!led_cdev->brightness_set_blocking)
> -			return -EINVAL;
> +	if (!(led_cdev->flags & LED_DEV_CAP_FLASH))
> +		return led_classdev_register_ext(parent, led_cdev, init_data);
>
> -		ops = fled_cdev->ops;
> -		if (!ops || !ops->strobe_set)
> -			return -EINVAL;
> +	if (!led_cdev->brightness_set_blocking)
> +		return -EINVAL;
>
> -		led_cdev->flash_resume = led_flash_resume;
> +	ops = fled_cdev->ops;
> +	if (!ops || !ops->strobe_set)
> +		return -EINVAL;
>
> -		/* Select the sysfs attributes to be created for the device */
> -		led_flash_init_sysfs_groups(fled_cdev);
> -	}
> +	led_cdev->flash_resume = led_flash_resume;
>
>  	/* Register led class device */
> -	ret = led_classdev_register_ext(parent, led_cdev, init_data);
> +	ret = led_classdev_init(parent, led_cdev, init_data);
>  	if (ret < 0)
>  		return ret;
>
> -	return 0;
> +	led_cdev->dev->type = &led_flash_device_type;
> +
> +	return led_classdev_add(led_cdev, init_data);
>  }
>  EXPORT_SYMBOL_GPL(led_classdev_flash_register_ext);
>
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
> index 57df0b2e785b..0656ca2361b3 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -12,6 +12,7 @@
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
>  #include <linux/uaccess.h>
> +#include "leds.h"
>
>  static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcled_cdev, size_t index)
>  {
> @@ -159,11 +160,17 @@ static const struct attribute *const led_multicolor_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(led_multicolor);
>
> +static const struct device_type led_multicolor_device_type = {
> +	.name = "multicolor",
> +	.groups = led_multicolor_groups,
> +};
> +
>  int led_classdev_multicolor_register_ext(struct device *parent,
>  				     struct led_classdev_mc *mcled_cdev,
>  				     struct led_init_data *init_data)
>  {
>  	struct led_classdev *led_cdev;
> +	int ret;
>
>  	if (!mcled_cdev)
>  		return -EINVAL;
> @@ -176,9 +183,13 @@ int led_classdev_multicolor_register_ext(struct device *parent,
>
>  	led_cdev = &mcled_cdev->led_cdev;
>  	led_cdev->flags |= LED_MULTI_COLOR;
> -	mcled_cdev->led_cdev.groups = led_multicolor_groups;
> +	ret = led_classdev_init(parent, led_cdev, init_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	led_cdev->dev->type = &led_multicolor_device_type;
>
> -	return led_classdev_register_ext(parent, led_cdev, init_data);
> +	return led_classdev_add(led_cdev, init_data);
>  }
>  EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 2f62141268ab..161b85db04f3 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -654,6 +654,10 @@ int led_classdev_add(struct led_classdev *led_cdev, struct led_init_data *init_d
>  }
>  EXPORT_SYMBOL_GPL(led_classdev_add);
>
> +static const struct device_type led_device_type = {
> +	.name = "standard",
> +};
> +
>  /**
>   * led_classdev_register_ext - register a new object of led_classdev class
>   *                             with init data.
> @@ -672,6 +676,8 @@ int led_classdev_register_ext(struct device *parent,
>  	if (ret < 0)
>  		return ret;
>
> +	led_cdev->dev->type = &led_device_type;
> +
>  	return led_classdev_add(led_cdev, init_data);
>  }
>  EXPORT_SYMBOL_GPL(led_classdev_register_ext);
> diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
> index 775a96217518..5204ef60dc4b 100644
> --- a/include/linux/led-class-flash.h
> +++ b/include/linux/led-class-flash.h
> @@ -28,8 +28,6 @@ struct led_classdev_flash;
>  #define LED_FAULT_LED_OVER_TEMPERATURE	(1 << 8)
>  #define LED_NUM_FLASH_FAULTS		9
>
> -#define LED_FLASH_SYSFS_GROUPS_SIZE	5
> -
>  struct led_flash_ops {
>  	/* set flash brightness */
>  	int (*flash_brightness_set)(struct led_classdev_flash *fled_cdev,
> @@ -79,9 +77,6 @@ struct led_classdev_flash {
>
>  	/* flash timeout value in microseconds along with its constraints */
>  	struct led_flash_setting duration;
> -
> -	/* LED Flash class sysfs groups */
> -	const struct attribute_group *sysfs_groups[LED_FLASH_SYSFS_GROUPS_SIZE];
>  };
>
>  static inline struct led_classdev_flash *lcdev_to_flcdev(
> -- 
> 2.56.1
>

-- 
Lee Jones
