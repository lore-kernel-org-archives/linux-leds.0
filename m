From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: Fix regression related to led-trigger API location change
Date: Thu, 9 Apr 2015 10:33:35 -0700
Message-ID: <CAK5ve-++Ej+Lb0=2WfxShojgLfejBpqam6e6ThLefvtYQLnzZw@mail.gmail.com>
References: <1428584133-27892-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:34755 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753818AbbDIRd4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 9 Apr 2015 13:33:56 -0400
Received: by pdbqa5 with SMTP id qa5so102784878pdb.1
        for <linux-leds@vger.kernel.org>; Thu, 09 Apr 2015 10:33:55 -0700 (PDT)
In-Reply-To: <1428584133-27892-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, Apr 9, 2015 at 5:55 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Patch fe4d2d05 ("leds: unify the location of led-trigger API") is
> causing a build break when led-triggers are turned off in the config.
> This patch fixes the issue and changes no-op declarations of affected
> functions to inlines instead of macros.
>

My bad, I should build and test kernel on my board and shouldn't put
this big change in next branch since merge window will open soon.

Jacek, I'm going to drop the previous patch from my tree. and please
fold this fix patch with previous one together. I will merge it into
my -devel branch instead of for-next branch. So that means it won't be
in 4.0 release but 4.1.

Does this make sense to you?

Thanks,
-Bryan

> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> ---
>  include/linux/leds.h |   37 +++++++++++++++++++------------------
>  1 file changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 0579708..0b9780e 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -223,24 +223,6 @@ struct led_trigger {
>         struct list_head  next_trig;
>  };
>
> -#ifdef CONFIG_LEDS_TRIGGERS
> -void led_trigger_set_default(struct led_classdev *led_cdev);
> -void led_trigger_set(struct led_classdev *led_cdev,
> -                       struct led_trigger *trigger);
> -void led_trigger_remove(struct led_classdev *led_cdev);
> -
> -static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
> -{
> -       return led_cdev->trigger_data;
> -}
> -
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
> @@ -262,6 +244,16 @@ extern void led_trigger_blink_oneshot(struct led_trigger *trigger,
>                                       unsigned long *delay_on,
>                                       unsigned long *delay_off,
>                                       int invert);
> +void led_trigger_set_default(struct led_classdev *led_cdev);
> +void led_trigger_set(struct led_classdev *led_cdev,
> +                       struct led_trigger *trigger);
> +void led_trigger_remove(struct led_classdev *led_cdev);
> +
> +static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
> +{
> +       return led_cdev->trigger_data;
> +}
> +
>  /**
>   * led_trigger_rename_static - rename a trigger
>   * @name: the new trigger name
> @@ -291,6 +283,15 @@ static inline void led_trigger_register_simple(const char *name,
>  static inline void led_trigger_unregister_simple(struct led_trigger *trigger) {}
>  static inline void led_trigger_event(struct led_trigger *trigger,
>                                 enum led_brightness event) {}
> +static inline void led_trigger_set_default(struct led_classdev *led_cdev) {}
> +static inline void led_trigger_set(struct led_classdev *led_cdev,
> +                               struct led_trigger *trigger) {}
> +static inline void led_trigger_remove(struct led_classdev *led_cdev) {}
> +static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
> +{
> +       return NULL;
> +}
> +
>  #endif /* CONFIG_LEDS_TRIGGERS */
>
>  /* Trigger specific functions */
> --
> 1.7.9.5
>
