From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 2/5] Documentation: leds: Add description of brightness
 setting API
Date: Tue, 22 Sep 2015 13:26:08 +0300
Message-ID: <56012CC0.3030405@linux.intel.com>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
 <1442845770-17800-3-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:53750 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757755AbbIVK0L (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 22 Sep 2015 06:26:11 -0400
In-Reply-To: <1442845770-17800-3-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andrew@lunn.ch

Hi Jacek,

Jacek Anaszewski wrote:
> This patch adds description of the LED subsystem API for
> setting an LED brightness.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> ---
>  Documentation/leds/leds-class.txt |   21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
> index 62261c0..2cc38fa 100644
> --- a/Documentation/leds/leds-class.txt
> +++ b/Documentation/leds/leds-class.txt
> @@ -52,6 +52,27 @@ above leaves scope for further attributes should they be needed. If sections
>  of the name don't apply, just leave that section blank.
>  
>  
> +Brightness setting API
> +======================
> +
> +LED subsystem core exposes following API for setting brightness:
> +
> +    - led_set_brightness : if necessary, cancels the software blink timer that
> +		implements blinking when the hardware doesn't; it is guaranteed
> +		not to sleep, which implies the possibility of delegating the
> +		job to a work queue task (uses led_set_brightness_nosleep
> +		underneath - see below),
> +    - led_set_brightness_sync : for use cases when immediate effect is desired;
> +		it can block the caller for the time required for accessing
> +		device registers and can sleep,
> +    - led_set_brightness_nosleep : sets an LEDs brightness using either
> +		brightness_set op, which is guaranteed not to sleep, or, if only
> +		brightness_set_blocking op is available, delegates it to a work
> +		queue task; this API is inteded for use by LED core and
> +		led-triggers, as they can be called from atomic context, and thus
> +		cannot sleep.

led_set_brightness_nosleep() isn't part of the API intended to be used
outside the LED framework --- I wouldn't document it here, only the part
relevant for users outside the LED class and triggers frameworks.

> +
> +
>  Hardware accelerated blink of LEDs
>  ==================================
>  
> 


-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
