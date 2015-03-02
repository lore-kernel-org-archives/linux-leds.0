From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: lp8860: make use of devm_gpiod_get_optional
Date: Mon, 2 Mar 2015 14:32:42 -0800
Message-ID: <CAK5ve-KLgao-7duD9eMJ4D9xpaJWnBot1hij83qgdr_gcExLEw@mail.gmail.com>
References: <1425245147-3521-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:38689 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237AbbCBWdE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 Mar 2015 17:33:04 -0500
Received: by iecrd18 with SMTP id rd18so52179301iec.5
        for <linux-leds@vger.kernel.org>; Mon, 02 Mar 2015 14:33:03 -0800 (PST)
In-Reply-To: <1425245147-3521-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Richard Purdie <rpurdie@rpsys.net>, kernel@pengutronix.de, Linux LED Subsystem <linux-leds@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On Sun, Mar 1, 2015 at 1:25 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The probe function open coded a bad variant of devm_gpiod_get_optiona=
l
> using devm_gpiod_get and just ignoring all errors.
> In contrast to that devm_gpiod_get_optional returns NULL if there was=
 no
> corresponding gpio specified in the device tree (or ACPI table) and
> fails if there is an error (or GPIOLIB is not enabled).
>
> Moreover since 39b2bbe3d715 (gpio: add flags argument to gpiod_get*()
> functions) which appeared in v3.17-rc1, the gpiod_get* functions take=
 an
> additional parameter that allows to specify direction and initial val=
ue
> for output which allows some simplification.
>

Thanks, I merged this into my tree.

-Bryan

> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/leds/leds-lp8860.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
> index 840e93f3ab3e..f2a29c256d32 100644
> --- a/drivers/leds/leds-lp8860.c
> +++ b/drivers/leds/leds-lp8860.c
> @@ -391,11 +391,13 @@ static int lp8860_probe(struct i2c_client *clie=
nt,
>                 }
>         }
>
> -       led->enable_gpio =3D devm_gpiod_get(&client->dev, "enable");
> -       if (IS_ERR(led->enable_gpio))
> -               led->enable_gpio =3D NULL;
> -       else
> -               gpiod_direction_output(led->enable_gpio, 0);
> +       led->enable_gpio =3D devm_gpiod_get_optional(&client->dev,
> +                                                  "enable", GPIOD_OU=
T_LOW);
> +       if (IS_ERR(led->enable_gpio)) {
> +               ret =3D PTR_ERR(led->enable_gpio);
> +               dev_err(&client->dev, "Failed to get enable gpio: %d\=
n", ret);
> +               return ret;
> +       }
>
>         led->regulator =3D devm_regulator_get(&client->dev, "vled");
>         if (IS_ERR(led->regulator))
> --
> 2.1.4
>
