From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: Allow compile test of LEDS_AAT1290 and LEDS_KTD2692
 if !GPIOLIB
Date: Mon, 06 Jul 2015 17:13:05 +0200
Message-ID: <559A9B01.9080206@samsung.com>
References: <1436190154-11517-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-reply-to: <1436190154-11517-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Geert,

Thanks for the patch.

On 07/06/2015 03:42 PM, Geert Uytterhoeven wrote:
> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
> functionality only, can still be compiled if GPIOLIB is not enabled.
>
> If COMPILE_TEST is enabled, relax the dependency on GPIOLIB for the
> recently introduced symbols LEDS_AAT1290 and LEDS_KTD2692.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   drivers/leds/Kconfig | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 94eced66d877182b..cf0248b8dbb9c023 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -43,7 +43,7 @@ config LEDS_AAT1290
>   	tristate "LED support for the AAT1290"
>   	depends on LEDS_CLASS_FLASH
>   	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> -	depends on GPIOLIB
> +	depends on GPIOLIB || COMPILE_TEST
>   	depends on OF
>   	depends on PINCTRL
>   	help
> @@ -543,7 +543,8 @@ config LEDS_MENF21BMC
>
>   config LEDS_KTD2692
>   	tristate "LED support for KTD2692 flash LED controller"
> -	depends on LEDS_CLASS_FLASH && GPIOLIB && OF
> +	depends on LEDS_CLASS_FLASH && OF
> +	depends on GPIOLIB || COMPILE_TEST
>   	help
>   	  This option enables support for KTD2692 LED flash connected
>   	  through ExpressWire interface.
>

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
