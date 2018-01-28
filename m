From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] leds: Clarify supported chips by LM355x driver
Date: Sun, 28 Jan 2018 16:18:54 +0200
Message-ID: <1517149134.7000.1284.camel@linux.intel.com>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
         <20180126102507.GA13775@amd> <20180126213238.GA10985@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga18.intel.com ([134.134.136.126]:63140 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751699AbeA1O22 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 28 Jan 2018 09:28:28 -0500
In-Reply-To: <20180126213238.GA10985@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, sakari.ailus@iki.fi

On Fri, 2018-01-26 at 22:32 +0100, Pavel Machek wrote:
> On Fri 2018-01-26 11:25:07, Pavel Machek wrote:

> Actually, what about this?

Works for me:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Though one typo below.

> 
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 318a28f..2acf864 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -69,7 +69,7 @@ config LEDS_APU
>  	  module will be called leds-apu.
>  
>  config LEDS_AS3645A
> -	tristate "AS3645A LED flash controller support"
> +	tristate "AS3645A and LM3555 LED flash controller support"

controller -> controllers

>  	depends on I2C && LEDS_CLASS_FLASH
>  	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
>  	help
> @@ -587,12 +587,12 @@ config LEDS_MAX8997
>  	  MAXIM MAX8997 PMIC.
>  
>  config LEDS_LM355x
> -	tristate "LED support for LM355x Chips, LM3554 and LM3556"
> +	tristate "LED support for LM3554 and LM3556 chips"
>  	depends on LEDS_CLASS && I2C
>  	select REGMAP_I2C
>  	help
> -	  This option enables support for LEDs connected to LM355x.
> -	  LM355x includes Torch, Flash and Indicator functions.
> +	  This option enables support for LEDs connected to LM3554
> +	  and lM3556. It includes Torch, Flash and Indicator
> functions.
>  
>  config LEDS_OT200
>  	tristate "LED support for the Bachmann OT200"
> 
> 
> 
> 
> 
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
