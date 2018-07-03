From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] leds: ledtrig-morse: send out morse code
Date: Tue, 3 Jul 2018 21:43:06 +0300
Message-ID: <CAHp75VcQmUPCqzteHs=EaA5h-ABAQ=GWuLVRGWL3meMKZBJ-iQ@mail.gmail.com>
References: <20180703155328.GA18299@arbeit>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703155328.GA18299@arbeit>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, ben.whitten@gmail.com, Geert Uytterhoeven <geert+renesas@glider.be>, Willy Tarreau <w@1wt.eu>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue, Jul 3, 2018 at 6:53 PM, Andreas Klinger <ak@it-klinger.de> wrote:
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
> Also add documentation for the morse led trigger


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

Redundant line.

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

If you keep it sorted it might be better to avoid any redundancy or
duplication in the future.

For now init.h and module.h are not needed together. Choose one which
suits (I guess module.h).

> +
> +

Redundant one blank line.

> +#define MORSE_DOT_UNIT_DEFAULT 500

If it's time, put it's unit to the end, like _MS

> +#define MORSE_TELEGRAM_SIZE    100

I would rather choose power of two -ish number, like
96 or 128.

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

const ?

> +       {'a', ".-"},
> +       {'b', "-..."},
> +       {'c', "-.-."},
> +       {'d', "-.."},
> +       {'e', "."},
> +       {'f', "..-."},
> +       {'g', "--."},
> +       {'h', "...."},
> +       {'i', ".."},
> +       {'j', ".---"},
> +       {'k', "-.-"},
> +       {'l', ".-.."},
> +       {'m', "--"},
> +       {'n', "-."},
> +       {'o', "---"},
> +       {'p', ".--."},
> +       {'q', "--.-"},
> +       {'r', ".-."},
> +       {'s', "..."},
> +       {'t', "-"},
> +       {'u', "..-"},
> +       {'v', "...-"},
> +       {'w', ".--"},
> +       {'x', "-..-"},
> +       {'y', "-.--"},
> +       {'z', "--.."},
> +       {'1', ".----"},
> +       {'2', "..---"},
> +       {'3', "...--"},
> +       {'4', "....-"},
> +       {'5', "....."},
> +       {'6', "-...."},
> +       {'7', "--..."},
> +       {'8', "---.."},
> +       {'9', "----."},
> +       {'0', "-----"},

Do you expect this to be changed somehow?
Otherwise we might just to keep two char arrays of alphas and digits
in an order of ascii appearance.

In the code something like

ch = tolower(x);
if (isalpha(ch))
 code = alphas[ch - 'a'];
else if (isdigit(ch))
 code = digits[ch - '0'];
else
 code = unknown;

> +       {0, NULL},

And this will gone, you just provide it with known size,

> +};

> +       msleep(3 * data->dot_unit);
> +       msleep(data->dot_unit);

For sake of consistency I would rather use

 1 * ...

> +static void morse_send_char(struct led_classdev *led_cdev, char ch)
> +{
> +       unsigned int i = 0;
> +
> +       while ((morse_table[i].c) && (morse_table[i].c != tolower(ch)))
> +               i++;
> +
> +       if (morse_table[i].c) {
> +               unsigned int j = 0;
> +
> +               while (morse_table[i].z[j]) {
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


> +static ssize_t morse_string_store(struct device *dev,
> +               struct device_attribute *attr, const char *buf, size_t size)
> +{
> +       struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +       struct morse_data *data = led_cdev->trigger_data;
> +
> +       if (size >= sizeof(data->telegram))
> +               return -E2BIG;

Hmm... What's wrong if it equals the size? Do we care about '\0' at
the end here?

> +
> +       mutex_lock(&data->lock);
> +
> +       memcpy(data->telegram, buf, size);
> +       data->telegram_size = size;
> +
> +       mutex_unlock(&data->lock);


> +
> +       schedule_work(&data->work);
> +
> +       return size;
> +}
> +
> +static DEVICE_ATTR_WO(morse_string);
> +
> +static ssize_t dot_unit_show(struct device *dev,
> +                               struct device_attribute *attr, char *buf)
> +{
> +       struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +       struct morse_data *data = led_cdev->trigger_data;
> +
> +       return sprintf(buf, "%u\n", data->dot_unit);
> +}
> +
> +static ssize_t dot_unit_store(struct device *dev,
> +               struct device_attribute *attr, const char *buf, size_t size)
> +{
> +       struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +       struct morse_data *data = led_cdev->trigger_data;
> +       unsigned long dot_unit;

> +       ssize_t ret = -EINVAL;

Redundant assignment.

> +
> +       ret = kstrtoul(buf, 10, &dot_unit);
> +       if (ret)
> +               return ret;
> +
> +       data->dot_unit = dot_unit;
> +
> +       return size;
> +}
> +
> +static DEVICE_ATTR_RW(dot_unit);
> +
> +static void morse_trig_activate(struct led_classdev *led_cdev)
> +{
> +       int rc;
> +       struct morse_data *data;
> +
> +       data = kzalloc(sizeof(struct morse_data), GFP_KERNEL);
> +       if (!data) {
> +               dev_err(led_cdev->dev, "unable to allocate morse trigger\n");
> +               return;
> +       }
> +
> +       led_cdev->trigger_data = data;
> +       data->led_cdev = led_cdev;
> +       data->dot_unit = MORSE_DOT_UNIT_DEFAULT;
> +

> +       rc = device_create_file(led_cdev->dev, &dev_attr_morse_string);
> +       if (rc)
> +               goto err_out_data;
> +
> +       rc = device_create_file(led_cdev->dev, &dev_attr_dot_unit);
> +       if (rc)
> +               goto err_out_morse_string;

When file appears, it means it's possible immediately to store/show.
Now imagine what would happen.

> +
> +       INIT_WORK(&data->work, morse_work);
> +
> +       mutex_init(&data->lock);
> +
> +       led_set_brightness(led_cdev, LED_OFF);
> +       led_cdev->activated = true;
> +
> +       return;
> +
> +err_out_data:
> +       kfree(data);
> +err_out_morse_string:
> +       device_remove_file(led_cdev->dev, &dev_attr_morse_string);
> +}
> +

> +static void morse_trig_deactivate(struct led_classdev *led_cdev)
> +{
> +       struct morse_data *data = led_cdev->trigger_data;
> +

> +       if (led_cdev->activated) {

Perhaps negative condition?

> +
> +               cancel_work_sync(&data->work);
> +
> +               device_remove_file(led_cdev->dev, &dev_attr_morse_string);
> +               device_remove_file(led_cdev->dev, &dev_attr_dot_unit);
> +
> +               kfree(data);
> +
> +               led_cdev->trigger_data = NULL;
> +               led_cdev->activated = false;
> +       }
> +}

> +MODULE_LICENSE("GPL");

This is not aligned with SPDX id.

-- 
With Best Regards,
Andy Shevchenko
