From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2] leds: start numerating duplicated devices from 2
Date: Thu, 26 Mar 2015 11:15:02 -0700
Message-ID: <CAK5ve-JVeosdk+c7QsGqGWskNHvrpKbGn--LfGGOzwyROwDk0w@mail.gmail.com>
References: <1427381989-17365-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:36029 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751552AbbCZSPX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Mar 2015 14:15:23 -0400
Received: by igbud6 with SMTP id ud6so137636006igb.1
        for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2015 11:15:23 -0700 (PDT)
In-Reply-To: <1427381989-17365-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>

On Thu, Mar 26, 2015 at 7:59 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Duplicated devices are currently given numerical suffixes
> starting from 1. Since duplication means that one instance
> of a device already exists in the system, then it is more
> intuitive for the next device to get the suffix "_2".
>

No, I prefer to "_1" since normally we treat the first one "_0" or
empty. But I suggest we add the "_0" for the first new device then the
second one will be "_1"

Thanks,
-Bryan

> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Cc: Sakari Ailus <sakari.ailus@iki.fi>
> ---
>  drivers/leds/led-class.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 4ca37b8..07fcb35 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -222,14 +222,14 @@ static int match_name(struct device *dev, const void *data)
>  static int led_classdev_next_name(const char *init_name, char *name,
>                                   size_t len)
>  {
> -       int i = 0;
> +       int i = 1;
>
>         strncpy(name, init_name, len);
>
>         while (class_find_device(leds_class, NULL, name, match_name))
>                 snprintf(name, len, "%s_%d", init_name, ++i);
>
> -       return i;
> +       return i > 1 ? i : 0;
>  }
>
>  /**
> --
> 1.7.9.5
>
