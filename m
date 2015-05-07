From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 3/3] leds: leds-gpio: Allow compile test if !GPIOLIB
Date: Thu, 07 May 2015 14:15:27 +0200
Message-ID: <554B575F.7090101@samsung.com>
References: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
 <1430986090-7243-4-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430986090-7243-4-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 05/07/2015 10:08 AM, Geert Uytterhoeven wrote:
> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
> functionality only, can still be compiled if GPIOLIB is not enabled.
>
> Relax the dependency of LEDS_GPIO on GPIOLIB if COMPILE_TEST is
> enabled.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> This could be folded in "[PATCH 09/27] leds: Allow compile test of GPIO
> consumers if !GPIOLIB" once its dependencies are satisfied.
> ---
>   drivers/leds/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 8161cddc3f8d597a..1f6cb38335b52c3c 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -182,7 +182,7 @@ config LEDS_PCA9532_GPIO
>   config LEDS_GPIO
>   	tristate "LED Support for GPIO connected LEDs"
>   	depends on LEDS_CLASS
> -	depends on GPIOLIB
> +	depends on GPIOLIB || COMPILE_TEST
>   	help
>   	  This option enables support for the LEDs connected to GPIO
>   	  outputs. To be useful the particular board must have LEDs
>

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
