From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2] leds: fix redundant trigger API #ifdef
Date: Thu, 9 Apr 2015 10:34:33 -0700
Message-ID: <CAK5ve-J3aUMk=ou=mpx9E_hkJ-U=DjdayK+SZ9huxgXV=kZ1hg@mail.gmail.com>
References: <1428593110-9611-1-git-send-email-valentinrothberg@gmail.com> <1428593865-9929-1-git-send-email-valentinrothberg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:33079 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753799AbbDIRey (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 9 Apr 2015 13:34:54 -0400
In-Reply-To: <1428593865-9929-1-git-send-email-valentinrothberg@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, pebolle@tiscali.nl, rupran@einserver.de, stefan.hengelein@fau.de

On Thu, Apr 9, 2015 at 8:37 AM, Valentin Rothberg
<valentinrothberg@gmail.com> wrote:
> Commit 5a15d172057c ("leds: unify the location of led-trigger API")
> moved the leds trigger API to led.h.  Moving the function definitions
> caused a logical problem regarding the visibility of #idef blocks.  As
> listed in the code snippet below, the inner #else block will never see a
> compiler since CONFIG_LEDS_TRIGGERS is always true for the second #ifdef.
>
>  #ifdef CONFIG_LEDS_TRIGGERS
>  [...]
>  #ifdef CONFIG_LEDS_TRIGGERS
>  [...]
>  #else
>  #define led_trigger_set_default(x) do {} while (0)
>  #define led_trigger_set(x, y) do {} while (0)
>  #define led_trigger_remove(x) do {} while (0)
>  #define led_get_trigger_data(x) (NULL)
>  #endif
>  #else
>  [...]
>  #endif
>
> This patch removes the second, redundant #ifdef and moves the code of
> the #else branch to its proper place.
>

Thanks for patching this. Jacek got a fix then.
-Bryan

> Signed-off-by: Valentin Rothberg <valentinrothberg@gmail.com>
> ---
> I found this issue with undertaker-checkpatch from the Undertaker
> toolsuite.  See undertaker.cs.fau.de for more information.
>
> v2:  Add the code snippet example.  It has been removed by Git before.
> ---
>  include/linux/leds.h | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 057970818961..96a669f93f69 100644
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
