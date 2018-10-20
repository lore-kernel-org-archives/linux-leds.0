From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/3] leds: upboard: Add LED support
Date: Sat, 20 Oct 2018 14:17:58 +0300
Message-ID: <CAHp75VcOxBFvr4MSd=y61t7eFAv=9pFzMsumd7=2jbW3aZ4O4g@mail.gmail.com>
References: <20180421085009.28773-1-javier@emutex.com> <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-3-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539969334-24577-3-git-send-email-dan@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, carlos.iglesias@emutex.com, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On Fri, Oct 19, 2018 at 8:27 PM Dan O'Donovan <dan@emutex.com> wrote:
>
> From: Javier Arteaga <javier@emutex.com>
>
> Allow userspace to use the on-board LEDs as "upboard:<color>:".



> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/mfd/upboard.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/acpi.h>

For better maintenance keep this ordered.

> +       adev = ACPI_COMPANION(dev);
> +       if (!adev || strcmp(acpi_device_hid(adev), "AANT0F01"))
> +               return -ENODEV;

Why do you need this part?

> +       if (led_index >= ARRAY_SIZE(upboard_led_names))
> +               return -EINVAL;

> +       if (!dev->parent)
> +               return -EINVAL;

...I think this check will cover cases when driver is being probed standalone.
Otherwise it's caller's responsibility not to instantiate it if
platform doesn't have this LED feature.

> +       regmap = dev_get_regmap(dev->parent, NULL);
> +       if (!regmap)
> +               return -EINVAL;

-- 
With Best Regards,
Andy Shevchenko
