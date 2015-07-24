From: Alan Tull <delicious.quinoa@gmail.com>
Subject: Re: [PATCH 2/3] leds/class: Check snprintf return value
Date: Thu, 23 Jul 2015 22:17:37 -0500
Message-ID: <CANk1AXSJpXzbEZmtYKQC5v_g1am0bR5dSk=yxTOvWW1FWuzSog@mail.gmail.com>
References: <1427706531-22569-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:34697 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752483AbbGXDRj (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2015 23:17:39 -0400
In-Reply-To: <1427706531-22569-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Mon, Mar 30, 2015 at 4:08 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> If the final name does not fit the string there is a potential
> endless-loop.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/leds/led-class.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 294d6d6..2ffe8b1 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -223,12 +223,17 @@ static int led_classdev_next_name(const char *init_name, char *name,
>                                   size_t len)
>  {
>         int i = 0;
> +       int ret = 0;
>
>         strlcpy(name, init_name, len);
>
> -       while (class_find_device(leds_class, NULL, name, match_name))
> +       while (class_find_device(leds_class, NULL, name, match_name) &&
> +              (ret < len))
>                 snprintf(name, len, "%s_%d", init_name, ++i);

class_find_device will get a reference for a device.  That reference must be
dropped using put_device().  See the definition for class_find_device in
drivers/base/class.c and other usage examples in the kernel.  So this
function call will only work the first time.

Alan Tull

>
> +       if (ret >= len)
> +               return -ENOMEM;
> +
>         return i;
>  }
>
> @@ -243,6 +248,9 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>         int ret;
>
>         ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
> +       if (ret < 0)
> +               return ret;
> +
>         led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
>                                 led_cdev, led_cdev->groups, "%s", name);
>         if (IS_ERR(led_cdev->dev))
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
