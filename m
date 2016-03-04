From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard backlight LEDs driver
Date: Fri, 04 Mar 2016 10:38:24 +0100
Message-ID: <56D95790.9080301@samsung.com>
References: <20160303234646.GA17641@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:30311 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759428AbcCDJi3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Mar 2016 04:38:29 -0500
In-reply-to: <20160303234646.GA17641@dtor-ws>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>, Simon Que <sque@chromium.org>, Olof Johansson <olofj@chromium.org>, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Dmitry,

Thanks for the patch. There's already other pending version [1],
still to be decided where it should live.

[1] http://comments.gmane.org/gmane.linux.leds/4523

Best regards,
Jacek Anaszewski

On 03/04/2016 12:46 AM, Dmitry Torokhov wrote:
> From: Simon Que <sque@chromium.org>
>
> This is a driver for ACPI-based keyboard backlight LEDs found on
> Chromebooks. The driver locates \\_SB.KBLT ACPI device and exports
> backlight as "chromeos::kbd_backlight" LED class device in sysfs.
>
> Signed-off-by: Simon Que <sque@chromium.org>
> Signed-off-by: Duncan Laurie <dlaurie@chromium.org>
> Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
> ---
>   drivers/leds/Kconfig                  |  11 ++++
>   drivers/leds/Makefile                 |   1 +
>   drivers/leds/leds-chromeos-keyboard.c | 106 ++++++++++++++++++++++++++++++++++
>   3 files changed, 118 insertions(+)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f86527cf..02aaaf1 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -581,6 +581,17 @@ config LEDS_SN3218
>   	  This driver can also be built as a module. If so the module
>   	  will be called leds-sn3218.
>
> +config LEDS_CHROMEOS_KEYBOARD
> +	tristate "LED backlight support for Chrome OS keyboards"
> +	depends on LEDS_CLASS && ACPI
> +	depends on CHROME_PLATFORMS || COMPILE_TEST
> +	help
> +	  This option enables support for the keyboard backlight LEDs on
> +	  select Chrome OS systems.
> +
> +	  This driver can also be built as a module. If so the module
> +	  will be called leds-chromeos-keyboard.
> +
>   comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
>
>   config LEDS_BLINKM
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 89c9b6f..5b96d15 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
>   obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
>   obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
>   obj-$(CONFIG_LEDS_SN3218)		+= leds-sn3218.o
> +obj-$(CONFIG_LEDS_CHROMEOS_KEYBOARD)	+= leds-chromeos-keyboard.o
>
>   # LED SPI Drivers
>   obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> diff --git a/drivers/leds/leds-chromeos-keyboard.c b/drivers/leds/leds-chromeos-keyboard.c
> new file mode 100644
> index 0000000..3592f09
> --- /dev/null
> +++ b/drivers/leds/leds-chromeos-keyboard.c
> @@ -0,0 +1,106 @@
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
> +#define ACPI_KEYBOARD_BACKLIGHT_DEVICE	"\\_SB.KBLT"
> +#define ACPI_KEYBOARD_BACKLIGHT_READ	ACPI_KEYBOARD_BACKLIGHT_DEVICE ".KBQC"
> +#define ACPI_KEYBOARD_BACKLIGHT_WRITE	ACPI_KEYBOARD_BACKLIGHT_DEVICE ".KBCM"
> +
> +#define ACPI_KEYBOARD_BACKLIGHT_MAX		100
> +
> +static void keyboard_led_set_brightness(struct led_classdev *cdev,
> +					enum led_brightness brightness)
> +{
> +	union acpi_object param;
> +	struct acpi_object_list input;
> +	acpi_status status;
> +
> +	param.type = ACPI_TYPE_INTEGER;
> +	param.integer.value = brightness;
> +	input.count = 1;
> +	input.pointer = &param;
> +
> +	status = acpi_evaluate_object(NULL, ACPI_KEYBOARD_BACKLIGHT_WRITE,
> +				      &input, NULL);
> +	if (ACPI_FAILURE(status))
> +		dev_err(cdev->dev, "Error setting keyboard LED value: %d\n",
> +			status);
> +}
> +
> +static int keyboard_led_probe(struct platform_device *pdev)
> +{
> +	struct led_classdev *cdev;
> +	acpi_handle handle;
> +	acpi_status status;
> +	int error;
> +
> +	/* Look for the keyboard LED ACPI Device */
> +	status = acpi_get_handle(ACPI_ROOT_OBJECT,
> +				 ACPI_KEYBOARD_BACKLIGHT_DEVICE,
> +				 &handle);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&pdev->dev, "Unable to find ACPI device %s: %d\n",
> +			ACPI_KEYBOARD_BACKLIGHT_DEVICE, status);
> +		return -ENXIO;
> +	}
> +
> +	cdev = devm_kzalloc(&pdev->dev, sizeof(*cdev), GFP_KERNEL);
> +	if (!cdev)
> +		return -ENOMEM;
> +
> +	cdev->name = "chromeos::kbd_backlight";
> +	cdev->brightness_set = keyboard_led_set_brightness;
> +	cdev->max_brightness = ACPI_KEYBOARD_BACKLIGHT_MAX;
> +	cdev->brightness = cdev->max_brightness;
> +	cdev->flags |= LED_CORE_SUSPENDRESUME;
> +
> +	error = devm_led_classdev_register(&pdev->dev, cdev);
> +	if (error)
> +		return error;
> +
> +	platform_set_drvdata(pdev, cdev);
> +	return 0;
> +}
> +
> +static const struct acpi_device_id keyboard_led_id[] = {
> +	{ "GOOG0002", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, keyboard_led_id);
> +
> +static struct platform_driver keyboard_led_driver = {
> +	.driver		= {
> +		.name	= "chromeos-keyboard-leds",
> +		.acpi_match_table = ACPI_PTR(keyboard_led_id),
> +	},
> +	.probe		= keyboard_led_probe,
> +};
> +module_platform_driver(keyboard_led_driver);
> +
> +MODULE_AUTHOR("Simon Que <sque@chromium.org>");
> +MODULE_DESCRIPTION("ChromeOS Keyboard backlight LED Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:chromeos-keyboard-leds");
>
