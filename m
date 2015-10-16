From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 04/10] leds: core: Use set_brightness_work for the
 blocking op
Date: Fri, 16 Oct 2015 18:43:58 +0300
Message-ID: <20151016154358.GN26916@valkosipuli.retiisi.org.uk>
References: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com>
 <1444209048-29415-5-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444209048-29415-5-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, sakari.ailus@linux.intel.com, andrew@lunn.ch
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

I think I'd rearrange patches 3 and 4; delayed_set_brightness is briefly
needed in patch 3 but again no longer here.

I have to say I quite like the set, it cleans up the framework a lot.
Thanks!

On Wed, Oct 07, 2015 at 11:10:42AM +0200, Jacek Anaszewski wrote:
> This patch makes LED core capable of setting brightness for drivers
> that implement brightness_set_blocking op. It removes from LED class
> drivers responsibility for using work queues on their own.
> 
> In order to achieve this set_brightness_delayed callback is being
> modified to directly call one of available ops for brightness setting.
> 
> led_set_brightness_async() function didn't set brightness in an
> asynchronous way in all cases. It was mistakenly assuming that all
> LED subsystem drivers used work queue in their brightness_set op,
> whereas only half of them did that. Since it has no users now,
> it is being removed.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> ---
>  drivers/leds/led-core.c |   12 +++++++++++-
>  drivers/leds/leds.h     |   10 ----------
>  include/linux/leds.h    |    2 +-
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index a1f53aa..7d2512f 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -83,6 +83,7 @@ static void set_brightness_delayed(struct work_struct *ws)
>  {
>  	struct led_classdev *led_cdev =
>  		container_of(ws, struct led_classdev, set_brightness_work);
> +	int ret = 0;
>  
>  	if (led_cdev->flags & LED_BLINK_DISABLE) {
>  		led_cdev->delayed_set_value = LED_OFF;
> @@ -90,7 +91,16 @@ static void set_brightness_delayed(struct work_struct *ws)
>  		led_cdev->flags &= ~LED_BLINK_DISABLE;
>  	}
>  
> -	led_set_brightness_async(led_cdev, led_cdev->delayed_set_value);
> +	if (led_cdev->brightness_set)
> +		led_cdev->brightness_set(led_cdev, led_cdev->brightness);
> +	else if (led_cdev->brightness_set_blocking)
> +		ret = led_cdev->brightness_set_blocking(led_cdev,
> +							led_cdev->brightness);
> +	else
> +		ret = -ENOTSUPP;
> +	if (ret < 0)
> +		dev_err(led_cdev->dev,
> +			"Setting an LED's brightness failed (%d)\n", ret);
>  }
>  
>  static void led_set_software_blink(struct led_classdev *led_cdev,
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index 8e252a2..683a605 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -16,16 +16,6 @@
>  #include <linux/rwsem.h>
>  #include <linux/leds.h>
>  
> -static inline void led_set_brightness_async(struct led_classdev *led_cdev,
> -					enum led_brightness value)
> -{
> -	value = min(value, led_cdev->max_brightness);
> -	led_cdev->brightness = value;
> -
> -	if (!(led_cdev->flags & LED_SUSPENDED))
> -		led_cdev->brightness_set(led_cdev, value);
> -}
> -
>  static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
>  					enum led_brightness value)
>  {
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index b47eff5..56d5069 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -158,7 +158,7 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
>   *
>   * Set an LED's brightness, and, if necessary, cancel the
>   * software blink timer that implements blinking when the
> - * hardware doesn't.
> + * hardware doesn't. This function is guaranteed not to sleep.
>   */
>  extern void led_set_brightness(struct led_classdev *led_cdev,
>  			       enum led_brightness brightness);

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
