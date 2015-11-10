From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] leds: ktd2692: Add missing of_node_put
Date: Tue, 10 Nov 2015 09:32:13 -0600
Message-ID: <CAL_JsqJpafiBJgy-RQr39NxB8K8DjOA77gmuzKfchakhGR_xzw@mail.gmail.com>
References: <1447124424-16525-1-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:42526 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752701AbbKJPcf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 10 Nov 2015 10:32:35 -0500
In-Reply-To: <1447124424-16525-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Nov 9, 2015 at 9:00 PM, Ingi Kim <ingi2.kim@samsung.com> wrote:
> The refcount of device_node increases after of_node_get() is called.
> So, a break out of the loop requires of_node_put().
>
> This patch adds missing of_node_put() when loop breaks.
>
> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  drivers/leds/leds-ktd2692.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
> index feca07b..dbf37ce 100644
> --- a/drivers/leds/leds-ktd2692.c
> +++ b/drivers/leds/leds-ktd2692.c
> @@ -332,21 +332,26 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
>                                    &cfg->movie_max_microamp);
>         if (ret) {
>                 dev_err(dev, "failed to parse led-max-microamp\n");
> -               return ret;
> +               goto err_parse_dt;
>         }
>
>         ret = of_property_read_u32(child_node, "flash-max-microamp",
>                                    &cfg->flash_max_microamp);
>         if (ret) {
>                 dev_err(dev, "failed to parse flash-max-microamp\n");
> -               return ret;
> +               goto err_parse_dt;
>         }
>
>         ret = of_property_read_u32(child_node, "flash-max-timeout-us",
>                                    &cfg->flash_max_timeout);
> -       if (ret)
> +       if (ret) {
>                 dev_err(dev, "failed to parse flash-max-timeout-us\n");
> +               goto err_parse_dt;
> +       }
> +
> +       return 0;
>
> +err_parse_dt:
>         of_node_put(child_node);
>         return ret;
>  }
> --
> 2.0.5
>
