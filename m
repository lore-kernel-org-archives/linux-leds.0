From: Antonio Ospite <ao2@ao2.it>
Subject: Re: [PATCH/RFC v6 19/36] leds: lp3944: Remove work queue
Date: Fri, 21 Aug 2015 09:47:11 +0200
Message-ID: <20150821094711.abfa5692e621c99ebb13a959@ao2.it>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
	<1440081846-11697-20-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp209.alice.it ([82.57.200.105]:11046 "EHLO smtp209.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753182AbbHUHr3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 21 Aug 2015 03:47:29 -0400
In-Reply-To: <1440081846-11697-20-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>

On Thu, 20 Aug 2015 16:43:49 +0200
Jacek Anaszewski <j.anaszewski@samsung.com> wrote:

> From: Andrew Lunn <andrew@lunn.ch>
> 
> Now the core implements the work queue, remove it from the driver,
> and switch to using brightness_set_blocking op.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Cc: Antonio Ospite <ospite@studenti.unina.it>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>

Acked-by: Antonio Ospite <ao2@ao2.it>

> ---
>  drivers/leds/leds-lp3944.c |   32 ++++++++------------------------
>  1 file changed, 8 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
> index 53144fb..6c758ae 100644
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
> @@ -68,10 +67,8 @@
>  struct lp3944_led_data {
>  	u8 id;
>  	enum lp3944_type type;
> -	enum lp3944_status status;
>  	struct led_classdev ldev;
>  	struct i2c_client *client;
> -	struct work_struct work;
>  };
>  
>  struct lp3944_data {
> @@ -275,13 +272,12 @@ static int lp3944_led_set_blink(struct led_classdev *led_cdev,
>  	dev_dbg(&led->client->dev, "%s: OK hardware accelerated blink!\n",
>  		__func__);
>  
> -	led->status = LP3944_LED_STATUS_DIM0;
> -	schedule_work(&led->work);
> +	lp3944_led_set(led, LP3944_LED_STATUS_DIM0);
>  
>  	return 0;
>  }
>  
> -static void lp3944_led_set_brightness(struct led_classdev *led_cdev,
> +static int lp3944_led_set_brightness(struct led_classdev *led_cdev,
>  				      enum led_brightness brightness)
>  {
>  	struct lp3944_led_data *led = ldev_to_led(led_cdev);
> @@ -289,16 +285,7 @@ static void lp3944_led_set_brightness(struct led_classdev *led_cdev,
>  	dev_dbg(&led->client->dev, "%s: %s, %d\n",
>  		__func__, led_cdev->name, brightness);
>  
> -	led->status = !!brightness;
> -	schedule_work(&led->work);
> -}
> -
> -static void lp3944_led_work(struct work_struct *work)
> -{
> -	struct lp3944_led_data *led;
> -
> -	led = container_of(work, struct lp3944_led_data, work);
> -	lp3944_led_set(led, led->status);
> +	return lp3944_led_set(led, !!brightness);
>  }
>  
>  static int lp3944_configure(struct i2c_client *client,
> @@ -318,14 +305,13 @@ static int lp3944_configure(struct i2c_client *client,
>  		case LP3944_LED_TYPE_LED:
>  		case LP3944_LED_TYPE_LED_INVERTED:
>  			led->type = pled->type;
> -			led->status = pled->status;
>  			led->ldev.name = pled->name;
>  			led->ldev.max_brightness = 1;
> -			led->ldev.brightness_set = lp3944_led_set_brightness;
> +			led->ldev.brightness_set_blocking =
> +						lp3944_led_set_brightness;
>  			led->ldev.blink_set = lp3944_led_set_blink;
>  			led->ldev.flags = LED_CORE_SUSPENDRESUME;
>  
> -			INIT_WORK(&led->work, lp3944_led_work);
>  			err = led_classdev_register(&client->dev, &led->ldev);
>  			if (err < 0) {
>  				dev_err(&client->dev,
> @@ -336,14 +322,14 @@ static int lp3944_configure(struct i2c_client *client,
>  
>  			/* to expose the default value to userspace */
>  			led->ldev.brightness =
> -					(enum led_brightness) led->status;
> +					(enum led_brightness) pled->status;
>  
>  			/* Set the default led status */
> -			err = lp3944_led_set(led, led->status);
> +			err = lp3944_led_set(led, pled->status);
>  			if (err < 0) {
>  				dev_err(&client->dev,
>  					"%s couldn't set STATUS %d\n",
> -					led->ldev.name, led->status);
> +					led->ldev.name, pled->status);
>  				goto exit;
>  			}
>  			break;
> @@ -364,7 +350,6 @@ exit:
>  			case LP3944_LED_TYPE_LED:
>  			case LP3944_LED_TYPE_LED_INVERTED:
>  				led_classdev_unregister(&data->leds[i].ldev);
> -				cancel_work_sync(&data->leds[i].work);
>  				break;
>  
>  			case LP3944_LED_TYPE_NONE:
> @@ -424,7 +409,6 @@ static int lp3944_remove(struct i2c_client *client)
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
