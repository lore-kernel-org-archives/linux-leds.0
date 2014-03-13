From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: clevo-mail: Make probe function __init
Date: Thu, 13 Mar 2014 16:16:02 -0700
Message-ID: <CAK5ve-KjqJfPf+b2vTYzvfPhDKUHqRy_VeypUTt1Y5MOB0yAtA@mail.gmail.com>
References: <20140313185624.4eb87d4f@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:48087 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755006AbaCMXQX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 13 Mar 2014 19:16:23 -0400
Received: by mail-la0-f45.google.com with SMTP id hr17so1198569lab.4
        for <linux-leds@vger.kernel.org>; Thu, 13 Mar 2014 16:16:22 -0700 (PDT)
In-Reply-To: <20140313185624.4eb87d4f@endymion.delvare>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

On Thu, Mar 13, 2014 at 10:56 AM, Jean Delvare <jdelvare@suse.de> wrote:
> One of the benefits of platform_driver_probe() is that you can make
> the probe function __init.
>

Thanks, merged.
-Bryan

> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---
> Build tested only, no hardware.
>
>  drivers/leds/leds-clevo-mail.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> --- linux-3.14-rc6.orig/drivers/leds/leds-clevo-mail.c  2014-01-20 03:40:07.000000000 +0100
> +++ linux-3.14-rc6/drivers/leds/leds-clevo-mail.c       2014-03-13 18:29:24.597849128 +0100
> @@ -153,7 +153,7 @@ static struct led_classdev clevo_mail_le
>         .flags                  = LED_CORE_SUSPENDRESUME,
>  };
>
> -static int clevo_mail_led_probe(struct platform_device *pdev)
> +static int __init clevo_mail_led_probe(struct platform_device *pdev)
>  {
>         return led_classdev_register(&pdev->dev, &clevo_mail_led);
>  }
> @@ -165,7 +165,6 @@ static int clevo_mail_led_remove(struct
>  }
>
>  static struct platform_driver clevo_mail_led_driver = {
> -       .probe          = clevo_mail_led_probe,
>         .remove         = clevo_mail_led_remove,
>         .driver         = {
>                 .name           = KBUILD_MODNAME,
>
>
> --
> Jean Delvare
> SUSE L3 Support
