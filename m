From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds/leds-pwm: Display error code on request_pwm failure
Date: Mon, 16 Dec 2013 17:26:11 -0800
Message-ID: <CAK5ve-L77knnYe8vfRByNgT6cE=7WozvCGbvfXVCWMAfcFYqYQ@mail.gmail.com>
References: <1387238932-18982-1-git-send-email-bgamari.foss@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:41112 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751019Ab3LQB0d (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Dec 2013 20:26:33 -0500
Received: by mail-la0-f48.google.com with SMTP id n7so2936745lam.7
        for <linux-leds@vger.kernel.org>; Mon, 16 Dec 2013 17:26:32 -0800 (PST)
In-Reply-To: <1387238932-18982-1-git-send-email-bgamari.foss@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ben Gamari <bgamari.foss@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Mon, Dec 16, 2013 at 4:08 PM, Ben Gamari <bgamari.foss@gmail.com> wrote:
> This can be useful in debugging devicetrees.
>

OK, I will merge this.

Thanks,
-Bryan

> Signed-off-by: Ben Gamari <bgamari.foss@gmail.com>
> ---
>  drivers/leds/leds-pwm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index b31d8e9..707a82a 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -165,8 +165,8 @@ static int led_pwm_probe(struct platform_device *pdev)
>                         if (IS_ERR(led_dat->pwm)) {
>                                 ret = PTR_ERR(led_dat->pwm);
>                                 dev_err(&pdev->dev,
> -                                       "unable to request PWM for %s\n",
> -                                       cur_led->name);
> +                                       "unable to request PWM for %s: error=%d\n",
> +                                       cur_led->name, ret);
>                                 goto err;
>                         }
>
> --
> 1.8.3.2
>
