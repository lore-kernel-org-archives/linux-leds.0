From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/1] leds: dac124s085: Remove redundant spi_set_drvdata
Date: Fri, 20 Sep 2013 15:38:32 -0700
Message-ID: <CAK5ve-Lyaht3d4Tam3BifzN8oMte4=P2dsVGcZ8e44QGgqkc0Q@mail.gmail.com>
References: <1379651279-24338-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:32987 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751936Ab3ITWiy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2013 18:38:54 -0400
Received: by mail-la0-f42.google.com with SMTP id ep20so849826lab.29
        for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2013 15:38:52 -0700 (PDT)
In-Reply-To: <1379651279-24338-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Guennadi Liakhovetski <lg@denx.de>

On Thu, Sep 19, 2013 at 9:27 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Driver core sets driver data to NULL upon failure or remove.
>

Good, I merged it into my tree.
Thanks,
-Bryan


> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Guennadi Liakhovetski <lg@denx.de>
> ---
>  drivers/leds/leds-dac124s085.c |    3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/leds/leds-dac124s085.c b/drivers/leds/leds-dac124s085.c
> index 1f9d8e6..db3ba8b 100644
> --- a/drivers/leds/leds-dac124s085.c
> +++ b/drivers/leds/leds-dac124s085.c
> @@ -101,7 +101,6 @@ eledcr:
>         while (i--)
>                 led_classdev_unregister(&dac->leds[i].ldev);
>
> -       spi_set_drvdata(spi, NULL);
>         return ret;
>  }
>
> @@ -115,8 +114,6 @@ static int dac124s085_remove(struct spi_device *spi)
>                 cancel_work_sync(&dac->leds[i].work);
>         }
>
> -       spi_set_drvdata(spi, NULL);
> -
>         return 0;
>  }
>
> --
> 1.7.9.5
>
