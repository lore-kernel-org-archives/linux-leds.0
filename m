From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 06/10] Documentation: leds: Add description of
 brightness setting API
Date: Fri, 16 Oct 2015 18:36:29 +0300
Message-ID: <20151016153629.GM26916@valkosipuli.retiisi.org.uk>
References: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com>
 <1444209048-29415-7-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:40084 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932155AbbJPPgb (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Fri, 16 Oct 2015 11:36:31 -0400
Content-Disposition: inline
In-Reply-To: <1444209048-29415-7-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, sakari.ailus@linux.intel.com, andrew@lunn.ch

Hi Jacek,

On Wed, Oct 07, 2015 at 11:10:44AM +0200, Jacek Anaszewski wrote:
> This patch adds description of the LED subsystem API for
> setting an LED brightness.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> ---
>  Documentation/leds/leds-class.txt |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
> index 62261c0..d406d98 100644
> --- a/Documentation/leds/leds-class.txt
> +++ b/Documentation/leds/leds-class.txt
> @@ -52,6 +52,19 @@ above leaves scope for further attributes should they be needed. If sections
>  of the name don't apply, just leave that section blank.
>  
>  
> +Brightness setting API
> +======================
> +
> +LED subsystem core exposes following API for setting brightness:
> +
> +    - led_set_brightness : it is guaranteed not to sleep, passing LED_OFF stops
> +		blinking,
> +    - led_set_brightness_sync : for use cases when immediate effect is desired -

Over 80 characters per line.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> +		it can block the caller for the time required for accessing
> +		device registers and can sleep, passing LED_OFF stops hardware
> +		blinking, returns -EBUSY if software blink fallback is enabled.
> +
> +
>  Hardware accelerated blink of LEDs
>  ==================================
>  

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
