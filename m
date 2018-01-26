From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v1] leds: Clarify supported chips by LM355x driver
Date: Fri, 26 Jan 2018 21:39:19 +0100
Message-ID: <0bbb47ba-4b4f-263f-a8f3-aad13d7bd753@gmail.com>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:53086 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751729AbeAZUkc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Jan 2018 15:40:32 -0500
Received: by mail-wm0-f66.google.com with SMTP id g1so3619523wmg.2
        for <linux-leds@vger.kernel.org>; Fri, 26 Jan 2018 12:40:31 -0800 (PST)
In-Reply-To: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org

Hi Andy,

Thanks for the patch.

On 01/26/2018 08:38 AM, Andy Shevchenko wrote:
> LM3555 is supported by AS3645A.
> Clarify this in Kconfig by referencing to AS3645A.
> 
> No functional change.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 3e763d2a0cb3..0961882fa57f 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -601,6 +601,8 @@ config LEDS_LM355x
>  	  This option enables support for LEDs connected to LM355x.
>  	  LM355x includes Torch, Flash and Indicator functions.
>  
> +	  Note, LM3555 is driven by AS3645A.

Could you please provide more details on this relationship?
Looking at the datasheet it seems that both chips are standalone
and controlled via I2C and/or via GPIO in case of LM3555.

>  config LEDS_OT200
>  	tristate "LED support for the Bachmann OT200"
>  	depends on LEDS_CLASS && HAS_IOMEM && (X86_32 || COMPILE_TEST)
> 

-- 
Best regards,
Jacek Anaszewski
