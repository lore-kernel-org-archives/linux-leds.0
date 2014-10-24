From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: regulator: Convert to devm_regulator_get_exclusive
Date: Fri, 24 Oct 2014 10:28:39 -0700
Message-ID: <CAK5ve-JJZUgSquLaQbrY8BWMtZzRua696N5+eEARNz+wYOjbvQ@mail.gmail.com>
References: <1414161958.607.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:55035 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756485AbaJXR3A (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 24 Oct 2014 13:29:00 -0400
Received: by mail-ig0-f176.google.com with SMTP id hn18so768698igb.15
        for <linux-leds@vger.kernel.org>; Fri, 24 Oct 2014 10:28:59 -0700 (PDT)
In-Reply-To: <1414161958.607.1.camel@phoenix>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Antonio Ospite <ospite@studenti.unina.it>, Mark Brown <broonie@kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Fri, Oct 24, 2014 at 7:45 AM, Axel Lin <axel.lin@ingics.com> wrote:
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Good move, I will merge it.

Thanks,
-Bryan


> ---
>  drivers/leds/leds-regulator.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/leds/leds-regulator.c b/drivers/leds/leds-regulator.c
> index 358430d..a6354f1 100644
> --- a/drivers/leds/leds-regulator.c
> +++ b/drivers/leds/leds-regulator.c
> @@ -153,24 +153,21 @@ static int regulator_led_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> -       vcc = regulator_get_exclusive(&pdev->dev, "vled");
> +       vcc = devm_regulator_get_exclusive(&pdev->dev, "vled");
>         if (IS_ERR(vcc)) {
>                 dev_err(&pdev->dev, "Cannot get vcc for %s\n", pdata->name);
>                 return PTR_ERR(vcc);
>         }
>
>         led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
> -       if (led == NULL) {
> -               ret = -ENOMEM;
> -               goto err_vcc;
> -       }
> +       if (led == NULL)
> +               return -ENOMEM;
>
>         led->cdev.max_brightness = led_regulator_get_max_brightness(vcc);
>         if (pdata->brightness > led->cdev.max_brightness) {
>                 dev_err(&pdev->dev, "Invalid default brightness %d\n",
>                                 pdata->brightness);
> -               ret = -EINVAL;
> -               goto err_vcc;
> +               return -EINVAL;
>         }
>         led->value = pdata->brightness;
>
> @@ -191,7 +188,7 @@ static int regulator_led_probe(struct platform_device *pdev)
>         ret = led_classdev_register(&pdev->dev, &led->cdev);
>         if (ret < 0) {
>                 cancel_work_sync(&led->work);
> -               goto err_vcc;
> +               return ret;
>         }
>
>         /* to expose the default value to userspace */
> @@ -201,10 +198,6 @@ static int regulator_led_probe(struct platform_device *pdev)
>         regulator_led_set_value(led);
>
>         return 0;
> -
> -err_vcc:
> -       regulator_put(vcc);
> -       return ret;
>  }
>
>  static int regulator_led_remove(struct platform_device *pdev)
> @@ -214,7 +207,6 @@ static int regulator_led_remove(struct platform_device *pdev)
>         led_classdev_unregister(&led->cdev);
>         cancel_work_sync(&led->work);
>         regulator_led_disable(led);
> -       regulator_put(led->vcc);
>         return 0;
>  }
>
> --
> 1.9.1
>
>
>
