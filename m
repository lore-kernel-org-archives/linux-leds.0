From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 01/20] leds: implement LED_BRIGHTNESS_FAST flag
Date: Mon, 01 Jun 2015 10:31:17 +0200
Message-ID: <556C1855.7070903@samsung.com>
References: <555CA58A.10700@list.ru> <555CA5FA.2080308@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <555CA5FA.2080308@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-leds@vger.kernel.org

On 05/20/2015 05:19 PM, Stas Sergeev wrote:
>
> Add LED_BRIGHTNESS_FAST flag. This flag is used to mark the led drivers
> that do not use waiting operations when setting led brightness and do not
> use work-queue in .brightness_set op.
> When this flag is not set, disallow the blink periods smaller than 10mS
> (LED_SLOW_MIN_PERIOD define).
>
> CC: Bryan Wu <cooloney@gmail.com>
> CC: Richard Purdie <rpurdie@rpsys.net>
> CC: Jacek Anaszewski <j.anaszewski@samsung.com>
> CC: Kyungmin Park <kyungmin.park@samsung.com>
> CC: linux-leds@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
>
> Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
> ---
>   drivers/leds/led-core.c                |   30 +++++++++++++++++++-----------
>   drivers/leds/led-triggers.c            |    8 +++++---
>   drivers/leds/trigger/ledtrig-oneshot.c |    5 ++++-
>   drivers/leds/trigger/ledtrig-timer.c   |   18 +++++++++++++-----
>   include/linux/leds.h                   |   12 ++++++++++--
>   5 files changed, 51 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 9886dac..89241aa 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -25,12 +25,19 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>   LIST_HEAD(leds_list);
>   EXPORT_SYMBOL_GPL(leds_list);
>
> -static void led_set_software_blink(struct led_classdev *led_cdev,
> +static int led_set_software_blink(struct led_classdev *led_cdev,
>   				   unsigned long delay_on,
>   				   unsigned long delay_off)
>   {
>   	int current_brightness;
>
> +	if (!(led_cdev->flags & LED_BRIGHTNESS_FAST)) {
> +		if (delay_on < LED_SLOW_MIN_PERIOD)
> +			return -ERANGE;
> +		if (delay_off < LED_SLOW_MIN_PERIOD)
> +			return -ERANGE;
> +	}
> +

With this approach, the LED will remain in its current blink state, in
case LED_BRIGHTNESS_FAST flag is not set and delay to be set is below 
LED_SLOW_MIN_PERIOD. This is because timer is deleted at the beginning
of led_blink_set. Effectively this can result in the LED staying turned
on when e.g. "echo 1 > delay_on" fails.

I propose to change this part of code as follows:

         if (!(led_cdev->flags & LED_BRIGHTNESS_FAST)) {
		if (delay_on < LED_SLOW_MIN_PERIOD ||
		    delay_off < LED_SLOW_MIN_PERIOD)
			led_set_brightness_async(led_cdev, LED_OFF);
			return -ERANGE;
		}
	}

By this occasion it turned out that we have inconsistency:
led_set_brightness_async calls brightness_set op, which doesn't
set LED brightness in an asynchronous way in case of every driver.

Before introduction of SET_BRIGHTNESS_SYNC and SET_BRIGHTNESS_ASYNC
flags there was only brightness_set op. The flags and
brightness_set_sync op was added for flash LED controllers to avoid
delegating the job to work queue and assure that brightness is set
as quickly as possible.

I mistakenly assumed that all drivers set the brightness with use
of a work queue.

Now, to fix the issue all drivers that set brightness in the
asynchronous way need to set the SET_BRIGHTNESS_SYNC flag and rename
their brightness_set ops to brightness_set_sync.
It would be also nice to rename brightness_set op to
brightness_set_async.

Also, led_set_brightness_async shouldn't be called directly
anywhere, but led_set_brightness should be used, as it
selects the appropriate op basing on the SET_BRIGHTNESS_* flag.

I'd prefer to do these modifications before merging this patch
set. I can produce the patch set within a few days. Or, maybe you
would like to take care of it?

>   	current_brightness = led_get_brightness(led_cdev);
>   	if (current_brightness)
>   		led_cdev->blink_brightness = current_brightness;
> @@ -43,36 +50,37 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>   	/* never on - just set to off */
>   	if (!delay_on) {
>   		led_set_brightness_async(led_cdev, LED_OFF);
> -		return;
> +		return 0;
>   	}
>
>   	/* never off - just set to brightness */
>   	if (!delay_off) {
>   		led_set_brightness_async(led_cdev, led_cdev->blink_brightness);
> -		return;
> +		return 0;
>   	}
>
>   	mod_timer(&led_cdev->blink_timer, jiffies + 1);
> +	return 0;
>   }
>
>
> -static void led_blink_setup(struct led_classdev *led_cdev,
> +static int led_blink_setup(struct led_classdev *led_cdev,
>   		     unsigned long *delay_on,
>   		     unsigned long *delay_off)
>   {
>   	if (!(led_cdev->flags & LED_BLINK_ONESHOT) &&
>   	    led_cdev->blink_set &&
>   	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
> -		return;
> +		return 0;
>
>   	/* blink with 1 Hz as default if nothing specified */
>   	if (!*delay_on && !*delay_off)
>   		*delay_on = *delay_off = 500;
>
> -	led_set_software_blink(led_cdev, *delay_on, *delay_off);
> +	return led_set_software_blink(led_cdev, *delay_on, *delay_off);
>   }
>
> -void led_blink_set(struct led_classdev *led_cdev,
> +int led_blink_set(struct led_classdev *led_cdev,
>   		   unsigned long *delay_on,
>   		   unsigned long *delay_off)
>   {
> @@ -81,18 +89,18 @@ void led_blink_set(struct led_classdev *led_cdev,
>   	led_cdev->flags &= ~LED_BLINK_ONESHOT;
>   	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
>
> -	led_blink_setup(led_cdev, delay_on, delay_off);
> +	return led_blink_setup(led_cdev, delay_on, delay_off);
>   }
>   EXPORT_SYMBOL(led_blink_set);
>
> -void led_blink_set_oneshot(struct led_classdev *led_cdev,
> +int led_blink_set_oneshot(struct led_classdev *led_cdev,
>   			   unsigned long *delay_on,
>   			   unsigned long *delay_off,
>   			   int invert)
>   {
>   	if ((led_cdev->flags & LED_BLINK_ONESHOT) &&
>   	     timer_pending(&led_cdev->blink_timer))
> -		return;
> +		return -EBUSY;
>
>   	led_cdev->flags |= LED_BLINK_ONESHOT;
>   	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
> @@ -102,7 +110,7 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
>   	else
>   		led_cdev->flags &= ~LED_BLINK_INVERT;
>
> -	led_blink_setup(led_cdev, delay_on, delay_off);
> +	return led_blink_setup(led_cdev, delay_on, delay_off);
>   }
>   EXPORT_SYMBOL(led_blink_set_oneshot);
>
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index e8b1120..63305b1 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -272,6 +272,7 @@ static void led_trigger_blink_setup(struct led_trigger *trig,
>   			     int oneshot,
>   			     int invert)
>   {
> +	int ret = 0;
>   	struct led_classdev *led_cdev;
>
>   	if (!trig)
> @@ -280,12 +281,13 @@ static void led_trigger_blink_setup(struct led_trigger *trig,
>   	read_lock(&trig->leddev_list_lock);
>   	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
>   		if (oneshot)
> -			led_blink_set_oneshot(led_cdev, delay_on, delay_off,
> -					      invert);
> +			ret = led_blink_set_oneshot(led_cdev, delay_on,
> +						   delay_off, invert);
>   		else
> -			led_blink_set(led_cdev, delay_on, delay_off);
> +			ret = led_blink_set(led_cdev, delay_on, delay_off);
>   	}
>   	read_unlock(&trig->leddev_list_lock);
> +	WARN_ON(ret);
>   }
>
>   void led_trigger_blink(struct led_trigger *trig,
> diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
> index fbd02cd..ba91838 100644
> --- a/drivers/leds/trigger/ledtrig-oneshot.c
> +++ b/drivers/leds/trigger/ledtrig-oneshot.c
> @@ -29,12 +29,15 @@ struct oneshot_trig_data {
>   static ssize_t led_shot(struct device *dev,
>   		struct device_attribute *attr, const char *buf, size_t size)
>   {
> +	ssize_t ret;
>   	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>   	struct oneshot_trig_data *oneshot_data = led_cdev->trigger_data;
>
> -	led_blink_set_oneshot(led_cdev,
> +	ret = led_blink_set_oneshot(led_cdev,
>   			&led_cdev->blink_delay_on, &led_cdev->blink_delay_off,
>   			oneshot_data->invert);
> +	if (ret)
> +		return ret;
>
>   	/* content is ignored */
>   	return size;
> diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
> index 8d09327..edc0c7f 100644
> --- a/drivers/leds/trigger/ledtrig-timer.c
> +++ b/drivers/leds/trigger/ledtrig-timer.c
> @@ -31,13 +31,15 @@ static ssize_t led_delay_on_store(struct device *dev,
>   {
>   	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>   	unsigned long state;
> -	ssize_t ret = -EINVAL;
> +	ssize_t ret;
>
>   	ret = kstrtoul(buf, 10, &state);
>   	if (ret)
>   		return ret;
>
> -	led_blink_set(led_cdev, &state, &led_cdev->blink_delay_off);
> +	ret = led_blink_set(led_cdev, &state, &led_cdev->blink_delay_off);
> +	if (ret)
> +		return ret;
>   	led_cdev->blink_delay_on = state;
>
>   	return size;
> @@ -56,13 +58,15 @@ static ssize_t led_delay_off_store(struct device *dev,
>   {
>   	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>   	unsigned long state;
> -	ssize_t ret = -EINVAL;
> +	ssize_t ret;
>
>   	ret = kstrtoul(buf, 10, &state);
>   	if (ret)
>   		return ret;
>
> -	led_blink_set(led_cdev, &led_cdev->blink_delay_on, &state);
> +	ret = led_blink_set(led_cdev, &led_cdev->blink_delay_on, &state);
> +	if (ret)
> +		return ret;
>   	led_cdev->blink_delay_off = state;
>
>   	return size;
> @@ -84,12 +88,16 @@ static void timer_trig_activate(struct led_classdev *led_cdev)
>   	if (rc)
>   		goto err_out_delayon;
>
> -	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
> +	rc = led_blink_set(led_cdev, &led_cdev->blink_delay_on,
>   		      &led_cdev->blink_delay_off);
> +	if (rc)
> +		goto err_out_delayoff;
>   	led_cdev->activated = true;
>
>   	return;
>
> +err_out_delayoff:
> +	device_remove_file(led_cdev->dev, &dev_attr_delay_off);
>   err_out_delayon:
>   	device_remove_file(led_cdev->dev, &dev_attr_delay_on);
>   }
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index b122eea..d3c6c2e 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -48,6 +48,10 @@ struct led_classdev {
>   #define SET_BRIGHTNESS_ASYNC	(1 << 21)
>   #define SET_BRIGHTNESS_SYNC	(1 << 22)
>   #define LED_DEV_CAP_FLASH	(1 << 23)
> +#define LED_BRIGHTNESS_FAST	(1 << 24)
> +
> +/* safe period value for slow leds is 10mS */
> +#define LED_SLOW_MIN_PERIOD 10
>
>   	/* Set LED brightness level */
>   	/* Must not sleep, use a workqueue if needed */
> @@ -127,8 +131,10 @@ extern void led_classdev_resume(struct led_classdev *led_cdev);
>    * Note that if software blinking is active, simply calling
>    * led_cdev->brightness_set() will not stop the blinking,
>    * use led_classdev_brightness_set() instead.
> + *
> + * Returns: 0 on success or negative error value on failure
>    */
> -extern void led_blink_set(struct led_classdev *led_cdev,
> +extern int led_blink_set(struct led_classdev *led_cdev,
>   			  unsigned long *delay_on,
>   			  unsigned long *delay_off);
>   /**
> @@ -144,8 +150,10 @@ extern void led_blink_set(struct led_classdev *led_cdev,
>    *
>    * If invert is set, led blinks for delay_off first, then for
>    * delay_on and leave the led on after the on-off cycle.
> + *
> + * Returns: 0 on success or negative error value on failure
>    */
> -extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
> +extern int led_blink_set_oneshot(struct led_classdev *led_cdev,
>   				  unsigned long *delay_on,
>   				  unsigned long *delay_off,
>   				  int invert);
>


-- 
Best Regards,
Jacek Anaszewski
