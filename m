From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: wm831x-status: Request a REG resource
Date: Fri, 30 Aug 2013 10:19:02 -0700
Message-ID: <CAK5ve-KKikD-p-j5YMmRV8HEEmMUz6Ji5GgnaUHNUsg_uqU3Ug@mail.gmail.com>
References: <1377785910-30812-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:63994 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752831Ab3H3RTZ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 30 Aug 2013 13:19:25 -0400
Received: by mail-lb0-f169.google.com with SMTP id z5so1439426lbh.28
        for <linux-leds@vger.kernel.org>; Fri, 30 Aug 2013 10:19:23 -0700 (PDT)
In-Reply-To: <1377785910-30812-1-git-send-email-broonie@kernel.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, patches@opensource.wolfsonmicro.com, Linux LED Subsystem <linux-leds@vger.kernel.org>, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On Thu, Aug 29, 2013 at 7:18 AM, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> The wm831x-status driver was not converted to use a REG resource when they
> were introduced and the rest of the wm831x drivers converted, causing it
> to fail to probe due to requesting the wrong resource type.
>

Nice, merged.
Thanks Mark,
-Bryan

> Signed-off-by: Mark Brown <broonie@linaro.org>
> Cc: stable@vger.kernel.org # v3.7+
> ---
>  drivers/leds/leds-wm831x-status.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
> index c32dad4..0a1a13f 100644
> --- a/drivers/leds/leds-wm831x-status.c
> +++ b/drivers/leds/leds-wm831x-status.c
> @@ -230,9 +230,9 @@ static int wm831x_status_probe(struct platform_device *pdev)
>         int id = pdev->id % ARRAY_SIZE(chip_pdata->status);
>         int ret;
>
> -       res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +       res = platform_get_resource(pdev, IORESOURCE_REG, 0);
>         if (res == NULL) {
> -               dev_err(&pdev->dev, "No I/O resource\n");
> +               dev_err(&pdev->dev, "No register resource\n");
>                 ret = -EINVAL;
>                 goto err;
>         }
> --
> 1.8.4.rc3
>
