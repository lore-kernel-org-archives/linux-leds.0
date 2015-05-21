From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/2] leds: add BCM6358 LED driver
Date: Thu, 21 May 2015 12:58:39 +0200
Message-ID: <555DBA5F.9040906@samsung.com>
References: <1432055578-14089-1-git-send-email-noltari@gmail.com>
 <1432055578-14089-3-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:14648 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753074AbbEUK6n (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 May 2015 06:58:43 -0400
In-reply-to: <1432055578-14089-3-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, cooloney@gmail.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com

Hi Alvaro,

Please fix the issues reported by checkpatch --strict.
Besides I have one comment below.

On 05/19/2015 07:12 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> This adds support for the LED controller on Broadcom's BCM6358.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>   drivers/leds/Kconfig        |   8 ++
>   drivers/leds/Makefile       |   1 +
>   drivers/leds/leds-bcm6358.c | 241 +++++++++++++++++++++++++++++++++=
+++++++++++
>   3 files changed, 250 insertions(+)
>   create mode 100644 drivers/leds/leds-bcm6358.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index ec26dd1..86de046 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -58,6 +58,14 @@ config LEDS_BCM6328
>   	  This option enables support for LEDs connected to the BCM6328
>   	  LED HW controller accessed via MMIO registers.
>
> +config LEDS_BCM6358
> +	tristate "LED Support for Broadcom BCM6358"
> +	depends on LEDS_CLASS
> +	depends on OF
> +	help
> +	  This option enables support for LEDs connected to the BCM6358
> +	  LED HW controller accessed via MMIO registers.
> +
>   config LEDS_LM3530
>   	tristate "LCD Backlight driver for LM3530"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index edb3abf..8d6a24a 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+=3D led-triggers.o
>   obj-$(CONFIG_LEDS_88PM860X)		+=3D leds-88pm860x.o
>   obj-$(CONFIG_LEDS_AAT1290)		+=3D leds-aat1290.o
>   obj-$(CONFIG_LEDS_BCM6328)		+=3D leds-bcm6328.o
> +obj-$(CONFIG_LEDS_BCM6358)		+=3D leds-bcm6358.o
>   obj-$(CONFIG_LEDS_BD2802)		+=3D leds-bd2802.o
>   obj-$(CONFIG_LEDS_LOCOMO)		+=3D leds-locomo.o
>   obj-$(CONFIG_LEDS_LM3530)		+=3D leds-lm3530.o
> diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.=
c
> new file mode 100644
> index 0000000..4a3a6c3
> --- /dev/null
> +++ b/drivers/leds/leds-bcm6358.c
> @@ -0,0 +1,241 @@
> +/*
> + * Driver for BCM6358 memory-mapped LEDs, based on leds-syscon.c
> + *
> + * Copyright 2015 =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.co=
m>
> + *
> + * This program is free software; you can redistribute  it and/or mo=
dify it
> + * under  the terms of  the GNU General  Public License as published=
 by the
> + * Free Software Foundation;  either version 2 of the  License, or (=
at your
> + * option) any later version.
> + */
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +
> +#define BCM6358_REG_MODE		0x0
> +#define BCM6358_REG_CTRL		0x4
> +
> +#define BCM6358_SLED_CLKDIV_MASK	3
> +#define BCM6358_SLED_CLKDIV_1		0
> +#define BCM6358_SLED_CLKDIV_2		1
> +#define BCM6358_SLED_CLKDIV_4		2
> +#define BCM6358_SLED_CLKDIV_8		3
> +
> +#define BCM6358_SLED_POLARITY		BIT(2)
> +#define BCM6358_SLED_BUSY		BIT(3)
> +
> +#define BCM6358_SLED_MAX_COUNT		32
> +#define BCM6358_SLED_WAIT		100
> +
> +/**
> + * struct bcm6358_led - state container for bcm6358 based LEDs
> + * @cdev: LED class device for this LED
> + * @mem: memory resource
> + * @lock: memory lock
> + * @pin: LED pin number
> + * @active_low: LED is active low
> + */
> +struct bcm6358_led {
> +	struct led_classdev cdev;
> +	void __iomem *mem;
> +	spinlock_t *lock;
> +	unsigned long pin;
> +	bool active_low;
> +};
> +
> +static void bcm6358_led_write(void __iomem *reg, unsigned long data)
> +{
> +	iowrite32be(data, reg);
> +}
> +
> +static unsigned long bcm6358_led_read(void __iomem *reg)
> +{
> +	return ioread32be(reg);
> +}
> +
> +static unsigned long bcm6358_led_busy(void __iomem *mem)
> +{
> +	unsigned long val;
> +
> +	while ((val =3D bcm6358_led_read(mem + BCM6358_REG_CTRL)) &
> +		BCM6358_SLED_BUSY)
> +		udelay(BCM6358_SLED_WAIT);
> +
> +	return val;
> +}
> +
> +static void bcm6358_led_mode(struct bcm6358_led *led, unsigned long =
value)
> +{
> +	unsigned long val;
> +
> +	bcm6358_led_busy(led->mem);
> +
> +	val =3D bcm6358_led_read(led->mem + BCM6358_REG_MODE);
> +	if ((led->active_low && value =3D=3D LED_OFF) ||
> +	    (!led->active_low && value !=3D LED_OFF))
> +		val |=3D BIT(led->pin);
> +	else
> +		val &=3D ~(BIT(led->pin));
> +	bcm6358_led_write(led->mem + BCM6358_REG_MODE, val);
> +}
> +
> +static void bcm6358_led_set(struct led_classdev *led_cdev,
> +			    enum led_brightness value)
> +{
> +	struct bcm6358_led *led =3D
> +		container_of(led_cdev, struct bcm6358_led, cdev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(led->lock, flags);
> +	bcm6358_led_mode(led, value);
> +	spin_unlock_irqrestore(led->lock, flags);
> +}
> +
> +static int bcm6358_led(struct device *dev, struct device_node *nc, u=
32 reg,
> +		       void __iomem *mem, spinlock_t *lock)
> +{
> +	struct bcm6358_led *led;
> +	unsigned long flags;
> +	const char *state;
> +	int rc;
> +
> +	led =3D devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	led->pin =3D reg;
> +	led->mem =3D mem;
> +	led->lock =3D lock;
> +
> +	if (of_property_read_bool(nc, "active-low"))
> +		led->active_low =3D true;
> +
> +	led->cdev.name =3D of_get_property(nc, "label", NULL) ? : nc->name;
> +	led->cdev.default_trigger =3D of_get_property(nc,
> +						    "linux,default-trigger",
> +						    NULL);
> +
> +	spin_lock_irqsave(lock, flags);
> +	if (!of_property_read_string(nc, "default-state", &state))
> +		if (!strcmp(state, "on"))
> +			led->cdev.brightness =3D LED_FULL;
> +		else if (!strcmp(state, "keep")) {
> +			unsigned long val;
> +
> +			bcm6358_led_busy(led->mem);
> +
> +			val =3D bcm6358_led_read(led->mem + BCM6358_REG_MODE);
> +			val &=3D BIT(led->pin);
> +			if ((led->active_low && !val) ||
> +				(!led->active_low && val))
> +				led->cdev.brightness =3D LED_FULL;
> +			else
> +				led->cdev.brightness =3D LED_OFF;
> +		} else
> +			led->cdev.brightness =3D LED_OFF;
> +	else
> +		led->cdev.brightness =3D LED_OFF;
> +	bcm6358_led_mode(led, led->cdev.brightness);
> +	spin_unlock_irqrestore(lock, flags);
> +
> +	led->cdev.brightness_set =3D bcm6358_led_set;
> +
> +	rc =3D led_classdev_register(dev, &led->cdev);
> +	if (rc < 0)
> +		return rc;
> +
> +	dev_dbg(dev, "registered LED %s\n", led->cdev.name);
> +
> +	return 0;
> +}
> +
> +static int bcm6358_leds_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct device_node *child;
> +	struct resource *mem_r;
> +	void __iomem *mem;
> +	spinlock_t *lock;
> +	unsigned long val;
> +	u32 clk_div;
> +
> +	mem_r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!mem_r)
> +		return -EINVAL;
> +
> +	mem =3D devm_ioremap_resource(dev, mem_r);
> +	if (IS_ERR(mem))
> +		return PTR_ERR(mem);
> +
> +	lock =3D devm_kzalloc(dev, sizeof(*lock), GFP_KERNEL);
> +	if (!lock)
> +		return -ENOMEM;
> +
> +	spin_lock_init(lock);
> +
> +	val =3D bcm6358_led_busy(mem);
> +	val &=3D ~(BCM6358_SLED_POLARITY | BCM6358_SLED_CLKDIV_MASK);
> +	if (of_property_read_bool(np, "brcm,clk-dat-low"))
> +		val |=3D BCM6358_SLED_POLARITY;
> +	of_property_read_u32(child, "brcm,clk-div", &clk_div);

child is uninitialized here

> +	switch (clk_div) {
> +	case 8:
> +		val |=3D BCM6358_SLED_CLKDIV_8;
> +		break;
> +	case 4:
> +		val |=3D BCM6358_SLED_CLKDIV_4;
> +		break;
> +	case 2:
> +		val |=3D BCM6358_SLED_CLKDIV_2;
> +		break;
> +	default:
> +		val |=3D BCM6358_SLED_CLKDIV_1;
> +		break;
> +	}
> +	bcm6358_led_write(mem + BCM6358_REG_CTRL, val);
> +
> +	for_each_available_child_of_node(np, child) {
> +		int rc;
> +		u32 reg;
> +
> +		if (of_property_read_u32(child, "reg", &reg))
> +			continue;
> +
> +		if (reg >=3D BCM6358_SLED_MAX_COUNT) {
> +			dev_err(dev, "invalid LED (%u >=3D %d)\n", reg,
> +				BCM6358_SLED_MAX_COUNT);
> +			continue;
> +		}
> +
> +		rc =3D bcm6358_led(dev, child, reg, mem, lock);
> +		if (rc < 0)
> +			return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id bcm6358_leds_of_match[] =3D {
> +	{ .compatible =3D "brcm,bcm6358-leds", },
> +	{ },
> +};
> +
> +static struct platform_driver bcm6358_leds_driver =3D {
> +	.probe =3D bcm6358_leds_probe,
> +	.driver =3D {
> +		.name =3D "leds-bcm6358",
> +		.of_match_table =3D bcm6358_leds_of_match,
> +	},
> +};
> +
> +module_platform_driver(bcm6358_leds_driver);
> +
> +MODULE_AUTHOR("=C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>"=
);
> +MODULE_DESCRIPTION("LED driver for BCM6358 controllers");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:leds-bcm6358");
>


--=20
Best Regards,
Jacek Anaszewski
