From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/3] leds: Reorder include directives
Date: Thu, 7 Aug 2014 17:16:33 -0700
Message-ID: <CAK5ve-JVKJupjNA83H6CPvfZTjv5GcGU6H2w2cbrJtKVausufw@mail.gmail.com>
References: <1407413424-30087-1-git-send-email-j.anaszewski@samsung.com> <1407413424-30087-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:41948 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755799AbaHHAQz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Aug 2014 20:16:55 -0400
Received: by mail-la0-f42.google.com with SMTP id pv20so4117396lab.15
        for <linux-leds@vger.kernel.org>; Thu, 07 Aug 2014 17:16:53 -0700 (PDT)
In-Reply-To: <1407413424-30087-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

On Thu, Aug 7, 2014 at 5:10 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Reorder include directives so that they are arranged
> in alphabetical order.
>

Applied to my -devel tree and I will move it over to for-next after
this merge window.

Thanks,
-Bryan

> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---
>  drivers/leds/led-class.c |   12 ++++++------
>  drivers/leds/led-core.c  |    2 +-
>  include/linux/leds.h     |    2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 129729d..3df5632 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -9,15 +9,15 @@
>   * published by the Free Software Foundation.
>   */
>
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -#include <linux/list.h>
> -#include <linux/spinlock.h>
> +#include <linux/ctype.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> -#include <linux/ctype.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
>  #include <linux/leds.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>  #include "leds.h"
>
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 4bb1168..8380eb7 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -12,10 +12,10 @@
>   */
>
>  #include <linux/kernel.h>
> +#include <linux/leds.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/rwsem.h>
> -#include <linux/leds.h>
>  #include <linux/workqueue.h>
>  #include "leds.h"
>
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 6a599dc..bc959c5 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -13,8 +13,8 @@
>  #define __LINUX_LEDS_H_INCLUDED
>
>  #include <linux/list.h>
> -#include <linux/spinlock.h>
>  #include <linux/rwsem.h>
> +#include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>
>  struct device;
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
