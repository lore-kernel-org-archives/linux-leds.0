From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v7 2/2] leds: lm3601x: Introduce the lm3601x LED driver
Date: Mon, 21 May 2018 23:44:25 +0300
Message-ID: <CAHp75VcShgaFoJVqbTGBXrrgEr-7JQcCLK4Qy-jydE5++f4VAQ@mail.gmail.com>
References: <20180521180927.18472-1-dmurphy@ti.com> <20180521180927.18472-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180521180927.18472-2-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Mon, May 21, 2018 at 9:09 PM, Dan Murphy <dmurphy@ti.com> wrote:
> Introduce the family of LED devices that can
> drive a torch, strobe or IR LED.
>
> The LED driver can be configured with a strobe
> timer to execute a strobe flash.  The IR LED
> brightness is controlled via the torch brightness
> register.
>
> The data sheet for each the LM36010 and LM36011
> LED drivers can be found here:
> http://www.ti.com/product/LM36010
> http://www.ti.com/product/LM36011

Thanks for an update. My comments below.

> +config LEDS_LM3601X
> +       tristate "LED support for LM3601x Chips"
> +       depends on LEDS_CLASS && I2C && OF

Now OF here is superfluous.

> +       depends on LEDS_CLASS_FLASH
> +       select REGMAP_I2C
> +       help
> +         This option enables support for the TI LM3601x family
> +         of flash, torch and indicator classes.

> +#define LM3601X_TIMEOUT_MASK   0x1e
> +#define LM3601X_ENABLE_MASK    0x03

I dunno if GENMASK() will be better here.

> +#define LM3601X_LOWER_STEP_US  40000
> +#define LM3601X_UPPER_STEP_US  200000
> +#define LM3601X_MIN_TIMEOUT_US 40000
> +#define LM3601X_MAX_TIMEOUT_US 1600000

> +#define LM3601X_TIMEOUT_XOVER  400000

Missed unit?

> +       ret = regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
> +                               LM3601X_MODE_TORCH | LM3601X_MODE_IR_DRV,
> +                               led_mode_val);

> +               ret = regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
> +                                       LM3601X_MODE_TORCH | LM3601X_MODE_IR_DRV,
> +                                       LM3601X_MODE_STROBE);

Perhaps
#define ..._MODE_TORCH_WITH_IR   (..._TOCRH | ..._IR_DRV)
?

> +static int lm3601x_probe(struct i2c_client *client,
> +                       const struct i2c_device_id *id)
> +{
> +       struct lm3601x_led *led;
> +       int err;

> +       err = lm3601x_parse_node(led, client->dev.of_node);
> +       if (err < 0)

> +               return -ENODEV;

Shouldn't be

return err;

?

> +       err = lm3601x_register_leds(led);
> +
> +       return err;

I will leave this to maintainers since you seems have strong
objections against more or less standard pattern, i.e.

return lm3601x_register_leds();

> +}

-- 
With Best Regards,
Andy Shevchenko
