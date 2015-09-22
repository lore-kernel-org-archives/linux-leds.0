From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/5] leds: Rename brightness_set_sync op to
 brightness_set_blocking
Date: Tue, 22 Sep 2015 20:54:26 +0200
Message-ID: <20150922185426.GC20029@lunn.ch>
References: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
 <1442400464-27367-4-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:41613 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759436AbbIVTCe (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 22 Sep 2015 15:02:34 -0400
Content-Disposition: inline
In-Reply-To: <1442400464-27367-4-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, stsp@users.sourceforge.net, pavel@ucw.cz, ospite@studenti.unina.it, davem@davemloft.net, linus.walleij@linaro.org, ricardo.ribalda@gmail.com, p.meerwald@bct-electronic.com

On Wed, Sep 16, 2015 at 12:47:42PM +0200, Jacek Anaszewski wrote:
> The initial purpose of brightness_set_sync op, introduced along with
> the LED flash class extension, was to add a means for setting torch LED
> brightness as soon as possible, which couldn't have been guaranteed by
> brightness_set op. This patch renames the op to brightness_set_blocking,
> which describes its purpose in a more generic way, and is beneficial
> in view of the prospective changes in the core related to using
> LED core's set_brightness_work for setting brightness for LED class
> drivers that can sleep or use delays while setting brightness.

...

> -	/*
> -	 * Set LED brightness level immediately - it can block the caller for
> -	 * the time required for accessing a LED device register.
> -	 */
> -	int		(*brightness_set_sync)(struct led_classdev *led_cdev,
> -					enum led_brightness brightness);
> +	/* Can sleep or use delays */
> +	int (*brightness_set_blocking)(struct led_classdev *led_cdev,

I'm no expert when it comes to flash photography with digital
cameras. But to me the old comment seems better. Doesn't the caller
want to know the flash is now giving out light? The new comment gives
no indication of this, where as the old one does?

   Andrew


>  	/* Get LED brightness level */
>  	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
>  
> -- 
> 1.7.9.5
> 
