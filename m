From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/3] leds: make brightness type consistent across whole subsystem
Date: Thu, 7 Aug 2014 17:18:34 -0700
Message-ID: <CAK5ve-LjNLJoCseVyE4DRpS-PuUYDKewWB9i5cvQEL-VDm4OBA@mail.gmail.com>
References: <1407413424-30087-1-git-send-email-j.anaszewski@samsung.com> <1407413424-30087-3-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:59053 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755384AbaHHAS4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Aug 2014 20:18:56 -0400
Received: by mail-la0-f49.google.com with SMTP id hz20so4116157lab.36
        for <linux-leds@vger.kernel.org>; Thu, 07 Aug 2014 17:18:55 -0700 (PDT)
In-Reply-To: <1407413424-30087-3-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

On Thu, Aug 7, 2014 at 5:10 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Documentations states that brightness units type is enum led_brightness
> and this is the type used by the led API functions. Adjust the type
> of brightness variables in the struct led_classdev accordingly.
>

Applied into my -devel branch

Thanks,
-Bryan

> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---
>  include/linux/leds.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index bc959c5..bc221d11 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -30,8 +30,8 @@ enum led_brightness {
>
>  struct led_classdev {
>         const char              *name;
> -       int                      brightness;
> -       int                      max_brightness;
> +       enum led_brightness      brightness;
> +       enum led_brightness      max_brightness;
>         int                      flags;
>
>         /* Lower 16 bits reflect status */
> --
> 1.7.9.5
>
