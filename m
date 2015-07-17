From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH/RFC 12/51] leds: lm3533: Remove work queue
Date: Fri, 17 Jul 2015 11:20:26 +0200
Message-ID: <20150717092026.GA28850@localhost>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
 <1437122857-6765-13-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:33611 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932309AbbGQJUa (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 05:20:30 -0400
Content-Disposition: inline
In-Reply-To: <1437122857-6765-13-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Johan Hovold <johan@kernel.org>

On Fri, Jul 17, 2015 at 10:46:58AM +0200, Jacek Anaszewski wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> Now the core implements the work queue, remove it from the driver.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Johan Hovold <johan@kernel.org>
> ---
>  drivers/leds/leds-lm3533.c |   30 ++++++------------------------
>  1 file changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> index 6e2e020..52496d8 100644
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c
> @@ -17,7 +17,6 @@
 
> @@ -123,27 +119,17 @@ out:
>  	return ret;
>  }
>  
> -static void lm3533_led_work(struct work_struct *work)
> -{
> -	struct lm3533_led *led = container_of(work, struct lm3533_led, work);
> -
> -	dev_dbg(led->cdev.dev, "%s - %u\n", __func__, led->new_brightness);
> -
> -	if (led->new_brightness == 0)
> -		lm3533_led_pattern_enable(led, 0);	/* disable blink */
> -
> -	lm3533_ctrlbank_set_brightness(&led->cb, led->new_brightness);
> -}
> -
>  static void lm3533_led_set(struct led_classdev *cdev,
> -						enum led_brightness value)
> +			   enum led_brightness value)

Unrelated random white-space change.

>  {
>  	struct lm3533_led *led = to_lm3533_led(cdev);
>  
> -	dev_dbg(led->cdev.dev, "%s - %d\n", __func__, value);
> +	dev_dbg(led->cdev.dev, "%s - %u\n", __func__, value);

Also an unrelated change.

> +
> +	if (value == 0)
> +		lm3533_led_pattern_enable(led, 0);	/* disable blink */
>  
> -	led->new_brightness = value;
> -	schedule_work(&led->work);
> +	lm3533_ctrlbank_set_brightness(&led->cb, value);
>  }

Johan
