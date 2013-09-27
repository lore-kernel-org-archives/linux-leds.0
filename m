From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/6] leds: gpio: Include linux/of.h header
Date: Fri, 27 Sep 2013 09:53:22 -0700
Message-ID: <CAK5ve-J12MJzvwwCYcLNL5uA6c638srsrbg-eweuP+XVv4dDpA@mail.gmail.com>
References: <1380281823-13487-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:54336 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753002Ab3I0Qxq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Sep 2013 12:53:46 -0400
Received: by mail-lb0-f177.google.com with SMTP id w7so2454326lbi.22
        for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2013 09:53:45 -0700 (PDT)
In-Reply-To: <1380281823-13487-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

On Fri, Sep 27, 2013 at 4:36 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> 'of_match_ptr' is defined in linux/of.h. Include it explicitly.
>

Why we need this? I think it is include from of_gpio.h or
of_platform.h. And I tried to build these driver files you patched,
there is no error or warning for this.

Is there any error or warning you met?

Thanks,
-Bryan

> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/leds/leds-gpio.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index e8b01e5..7ccafde 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/gpio.h>
>  #include <linux/leds.h>
> +#include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/of_gpio.h>
>  #include <linux/slab.h>
> --
> 1.7.9.5
>
