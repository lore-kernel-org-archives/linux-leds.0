From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC v6 02/36] leds: Add led_set_brightness_sync to the
 public LED subsystem API
Date: Thu, 20 Aug 2015 17:43:27 +0200
Message-ID: <20150820154327.GE27457@lunn.ch>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
 <1440081846-11697-3-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:37099 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751510AbbHTPus (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 20 Aug 2015 11:50:48 -0400
Content-Disposition: inline
In-Reply-To: <1440081846-11697-3-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>

On Thu, Aug 20, 2015 at 04:43:32PM +0200, Jacek Anaszewski wrote:
> led_set_brightness_sync function was visible only internally to the
> LED subsystem. It is now being made publicly available since it has
> become apparent that this is a caller who should decide whether
> brightness is to be set in a synchronous or an asynchronous way.
> 
> The function is modified to use brightness_set_blocking or
> brightness_set op, depending on which of them is implemented, in case
> brightness_set_sync op wasn't been provided.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Stas Sergeev <stsp@users.sourceforge.net>
> ---
>  drivers/leds/led-core.c |   25 +++++++++++++++++++++++++
>  drivers/leds/leds.h     |   13 -------------
>  include/linux/leds.h    |   15 +++++++++++++++
>  3 files changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 549de7e..3f3b71d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -141,6 +141,31 @@ void led_set_brightness(struct led_classdev *led_cdev,
>  }
>  EXPORT_SYMBOL(led_set_brightness);
>  
> +int led_set_brightness_sync(struct led_classdev *led_cdev,
> +			    enum led_brightness value)
> +{
> +	int ret = 0;
> +
> +	led_cdev->brightness = min(value, led_cdev->max_brightness);
> +
> +	if (led_cdev->flags & LED_SUSPENDED)
> +		return 0;
> +
> +	if (led_cdev->brightness_set_sync)
> +		ret = led_cdev->brightness_set_sync(led_cdev,
> +							led_cdev->brightness);
> +	else if (led_cdev->brightness_set_blocking)
> +		led_cdev->brightness_set_blocking(led_cdev,
> +							led_cdev->brightness);
> +	else if (led_cdev->brightness_set)
> +		led_cdev->brightness_set(led_cdev, led_cdev->brightness);

I don't see how this can be correct, when you say:

> +/**
> + * led_set_brightness_sync - set LED brightness synchronously
> + * @led_cdev: the LED to set
> + * @brightness: the brightness to set it to
> + *
> + * Set an LED's brightness immediately. This function will block
> + * the caller for the time required for accessing device register,
> + * and it can sleep.

led_cdev->brightness_set_sync() is fine, it is defined to the
synchronous.

led_cdev->brightness_set_blocking() is O.K.

But led_cdev->brightness_set() only guarantees:

        /* Set LED brightness level */
        /* Must not sleep, use a workqueue if needed */
        void            (*brightness_set)(struct led_classdev *led_cdev,
                                          enum led_brightness brightness);


and it seems like 50% of the current drivers use work queues. It has
never been defined to by synchronous. If brightness_set() is your only
choice, you should return -ENOSUP.

With time, you could review all the drivers and move those that are
synchronous to brightness_set_sync().

 Andrew
