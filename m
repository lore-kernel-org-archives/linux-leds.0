From: Jacek Anaszewski <j.anaszewski81@gmail.com>
Subject: Re: [PATCH 1/2] leds: use hrtimer for blinking
Date: Fri, 24 Apr 2015 14:52:11 +0200
Message-ID: <20150424145211.07ac2504@ja.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:33089 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751500AbbDXMwU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 24 Apr 2015 08:52:20 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, rpurdie@rpsys.net, cooloney@gmail.com

Hi Stas,

On 22.04.2015 19:06, Stas Sergeev wrote:> 
> Add the following resolutions to led trigger timer:
> 'n' for nanosecond resolution
> 'u' for microsecond resolution
> 'm' for millisecond resolution
> The default is 'm' for backward compatibility.
> 
> This functionality is needed for things like PWM for software
> brightness control, because the default mS resolution is not enough
> for that tasks.
> 
> CC: Bryan Wu <cooloney@gmail.com>
> CC: Richard Purdie <rpurdie@rpsys.net>
> CC: linux-leds@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> 
> Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
> ---
>   drivers/leds/led-class.c             |   18 +++++++++++--
>   drivers/leds/trigger/ledtrig-timer.c |   49
> ++++++++++++++++++++++++++++++++++
> include/linux/leds.h                 |    7 +++++ 3 files changed, 72
> insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index f95ce912..2cfbb9d 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -108,6 +108,7 @@ static enum hrtimer_restart
> led_timer_function(struct hrtimer *timer) struct led_classdev,
> blink_timer); unsigned long brightness;
>   	unsigned long delay;
> +	ktime_t k_delay;
> 
>   	if (!led_cdev->blink_delay_on
> || !led_cdev->blink_delay_off) { led_set_brightness_async(led_cdev,
> LED_OFF); @@ -149,9 +150,22 @@ static enum hrtimer_restart
> led_timer_function(struct hrtimer *timer) }
>   	}
> 
> +	switch (led_cdev->resolution) {
> +	case LED_BLINK_MS:
> +		k_delay = ms_to_ktime(delay);
> +		break;
> +	case LED_BLINK_US:
> +		k_delay = ns_to_ktime(delay * 1000);
> +		break;
> +	case LED_BLINK_NS:
> +		k_delay = ns_to_ktime(delay);
> +		break;
> +	default:
> +		/* should not happen */
> +		return HRTIMER_NORESTART;
> +	}
>   	hrtimer_forward(&led_cdev->blink_timer,
> -			hrtimer_get_expires(&led_cdev->blink_timer),
> -			ms_to_ktime(delay));
> +			hrtimer_get_expires(&led_cdev->blink_timer),
> k_delay); return HRTIMER_RESTART;
>   }
> 
> diff --git a/drivers/leds/trigger/ledtrig-timer.c
> b/drivers/leds/trigger/ledtrig-timer.c index 8d09327..222c755 100644
> --- a/drivers/leds/trigger/ledtrig-timer.c
> +++ b/drivers/leds/trigger/ledtrig-timer.c
> @@ -68,8 +68,51 @@ static ssize_t led_delay_off_store(struct device
> *dev, return size;
>   }
> 
> +static ssize_t led_res_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	const char res_suffix[] = {
> +		[LED_BLINK_MS] = 'm',
> +		[LED_BLINK_US] = 'u',
> +		[LED_BLINK_NS] = 'n',
> +	};
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);

Semantics of sysfs attributes should be self-explanatory.
I propose to rename the attribute to delay_units. Also unit identifiers
could be renamed to milliseconds, microseconds and nanoseconds
respectively. 
Additionally available_delay_units attribute should be added.
The attribute when read shoud return a space separated list of
acceptable delay_units values.

> +	return sprintf(buf, "%c\n",
> res_suffix[led_cdev->resolution]); +}
> +
> +static ssize_t led_res_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf,
> size_t size) +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	int ret = strlen(buf);
> +	/* char and \n */
> +	if (ret != 2)
> +		return -EINVAL;
> +
> +	switch (buf[0]) {
> +	case 'm':
> +		led_cdev->resolution = LED_BLINK_MS;
> +		break;
> +	case 'u':
> +		led_cdev->resolution = LED_BLINK_US;
> +		break;
> +	case 'n':
> +		led_cdev->resolution = LED_BLINK_NS;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
> +		      &led_cdev->blink_delay_off);
> +
> +	return ret;
> +}
> +
>   static DEVICE_ATTR(delay_on, 0644, led_delay_on_show,
> led_delay_on_store); static DEVICE_ATTR(delay_off, 0644,
> led_delay_off_show, led_delay_off_store); +static
> DEVICE_ATTR(resolution, 0644, led_res_show, led_res_store);
> 
>   static void timer_trig_activate(struct led_classdev *led_cdev)
>   {
> @@ -83,6 +126,9 @@ static void timer_trig_activate(struct
> led_classdev *led_cdev) rc = device_create_file(led_cdev->dev,
> &dev_attr_delay_off); if (rc)
>   		goto err_out_delayon;
> +	rc = device_create_file(led_cdev->dev, &dev_attr_resolution);
> +	if (rc)
> +		goto err_out_delayoff;

This attribute should be created only if support for hr timers
is enabled in the kernel config.

>   	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
>   		      &led_cdev->blink_delay_off);
> @@ -90,6 +136,8 @@ static void timer_trig_activate(struct
> led_classdev *led_cdev)
> 
>   	return;
> 
> +err_out_delayoff:
> +	device_remove_file(led_cdev->dev, &dev_attr_delay_off);
>   err_out_delayon:
>   	device_remove_file(led_cdev->dev, &dev_attr_delay_on);
>   }
> @@ -99,6 +147,7 @@ static void timer_trig_deactivate(struct
> led_classdev *led_cdev) if (led_cdev->activated) {
>   		device_remove_file(led_cdev->dev,
> &dev_attr_delay_on); device_remove_file(led_cdev->dev,
> &dev_attr_delay_off);
> +		device_remove_file(led_cdev->dev,
> &dev_attr_resolution); led_cdev->activated = false;
>   	}
> 
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 68f5a23..5e6fe26 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -30,10 +30,17 @@ enum led_brightness {
>   	LED_FULL	= 255,
>   };
> 
> +enum led_blink_resolution {
> +	LED_BLINK_MS,
> +	LED_BLINK_US,
> +	LED_BLINK_NS,
> +};
> +
>   struct led_classdev {
>   	const char		*name;
>   	enum led_brightness	 brightness;
>   	enum led_brightness	 max_brightness;
> +	enum led_blink_resolution resolution;

I'd rename resolution to delay_unit and put it after blink_timer.

Similarly let's rename enum led_blink_resolution to
enum led_blink_delay_unit


>   	int			 flags;
> 
>   	/* Lower 16 bits reflect status */
>

Documentation/leds/leds-class.txt should also be updated in this patch
set.

Please add there information on what CONFIG_* symbols have to be
defined to add support for hr timers.

It would be also nice to have:
- information that not every platform may support hr timers
- description of newly added sysfs attributes
- 

-- 
Best Regards,
Jacek Anaszewski
