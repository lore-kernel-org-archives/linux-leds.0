From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: Add user LED driver for NIC78bx device
Date: Fri, 28 Oct 2016 12:08:57 +0200
Message-ID: <d61aa980-9519-df29-6fef-cc6e4ac182d6@samsung.com>
References: <CGME20161027110331epcas3p332bf735529a71e5c5efa66adf4312785@epcas3p3.samsung.com>
 <1477566173-124969-1-git-send-email-hui.chun.ong@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55265 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751549AbcJ1KJE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Oct 2016 06:09:04 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFR0061B5J0ZJ10@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 28 Oct 2016 11:09:00 +0100 (BST)
In-reply-to: <1477566173-124969-1-git-send-email-hui.chun.ong@ni.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hui Chun Ong <hui.chun.ong@ni.com>, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, jonathan.hearn@ni.com, julia.cartwright@ni.com, Brad Mouring <brad.mouring@ni.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Hui,

Thanks for the update.

On 10/27/2016 01:02 PM, Hui Chun Ong wrote:
> Add the driver to support User LEDs on PXI Embedded Controller.
>
> Signed-off-by: Hui Chun Ong <hui.chun.ong@ni.com>
> Signed-off-by: Brad Mouring <brad.mouring@ni.com>
> ---
> v1: Update code to use spinlock.
>     Change from acpi_driver to platform_driver.
>     Create struct ni78bx_led_data to aggregate static variables.
> ---
>  drivers/leds/Kconfig       |  11 +++
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-ni78bx.c | 209 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 drivers/leds/leds-ni78bx.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 7a628c6..5540795 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -659,6 +659,17 @@ config LEDS_MLXCPLD
>  	  This option enabled support for the LEDs on the Mellanox
>  	  boards. Say Y to enabled these.
>
> +config LEDS_NI78BX
> +	tristate "LED support for NI PXI NIC78bx devices"
> +	depends on LEDS_CLASS
> +	depends on X86 && ACPI
> +	help
> +	  This option enables support for the User1 and User2 LEDs on NI
> +	  PXI NIC78bx devices.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-ni78bx.
> +
>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"
>
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 3965070..9758d1e 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
>  obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
>  obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>  obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
> +obj-$(CONFIG_LEDS_NI78BX)		+= leds-ni78bx.o
>
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> diff --git a/drivers/leds/leds-ni78bx.c b/drivers/leds/leds-ni78bx.c
> new file mode 100644
> index 0000000..c5682ee
> --- /dev/null
> +++ b/drivers/leds/leds-ni78bx.c
> @@ -0,0 +1,209 @@
> +/*
> + * Copyright (C) 2016 National Instruments Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +
> +#define NIC78BX_USER1_LED_MASK		0x3
> +#define NIC78BX_USER1_GREEN_LED		BIT(0)
> +#define NIC78BX_USER1_YELLOW_LED	BIT(1)
> +
> +#define NIC78BX_USER2_LED_MASK		0xC
> +#define NIC78BX_USER2_GREEN_LED		BIT(2)
> +#define NIC78BX_USER2_YELLOW_LED	BIT(3)
> +
> +#define NIC78BX_LOCK_REG_OFFSET		1
> +#define NIC78BX_LOCK_VALUE		0xA5
> +#define NIC78BX_UNLOCK_VALUE		0x5A
> +
> +#define USER_LED_IO_SIZE		2

This macro also requires prefix.

> +
> +struct ni78bx_led_data {
> +	u16 io_base;
> +	spinlock_t lock;
> +	struct platform_device *pdev;
> +};
> +
> +struct ni78bx_led {
> +	u8 bit;
> +	u8 mask;
> +	struct ni78bx_led_data *data;
> +	struct led_classdev cdev;
> +};
> +
> +static inline struct ni78bx_led *to_ni78bx_led(struct led_classdev *cdev)
> +{
> +	return container_of(cdev, struct ni78bx_led, cdev);
> +}
> +
> +static void ni78bx_brightness_set(struct led_classdev *cdev,
> +				  enum led_brightness brightness)
> +{
> +	struct ni78bx_led *nled = to_ni78bx_led(cdev);
> +	unsigned long flags;
> +	u8 value;
> +
> +	spin_lock_irqsave(&nled->data->lock, flags);
> +	value = inb(nled->data->io_base);
> +
> +	if (brightness) {
> +		value &= ~nled->mask;
> +		value |= nled->bit;
> +	} else {
> +		value &= ~nled->bit;
> +	}
> +
> +	outb(value, nled->data->io_base);
> +	spin_unlock_irqrestore(&nled->data->lock, flags);
> +}
> +
> +static enum led_brightness ni78bx_brightness_get(struct led_classdev *cdev)
> +{
> +	struct ni78bx_led *nled = to_ni78bx_led(cdev);
> +	unsigned long flags;
> +	u8 value;
> +
> +	spin_lock_irqsave(&nled->data->lock, flags);
> +	value = inb(nled->data->io_base);
> +	spin_unlock_irqrestore(&nled->data->lock, flags);
> +
> +	return (value & nled->bit) ? 1 : LED_OFF;
> +}
> +
> +static struct ni78bx_led ni78bx_leds[] = {
> +	{
> +		.bit = NIC78BX_USER1_GREEN_LED,
> +		.mask = NIC78BX_USER1_LED_MASK,
> +		.cdev = {
> +			.name = "nilrt:green:user1",

Why nilrt prefix? There is some discrepancy in the naming allover
this patch. You have:

- NIC78bx in the commit title
- ni78bx in the function prefixes
- nilrt in the LED class device names

Please make it uniform. What actually the device name is?

> +			.max_brightness = 1,
> +			.brightness_set = ni78bx_brightness_set,
> +			.brightness_get = ni78bx_brightness_get,
> +		}
> +	},
> +	{
> +		.bit = NIC78BX_USER1_YELLOW_LED,
> +		.mask = NIC78BX_USER1_LED_MASK,
> +		.cdev = {
> +			.name = "nilrt:yellow:user1",
> +			.max_brightness = 1,
> +			.brightness_set = ni78bx_brightness_set,
> +			.brightness_get = ni78bx_brightness_get,
> +		}
> +	},
> +	{
> +		.bit = NIC78BX_USER2_GREEN_LED,
> +		.mask = NIC78BX_USER2_LED_MASK,
> +		.cdev = {
> +			.name = "nilrt:green:user2",
> +			.max_brightness = 1,
> +			.brightness_set = ni78bx_brightness_set,
> +			.brightness_get = ni78bx_brightness_get,
> +		}
> +	},
> +	{
> +		.bit = NIC78BX_USER2_YELLOW_LED,
> +		.mask = NIC78BX_USER2_LED_MASK,
> +		.cdev = {
> +			.name = "nilrt:yellow:user2",
> +			.max_brightness = 1,
> +			.brightness_set = ni78bx_brightness_set,
> +			.brightness_get = ni78bx_brightness_get,
> +		}
> +	}
> +};
> +
> +static int ni78bx_remove(struct platform_device *pdev)
> +{
> +	struct ni78bx_led_data *led_data = platform_get_drvdata(pdev);
> +
> +	/* Lock LED register */
> +	outb(NIC78BX_LOCK_VALUE,
> +	     led_data->io_base + NIC78BX_LOCK_REG_OFFSET);
> +
> +	return 0;
> +}
> +
> +static int ni78bx_add(struct platform_device *pdev)
> +{

s/add/probe/

Please also put ni78bx_remove() after this function.

> +	struct device *dev = &pdev->dev;
> +	struct ni78bx_led_data *led_data;
> +	struct resource *io_rc;
> +	int ret, i;
> +
> +	led_data = devm_kzalloc(dev, sizeof(*led_data), GFP_KERNEL);
> +	if (!led_data)
> +		return -ENOMEM;
> +
> +	led_data->pdev = pdev;
> +	platform_set_drvdata(pdev, led_data);
> +
> +	io_rc = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (!io_rc) {
> +		dev_err(dev, "missing IO resources\n");
> +		return -EINVAL;
> +	}
> +
> +	if (resource_size(io_rc) < USER_LED_IO_SIZE) {
> +		dev_err(dev, "IO region too small\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!devm_request_region(dev, io_rc->start, resource_size(io_rc),
> +				 KBUILD_MODNAME)) {
> +		dev_err(dev, "failed to get IO region\n");
> +		return -EBUSY;
> +	}
> +
> +	led_data->io_base = io_rc->start;
> +	spin_lock_init(&led_data->lock);
> +
> +	for (i = 0; i < ARRAY_SIZE(ni78bx_leds); i++) {
> +		ni78bx_leds[i].data = led_data;
> +
> +		ret = devm_led_classdev_register(dev, &ni78bx_leds[i].cdev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Unlock LED register */
> +	outb(NIC78BX_UNLOCK_VALUE,
> +	     led_data->io_base + NIC78BX_LOCK_REG_OFFSET);
> +
> +	return ret;
> +}
> +
> +static const struct acpi_device_id led_device_ids[] = {
> +	{"NIC78B3", 0},
> +	{"", 0},
> +};
> +MODULE_DEVICE_TABLE(acpi, led_device_ids);
> +
> +static struct platform_driver led_driver = {
> +	.probe = ni78bx_add,
> +	.remove = ni78bx_remove,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.acpi_match_table = ACPI_PTR(led_device_ids),

Please CC ACPI maintainers always if you include acpi.h
Cc Rafael and Mika.

> +	},
> +};
> +
> +module_platform_driver(led_driver);
> +
> +MODULE_DESCRIPTION("National Instruments PXI User LEDs driver");
> +MODULE_AUTHOR("Hui Chun Ong <hui.chun.ong@ni.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.7.4
>
>
>
>


-- 
Best regards,
Jacek Anaszewski
