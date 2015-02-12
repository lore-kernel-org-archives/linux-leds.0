From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: leds-pwm: drop one pwm_get_period() call
Date: Thu, 12 Feb 2015 11:22:56 -0800
Message-ID: <CAK5ve-Kam0kyCC3w3wssDASoN-YHkqDaMnXJwbVVjj=PHZwfMw@mail.gmail.com>
References: <1423238640-32202-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:38083 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751199AbbBLTXV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Feb 2015 14:23:21 -0500
Received: by iecrd18 with SMTP id rd18so14329441iec.5
        for <linux-leds@vger.kernel.org>; Thu, 12 Feb 2015 11:23:21 -0800 (PST)
In-Reply-To: <1423238640-32202-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Fri, Feb 6, 2015 at 8:04 AM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> pwm_get_period() is called twice in case the child parameter is set. I
> assume retrieving this parameter once is enough therefore this patch
> removes the conditial invocation of pwm_get_period().
>

Good catch, I will merge this patch
-Bryan

> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/leds/leds-pwm.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index f668500a2157..1d07e3e83d29 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -119,13 +119,10 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>                 dev_err(dev, "unable to request PWM for %s: %d\n",
>                         led->name, ret);
>                 return ret;
>         }
>
> -       if (child)
> -               led_data->period = pwm_get_period(led_data->pwm);
> -
>         led_data->can_sleep = pwm_can_sleep(led_data->pwm);
>         if (led_data->can_sleep)
>                 INIT_WORK(&led_data->work, led_pwm_work);
>
>         led_data->period = pwm_get_period(led_data->pwm);
> --
> 2.1.4
>
