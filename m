From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] leds: Clarify supported chips by LM355x driver
Date: Thu, 1 Feb 2018 22:33:19 +0100
Message-ID: <a853ff7d-fccc-cb4a-3241-2e260137490b@gmail.com>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
 <0bbb47ba-4b4f-263f-a8f3-aad13d7bd753@gmail.com>
 <1517149809.7000.1288.camel@linux.intel.com>
 <5968dfb2-8bf9-917f-4299-47bf1cd97124@gmail.com>
 <1517310500.7000.1319.camel@linux.intel.com>
 <15971fbb-2c6d-5c15-d5d7-1718af904ebb@gmail.com> <20180201202634.GA29617@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:41020 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751715AbeBAVec (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Feb 2018 16:34:32 -0500
Received: by mail-wr0-f194.google.com with SMTP id v15so20569805wrb.8
        for <linux-leds@vger.kernel.org>; Thu, 01 Feb 2018 13:34:31 -0800 (PST)
In-Reply-To: <20180201202634.GA29617@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>

Hi Pavel,

Thanks for the update.

On 02/01/2018 09:26 PM, Pavel Machek wrote:
> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Clarify which controllers are supported by which driver.
> 
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 318a28f..9a538de 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -69,7 +69,7 @@ config LEDS_APU
>  	  module will be called leds-apu.
>  
>  config LEDS_AS3645A
> -	tristate "AS3645A LED flash controller support"
> +	tristate "AS3645A and LM3555 LED flash controllers support"
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
> +	  and LM3556. It includes Torch, Flash and Indicator functions.
>  
>  config LEDS_OT200
>  	tristate "LED support for the Bachmann OT200"
> 

Applied to the for-4.17 branch.

-- 
Best regards,
Jacek Anaszewski
