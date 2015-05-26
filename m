From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: Re: [PATCH 15/20] leds: mark ot200 driver with LED_BRIGHTNESS_FAST flag
Date: Tue, 26 May 2015 11:16:38 +0200
Message-ID: <CAH9NwWfrixFNiObPv17or0NwGeayq56+bG1JZp8gf-mMOZJZSQ@mail.gmail.com>
References: <555CA58A.10700@list.ru> <555DF7DD.9080907@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <555DF7DD.9080907@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: linux-leds@vger.kernel.org

>
> This driver doesn't use sleeping operations in .brightness_set
> method, and can be marked with LED_BRIGHTNESS_FAST flag.
> That flag allows changing brightness at high rates (over 100Hz).
>
> CC: Bryan Wu <cooloney@gmail.com>
> CC: Richard Purdie <rpurdie@rpsys.net>
> CC: Jacek Anaszewski <j.anaszewski@samsung.com>
> CC: linux-leds@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> CC: Christian Gmeiner <christian.gmeiner@gmail.com>
>
> Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
> ---
>  drivers/leds/leds-ot200.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/leds/leds-ot200.c b/drivers/leds/leds-ot200.c
> index 39870de..d357c14 100644
> --- a/drivers/leds/leds-ot200.c
> +++ b/drivers/leds/leds-ot200.c
> @@ -123,6 +123,7 @@ static int ot200_led_probe(struct platform_device *pdev)
>
>                 leds[i].cdev.name = leds[i].name;
>                 leds[i].cdev.brightness_set = ot200_led_brightness_set;
> +               leds[i].cdev.flags |= LED_BRIGHTNESS_FAST;
>
>                 ret = led_classdev_register(&pdev->dev, &leds[i].cdev);
>                 if (ret < 0)
> --
> 1.7.9.5

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>
