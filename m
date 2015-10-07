From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: triggers: add invert to heartbeat
Date: Wed, 07 Oct 2015 15:32:02 +0200
Message-ID: <56151ED2.5020300@samsung.com>
References: <d59e47a523eb7e21f3986f316569cd48810bdc35.1444209737.git.jiri.prchal@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:13431 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751535AbbJGNcG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 7 Oct 2015 09:32:06 -0400
In-reply-to: <d59e47a523eb7e21f3986f316569cd48810bdc35.1444209737.git.jiri.prchal@aksignal.cz>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, cooloney@gmail.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org

Hi Jiri,

Thanks for the patch. It's nice in general, but please see my
comments below.

On 10/07/2015 11:31 AM, Jiri Prchal wrote:
> This patcht adds possibility to invert heartbeat blinking. The inverted LED is
> more time ON then OFF.
> It's because it looks better when the heartbeat LED is next to other LED which
> is most time ON.
> The invert value is exported same way via sysfs in file invert like oneshot. I
> get inspiration from this trigger.

Please adjust commit message so as it wouldn't exceed 75 characters line
length limit. scripts/checkpatch.pl is useful for  catching this kind of
problems.

> Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
> ---
>   drivers/leds/trigger/ledtrig-heartbeat.c | 49 ++++++++++++++++++++++++++++++--
>   1 file changed, 47 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
> index fea6871..c09c30b 100644
> --- a/drivers/leds/trigger/ledtrig-heartbeat.c
> +++ b/drivers/leds/trigger/ledtrig-heartbeat.c
> @@ -27,6 +27,7 @@ struct heartbeat_trig_data {
>   	unsigned int phase;
>   	unsigned int period;
>   	struct timer_list timer;
> +	unsigned int invert;
>   };
>
>   static void led_heartbeat_function(unsigned long data)
> @@ -56,21 +57,27 @@ static void led_heartbeat_function(unsigned long data)
>   			msecs_to_jiffies(heartbeat_data->period);
>   		delay = msecs_to_jiffies(70);
>   		heartbeat_data->phase++;
> -		brightness = led_cdev->max_brightness;
> +		if (!heartbeat_data->invert)
> +			brightness = led_cdev->max_brightness;
>   		break;
>   	case 1:
>   		delay = heartbeat_data->period / 4 - msecs_to_jiffies(70);
>   		heartbeat_data->phase++;
> +		if (heartbeat_data->invert)
> +			brightness = led_cdev->max_brightness;

As you are at it, could you change, in a separate patch,
led_cdev->max_brightness to led_cdev->brightness? I think there is no
reason for which we shouldn't allow other values than max.

>   		break;
>   	case 2:
>   		delay = msecs_to_jiffies(70);
>   		heartbeat_data->phase++;
> -		brightness = led_cdev->max_brightness;
> +		if (!heartbeat_data->invert)
> +			brightness = led_cdev->max_brightness;
>   		break;
>   	default:
>   		delay = heartbeat_data->period - heartbeat_data->period / 4 -
>   			msecs_to_jiffies(70);
>   		heartbeat_data->phase = 0;
> +		if (heartbeat_data->invert)
> +			brightness = led_cdev->max_brightness;
>   		break;
>   	}
>
> @@ -78,15 +85,50 @@ static void led_heartbeat_function(unsigned long data)
>   	mod_timer(&heartbeat_data->timer, jiffies + delay);
>   }
>
> +static ssize_t led_invert_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct heartbeat_trig_data *heartbeat_data = led_cdev->trigger_data;
> +
> +	return sprintf(buf, "%u\n", heartbeat_data->invert);
> +}
> +
> +static ssize_t led_invert_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t size)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct heartbeat_trig_data *heartbeat_data = led_cdev->trigger_data;
> +	unsigned long state;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &state);
> +	if (ret)
> +		return ret;
> +
> +	heartbeat_data->invert = !!state;
> +
> +	return size;
> +}
> +
> +static DEVICE_ATTR(invert, 0644, led_invert_show, led_invert_store);
> +
>   static void heartbeat_trig_activate(struct led_classdev *led_cdev)
>   {
>   	struct heartbeat_trig_data *heartbeat_data;
> +	int rc;
>
>   	heartbeat_data = kzalloc(sizeof(*heartbeat_data), GFP_KERNEL);
>   	if (!heartbeat_data)
>   		return;
>
>   	led_cdev->trigger_data = heartbeat_data;
> +	rc = device_create_file(led_cdev->dev, &dev_attr_invert);
> +	if (rc) {
> +		kfree(led_cdev->trigger_data);
> +		return;
> +	}
> +
>   	setup_timer(&heartbeat_data->timer,
>   		    led_heartbeat_function, (unsigned long) led_cdev);
>   	heartbeat_data->phase = 0;
> @@ -100,9 +142,12 @@ static void heartbeat_trig_deactivate(struct led_classdev *led_cdev)
>
>   	if (led_cdev->activated) {
>   		del_timer_sync(&heartbeat_data->timer);
> +		device_remove_file(led_cdev->dev, &dev_attr_invert);
>   		kfree(heartbeat_data);
>   		led_cdev->activated = false;
>   	}
> +
> +	led_set_brightness(led_cdev, LED_OFF);

I believe this is a fix. Could you split it into a separate patch
and explain its merit?

>   }
>
>   static struct led_trigger heartbeat_led_trigger = {
>


-- 
Best Regards,
Jacek Anaszewski
