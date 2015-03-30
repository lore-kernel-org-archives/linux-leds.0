From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Mon, 30 Mar 2015 10:43:39 +0200
Message-ID: <CAMuHMdUTnUrvhQtMaTCy=FvJCxr10CHbn0AaePoza0YE-frphQ@mail.gmail.com>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Ricardo,

I forgot one thing:

On Sat, Mar 14, 2015 at 12:05 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
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

unsigned int

> +
> +       strncpy(name, init_name, len);
> +
> +       while (class_find_device(leds_class, NULL, name, match_name))
> +               snprintf(name, len, "%s_%d", init_name, ++i);

%u

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
