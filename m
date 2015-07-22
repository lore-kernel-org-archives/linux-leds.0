From: Antonio Ospite <ao2@ao2.it>
Subject: Re: [PATCH/RFC 15/51] leds: lp3944: Remove work queue
Date: Wed, 22 Jul 2015 11:45:16 +0200
Message-ID: <20150722114516.023361c194227890febbce54@ao2.it>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
	<1437122857-6765-16-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp209.alice.it ([82.57.200.105]:31193 "EHLO smtp209.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755016AbbGVJvv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 22 Jul 2015 05:51:51 -0400
In-Reply-To: <1437122857-6765-16-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>

On Fri, 17 Jul 2015 10:47:01 +0200
Jacek Anaszewski <j.anaszewski@samsung.com> wrote:

> From: Andrew Lunn <andrew@lunn.ch>
> 
> Now the core implements the work queue, remove it from the driver.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Cc: Antonio Ospite <ospite@studenti.unina.it>

I can't test the changes but they look good to me.

Acked-by: Antonio Ospite <ao2@ao2.it>

AFAICS now the status field may be dropped from struct
lp3944_led_data and the values passed directly to lp3944_led_set()

Not a big deal anyway, If you are not adding this change in the next
iteration I will eventually send the cleanup as a separate patch after
your change have been merged.

Thanks,
   Antonio

> ---
>  drivers/leds/leds-lp3944.c |   15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
> index 53144fb..c5cb4b9 100644
> --- a/drivers/leds/leds-lp3944.c
> +++ b/drivers/leds/leds-lp3944.c
> @@ -31,7 +31,6 @@
>  #include <linux/slab.h>
>  #include <linux/leds.h>
>  #include <linux/mutex.h>
> -#include <linux/workqueue.h>
>  #include <linux/leds-lp3944.h>
>  
>  /* Read Only Registers */
> @@ -71,7 +70,6 @@ struct lp3944_led_data {
>  	enum lp3944_status status;
>  	struct led_classdev ldev;
>  	struct i2c_client *client;
> -	struct work_struct work;
>  };
>  
>  struct lp3944_data {
> @@ -276,7 +274,7 @@ static int lp3944_led_set_blink(struct led_classdev *led_cdev,
>  		__func__);
>  
>  	led->status = LP3944_LED_STATUS_DIM0;
> -	schedule_work(&led->work);
> +	lp3944_led_set(led, led->status);
>  
>  	return 0;
>  }
> @@ -290,14 +288,6 @@ static void lp3944_led_set_brightness(struct led_classdev *led_cdev,
>  		__func__, led_cdev->name, brightness);
>  
>  	led->status = !!brightness;
> -	schedule_work(&led->work);
> -}
> -
> -static void lp3944_led_work(struct work_struct *work)
> -{
> -	struct lp3944_led_data *led;
> -
> -	led = container_of(work, struct lp3944_led_data, work);
>  	lp3944_led_set(led, led->status);
>  }
>  
> @@ -325,7 +315,6 @@ static int lp3944_configure(struct i2c_client *client,
>  			led->ldev.blink_set = lp3944_led_set_blink;
>  			led->ldev.flags = LED_CORE_SUSPENDRESUME;
>  
> -			INIT_WORK(&led->work, lp3944_led_work);
>  			err = led_classdev_register(&client->dev, &led->ldev);
>  			if (err < 0) {
>  				dev_err(&client->dev,
> @@ -364,7 +353,6 @@ exit:
>  			case LP3944_LED_TYPE_LED:
>  			case LP3944_LED_TYPE_LED_INVERTED:
>  				led_classdev_unregister(&data->leds[i].ldev);
> -				cancel_work_sync(&data->leds[i].work);
>  				break;
>  
>  			case LP3944_LED_TYPE_NONE:
> @@ -424,7 +412,6 @@ static int lp3944_remove(struct i2c_client *client)
>  		case LP3944_LED_TYPE_LED:
>  		case LP3944_LED_TYPE_LED_INVERTED:
>  			led_classdev_unregister(&data->leds[i].ldev);
> -			cancel_work_sync(&data->leds[i].work);
>  			break;
>  
>  		case LP3944_LED_TYPE_NONE:
> -- 
> 1.7.9.5
> 


-- 
Antonio Ospite
http://ao2.it

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
