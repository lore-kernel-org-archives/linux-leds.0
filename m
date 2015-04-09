From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH -next] leds: Fix build failure seen if LEDS_TRIGGERS is
 not configured
Date: Thu, 9 Apr 2015 10:34:49 -0700
Message-ID: <CAK5ve-JMsG_XijWVJ_=4xTTPhG9-FjMADbBTZnQFiCmFjkbXvA@mail.gmail.com>
References: <1428594140-16832-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:36571 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755923AbbDIRfK (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 9 Apr 2015 13:35:10 -0400
In-Reply-To: <1428594140-16832-1-git-send-email-linux@roeck-us.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Jacek Anaszewski <j.anaszewski@samsung.com>

On Thu, Apr 9, 2015 at 8:42 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> Fix:
>
> drivers/leds/led-class.c: In function 'brightness_store':
> drivers/leds/led-class.c:57: error:
>                         implicit declaration of function 'led_trigger_remove'
>
> seen if LEDS_TRIGGERS is not configured.
>

Thanks for patching this. Jacek got a fix then.
-Bryan

> Fixes: 5a15d172057c ("leds: unify the location of led-trigger API")
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  include/linux/leds.h | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 0579708..96a669f 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -223,7 +223,6 @@ struct led_trigger {
>         struct list_head  next_trig;
>  };
>
> -#ifdef CONFIG_LEDS_TRIGGERS
>  void led_trigger_set_default(struct led_classdev *led_cdev);
>  void led_trigger_set(struct led_classdev *led_cdev,
>                         struct led_trigger *trigger);
> @@ -234,13 +233,6 @@ static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
>         return led_cdev->trigger_data;
>  }
>
> -#else
> -#define led_trigger_set_default(x) do {} while (0)
> -#define led_trigger_set(x, y) do {} while (0)
> -#define led_trigger_remove(x) do {} while (0)
> -#define led_get_trigger_data(x) (NULL)
> -#endif
> -
>  ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>                         const char *buf, size_t count);
>  ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
> @@ -282,6 +274,11 @@ extern void led_trigger_rename_static(const char *name,
>
>  #else
>
> +#define led_trigger_set_default(x) do {} while (0)
> +#define led_trigger_set(x, y) do {} while (0)
> +#define led_trigger_remove(x) do {} while (0)
> +#define led_get_trigger_data(x) (NULL)
> +
>  /* Trigger has no members */
>  struct led_trigger {};
>
> --
> 2.1.0
>
