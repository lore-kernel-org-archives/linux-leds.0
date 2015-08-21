From: Antonio Ospite <ao2@ao2.it>
Subject: Re: [PATCH/RFC v6 32/36] leds: regulator: Remove work queue
Date: Fri, 21 Aug 2015 09:49:32 +0200
Message-ID: <20150821094932.49f3b1973a748db682789651@ao2.it>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
	<1440081846-11697-33-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp209.alice.it ([82.57.200.105]:8945 "EHLO smtp209.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751728AbbHUHtq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 21 Aug 2015 03:49:46 -0400
In-Reply-To: <1440081846-11697-33-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>

On Thu, 20 Aug 2015 16:44:02 +0200
Jacek Anaszewski <j.anaszewski@samsung.com> wrote:

> From: Andrew Lunn <andrew@lunn.ch>
> 
> Now the core implements the work queue, remove it from the drivers,
> and switch to using brightness_set_blocking op.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Cc: Antonio Ospite <ospite@studenti.unina.it>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>

Acked-by: Antonio Ospite <ao2@ao2.it>

> ---
>  drivers/leds/leds-regulator.c |   46 +++++++++++------------------------------
>  1 file changed, 12 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/leds/leds-regulator.c b/drivers/leds/leds-regulator.c
> index ffc2139..acf77ca 100644
> --- a/drivers/leds/leds-regulator.c
> +++ b/drivers/leds/leds-regulator.c
> @@ -14,7 +14,6 @@
>  #include <linux/module.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
> -#include <linux/workqueue.h>
>  #include <linux/leds.h>
>  #include <linux/leds-regulator.h>
>  #include <linux/platform_device.h>
> @@ -25,10 +24,8 @@
>  
>  struct regulator_led {
>  	struct led_classdev cdev;
> -	enum led_brightness value;
>  	int enabled;
>  	struct mutex mutex;
> -	struct work_struct work;
>  
>  	struct regulator *vcc;
>  };
> @@ -94,22 +91,24 @@ static void regulator_led_disable(struct regulator_led *led)
>  	led->enabled = 0;
>  }
>  
> -static void regulator_led_set_value(struct regulator_led *led)
> +static int regulator_led_brightness_set(struct led_classdev *led_cdev,
> +					 enum led_brightness value)
>  {
> +	struct regulator_led *led = to_regulator_led(led_cdev);
>  	int voltage;
> -	int ret;
> +	int ret = 0;
>  
>  	mutex_lock(&led->mutex);
>  
> -	if (led->value == LED_OFF) {
> +	if (value == LED_OFF) {
>  		regulator_led_disable(led);
>  		goto out;
>  	}
>  
>  	if (led->cdev.max_brightness > 1) {
> -		voltage = led_regulator_get_voltage(led->vcc, led->value);
> +		voltage = led_regulator_get_voltage(led->vcc, value);
>  		dev_dbg(led->cdev.dev, "brightness: %d voltage: %d\n",
> -				led->value, voltage);
> +				value, voltage);
>  
>  		ret = regulator_set_voltage(led->vcc, voltage, voltage);
>  		if (ret != 0)
> @@ -121,23 +120,7 @@ static void regulator_led_set_value(struct regulator_led *led)
>  
>  out:
>  	mutex_unlock(&led->mutex);
> -}
> -
> -static void led_work(struct work_struct *work)
> -{
> -	struct regulator_led *led;
> -
> -	led = container_of(work, struct regulator_led, work);
> -	regulator_led_set_value(led);
> -}
> -
> -static void regulator_led_brightness_set(struct led_classdev *led_cdev,
> -			   enum led_brightness value)
> -{
> -	struct regulator_led *led = to_regulator_led(led_cdev);
> -
> -	led->value = value;
> -	schedule_work(&led->work);
> +	return ret;
>  }
>  
>  static int regulator_led_probe(struct platform_device *pdev)
> @@ -169,9 +152,8 @@ static int regulator_led_probe(struct platform_device *pdev)
>  				pdata->brightness);
>  		return -EINVAL;
>  	}
> -	led->value = pdata->brightness;
>  
> -	led->cdev.brightness_set = regulator_led_brightness_set;
> +	led->cdev.brightness_set_blocking = regulator_led_brightness_set;
>  	led->cdev.name = pdata->name;
>  	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
>  	led->vcc = vcc;
> @@ -181,21 +163,18 @@ static int regulator_led_probe(struct platform_device *pdev)
>  		led->enabled = 1;
>  
>  	mutex_init(&led->mutex);
> -	INIT_WORK(&led->work, led_work);
>  
>  	platform_set_drvdata(pdev, led);
>  
>  	ret = led_classdev_register(&pdev->dev, &led->cdev);
> -	if (ret < 0) {
> -		cancel_work_sync(&led->work);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	/* to expose the default value to userspace */
> -	led->cdev.brightness = led->value;
> +	led->cdev.brightness = pdata->brightness;
>  
>  	/* Set the default led status */
> -	regulator_led_set_value(led);
> +	regulator_led_brightness_set(&led->cdev, led->cdev.brightness);
>  
>  	return 0;
>  }
> @@ -205,7 +184,6 @@ static int regulator_led_remove(struct platform_device *pdev)
>  	struct regulator_led *led = platform_get_drvdata(pdev);
>  
>  	led_classdev_unregister(&led->cdev);
> -	cancel_work_sync(&led->work);
>  	regulator_led_disable(led);
>  	return 0;
>  }
> -- 
> 1.7.9.5
> 


-- 
Antonio Ospite
http://ao2.it

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
