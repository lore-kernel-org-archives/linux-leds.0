From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v1] leds: Clarify supported chips by LM355x driver
Date: Sat, 27 Jan 2018 00:07:54 +0200
Message-ID: <20180126220754.5x2eog7ztdcemvc6@valkosipuli.retiisi.org.uk>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
 <20180126102507.GA13775@amd>
 <20180126213238.GA10985@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:44318 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751257AbeAZWH6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Jan 2018 17:07:58 -0500
Content-Disposition: inline
In-Reply-To: <20180126213238.GA10985@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org

Hi Pavel,

On Fri, Jan 26, 2018 at 10:32:39PM +0100, Pavel Machek wrote:
> On Fri 2018-01-26 11:25:07, Pavel Machek wrote:
> > On Fri 2018-01-26 09:38:28, Andy Shevchenko wrote:
> > > LM3555 is supported by AS3645A.
> > > Clarify this in Kconfig by referencing to AS3645A.
> > > 
> > > No functional change.
> > > 
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  drivers/leds/Kconfig | 2 ++
> > >  1 file changed, 2 insertions(+)
> 
> Actually, what about this?
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
> +	  and lM3556. It includes Torch, Flash and Indicator functions.

s/l/L/

>  
>  config LEDS_OT200
>  	tristate "LED support for the Bachmann OT200"

Could you submit a patch to linux-leds, please?

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
