From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: lp8860: Fix module dependency
Date: Mon, 1 Dec 2014 15:26:56 -0800
Message-ID: <CAK5ve-KVEx0wuN713m-CVqbN-CqxXpQfn=-3yO9d=YKWs9kneQ@mail.gmail.com>
References: <1416577706.16072.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:51536 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932631AbaLAX1R (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 1 Dec 2014 18:27:17 -0500
Received: by mail-ie0-f175.google.com with SMTP id x19so5477749ier.34
        for <linux-leds@vger.kernel.org>; Mon, 01 Dec 2014 15:27:17 -0800 (PST)
In-Reply-To: <1416577706.16072.1.camel@phoenix>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Dan Murphy <dmurphy@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Fri, Nov 21, 2014 at 5:48 AM, Axel Lin <axel.lin@ingics.com> wrote:
> The driver should select REGMAP_I2C rather than depend on it.
>

Applied. Thanks,
-Bryan

> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/leds/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index b3c0d8a..59f4228 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -249,7 +249,8 @@ config LEDS_LP8788
>
>  config LEDS_LP8860
>         tristate "LED support for the TI LP8860 4 channel LED driver"
> -       depends on LEDS_CLASS && REGMAP_I2C
> +       depends on LEDS_CLASS && I2C
> +       select REGMAP_I2C
>         help
>           If you say yes here you get support for the TI LP8860 4 channel
>           LED driver.
> --
> 1.9.1
>
>
>
