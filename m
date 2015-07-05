From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH/RFC v3 1/7] leds: Add led_set_brightness_sync to the
 public LED subsystem API
Date: Sun, 5 Jul 2015 14:34:48 +0200
Message-ID: <20150705123448.GB29782@amd>
References: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
 <1435929052-8736-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53297 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826AbbGEMeu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 5 Jul 2015 08:34:50 -0400
Content-Disposition: inline
In-Reply-To: <1435929052-8736-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@

Hi!

>  extern void led_set_brightness(struct led_classdev *led_cdev,
>  			       enum led_brightness brightness);
> +
> +/**
> + * led_set_brightness_sync - set LED brightness synchronously
> + * @led_cdev: the LED to set
> + * @brightness: the brightness to set it to
> + *
> + * Set an LED's brightness immediately. This function will block
> + * the caller for the time required for accessing device register,
> + * and it can sleep.
> + */
> +static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
> +					  enum led_brightness value)
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
> +						    led_cdev->brightness);
> +	else
> +		led_cdev->brightness_set(led_cdev, led_cdev->brightness);
> +
> +	return 0;
> +}

return ret, AFAICT?
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
