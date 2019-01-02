From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 2/5] leds: Add helper for getting default pattern from
 Device Tree
Date: Wed, 2 Jan 2019 20:16:52 +0100
Message-ID: <913204f7-93e7-95f1-c477-85359ea1d73c@gmail.com>
References: <20190101140717.13564-1-krzk@kernel.org>
 <20190101140717.13564-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190101140717.13564-3-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Raphael Teysseyre <rteysseyre@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Krzysztof,

You mentioned change of helper name in the cover
letter, but it still has "classdev" part.

On 1/1/19 3:07 PM, Krzysztof Kozlowski wrote:
> Multiple LED triggers might need to access default pattern so add a
> helper for that.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/leds/led-core.c | 43 +++++++++++++++++++++++++++++++++++++++++
>   include/linux/leds.h    |  3 +++
>   2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index ede4fa0ac2cc..e4b6da73bc12 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -16,7 +16,9 @@
>   #include <linux/list.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/of.h>
>   #include <linux/rwsem.h>
> +#include <linux/slab.h>
>   #include "leds.h"
>   
>   DECLARE_RWSEM(leds_list_lock);
> @@ -310,6 +312,47 @@ int led_update_brightness(struct led_classdev *led_cdev)
>   }
>   EXPORT_SYMBOL_GPL(led_update_brightness);
>   
> +/**
> + * led_classdev_get_default_pattern - return default pattern

s/led_classdev/led/

> + *
> + * @led_cdev: the led_classdev structure for this device
> + * @size:     pointer for storing the number of elements in returned array,
> + *            modified only if return != NULL
> + *
> + * Return:    Allocated array of integers with default pattern from DeviceTree
> + *            or NULL.  Caller is responsible for kfree().
> + */
> +u32 *led_classdev_get_default_pattern(struct led_classdev *led_cdev,
> +				      unsigned int *size)

Ditto.

> +{
> +	struct device_node *np = dev_of_node(led_cdev->dev);
> +	u32 *pattern;
> +	int count;
> +
> +	if (!np)
> +		return NULL;
> +
> +	count = of_property_count_u32_elems(np, "led-pattern");
> +	if (count < 0)
> +		return NULL;
> +
> +	pattern = kcalloc(count, sizeof(*pattern), GFP_KERNEL);
> +	if (!pattern)
> +		return NULL;
> +
> +	if (of_property_read_u32_array(np, "led-pattern", pattern, count))
> +		goto err;
> +
> +	*size = count;
> +
> +	return pattern;
> +
> +err:
> +	kfree(pattern);
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(led_classdev_get_default_pattern);

Ditto.

> +
>   /* Caller must ensure led_cdev->led_access held */
>   void led_sysfs_disable(struct led_classdev *led_cdev)
>   {
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 5263f87e1d2c..70edf574ba81 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -129,6 +129,9 @@ struct led_classdev {
>   	struct mutex		led_access;
>   };
>   
> +extern u32 *led_classdev_get_default_pattern(struct led_classdev *led_cdev,
> +					     unsigned int *size);
> +

Ditto.

>   extern int of_led_classdev_register(struct device *parent,
>   				    struct device_node *np,
>   				    struct led_classdev *led_cdev);
> 

-- 
Best regards,
Jacek Anaszewski
