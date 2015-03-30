From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] leds/class: Check snprintf return value
Date: Mon, 30 Mar 2015 10:59:00 +0200
Message-ID: <CAMuHMdXdtWvMazm12Kr3TGf=gWjMqqTaCr-t6W7yQscveVeTrA@mail.gmail.com>
References: <1427705712-18083-1-git-send-email-ricardo.ribalda@gmail.com>
	<1427705712-18083-3-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427705712-18083-3-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Mar 30, 2015 at 10:55 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
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

Missing "ret = "

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
