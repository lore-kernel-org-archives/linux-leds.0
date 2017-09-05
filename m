From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] media: leds: as3645a: add V4L2_FLASH_LED_CLASS
 depdendency
Date: Tue, 5 Sep 2017 21:24:10 +0200
Message-ID: <ffbecf66-df9d-d8cf-8820-a119c76d8145@gmail.com>
References: <20170905071345.3807685-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:36106 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752300AbdIETZB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Sep 2017 15:25:01 -0400
In-Reply-To: <20170905071345.3807685-1-arnd@arndb.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Arnd,

Thanks for the patch.

On 09/05/2017 09:13 AM, Arnd Bergmann wrote:
> We get a link error when V4L2_FLASH_LED_CLASS=m and AS3645A is built-in:
> 
> drivers/leds/leds-as3645a.o: In function `as3645a_v4l2_setup':
> leds-as3645a.c:(.text+0x258): undefined reference to `v4l2_flash_init'
> leds-as3645a.c:(.text+0x284): undefined reference to `v4l2_flash_indicator_init'
> leds-as3645a.c:(.text+0x2a4): undefined reference to `v4l2_flash_release'
> drivers/leds/leds-as3645a.o: In function `as3645a_remove':
> leds-as3645a.c:(.text+0x784): undefined reference to `v4l2_flash_release'
> 
> This adds the same Kconfig dependency that the other V4L2 flash
> drivers in drivers/leds use, to avoid that broken configuration.
> 
> Fixes: a56ba8fbcb55 ("media: leds: as3645a: Add LED flash class driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/leds/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> The patch that caused the problem is currently in the v4l git tree,
> rather than the leds tree. Please merge this through an appropriate
> path, either v4l or led, depending on the timing.
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 0bf022bcb6ac..52ea34e337cd 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -61,6 +61,7 @@ config LEDS_AAT1290
>  config LEDS_AS3645A
>  	tristate "AS3645A LED flash controller support"
>  	depends on I2C && LEDS_CLASS_FLASH
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
>  	help
>  	  Enable LED flash class support for AS3645A LED flash
>  	  controller. V4L2 flash API is provided as well if
> 

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
