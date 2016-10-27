From: Matt Ranostay <matt@ranostay.consulting>
Subject: Re: [PATCH v3] leds: pca963x: enable low-power state
Date: Wed, 26 Oct 2016 21:07:05 -0700
Message-ID: <CAJ_EiSSwg4QWg5w4FAZbC5yzP72jC21XOmqVb7gPd9YvJFurzg@mail.gmail.com>
References: <1477541084-4979-1-git-send-email-matt@ranostay.consulting>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34508 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750742AbcJ0EHH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Oct 2016 00:07:07 -0400
Received: by mail-qk0-f195.google.com with SMTP id n189so1666135qke.1
        for <linux-leds@vger.kernel.org>; Wed, 26 Oct 2016 21:07:06 -0700 (PDT)
In-Reply-To: <1477541084-4979-1-git-send-email-matt@ranostay.consulting>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Matt Ranostay <mranostay@gmail.com>
Cc: linux-leds@vger.kernel.org, Peter Meerwald <p.meerwald@bct-electronic.com>, Ricardo Ribalda <ricardo.ribalda@gmail.com>, Tony Lindgren <tony@atomide.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

Forgot the change log in my email...

On Wed, Oct 26, 2016 at 9:04 PM, Matt Ranostay <mranostay@gmail.com> wrote:
> Allow chip to enter low power state when no LEDs are being lit or in
> blink mode.
>
> Cc: Peter Meerwald <p.meerwald@bct-electronic.com>,
> Cc: Ricardo Ribalda <ricardo.ribalda@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
> ---
Changes from v1:
* remove runtime pm
* count leds that are off, if all then enter low-power state

Changes from v2:
* add reference count of leds to reduce i2c transactions

>  drivers/leds/leds-pca963x.c | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index b6ce1f2ec33e..e1767369776f 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -103,6 +103,7 @@ struct pca963x {
>         struct mutex mutex;
>         struct i2c_client *client;
>         struct pca963x_led *leds;
> +       int leds_on;
>  };
>
>  struct pca963x_led {
> @@ -180,14 +181,40 @@ static void pca963x_blink(struct pca963x_led *pca963x)
>         mutex_unlock(&pca963x->chip->mutex);
>  }
>
> +static int pca963x_power_state(struct pca963x_led *pca963x)
> +{
> +       int i, ret = 0, leds_on = 0;
> +       int prev_leds = pca963x->chip->leds_on;
> +
> +       for (i = 0; i < pca963x->chip->chipdef->n_leds; i++) {
> +               if (pca963x->chip->leds[i].led_cdev.brightness > 0)
> +                       leds_on++;
> +       }
> +
> +       if (leds_on != prev_leds && !(leds_on && prev_leds)) {
> +               ret = i2c_smbus_write_byte_data(pca963x->chip->client,
> +                                               PCA963X_MODE1,
> +                                               leds_on ? 0 : BIT(4));
> +       }
> +
> +       pca963x->chip->leds_on = leds_on;
> +
> +       return ret;
> +}
> +
>  static int pca963x_led_set(struct led_classdev *led_cdev,
>         enum led_brightness value)
>  {
>         struct pca963x_led *pca963x;
> +       int ret;
>
>         pca963x = container_of(led_cdev, struct pca963x_led, led_cdev);
>
> -       return pca963x_brightness(pca963x, value);
> +       ret = pca963x_brightness(pca963x, value);
> +       if (ret < 0)
> +               return ret;
> +
> +       return pca963x_power_state(pca963x);
>  }
>
>  static unsigned int pca963x_period_scale(struct pca963x_led *pca963x,
> @@ -403,8 +430,8 @@ static int pca963x_probe(struct i2c_client *client,
>                         goto exit;
>         }
>
> -       /* Disable LED all-call address and set normal mode */
> -       i2c_smbus_write_byte_data(client, PCA963X_MODE1, 0x00);
> +       /* Disable LED all-call address, and power down initially */
> +       i2c_smbus_write_byte_data(client, PCA963X_MODE1, BIT(4));
>
>         if (pdata) {
>                 /* Configure output: open-drain or totem pole (push-pull) */
> --
> 2.7.4
>
