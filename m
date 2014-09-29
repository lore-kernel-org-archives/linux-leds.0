From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 3/3] leds: gpio: cleanup the leds-gpio driver
Date: Mon, 29 Sep 2014 10:22:12 -0700
Message-ID: <CAK5ve-L7WqhD1GZGtqRsE=bLt0r+4SS4VBr5zxGUb8Y2yjhRxQ@mail.gmail.com>
References: <1411894636-12360-1-git-send-email-Li.Xiubo@freescale.com> <1411894636-12360-4-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:52015 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752182AbaI2RWe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Sep 2014 13:22:34 -0400
Received: by mail-lb0-f170.google.com with SMTP id n15so6690850lbi.15
        for <linux-leds@vger.kernel.org>; Mon, 29 Sep 2014 10:22:33 -0700 (PDT)
In-Reply-To: <1411894636-12360-4-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Xiubo Li <Li.Xiubo@freescale.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Sun, Sep 28, 2014 at 1:57 AM, Xiubo Li <Li.Xiubo@freescale.com> wrote:
> Remove stray blank line and space.
>

Good, I will apply it.
-Bryan

> Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
> ---
>  drivers/leds/leds-gpio.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 1b1e617..b4518c8 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -36,7 +36,7 @@ struct gpio_led_data {
>
>  static void gpio_led_work(struct work_struct *work)
>  {
> -       struct gpio_led_data    *led_dat =
> +       struct gpio_led_data *led_dat =
>                 container_of(work, struct gpio_led_data, work);
>
>         if (led_dat->blinking) {
> @@ -235,14 +235,12 @@ static struct gpio_leds_priv *gpio_leds_create_of(struct platform_device *pdev)
>  }
>  #endif /* CONFIG_OF_GPIO */
>
> -
>  static int gpio_led_probe(struct platform_device *pdev)
>  {
>         struct gpio_led_platform_data *pdata = dev_get_platdata(&pdev->dev);
>         struct gpio_leds_priv *priv;
>         int i, ret = 0;
>
> -
>         if (pdata && pdata->num_leds) {
>                 priv = devm_kzalloc(&pdev->dev,
>                                 sizeof_gpio_leds_priv(pdata->num_leds),
> --
> 2.1.0.27.g96db324
>
