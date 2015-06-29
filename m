From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: fix max77693-led build errors
Date: Mon, 29 Jun 2015 10:09:53 -0700
Message-ID: <CAK5ve-KL985j1L_BWkjKEm+XtVYXaugqowLEELHybSwZX2kpYA@mail.gmail.com>
References: <1435589123-23545-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:36468 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752352AbbF2RKN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jun 2015 13:10:13 -0400
Received: by ykdr198 with SMTP id r198so120430376ykd.3
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2015 10:10:12 -0700 (PDT)
In-Reply-To: <1435589123-23545-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

On Mon, Jun 29, 2015 at 7:45 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Fix build errors when LEDS_MAX77693=y and V4L2_FLASH_LED_CLASS=m
> by restricting LEDS_MAX77693 to =m if V4L2_FLASH_LED_CLASS=m.
>
> drivers/leds/leds-max77693.c:1062: undefined reference to `v4l2_flash_release'
> drivers/leds/leds-max77693.c:1068: undefined reference to `v4l2_flash_release'
> drivers/built-in.o: In function `max77693_register_led':
> drivers/leds/leds-max77693.c:968: undefined reference to `v4l2_flash_init'
> drivers/built-in.o: In function `max77693_led_probe':
> drivers/leds/leds-max77693.c:1048: undefined reference to `v4l2_flash_release'
>

Merged, thanks,
-Bryan

> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---
>  drivers/leds/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a817a13..9ad35f7 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -502,6 +502,7 @@ config LEDS_TLC591XX
>  config LEDS_MAX77693
>         tristate "LED support for MAX77693 Flash"
>         depends on LEDS_CLASS_FLASH
> +       depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
>         depends on MFD_MAX77693
>         depends on OF
>         help
> --
> 1.7.9.5
>
