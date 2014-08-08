From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: lp3944: fix sparse warning
Date: Fri, 8 Aug 2014 09:42:54 -0700
Message-ID: <CAK5ve-LcEGE6VVn46UAW37prCorG3Dg8+31K7jAt4p0Ovi_azA@mail.gmail.com>
References: <1407481784-24057-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:51384 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756435AbaHHQnQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 8 Aug 2014 12:43:16 -0400
Received: by mail-la0-f47.google.com with SMTP id mc6so4792081lab.20
        for <linux-leds@vger.kernel.org>; Fri, 08 Aug 2014 09:43:15 -0700 (PDT)
In-Reply-To: <1407481784-24057-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

On Fri, Aug 8, 2014 at 12:09 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Fix sparse warning appeared after changing brightness
> type in the leds.h from int to enum led_brightness.
>

OK, merged.
Thanks,
-Bryan

> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---
>  drivers/leds/leds-lp3944.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
> index 8e1abdc..53144fb 100644
> --- a/drivers/leds/leds-lp3944.c
> +++ b/drivers/leds/leds-lp3944.c
> @@ -335,7 +335,8 @@ static int lp3944_configure(struct i2c_client *client,
>                         }
>
>                         /* to expose the default value to userspace */
> -                       led->ldev.brightness = led->status;
> +                       led->ldev.brightness =
> +                                       (enum led_brightness) led->status;
>
>                         /* Set the default led status */
>                         err = lp3944_led_set(led, led->status);
> --
> 1.7.9.5
>
