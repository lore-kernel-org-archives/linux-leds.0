From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH V2] leds: s3c24xx: Fix build failure
Date: Thu, 2 Jan 2014 22:19:38 -0800
Message-ID: <CAK5ve-K0aCVTo+21G47M0aYT8f-vkqLAd9etWxSY+ieib8KfMQ@mail.gmail.com>
References: <1388394595-1347-1-git-send-email-tushar.behera@linaro.org> <1388726757-7387-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1388726757-7387-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>
List-Id: linux-leds@vger.kernel.org

On Thu, Jan 2, 2014 at 9:25 PM, Tushar Behera <tushar.behera@linaro.org=
> wrote:
> Commit c67d0f29262b ("ARM: s3c24xx: get rid of custom <mach/gpio.h>")
> removed the usage of mach/gpio.h file, but we need to include
> plat/gpio-cfg.h to avoid following build error.
>
> Fixes following build error.
> drivers/leds/leds-s3c24xx.c: In function =91s3c24xx_led_probe=92:
> drivers/leds/leds-s3c24xx.c:100:2: error: implicit declaration of
> function =91s3c_gpio_setpull=92 [-Werror=3Dimplicit-function-declarat=
ion]
>

I think this patch should go with Linus's patchset.

-Bryan

> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> Changes for V2:
> * Updated commit message
>
> Bryan,
>
> I should have been more explicit regarding this patch. This patch fix=
es
> build error on linux-next after the above patch was merged.
>
> Tested at next-20131224.
>
>  drivers/leds/leds-s3c24xx.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.=
c
> index 76483fb..87cf215 100644
> --- a/drivers/leds/leds-s3c24xx.c
> +++ b/drivers/leds/leds-s3c24xx.c
> @@ -21,6 +21,7 @@
>
>  #include <mach/hardware.h>
>  #include <mach/regs-gpio.h>
> +#include <plat/gpio-cfg.h>
>  #include <linux/platform_data/leds-s3c24xx.h>
>
>  /* our context */
> --
> 1.7.9.5
>
