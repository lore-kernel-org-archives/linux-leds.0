From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard LEDs driver
Date: Tue, 23 Feb 2016 09:18:10 +0100
Message-ID: <56CC15C2.2060003@samsung.com>
References: <1456156814-9619-1-git-send-email-aeroevan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28235 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932551AbcBWISO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2016 03:18:14 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2Z005M9R2CXB50@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 23 Feb 2016 08:18:12 +0000 (GMT)
In-reply-to: <1456156814-9619-1-git-send-email-aeroevan@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Evan McClain <aeroevan@gmail.com>
Cc: linux-leds@vger.kernel.org, Simon Que <sque@chromium.org>, Duncan Laurie <dlaurie@chromium.org>

Hi Evan,

There are still problems - the patch doesn't apply cleanly due to
conflicts with drivers/leds/Kconfig and drivers/leds/Makefile.
Please rebase the patch on top of LED git, for-next branch:

git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git

Best regards,
Jacek Anaszewski

On 02/22/2016 05:00 PM, Evan McClain wrote:
> From: Simon Que <sque@chromium.org>
>
> Some Chrome OS devices use ACPI-based keyboard backlight LEDs.
>
> Enable with menuconfig option under Device Drivers -> LED Support.
>
> Signed-off-by: Simon Que <sque@chromium.org>
> Signed-off-by: Duncan Laurie <dlaurie@chromium.org>
> Signed-off-by: Evan McClain <aeroevan@gmail.com>
> ---
>   drivers/leds/Kconfig                  |   7 ++
>   drivers/leds/Makefile                 |   1 +
>   drivers/leds/leds-chromeos-keyboard.c | 118 ++++++++++++++++++++++++++++++++++
>   3 files changed, 126 insertions(+)
>   create mode 100644 drivers/leds/leds-chromeos-keyboard.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 7f940c2..38d2997 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -607,6 +607,13 @@ config LEDS_VERSATILE
>   	  This option enabled support for the LEDs on the ARM Versatile
>   	  and RealView boards. Say Y to enabled these.
>
> +config LEDS_CHROMEOS_KEYBOARD
> +	tristate "LED support for Chrome OS keyboards"
> +	depends on LEDS_CLASS && ACPI
> +	help
> +	  This option enables support for the LEDs on Chrome OS keyboards.
> +	  Say Y to enable keyboard LEDs on Chrome OS systems.
> +
>   comment "LED Triggers"
>   source "drivers/leds/trigger/Kconfig"
>
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index e9d53092..2d7f73a 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
>   obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
>   obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
>   obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
> +obj-$(CONFIG_LEDS_CHROMEOS_KEYBOARD)	+= leds-chromeos-keyboard.o
>
>   # LED SPI Drivers
>   obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> diff --git a/drivers/leds/leds-chromeos-keyboard.c b/drivers/leds/leds-chromeos-keyboard.c
> new file mode 100644
> index 0000000..4e56ede
> --- /dev/null
> +++ b/drivers/leds/leds-chromeos-keyboard.c
> @@ -0,0 +1,118 @@
> +/*
> + *  LED driver for Chrome OS keyboard backlight
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
> +	if (!(cdev->flags & LED_SUSPENDED))
> +		cdev->brightness = brightness;
> +
> +	param.type = ACPI_TYPE_INTEGER;
> +	param.integer.value = brightness;
> +	input.count = 1;
> +	input.pointer = &param;
> +
> +	status = acpi_evaluate_object(NULL, ACPI_KEYBOARD_BACKLIGHT_WRITE,
> +					  &input, NULL);
> +	if (ACPI_FAILURE(status))
> +		dev_err(cdev->dev, "Error setting keyboard LED value");
> +}
> +
> +static int keyboard_led_probe(struct platform_device *pdev)
> +{
> +	struct led_classdev *cdev;
> +	acpi_handle handle;
> +	acpi_status status;
> +	int ret;
> +
> +	/* Look for the keyboard LED ACPI Device */
> +	status = acpi_get_handle(ACPI_ROOT_OBJECT,
> +				 ACPI_KEYBOARD_BACKLIGHT_DEVICE,
> +				 &handle);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&pdev->dev, "Unable fo find ACPI device %s\n",
> +			ACPI_KEYBOARD_BACKLIGHT_DEVICE);
> +		return -ENODEV;
> +	}
> +
> +	cdev = devm_kzalloc(&pdev->dev, sizeof(struct led_classdev), GFP_KERNEL);
> +	if (!cdev)
> +		return -ENOMEM;
> +	cdev->name = "chromeos::kbd_backlight";
> +	cdev->brightness_set = keyboard_led_set_brightness;
> +	cdev->max_brightness = ACPI_KEYBOARD_BACKLIGHT_MAX;
> +	cdev->brightness = cdev->max_brightness;
> +	cdev->flags |= LED_CORE_SUSPENDRESUME;
> +
> +	ret = devm_led_classdev_register(&pdev->dev, cdev);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, cdev);
> +	return 0;
> +}
> +
> +static int keyboard_led_remove(struct platform_device *pdev)
> +{
> +	struct led_classdev *cdev = platform_get_drvdata(pdev);
> +
> +	platform_set_drvdata(pdev, NULL);
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
> +		.owner	= THIS_MODULE,
> +		.acpi_match_table = ACPI_PTR(keyboard_led_id),
> +	},
> +	.probe		= keyboard_led_probe,
> +	.remove		= keyboard_led_remove,
> +};
> +
> +module_platform_driver(keyboard_led_driver);
> +
> +MODULE_AUTHOR("Simon Que <sque@chromium.org>");
> +MODULE_DESCRIPTION("ChromeOS Keyboard LED Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:chromeos-keyboard-leds");
>
