From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Mon, 30 Mar 2015 09:59:21 +0200
Message-ID: <CAMuHMdUKos-vWP0Ok0=a7B2g5EjnRH12hqS0vm2wUDgu-b0QHQ@mail.gmail.com>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34723 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752933AbbC3H7V (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 03:59:21 -0400
In-Reply-To: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Mar 14, 2015 at 12:05 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> The current code expected that every LED had an unique name. This is a
> legit expectation when the device tree can no be modified or extended.
> But with device tree overlays this requirement can be easily broken.
>
> This patch finds out if the name is already in use and adds the suffix
> _1, _2... if not.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> v3: Suggested by Bryan Wu <cooloney@gmail.com>
>
> -Do not allocate dynamically the name
>  drivers/leds/led-class.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 768d33a..4ca37b8 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -212,6 +212,26 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
>         .resume         = led_resume,
>  };
>
> +static int match_name(struct device *dev, const void *data)
> +{
> +       if (!dev_name(dev))
> +               return 0;
> +       return !strcmp(dev_name(dev), (char *)data);
> +}
> +
> +static int led_classdev_next_name(const char *init_name, char *name,
> +                                 size_t len)
> +{
> +       int i = 0;
> +
> +       strncpy(name, init_name, len);

What's the maximum length of init_name?
strncpy() is _not_ guaranteed to zero-terminate the destination buffer.

There are two ways to fix this:
  1. Use strlcpy() instead of strncpy(),
  2. Explicitly set name[len-1] to 0 after the call to strncpy().

As we don't need the "security" feature of strncpy() that fills the remaining
part of the buffer with zeroes, I think using strlcpy() is the best solution.

> +       while (class_find_device(leds_class, NULL, name, match_name))
> +               snprintf(name, len, "%s_%d", init_name, ++i);

This will become an infinite loop once the resulting string no longer fits in
the target buffer. Hence the loop should be terminated, and an error code
should be returned, once snprintf() returns a value >= len.

> +
> +       return i;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
