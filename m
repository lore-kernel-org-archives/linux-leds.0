From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] leds: ledtrig-morse: send out morse code
Date: Thu, 28 Jun 2018 17:36:25 +0200
Message-ID: <CAMuHMdX4CACrHq1R-29190uGzhHKKrsrqqeEfJuauNjeq-sY_w@mail.gmail.com>
References: <20180628134227.GA1719@arbeit>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628134227.GA1719@arbeit>
Sender: linux-kernel-owner@vger.kernel.org
To: ak@it-klinger.de
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Ben Whitten <ben.whitten@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Willy Tarreau <w@1wt.eu>, Philippe Ombredanne <pombredanne@nexb.com>, Greg KH <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Andreas,

On Thu, Jun 28, 2018 at 3:42 PM Andreas Klinger <ak@it-klinger.de> wrote:
> Send out a morse code by using LEDs.
>
> This is useful especially on embedded systems without displays to tell the
> user about error conditions and status information.
>
> The trigger will be called "morse"
>
> The string to be send is written into the file morse_string and sent out
> with a workqueue. Supported are letters and digits.
>
> With the file dot_unit the minimal time unit can be adjusted in
> milliseconds.
>
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>\

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-morse.c
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ledtrig-morse: LED Morse Trigger
> + *
> + * send a string as morse code out through LEDs
> + *
> + * can be used to send error codes or messages
> + *
> + * string to be send is written into morse_string
> + * supported are letters and digits
> + *
> + * Author: Andreas Klinger <ak@it-klinger.de>
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/device.h>
> +#include <linux/ctype.h>
> +#include <linux/slab.h>
> +#include <linux/delay.h>
> +#include <linux/workqueue.h>
> +#include <linux/leds.h>
> +
> +
> +#define MORSE_DOT_UNIT_DEFAULT 500
> +#define MORSE_TELEGRAM_SIZE    100
> +
> +struct morse_data {
> +       unsigned int            dot_unit;
> +       struct led_classdev     *led_cdev;
> +       struct work_struct      work;
> +       char                    telegram[MORSE_TELEGRAM_SIZE];
> +       unsigned int            telegram_size;
> +       struct mutex            lock;
> +};
> +
> +struct morse_char {
> +       char    c;
> +       char    *z;
> +};
> +
> +static struct morse_char morse_table[] = {
> +       {'a', ".-S"},

What's the added value of the trailing "S", which is present in each string,
over the standard NUL terminator, which is also present?

Given no character uses more than 5 symbols, a more compact encoding
(e.g. 3 bits for length, 5 bits for symbols) could be used.
But it may not be worth doing that optimization. And you may want to add
support for more characters later.

> +static void morse_send_char(struct led_classdev *led_cdev, char ch)
> +{
> +       int i = 0;

unsigned int

> +
> +       while ((morse_table[i].c) && (morse_table[i].c != tolower(ch)))
> +               i++;
> +
> +       if (morse_table[i].c) {
> +               int j = 0;

unsigned int

> +
> +               while (morse_table[i].z[j] != 'S') {

Without the trailing "S"es, you could just check for "morse_table[i].z[j]".

> +                       switch (morse_table[i].z[j]) {
> +                       case '.':
> +                               morse_short(led_cdev);
> +                               break;
> +                       case '-':
> +                               morse_long(led_cdev);
> +                               break;
> +                       }
> +                       j++;
> +               }
> +               morse_letter_space(led_cdev);
> +       } else {
> +               /*
> +                * keep it simple:
> +                * whenever there is an unrecognized character make a word
> +                * space
> +                */
> +               morse_word_space(led_cdev);
> +       }
> +}
> +
> +static void morse_work(struct work_struct *work)
> +{
> +       struct morse_data *data = container_of(work, struct morse_data, work);
> +       int i;

unsigned int i;

> +
> +       mutex_lock(&data->lock);
> +
> +       for (i = 0; i < data->telegram_size; i++)
> +               morse_send_char(data->led_cdev, data->telegram[i]);
> +
> +       mutex_unlock(&data->lock);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
