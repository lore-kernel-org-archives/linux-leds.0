From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/2] leds: pwm: Remove redundant of_match_ptr
Date: Wed, 2 Oct 2013 14:13:10 -0700
Message-ID: <CAK5ve-LyHTwxXpD283u6NJBPCp7AGob5QPzKed1ro6VUouLTYg@mail.gmail.com>
References: <1380368311-27529-1-git-send-email-sachin.kamat@linaro.org> <1380368311-27529-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:47504 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753385Ab3JBVNb (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2013 17:13:31 -0400
Received: by mail-lb0-f176.google.com with SMTP id y6so1241752lbh.7
        for <linux-leds@vger.kernel.org>; Wed, 02 Oct 2013 14:13:30 -0700 (PDT)
In-Reply-To: <1380368311-27529-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

On Sat, Sep 28, 2013 at 4:38 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> The data structure of_match_ptr() protects is always compiled in.
> Hence of_match_ptr() is not needed.
>

Also applied, thanks,
-Bryan


> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/leds/leds-pwm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index bb6f948..2848171 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -232,7 +232,7 @@ static struct platform_driver led_pwm_driver = {
>         .driver         = {
>                 .name   = "leds_pwm",
>                 .owner  = THIS_MODULE,
> -               .of_match_table = of_match_ptr(of_pwm_leds_match),
> +               .of_match_table = of_pwm_leds_match,
>         },
>  };
>
> --
> 1.7.9.5
>
