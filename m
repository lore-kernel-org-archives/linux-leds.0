From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] leds: Add user LED driver for NIC78bx device
Date: Fri, 21 Oct 2016 23:11:48 +0200
Message-ID: <738565681.7bNtjkuhEA@vostro.rjw.lan>
References: <CGME20161021063441eucas1p221cdc9bd704f03ad367df8cf59fa35e6@eucas1p2.samsung.com> <335a9cd9-2af7-2d7c-12ab-1000dddbd0d6@samsung.com> <20161021130604.GX24289@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:48432 "HELO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with SMTP id S933950AbcJUVEv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 21 Oct 2016 17:04:51 -0400
In-Reply-To: <20161021130604.GX24289@lahna.fi.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Hui Chun Ong <hui.chun.ong@ni.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jonathan.hearn@ni.com, julia.cartwright@ni.com, Brad Mouring <brad.mouring@ni.com>

On Friday, October 21, 2016 04:06:04 PM Mika Westerberg wrote:
> On Fri, Oct 21, 2016 at 02:56:15PM +0200, Jacek Anaszewski wrote:
> > Hi Hui,
> > 
> > Thanks for the patch. I have few comments in the code below.
> > 
> > On 10/21/2016 08:33 AM, Hui Chun Ong wrote:
> > > Add the driver to support User LEDs on PXI Embedded Controller.
> > > 
> > > Signed-off-by: Hui Chun Ong <hui.chun.ong@ni.com>
> > > Signed-off-by: Brad Mouring <brad.mouring@ni.com>
> > > ---
> > >  drivers/leds/Kconfig       |  11 +++
> > >  drivers/leds/Makefile      |   1 +
> > >  drivers/leds/leds-ni78bx.c | 210 +++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 222 insertions(+)
> > >  create mode 100644 drivers/leds/leds-ni78bx.c
> > > 
> > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > index 7a628c6..5540795 100644
> > > --- a/drivers/leds/Kconfig
> > > +++ b/drivers/leds/Kconfig
> > > @@ -659,6 +659,17 @@ config LEDS_MLXCPLD
> > >  	  This option enabled support for the LEDs on the Mellanox
> > >  	  boards. Say Y to enabled these.
> > > 
> > > +config LEDS_NI78BX
> > > +	tristate "LED support for NI PXI NIC78bx devices"
> > > +	depends on LEDS_CLASS
> > > +	depends on X86 && ACPI
> > > +	help
> > > +	  This option enables support for the User1 and User2 LEDs on NI
> > > +	  PXI NIC78bx devices.
> > > +
> > > +	  To compile this driver as a module, choose M here: the module
> > > +	  will be called leds-ni78bx.
> > > +
> > >  comment "LED Triggers"
> > >  source "drivers/leds/trigger/Kconfig"
> > > 
> > > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > > index 3965070..9758d1e 100644
> > > --- a/drivers/leds/Makefile
> > > +++ b/drivers/leds/Makefile
> > > @@ -71,6 +71,7 @@ obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
> > >  obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
> > >  obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
> > >  obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
> > > +obj-$(CONFIG_LEDS_NI78BX)		+= leds-ni78bx.o
> > > 
> > >  # LED SPI Drivers
> > >  obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> > > diff --git a/drivers/leds/leds-ni78bx.c b/drivers/leds/leds-ni78bx.c
> > > new file mode 100644
> > > index 0000000..3da4675
> > > --- /dev/null
> > > +++ b/drivers/leds/leds-ni78bx.c
> > > @@ -0,0 +1,210 @@
> > > +/*
> > > + * Copyright (C) 2016 National Instruments Corp.
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify
> > > + * it under the terms of the GNU General Public License as published by
> > > + * the Free Software Foundation; either version 2 of the License, or
> > > + * (at your option) any later version.
> > > + *
> > > + * This program is distributed in the hope that it will be useful,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + * GNU General Public License for more details.
> > > + */
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <linux/leds.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +
> > > +#define USER1_LED_MASK		0x3
> > > +#define USER1_GREEN_LED		BIT(0)
> > > +#define USER1_YELLOW_LED	BIT(1)
> > > +
> > > +#define USER2_LED_MASK		0xC
> > > +#define USER2_GREEN_LED		BIT(2)
> > > +#define USER2_YELLOW_LED	BIT(3)
> > > +
> > > +#define LOCK_REG_OFFSET		1
> > > +#define LOCK_VALUE		0xA5
> > > +#define UNLOCK_VALUE		0x5A
> > 
> > Please add NIC78BX namespacing prefix to these macros.
> > 
> > > +
> > > +#define USER_LED_IO_SIZE	2
> > > +
> > > +static u16 io_base;
> > > +static DEFINE_MUTEX(led_lock);
> > 
> > Don't define static variables but instead create a struct that
> > will aggregate them and allocate it dynamically.
> > 
> > > +
> > > +struct ni78bx_led {
> > > +	u8 bit;
> > > +	u8 mask;
> > > +	struct led_classdev cdev;
> > > +};
> > > +
> > > +static inline struct ni78bx_led *to_ni78bx_led(struct led_classdev *cdev)
> > > +{
> > > +	return container_of(cdev, struct ni78bx_led, cdev);
> > > +}
> > > +
> > > +static void ni78bx_brightness_set(struct led_classdev *cdev,
> > > +				  enum led_brightness brightness)
> > > +{
> > > +	struct ni78bx_led *nled = to_ni78bx_led(cdev);
> > > +	u8 value;
> > > +
> > > +	mutex_lock(&led_lock);
> > 
> > You can use spin_lock_irqsave() instead, since we are not going to sleep
> > while accessing memory mapped registers.
> > 
> > Note that in the opposite case you would have to use
> > brightness_set_blocking op.
> > 
> > > +
> > > +	value = inb(io_base);
> > > +
> > > +	if (brightness) {
> > > +		value &= ~nled->mask;
> > > +		value |= nled->bit;
> > > +	} else {
> > > +		value &= ~nled->bit;
> > > +	}
> > > +
> > > +	outb(value, io_base);
> > > +	mutex_unlock(&led_lock);
> > > +}
> > > +
> > > +static enum led_brightness ni78bx_brightness_get(struct led_classdev *cdev)
> > > +{
> > > +	struct ni78bx_led *nled = to_ni78bx_led(cdev);
> > > +	u8 value;
> > > +
> > > +	mutex_lock(&led_lock);
> > > +	value = inb(io_base);
> > > +	mutex_unlock(&led_lock);
> > > +
> > > +	return (value & nled->bit) ? 1 : LED_OFF;
> > > +}
> > > +
> > > +static struct ni78bx_led ni78bx_leds[] = {
> > > +	{
> > > +		.bit = USER1_GREEN_LED,
> > > +		.mask = USER1_LED_MASK,
> > > +		.cdev = {
> > > +			.name = "nilrt:green:user1",
> > > +			.max_brightness = 1,
> > > +			.brightness_set = ni78bx_brightness_set,
> > > +			.brightness_get = ni78bx_brightness_get,
> > > +		}
> > > +	},
> > > +	{
> > > +		.bit = USER1_YELLOW_LED,
> > > +		.mask = USER1_LED_MASK,
> > > +		.cdev = {
> > > +			.name = "nilrt:yellow:user1",
> > > +			.max_brightness = 1,
> > > +			.brightness_set = ni78bx_brightness_set,
> > > +			.brightness_get = ni78bx_brightness_get,
> > > +		}
> > > +	},
> > > +	{
> > > +		.bit = USER2_GREEN_LED,
> > > +		.mask = USER2_LED_MASK,
> > > +		.cdev = {
> > > +			.name = "nilrt:green:user2",
> > > +			.max_brightness = 1,
> > > +			.brightness_set = ni78bx_brightness_set,
> > > +			.brightness_get = ni78bx_brightness_get,
> > > +		}
> > > +	},
> > > +	{
> > > +		.bit = USER2_YELLOW_LED,
> > > +		.mask = USER2_LED_MASK,
> > > +		.cdev = {
> > > +			.name = "nilrt:yellow:user2",
> > > +			.max_brightness = 1,
> > > +			.brightness_set = ni78bx_brightness_set,
> > > +			.brightness_get = ni78bx_brightness_get,
> > > +		}
> > > +	}
> > > +};
> > > +
> > > +static acpi_status
> > > +ni78bx_resources(struct acpi_resource *res, void *data)
> > > +{
> > > +	struct acpi_device *led = data;
> > > +	u16 io_size;
> > > +
> > > +	switch (res->type) {
> > > +	case ACPI_RESOURCE_TYPE_IO:
> > > +		if (io_base != 0) {
> > > +			dev_err(&led->dev, "too many IO resources\n");
> > > +			return AE_ERROR;
> > > +		}
> > > +
> > > +		io_base = res->data.io.minimum;
> > > +		io_size = res->data.io.address_length;
> > > +
> > > +		if (io_size < USER_LED_IO_SIZE) {
> > > +			dev_err(&led->dev, "memory region too small\n");
> > > +			return AE_ERROR;
> > > +		}
> > > +
> > > +		if (!devm_request_region(&led->dev, io_base, io_size,
> > > +					 KBUILD_MODNAME)) {
> > > +			dev_err(&led->dev, "failed to get memory region\n");
> > > +			return AE_ERROR;
> > > +		}
> > > +
> > > +		return AE_OK;
> > > +
> > > +	default:
> > > +		/* Ignore unsupported resources */
> > > +		return AE_OK;
> > > +	}
> > > +}
> > > +
> > > +static int ni78bx_remove(struct acpi_device *pdev)
> > > +{
> > > +	/* Lock LED register */
> > > +	outb(LOCK_VALUE, io_base + LOCK_REG_OFFSET);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int ni78bx_add(struct acpi_device *pdev)
> > > +{
> > > +	int ret, i;
> > > +	acpi_status status;
> > > +
> > > +	status = acpi_walk_resources(pdev->handle, METHOD_NAME__CRS,
> > > +				     ni78bx_resources, pdev);
> > > +
> > > +	if (ACPI_FAILURE(status) || io_base == 0)
> > > +		return -ENODEV;
> > > +
> > > +	/* Unlock LED register */
> > > +	outb(UNLOCK_VALUE, io_base + LOCK_REG_OFFSET);
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(ni78bx_leds); i++) {
> > > +		ret = devm_led_classdev_register(&pdev->dev,
> > > +						 &ni78bx_leds[i].cdev);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct acpi_device_id led_device_ids[] = {
> > > +	{"NIC78B3", 0},
> > > +	{"", 0},
> > 
> > CC also ACPI maintainers.
> > 
> > > +};
> > > +MODULE_DEVICE_TABLE(acpi, led_device_ids);
> > > +
> > > +static struct acpi_driver led_acpi_driver = {
> 
> I think you want to have a platform driver here instead.

Ah, thanks for the heads-up Mika!

As a rule, struct acpi_driver can only be used by things in drivers/acpi/.

If you think you need it *anyway*, the patch must be CCed to linux-acpi and
it is unlikely to be approved unless you have a very good reason to use
struct acpi_driver and very convincing arguments to support that.

Thanks,
Rafael
