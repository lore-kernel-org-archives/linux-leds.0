From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/3] leds: leds-mc13783: Remove unneeded mc13xxx_{un}lock
Date: Mon, 9 Dec 2013 17:16:43 -0800
Message-ID: <CAK5ve-KkanBKGU46QaVLdh9rwnZned38VA6sMAqaVea+CR1iFQ@mail.gmail.com>
References: <1386397339-30972-1-git-send-email-shc_work@mail.ru> <1386397339-30972-2-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:42220 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790Ab3LJBRE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Dec 2013 20:17:04 -0500
Received: by mail-la0-f41.google.com with SMTP id eo20so2172951lab.14
        for <linux-leds@vger.kernel.org>; Mon, 09 Dec 2013 17:17:03 -0800 (PST)
In-Reply-To: <1386397339-30972-2-git-send-email-shc_work@mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, =?ISO-8859-1?Q?Philippe_R=E9tornaz?= <philippe.retornaz@epfl.ch>, Sascha Hauer <kernel@pengutronix.de>

On Fri, Dec 6, 2013 at 10:22 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
> LED registers are used only in this driver, so no additional
> locking is needed. Read-Modify-Write cycle in workqueue is already
> protected by regmap.
>

Good, I will merge this.

Thanks,
-Bryan

> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/leds/leds-mc13783.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
> index ec704f2..ca87a1b 100644
> --- a/drivers/leds/leds-mc13783.c
> +++ b/drivers/leds/leds-mc13783.c
> @@ -117,9 +117,7 @@ static void mc13xxx_led_work(struct work_struct *work)
>                 BUG();
>         }
>
> -       mc13xxx_lock(led->master);
>         mc13xxx_reg_rmw(led->master, reg, mask << shift, value << shift);
> -       mc13xxx_unlock(led->master);
>  }
>
>  static void mc13xxx_led_set(struct led_classdev *led_cdev,
> @@ -164,19 +162,12 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
>         leds->num_leds = num_leds;
>         platform_set_drvdata(pdev, leds);
>
> -       mc13xxx_lock(mcdev);
>         for (i = 0; i < devtype->num_regs; i++) {
>                 reg = pdata->led_control[i];
>                 WARN_ON(reg >= (1 << 24));
>                 ret = mc13xxx_reg_write(mcdev, MC13XXX_REG_LED_CONTROL(i), reg);
>                 if (ret)
> -                       break;
> -       }
> -       mc13xxx_unlock(mcdev);
> -
> -       if (ret) {
> -               dev_err(&pdev->dev, "Unable to init LED driver\n");
> -               return ret;
> +                       return ret;
>         }
>
>         for (i = 0; i < num_leds; i++) {
> @@ -237,10 +228,8 @@ static int mc13xxx_led_remove(struct platform_device *pdev)
>                 cancel_work_sync(&leds->led[i].work);
>         }
>
> -       mc13xxx_lock(mcdev);
>         for (i = 0; i < leds->devtype->num_regs; i++)
>                 mc13xxx_reg_write(mcdev, MC13XXX_REG_LED_CONTROL(i), 0);
> -       mc13xxx_unlock(mcdev);
>
>         return 0;
>  }
> --
> 1.8.3.2
>
