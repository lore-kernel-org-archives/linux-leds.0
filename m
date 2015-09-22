From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 4/5] leds: core: Add an internal
 led_set_brightness_nosleep function
Date: Tue, 22 Sep 2015 21:02:43 +0200
Message-ID: <20150922190243.GD20029@lunn.ch>
References: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
 <1442400464-27367-5-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442400464-27367-5-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, stsp@users.sourceforge.net, pavel@ucw.cz, ospite@studenti.unina.it, davem@davemloft.net, linus.walleij@linaro.org, ricardo.ribalda@gmail.com, p.meerwald@bct-electronic.com
List-Id: linux-leds@vger.kernel.org

> +void led_set_brightness_nosleep(struct led_classdev *led_cdev,
> +					enum led_brightness value)
> +{
> +	led_cdev->brightness = min(value, led_cdev->max_brightness);
> +
> +	if (led_cdev->flags & LED_SUSPENDED)
> +		return;
> +
> +	/* Use brightness_set op if available, it is guaranteed not to sleep */
> +	if (led_cdev->brightness_set)
> +		led_cdev->brightness_set(led_cdev, led_cdev->brightness);
> +
> +	/* If brightness setting can sleep, delegate it to a work queue task */
> +	led_cdev->delayed_set_value = led_cdev->brightness;
> +	schedule_work(&led_cdev->set_brightness_work);
> +}

To me, it looks like there is a missing else, or return here. We don't
want both led_cdev->brightness_set() and the work queue.


> +EXPORT_SYMBOL(led_set_brightness_nosleep);

There seems to be a mixture of EXPORT_SYMBOL and
EXPORT_SYMBOL_GPL. Have you figured out the pattern? led-class.c seems
to be all _GPL, but led-core.c has a mixture.

   Andrew
