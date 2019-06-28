From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 05/26] leds: core: Add support for composing LED class
 device names
Date: Fri, 28 Jun 2019 09:46:14 +0100
Message-ID: <CACRpkdYdqKZVKSaQB0THi=iZcRT04EKX2-85__Hw1f53o8vsuw@mail.gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com> <20190609190803.14815-6-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609190803.14815-6-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, Dmitry Torokhov <dtor@google.com>, Guenter Roeck <linux@roeck-us.net>, Dan Murphy <dmurphy@ti.com>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

On Sun, Jun 9, 2019 at 8:08 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:

> Add generic support for composing LED class device name. The newly
> introduced led_compose_name() function composes device name according
> to either <color:function> or <devicename:color:function> pattern,
> depending on the configuration of initialization data.
>
> Backward compatibility with in-driver hard-coded LED class device
> names is assured thanks to the default_label and devicename properties
> of newly introduced struct led_init_data.
>
> In case none of the aforementioned properties was found, then, for OF
> nodes, the node name is adopted for LED class device name.
>
> At the occassion of amending the Documentation/leds/leds-class.txt
> unify spelling: colour -> color.
>
> Alongside these changes added is a new tool - tools/leds/get_led_device_info.sh.
> The tool allows retrieving details of a LED class device's parent device,
> which proves that using vendor or product name for devicename part
> of LED name doesn't convey any added value since that information had been
> already available in sysfs. The script performs also basic validation
> of a LED class device name.
>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Simon Shields <simon@lineageos.org>

This is good progress on trying to bring order in chaos.

A problem with LEDs is that it invites bikeshedding because it is too
relateable.

So by the motto "rough consensus and running code":
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
