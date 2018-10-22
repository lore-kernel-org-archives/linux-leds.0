From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] pinctrl: upboard: Add UP2 pinctrl and gpio driver
Date: Mon, 22 Oct 2018 11:07:13 +0200
Message-ID: <CACRpkdaLTFFDbW9VY3DmaJ4R5ceXFJK0W_dSi7jbqi3Bz4FXkg@mail.gmail.com>
References: <20180421085009.28773-1-javier@emutex.com> <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-4-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539969334-24577-4-git-send-email-dan@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>, Eric Anholt <eric@anholt.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-leds@vger.kernel.org, carlos.iglesias@emutex.com, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On Fri, Oct 19, 2018 at 7:16 PM Dan O'Donovan <dan@emutex.com> wrote:

> From: Javier Arteaga <javier@emutex.com>
>
> The UP2 board features a Raspberry Pi compatible pin header (HAT) and a
> board-specific expansion connector (EXHAT).

Which makes me want to have Eric Anholt's review on this patch
so as to secure basic interoperability with that header.

> Both expose assorted
> functions from either the SoC (such as GPIO, I2C, SPI, UART...) or other
> on-board devices (ADC, FPGA IP blocks...).

OK
Look at how RPi define names for their GPIO lines in the
DTS file:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/bcm2835-rpi-b.dts

Please follow this pattern with your patch.

As you probably do not have device tree or anything similar
for ACPI to name the lines (correct me if I'm wrong)
you can use the .names array in struct gpio_chip for
hardcoding the proper line names.

lsgpio should give the same line names as it does on
the corresponding RPi header IMO.

> +config PINCTRL_UPBOARD
> +       tristate "UP Squared pinctrl and GPIO driver"
> +       depends on ACPI
> +       depends on MFD_UPBOARD
> +       select PINMUX

select GPIOLIB

as you're using it.

> +static int upboard_get_functions_count(struct pinctrl_dev *pctldev)
> +{
> +       return 0;
> +}
> +
> +static int upboard_get_function_groups(struct pinctrl_dev *pctldev,
> +                                      unsigned int selector,
> +                                      const char * const **groups,
> +                                      unsigned int *num_groups)
> +{
> +       *groups = NULL;
> +       *num_groups = 0;
> +       return 0;
> +}
> +
> +static const char *upboard_get_function_name(struct pinctrl_dev *pctldev,
> +                                            unsigned int selector)
> +{
> +       return NULL;
> +}
> +
> +static int upboard_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
> +                          unsigned int group)
> +{
> +       return 0;
> +}

This just looks weird.

There seems to be code to disable pins and turn them into
GPIOs in upboard_gpio_request_enable() but no way to
switch them back to the original function, is that how it works?

I guess it is fine if that is how it's supposed to be used. But
won't some grumpy users come around and complain about
this one day?

We can fix it when it happens though.

> +static int upboard_gpio_request(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct upboard_pinctrl *pctrl =
> +               container_of(gc, struct upboard_pinctrl, chip);
> +       struct gpio_desc *desc;
> +       int ret;
> +
> +       ret = pinctrl_gpio_request(gc->base + offset);
> +       if (ret)
> +               return ret;
> +
> +       desc = devm_gpiod_get_index(gc->parent, "external", offset, GPIOD_ASIS);
> +       if (IS_ERR(desc))
> +               return PTR_ERR(desc);

No please don't do this. The consumers should request
the gpio, not the driver.

> +static void upboard_gpio_free(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct upboard_pinctrl *pctrl =
> +               container_of(gc, struct upboard_pinctrl, chip);
> +
> +       if (offset + 1 > pctrl->nsoc_gpios || !pctrl->soc_gpios[offset])
> +               return;
> +
> +       devm_gpiod_put(gc->parent, pctrl->soc_gpios[offset]);

Dito.

> +static int upboard_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct gpio_desc *desc = upboard_offset_to_soc_gpio(gc, offset);
> +
> +       if (IS_ERR(desc))
> +               return PTR_ERR(desc);
> +
> +       return gpiod_get_direction(desc);
> +}

This is just confusing me even more...

If you need pinctrl_gpio_get_direction() then it should be
added to the API in <linux/pinctrl/consumer.h>.

> +static int upboard_gpio_direction_output(struct gpio_chip *gc,
> +                                        unsigned int offset, int value)
> +{
> +       struct gpio_desc *desc = upboard_offset_to_soc_gpio(gc, offset);
> +       int ret;
> +
> +       if (IS_ERR(desc))
> +               return PTR_ERR(desc);
> +
> +       ret = pinctrl_gpio_direction_output(gc->base + offset);
> +       if (ret)
> +               return ret;
> +
> +       return gpiod_direction_output(desc, value);

No this looks confusing too.

> +static int upboard_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct gpio_desc *desc = upboard_offset_to_soc_gpio(gc, offset);
> +
> +       if (IS_ERR(desc))
> +               return PTR_ERR(desc);
> +
> +       return gpiod_get_value(desc);

I don't get this masking one GPIO chip behind another GPIO chip.
It looks really weird.

What we usually have is a GPIO chip in front of a pin controller
utilizing
extern int pinctrl_gpio_request(unsigned gpio);
extern void pinctrl_gpio_free(unsigned gpio);
extern int pinctrl_gpio_direction_input(unsigned gpio);
extern int pinctrl_gpio_direction_output(unsigned gpio);
extern int pinctrl_gpio_set_config(unsigned gpio, unsigned long config);

these things for the GPIO chip to talk to the pin control
back-end.

This driver seems to use a GPIO chip in front of a
GPIO chip and a pin controller too (or something like
that) and that makes me very uneasy.

I need a clear picture of the internal architectur of
the GPIO parts of this driver, why the GPIO accessors
are calling back into the GPIO layer etc. It looks very
unorthodox to me, and I get very confused.

Yours.
Linus Walleij
