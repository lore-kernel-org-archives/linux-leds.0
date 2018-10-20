From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: upboard: Add UP2 pinctrl and gpio driver
Date: Sat, 20 Oct 2018 14:40:31 +0300
Message-ID: <CAHp75Vc8jxK6mcjOxmuOD0CTqYvfSSL=HMPpRVtOyCb6LxVB2w@mail.gmail.com>
References: <20180421085009.28773-1-javier@emutex.com> <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-4-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539969334-24577-4-git-send-email-dan@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, carlos.iglesias@emutex.com, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On Fri, Oct 19, 2018 at 8:24 PM Dan O'Donovan <dan@emutex.com> wrote:
>
> From: Javier Arteaga <javier@emutex.com>
>
> The UP2 board features a Raspberry Pi compatible pin header (HAT) and a
> board-specific expansion connector (EXHAT). Both expose assorted
> functions from either the SoC (such as GPIO, I2C, SPI, UART...) or other
> on-board devices (ADC, FPGA IP blocks...).
>
> These lines are routed through an on-board FPGA. The platform controller
> in its stock firmware provides register fields to change:
>
> - Line enable (FPGA pins enabled / high impedance)
> - Line direction (SoC driven / FPGA driven)
>
> To enable using SoC GPIOs on the pin header, this arrangement requires
> both configuring the platform controller, and updating the SoC pad
> registers in sync.
>
> Add a frontend pinctrl/GPIO driver that registers a new set of GPIO
> lines for the header pins. When these are requested, the driver
> propagates this request to the backend SoC pinctrl/GPIO driver by
> grabbing a GPIO descriptor for the matching SoC GPIO line. The needed
> mapping for this is retrieved via ACPI properties.

To Linus: please, don't consider this as anyhow part of Intel pin
control infrastructure. Thus, if you are okay with the driver
(personally I don't see any major issues with the code, though it
might be required some clarification on design level, e.g. ACPI
relationship) I have no objection.

> +#define UPBOARD_BIT_TO_PIN(r, bit) \
> +       ((r) * UPBOARD_REGISTER_SIZE + (bit))

One line?

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

Hmm... Do you need those stubs? Same Q for other stubs in the file.

> +static int upboard_gpio_request_enable(struct pinctrl_dev *pctldev,
> +                                      struct pinctrl_gpio_range *range,
> +                                      unsigned int pin)
> +{
> +       const struct pin_desc * const pd = pin_desc_get(pctldev, pin);
> +       const struct upboard_pin *p;
> +       int ret;
> +

> +       if (!pd)
> +               return -EINVAL;

When it possible to happen?
Same Q for the rest same excerpts.

> +       p = pd->drv_data;
> +
> +       /* if this pin has an associated function bit, disable it first */
> +       if (p->func_en) {
> +               ret = regmap_field_write(p->func_en, 0);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (p->gpio_en) {
> +               ret = regmap_field_write(p->gpio_en, 1);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}

> +static struct gpio_desc *upboard_offset_to_soc_gpio(struct gpio_chip *gc,
> +                                                   unsigned int offset)
> +{

> +       struct upboard_pinctrl *pctrl =
> +               container_of(gc, struct upboard_pinctrl, chip);

One line?

> +
> +       if (offset + 1 > pctrl->nsoc_gpios || !pctrl->soc_gpios[offset])
> +               return ERR_PTR(-ENODEV);

offset >= ?
Is it even possible?

> +
> +       return pctrl->soc_gpios[offset];
> +}
> +
> +static int upboard_gpio_request(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct upboard_pinctrl *pctrl =
> +               container_of(gc, struct upboard_pinctrl, chip);

One line?

> +}
> +
> +static void upboard_gpio_free(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct upboard_pinctrl *pctrl =
> +               container_of(gc, struct upboard_pinctrl, chip);

Ditto.

> +       if (offset + 1 > pctrl->nsoc_gpios || !pctrl->soc_gpios[offset])
> +               return;

offset >= ?
Is it even possible?

> +}

> +static int upboard_pinctrl_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct pinctrl_desc *pctldesc;
> +       struct upboard_pinctrl *pctrl;
> +       struct upboard_pin *pins;
> +       struct acpi_device *adev;
> +       struct regmap *regmap;
> +       unsigned int i;
> +       int ret;

> +       adev = ACPI_COMPANION(dev);
> +       if (!adev || strcmp(acpi_device_hid(adev), "AANT0F01"))
> +               return -ENODEV;

Same Q as per LED driver.

> +       for (i = 0; i < pctldesc->npins; i++) {
> +               struct upboard_pin *pin = &pins[i];
> +               const struct pinctrl_pin_desc *pd = &pctldesc->pins[i];

> +               pin->func_en = NULL;

Useless.

> +               if (pd->drv_data) {
> +                       struct reg_field *field = pd->drv_data;
> +
> +                       pin->func_en = devm_regmap_field_alloc(dev, regmap,
> +                                                              *field);
> +                       if (IS_ERR(pin->func_en))
> +                               return PTR_ERR(pin->func_en);
> +               }
> +
> +               pin->gpio_en = upboard_field_alloc(dev, regmap,
> +                                                  UPBOARD_REG_GPIO_EN0, i);
> +               if (IS_ERR(pin->gpio_en))
> +                       return PTR_ERR(pin->gpio_en);
> +
> +               pin->gpio_dir = upboard_field_alloc(dev, regmap,
> +                                                   UPBOARD_REG_GPIO_DIR0, i);
> +               if (IS_ERR(pin->gpio_dir))
> +                       return PTR_ERR(pin->gpio_dir);
> +

> +               ((struct pinctrl_pin_desc *)pd)->drv_data = pin;

I'm not sure I understand the purpose of this casting.

> +       }

> +       pctrl->soc_gpios = devm_kzalloc(dev,
> +                                       pctrl->nsoc_gpios * sizeof(*pctrl->soc_gpios),
> +                                       GFP_KERNEL);
> +       if (!pctrl->soc_gpios)
> +               return -ENOMEM;

kzalloc -> kcalloc

> +}

-- 
With Best Regards,
Andy Shevchenko
