From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: replace list_for_each with list_for_each_entry
Date: Thu, 2 Jan 2014 14:53:44 -0800
Message-ID: <CAK5ve-+zxZPEfQHAfUJDCyE7zAuc4LF6VYE8NJ51-80e00WDWQ@mail.gmail.com>
References: <510322a941c9364485d9f5cd883a81fa74365a7a.1388238995.git.gamerh2o@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:40904 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750744AbaABWyG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 2 Jan 2014 17:54:06 -0500
Received: by mail-la0-f42.google.com with SMTP id ec20so7822702lab.29
        for <linux-leds@vger.kernel.org>; Thu, 02 Jan 2014 14:54:04 -0800 (PST)
In-Reply-To: <510322a941c9364485d9f5cd883a81fa74365a7a.1388238995.git.gamerh2o@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: ZHAO Gang <gamerh2o@gmail.com>
Cc: linux-leds <linux-leds@vger.kernel.org>

On Sat, Dec 28, 2013 at 7:00 AM, ZHAO Gang <gamerh2o@gmail.com> wrote:
> Use the more convenient macro.
>

Good, applied.

Thanks,
-Bryan

> Signed-off-by: ZHAO Gang <gamerh2o@gmail.com>
> ---
>  drivers/leds/led-triggers.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 3c972b2..e387f41 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -242,18 +242,14 @@ EXPORT_SYMBOL_GPL(led_trigger_unregister);
>  void led_trigger_event(struct led_trigger *trig,
>                         enum led_brightness brightness)
>  {
> -       struct list_head *entry;
> +       struct led_classdev *led_cdev;
>
>         if (!trig)
>                 return;
>
>         read_lock(&trig->leddev_list_lock);
> -       list_for_each(entry, &trig->led_cdevs) {
> -               struct led_classdev *led_cdev;
> -
> -               led_cdev = list_entry(entry, struct led_classdev, trig_list);
> +       list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
>                 led_set_brightness(led_cdev, brightness);
> -       }
>         read_unlock(&trig->leddev_list_lock);
>  }
>  EXPORT_SYMBOL_GPL(led_trigger_event);
> @@ -264,16 +260,13 @@ static void led_trigger_blink_setup(struct led_trigger *trig,
>                              int oneshot,
>                              int invert)
>  {
> -       struct list_head *entry;
> +       struct led_classdev *led_cdev;
>
>         if (!trig)
>                 return;
>
>         read_lock(&trig->leddev_list_lock);
> -       list_for_each(entry, &trig->led_cdevs) {
> -               struct led_classdev *led_cdev;
> -
> -               led_cdev = list_entry(entry, struct led_classdev, trig_list);
> +       list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
>                 if (oneshot)
>                         led_blink_set_oneshot(led_cdev, delay_on, delay_off,
>                                               invert);
> --
> 1.8.4.2
>
