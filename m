From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH -next] leds: ipaq-micro: fix sparse non static symbol warning
Date: Tue, 29 Jul 2014 10:58:42 -0700
Message-ID: <CAK5ve-KtqRSWjL85o4rRrDxJNHY8-O418uVA4zx-5GKqQr4MDQ@mail.gmail.com>
References: <1406553324-29593-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:33995 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750986AbaG2R7E (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 29 Jul 2014 13:59:04 -0400
Received: by mail-lb0-f172.google.com with SMTP id z11so14210lbi.17
        for <linux-leds@vger.kernel.org>; Tue, 29 Jul 2014 10:59:02 -0700 (PDT)
In-Reply-To: <1406553324-29593-1-git-send-email-weiyj_lk@163.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: weiyj_lk@163.com
Cc: Richard Purdie <rpurdie@rpsys.net>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Mon, Jul 28, 2014 at 6:15 AM,  <weiyj_lk@163.com> wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Fixes the following sparse warnings:
>
> drivers/leds/leds-ipaq-micro.c:130:24: warning:
>  symbol 'micro_leds_device_driver' was not declared. Should it be static?
>

Good catch, applied.
Thanks,
-Bryan

> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/leds/leds-ipaq-micro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
> index 3210a47..3776f51 100644
> --- a/drivers/leds/leds-ipaq-micro.c
> +++ b/drivers/leds/leds-ipaq-micro.c
> @@ -127,7 +127,7 @@ static int micro_leds_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> -struct platform_driver micro_leds_device_driver = {
> +static struct platform_driver micro_leds_device_driver = {
>         .driver = {
>                 .name    = "ipaq-micro-leds",
>         },
>
