From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: core: avoid error message when a USB LED device is
 unplugged
Date: Fri, 22 Jan 2016 09:45:32 +0100
Message-ID: <56A1EC2C.6050808@samsung.com>
References: <569E9F98.3070802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39765 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751599AbcAVIpf (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 Jan 2016 03:45:35 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1C00FFIIZXJ800@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 22 Jan 2016 08:45:33 +0000 (GMT)
In-reply-to: <569E9F98.3070802@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

Hi Heiner,

Could you rebase this patch on the top of devel branch
of LED git, please?

I am getting an error while applying it:

error: short SHA1 19e1e60 is ambiguous.
fatal: sha1 information is lacking or useless (drivers/leds/led-core.c).
Repository lacks necessary blobs to fall back on 3-way merge.

It may have happened that you had some patches that are not in mainline
kernel in the repository you produced the patch from. It is also
possible that this is an issue with the git version I am using, so this
would clarify the situation.

Thanks in advance.

Best Regards,
Jacek Anaszewski

On 01/19/2016 09:42 PM, Heiner Kallweit wrote:
> When a USB LED device is unplugged the remove call chain calls
> led_classdev_unregister which tries to switch the LED off.
> As the device has been removed already this results in a ENODEV
> error message in dmesg.
> Avoid this error message by ignoring ENODEV in calls from
> led_classdev_unregister if the LED device is flagged as pluggable.
>
> Therefore a new flag LED_HW_PLUGGABLE was introduced which should be set by
> all LED drivers handling pluggable LED devices (mainly USB LED devices).
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/leds/led-class.c | 2 ++
>   drivers/leds/led-core.c  | 5 ++++-
>   include/linux/leds.h     | 2 ++
>   3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 14139c3..aa84e5b 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -245,6 +245,8 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
>   	up_write(&led_cdev->trigger_lock);
>   #endif
>
> +	led_cdev->flags |= LED_UNREGISTERING;
> +
>   	/* Stop blinking */
>   	led_stop_software_blink(led_cdev);
>
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 19e1e60..ad684b6 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -98,7 +98,10 @@ static void set_brightness_delayed(struct work_struct *ws)
>   						led_cdev->delayed_set_value);
>   	else
>   		ret = -ENOTSUPP;
> -	if (ret < 0)
> +	if (ret < 0 &&
> +	    /* LED HW might have been unplugged, therefore don't warn */
> +	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
> +	    (led_cdev->flags & LED_HW_PLUGGABLE)))
>   		dev_err(led_cdev->dev,
>   			"Setting an LED's brightness failed (%d)\n", ret);
>   }
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 4429887..24413a8 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -39,6 +39,7 @@ struct led_classdev {
>
>   	/* Lower 16 bits reflect status */
>   #define LED_SUSPENDED		(1 << 0)
> +#define LED_UNREGISTERING	(1 << 1)
>   	/* Upper 16 bits reflect control information */
>   #define LED_CORE_SUSPENDRESUME	(1 << 16)
>   #define LED_BLINK_ONESHOT	(1 << 17)
> @@ -48,6 +49,7 @@ struct led_classdev {
>   #define LED_BLINK_DISABLE	(1 << 21)
>   #define LED_SYSFS_DISABLE	(1 << 22)
>   #define LED_DEV_CAP_FLASH	(1 << 23)
> +#define LED_HW_PLUGGABLE	(1 << 24)
>
>   	/* Set LED brightness level */
>   	/* Must not sleep. If no non-blocking version can be provided
>
