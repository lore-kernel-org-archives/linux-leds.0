From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/2] leds:pca963x: Always initialize MODE2 register
Date: Wed, 2 Jul 2014 16:42:29 -0700
Message-ID: <CAK5ve-+9eP=k4UHDGD2FX6NOOSWMHitq1zFLoffeedA6vBWjNg@mail.gmail.com>
References: <1404288046-26661-1-git-send-email-pmeerw@pmeerw.net> <1404288046-26661-2-git-send-email-pmeerw@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:33566 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750890AbaGBXmu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 2 Jul 2014 19:42:50 -0400
Received: by mail-la0-f52.google.com with SMTP id ty20so7466793lab.39
        for <linux-leds@vger.kernel.org>; Wed, 02 Jul 2014 16:42:49 -0700 (PDT)
In-Reply-To: <1404288046-26661-2-git-send-email-pmeerw@pmeerw.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Meerwald <pmeerw@pmeerw.net>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>

On Wed, Jul 2, 2014 at 1:00 AM, Peter Meerwald <pmeerw@pmeerw.net> wrote:
> From: Peter Meerwald <p.meerwald@bct-electronic.com>
>
> PCA9632 defaults to open-drain
> PCA9633/4/5 defaults to totem-pole
>
> the driver assumed that totem-pole default and didn't actively set
> the value; the MODE2 register is now written if platform
> data indicating the mode is given
>

This one looks good to me.

-Bryan

> Signed-off-by: Peter Meerwald <pmeerw@pmeerw.net>
> ---
>  drivers/leds/leds-pca963x.c |   10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index 70e3825..2214648 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -423,9 +423,13 @@ static int pca963x_probe(struct i2c_client *client,
>         /* Disable LED all-call address and set normal mode */
>         i2c_smbus_write_byte_data(client, PCA963X_MODE1, 0x00);
>
> -       /* Configure output: open-drain or totem pole (push-pull) */
> -       if (pdata && pdata->outdrv == PCA963X_OPEN_DRAIN)
> -               i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x01);
> +       if (pdata) {
> +               /* Configure output: open-drain or totem pole (push-pull) */
> +               if (pdata->outdrv == PCA963X_OPEN_DRAIN)
> +                       i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x01);
> +               else
> +                       i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x05);
> +       }
>
>         return 0;
>
> --
> 1.7.9.5
>
