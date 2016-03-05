From: Guenter Roeck <groeck@google.com>
Subject: Re: [PATCH] platform/chrome: Add Chrome OS keyboard backlight LEDs support
Date: Fri, 4 Mar 2016 17:50:04 -0800
Message-ID: <CABXOdTdU-Pd2hq9kbHB_Qihb+ugpFJvCv6H8BjAoBERpD6VyTA@mail.gmail.com>
References: <20160305012309.GA30176@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:36171 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759066AbcCEBuG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Mar 2016 20:50:06 -0500
Received: by mail-lb0-f182.google.com with SMTP id x1so79678331lbj.3
        for <linux-leds@vger.kernel.org>; Fri, 04 Mar 2016 17:50:05 -0800 (PST)
In-Reply-To: <20160305012309.GA30176@dtor-ws>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, Rhard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Duncan Laurie <dlaurie@chromium.org>, Simon Que <sque@chromium.org>, Bryan Wu <cooloney@gmail.com>, Guenter Roeck <groeck@chromium.org>, Evan McClain <aeroevan@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Fri, Mar 4, 2016 at 5:23 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> This is a driver for ACPI-based keyboard backlight LEDs found on
> Chromebooks. The driver locates \\_SB.KBLT ACPI device and exports
> backlight as "chromeos::kbd_backlight" LED class device in sysfs.
>
> Signed-off-by: Simon Que <sque@chromium.org>
> Signed-off-by: Duncan Laurie <dlaurie@chromium.org>
> Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
> ---
>
> Changes form previous submission:
>
> - moved from drivers/leds to drivers/platform/chrome
> - added method to retrieve brightness from ACPI
> - renamed to cros_kbd_led_backlight
> - config option renamed to CROS_KBD_LED_BACKLIGHT
> - no longer setting initial brightness to max brightness (although on
>   Pixel 1 - Link - ACPI initially reports 100 as brightness anyway)
>
> I ran this on Pixel 1; Evan, could you give it a spin on your Pixel 2?
>
> Thanks!
>
>  drivers/platform/chrome/Kconfig                  |  10 ++
>  drivers/platform/chrome/Makefile                 |  15 +--
>  drivers/platform/chrome/cros_kbd_led_backlight.c | 123 +++++++++++++++++++++++
>  3 files changed, 141 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index d03df4a..76bdae1 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -64,4 +64,14 @@ config CROS_EC_PROTO
>          help
>            ChromeOS EC communication protocol helpers.
>
> +config CROS_KBD_LED_BACKLIGHT
> +       tristate "Backlight LED support for Chrome OS keyboards"
> +       depends on LEDS_CLASS && ACPI
> +       help
> +         This option enables support for the keyboard backlight LEDs on
> +         select Chrome OS systems.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called cros_kbd_led_backlight.
> +
>  endif # CHROMEOS_PLATFORMS
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> index bc498bd..4f34627 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -1,8 +1,9 @@
>
> -obj-$(CONFIG_CHROMEOS_LAPTOP)  += chromeos_laptop.o
> -obj-$(CONFIG_CHROMEOS_PSTORE)  += chromeos_pstore.o
> -cros_ec_devs-objs              := cros_ec_dev.o cros_ec_sysfs.o \
> -                                  cros_ec_lightbar.o cros_ec_vbc.o
> -obj-$(CONFIG_CROS_EC_CHARDEV)   += cros_ec_devs.o
> -obj-$(CONFIG_CROS_EC_LPC)       += cros_ec_lpc.o
> -obj-$(CONFIG_CROS_EC_PROTO)    += cros_ec_proto.o
> +obj-$(CONFIG_CHROMEOS_LAPTOP)          += chromeos_laptop.o
> +obj-$(CONFIG_CHROMEOS_PSTORE)          += chromeos_pstore.o
> +cros_ec_devs-objs                      := cros_ec_dev.o cros_ec_sysfs.o \
> +                                          cros_ec_lightbar.o cros_ec_vbc.o
> +obj-$(CONFIG_CROS_EC_CHARDEV)          += cros_ec_devs.o
> +obj-$(CONFIG_CROS_EC_LPC)              += cros_ec_lpc.o
> +obj-$(CONFIG_CROS_EC_PROTO)            += cros_ec_proto.o
> +obj-$(CONFIG_CROS_KBD_LED_BACKLIGHT)   += cros_kbd_led_backlight.o
> diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
> new file mode 100644
> index 0000000..55477d7
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
> @@ -0,0 +1,123 @@
> +/*
> + *  Keyboard backlight LED driver for Chrome OS.
> + *
> + *  Copyright (C) 2012 Google, Inc.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/leds.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +/* Keyboard LED ACPI Device must be defined in firmware */
> +#define ACPI_KEYBOARD_BACKLIGHT_DEVICE "\\_SB.KBLT"
> +#define ACPI_KEYBOARD_BACKLIGHT_READ   ACPI_KEYBOARD_BACKLIGHT_DEVICE ".KBQC"
> +#define ACPI_KEYBOARD_BACKLIGHT_WRITE  ACPI_KEYBOARD_BACKLIGHT_DEVICE ".KBCM"
> +
> +#define ACPI_KEYBOARD_BACKLIGHT_MAX            100
> +
> +static void keyboard_led_set_brightness(struct led_classdev *cdev,
> +                                       enum led_brightness brightness)
> +{
> +       union acpi_object param;
> +       struct acpi_object_list input;
> +       acpi_status status;
> +
> +       param.type = ACPI_TYPE_INTEGER;
> +       param.integer.value = brightness;
> +       input.count = 1;
> +       input.pointer = &param;
> +
> +       status = acpi_evaluate_object(NULL, ACPI_KEYBOARD_BACKLIGHT_WRITE,
> +                                     &input, NULL);
> +       if (ACPI_FAILURE(status))
> +               dev_err(cdev->dev, "Error setting keyboard LED value: %d\n",
> +                       status);
> +}
> +
> +static enum led_brightness
> +keyboard_led_get_brightness(struct led_classdev *cdev)
> +{
> +       unsigned long long brightness;
> +       acpi_status status;
> +
> +       status = acpi_evaluate_integer(NULL, ACPI_KEYBOARD_BACKLIGHT_READ,
> +                                      NULL, &brightness);
> +       if (ACPI_FAILURE(status)) {
> +               dev_err(cdev->dev, "Error getting keyboard LED value: %d\n",
> +                       status);
> +               return -EIO;
> +       }
> +
> +       return brightness;
> +}
> +
> +static int keyboard_led_probe(struct platform_device *pdev)
> +{
> +       struct led_classdev *cdev;
> +       acpi_handle handle;
> +       acpi_status status;
> +       int error;
> +
> +       /* Look for the keyboard LED ACPI Device */
> +       status = acpi_get_handle(ACPI_ROOT_OBJECT,
> +                                ACPI_KEYBOARD_BACKLIGHT_DEVICE,
> +                                &handle);
> +       if (ACPI_FAILURE(status)) {
> +               dev_err(&pdev->dev, "Unable to find ACPI device %s: %d\n",
> +                       ACPI_KEYBOARD_BACKLIGHT_DEVICE, status);
> +               return -ENXIO;
> +       }
> +
> +       cdev = devm_kzalloc(&pdev->dev, sizeof(*cdev), GFP_KERNEL);
> +       if (!cdev)
> +               return -ENOMEM;
> +
> +       cdev->name = "chromeos::kbd_backlight";
> +       cdev->max_brightness = ACPI_KEYBOARD_BACKLIGHT_MAX;
> +       cdev->flags |= LED_CORE_SUSPENDRESUME;
> +       cdev->brightness_set = keyboard_led_set_brightness;
> +       cdev->brightness_get = keyboard_led_get_brightness;
> +
> +       error = devm_led_classdev_register(&pdev->dev, cdev);
> +       if (error)
> +               return error;
> +
> +       platform_set_drvdata(pdev, cdev);

Is this needed ?

Thanks,
Guenter

> +       return 0;
> +}
> +
> +static const struct acpi_device_id keyboard_led_id[] = {
> +       { "GOOG0002", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, keyboard_led_id);
> +
> +static struct platform_driver keyboard_led_driver = {
> +       .driver         = {
> +               .name   = "chromeos-keyboard-leds",
> +               .acpi_match_table = ACPI_PTR(keyboard_led_id),
> +       },
> +       .probe          = keyboard_led_probe,
> +};
> +module_platform_driver(keyboard_led_driver);
> +
> +MODULE_AUTHOR("Simon Que <sque@chromium.org>");
> +MODULE_DESCRIPTION("ChromeOS Keyboard backlight LED Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:chromeos-keyboard-leds");
> --
> 2.7.0.rc3.207.g0ac5344
>
>
> --
> Dmitry
