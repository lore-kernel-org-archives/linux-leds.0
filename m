From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/1] leds: Add driver for PC Engines APU/APU2 LEDs
Date: Thu, 21 Sep 2017 22:46:52 +0200
Message-ID: <5803b209-f857-d339-a98b-6e3d6b1dca6c@gmail.com>
References: <20170917033529.GA12375@olympus.mizrahi.com.ve>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:34053 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751707AbdIUUrr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Sep 2017 16:47:47 -0400
Received: by mail-wr0-f194.google.com with SMTP id k20so3714035wre.1
        for <linux-leds@vger.kernel.org>; Thu, 21 Sep 2017 13:47:46 -0700 (PDT)
In-Reply-To: <20170917033529.GA12375@olympus.mizrahi.com.ve>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alan Mizrahi <alan@mizrahi.com.ve>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

Hi Alan,

Thanks for the patch. I have some comments in the code below,
please take a look.

On 09/17/2017 05:35 AM, Alan Mizrahi wrote:
> ---
>  drivers/leds/Kconfig    |  11 ++
>  drivers/leds/Makefile   |   1 +
>  drivers/leds/leds-apu.c | 295 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 307 insertions(+)
>  create mode 100644 drivers/leds/leds-apu.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 52ea34e..e5b3628 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -58,6 +58,17 @@ config LEDS_AAT1290
>  	help
>  	 This option enables support for the LEDs on the AAT1290.
>  
> +config LEDS_APU
> +	tristate "Front LED support for PC Engines APU/APU2 boards"

s/Front/Front panel/ ?

> +	depends on LEDS_CLASS
> +	depends on X86 && DMI
> +	help
> +	  This driver makes the PC Engines APU/APU2 front LEDs accessible from

s/front/front panel/

Unless documentation calls the LEDs exactly "front LEDs" ?

> +	  userspace programs through the leds subsystem.

s/leds/LED/

> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called leds-apu.
> +
>  config LEDS_AS3645A
>  	tristate "AS3645A LED flash controller support"
>  	depends on I2C && LEDS_CLASS_FLASH
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 7d7b265..69bc0bc 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
>  obj-$(CONFIG_LEDS_88PM860X)		+= leds-88pm860x.o
>  obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
>  obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
> +obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
>  obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
>  obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
>  obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
> diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
> new file mode 100644
> index 0000000..b8466a5
> --- /dev/null
> +++ b/drivers/leds/leds-apu.c
> @@ -0,0 +1,295 @@
> +/*
> + * drivers/leds/leds-apu.c
> + * Copyright (C) 2017 Alan Mizrahi, alan at mizrahi dot com dot ve
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions are met:
> + *
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + * 3. Neither the names of the copyright holders nor the names of its
> + *    contributors may be used to endorse or promote products derived from
> + *    this software without specific prior written permission.
> + *
> + * Alternatively, this software may be distributed under the terms of the
> + * GNU General Public License ("GPL") version 2 as published by the Free
> + * Software Foundation.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
> + * POSSIBILITY OF SUCH DAMAGE.
> + */
> +
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define APU1_FCH_ACPI_MMIO_BASE 0xFED80000
> +#define APU1_FCH_GPIO_BASE      (APU1_FCH_ACPI_MMIO_BASE + 0x01BD)
> +#define APU1_LEDON              0x08
> +#define APU1_LEDOFF             0xC8
> +#define APU1_NUM_GPIO           3
> +#define APU1_IOSIZE             sizeof(u8)
>
> +#define APU2_FCH_ACPI_MMIO_BASE 0xFED80000
> +#define APU2_FCH_GPIO_BASE      (APU2_FCH_ACPI_MMIO_BASE + 0x1500)
> +#define APU2_GPIO_BIT_WRITE     22
> +#define APU2_APU2_NUM_GPIO      4
> +#define APU2_IOSIZE             sizeof(u32)
> +
> +/* LED access parameters */
> +struct apu_param {
> +	void __iomem *addr; /* for ioread/iowrite */
> +};
> +
> +/* LED private data */
> +struct apu_led_priv {
> +	struct led_classdev cdev;
> +	struct apu_param param;
> +};
> +#define cdev_to_priv(c) container_of(c, struct apu_led_priv, cdev)
> +
> +/* LED profile */
> +struct apu_led_profile {
> +	const char *name;
> +	enum led_brightness brightness;
> +	unsigned long offset; /* for devm_ioremap */
> +};
> +
> +/* Supported platform types */
> +enum apu_led_platform_types {
> +	LED_PLATFORM_APU1,
> +	LED_PLATFORM_APU2,

LED prefix is reserved for LED core namespace.

Please change the enums to:

APU1_LED_PLATFORM
APU2_LED_PLATFORM


> +};
> +
> +struct apu_led_pdata {
> +	struct platform_device *pdev;
> +	struct apu_led_priv *pled;
> +	struct apu_led_profile *profile;
> +	enum apu_led_platform_types platform;
> +	int num_led_instances;
> +	int iosize; /* for devm_ioremap() */
> +	spinlock_t lock;
> +};
> +
> +static struct apu_led_pdata *apu_led;
> +
> +static struct apu_led_profile apu1_led_profile[] = {
> +	{ "apu:1", 1,       APU1_FCH_GPIO_BASE + 0 * APU1_IOSIZE },
> +	{ "apu:2", LED_OFF, APU1_FCH_GPIO_BASE + 1 * APU1_IOSIZE },
> +	{ "apu:3", LED_OFF, APU1_FCH_GPIO_BASE + 2 * APU1_IOSIZE },
> +};

Is brightness property needed at all in the struct apu_led_profile?
It is always initialized to LED_OFF.

> +
> +static struct apu_led_profile apu2_led_profile[] = {
> +	{ "apu2:1", 1,       APU2_FCH_GPIO_BASE + 68 * APU2_IOSIZE },
> +	{ "apu2:2", LED_OFF, APU2_FCH_GPIO_BASE + 69 * APU2_IOSIZE },
> +	{ "apu2:3", LED_OFF, APU2_FCH_GPIO_BASE + 70 * APU2_IOSIZE },
> +};
> +
> +static struct dmi_system_id apu_led_dmi_table[] __initdata = {
> +	{
> +		.ident = "apu",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "APU")
> +		}
> +	},
> +	{
> +		.ident = "apu2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_BOARD_NAME, "APU2")
> +		}
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);

You're currently not using this array anywhere. It is required when
dmi_check_system() is used in the driver.

> +static void apu1_led_brightness_set(struct led_classdev *led, enum led_brightness value)
> +{
> +	struct apu_led_priv *pled = cdev_to_priv(led);
> +
> +	spin_lock(&apu_led->lock);
> +	iowrite8(value ? APU1_LEDON : APU1_LEDOFF, pled->param.addr);
> +	spin_unlock(&apu_led->lock);
> +
> +	return;
> +}
> +
> +static void apu2_led_brightness_set(struct led_classdev *led, enum led_brightness value)
> +{
> +	struct apu_led_priv *pled = cdev_to_priv(led);
> +	u32 value_new;
> +
> +	spin_lock(&apu_led->lock);
> +
> +	value_new = ioread32(pled->param.addr);
> +
> +	if (value)
> +		value_new &= ~BIT(APU2_GPIO_BIT_WRITE);
> +	else
> +		value_new |= BIT(APU2_GPIO_BIT_WRITE);
> +
> +	iowrite32(value_new, pled->param.addr);
> +
> +	spin_unlock(&apu_led->lock);
> +	return;

This return instruction is redundant as the function returns void.

Please use scripts/checkpatch.pl to get rid also of other problems
it reports.

> +}
> +
> +/*
> + * Does the hardware support this?
> + *
> +static int apu1_led_blink_set(struct led_classdev *led, unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct apu_led_priv *pled = cdev_to_priv(led);
> +	return 0;
> +}
> +static int apu2_led_blink_set(struct led_classdev *led, unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct apu_led_priv *pled = cdev_to_priv(led);
> +	return 0;
> +}
> +*/

Please remove this piece of commented code.

> +
> +static int apu_led_config(struct device *dev, struct apu_led_pdata *apuld)
> +{
> +	int i;
> +	int err;
> +
> +	apu_led->pled = devm_kzalloc(dev, sizeof(struct apu_led_priv) * apu_led->num_led_instances, GFP_KERNEL);
> +
> +	if (!apu_led->pled)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < apu_led->num_led_instances; i++) {
> +		apu_led->pled[i].cdev.name = apu_led->profile[i].name;

It would improve readability if you used intermediary variables like:

struct apu_led_priv *pled = &apu_led->pled[i];
struct led_classdev *led_cdev = &pled->led_cdev;

led_cdev->name = apu_led->profile[i].name

and so on...

> +		apu_led->pled[i].cdev.brightness = apu_led->profile[i].brightness;
> +		apu_led->pled[i].cdev.max_brightness = 1;
> +		if (apu_led->platform == LED_PLATFORM_APU1) {
> +			apu_led->pled[i].cdev.brightness_set = apu1_led_brightness_set;
> +			/* apu_led->pled[i].cdev.blink_set   = apu1_led_blink_set; */

Why are you leaving this unimplemented actually? Is hw blinking feature
documented but doesn't work as advertised or so?

> +		} else if (apu_led->platform == LED_PLATFORM_APU2) {
> +			apu_led->pled[i].cdev.brightness_set = apu2_led_brightness_set;
> +			/* apu_led->pled[i].cdev.blink_set   = apu2_led_blink_set; */
> +		}
> +		apu_led->pled[i].cdev.flags = LED_CORE_SUSPENDRESUME;
> +
> +		err = led_classdev_register(dev, &apu_led->pled[i].cdev);
> +		if (err)
> +			goto error;

This should be the last instruction in this function.

> +
> +		apu_led->pled[i].param.addr = devm_ioremap(dev, apu_led->profile[i].offset, apu_led->iosize);
> +		if (!apu_led->pled[i].param.addr) {
> +			led_classdev_unregister(&apu_led->pled[i].cdev);
> +			err = -ENOMEM;
> +			goto error;
> +		}
> +
> +		if (apu_led->profile[i].brightness)
> +			apu_led->pled[i].cdev.brightness_set(&apu_led->pled[i].cdev, apu_led->profile[i].brightness);
> +	}
> +
> +	return 0;
> +
> +error:
> +	while (i-- > 0) {
> +                led_classdev_unregister(&apu_led->pled[i].cdev);
> +	}
> +
> +	return err;
> +}
> +
> +static int __init apu_led_probe(struct platform_device *pdev)
> +{
> +	apu_led = devm_kzalloc(&pdev->dev, sizeof(*apu_led), GFP_KERNEL);
> +
> +	if (!apu_led)
> +		return -ENOMEM;
> +
> +	apu_led->pdev = pdev;
> +
> +	if (dmi_match(DMI_BOARD_NAME, "APU")) {
> +		apu_led->profile = apu1_led_profile;
> +		apu_led->platform = LED_PLATFORM_APU1;
> +		apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
> +		apu_led->iosize = APU1_IOSIZE;
> +	} else if (dmi_match(DMI_BOARD_NAME, "APU2")) {
> +		apu_led->profile = apu2_led_profile;
> +		apu_led->platform = LED_PLATFORM_APU2;
> +		apu_led->num_led_instances = ARRAY_SIZE(apu2_led_profile);
> +		apu_led->iosize = APU2_IOSIZE;
> +	}
> +
> +	spin_lock_init(&apu_led->lock);
> +	return apu_led_config(&pdev->dev, apu_led);
> +}
> +
> +static struct platform_driver apu_led_driver = {
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +	},
> +};
> +
> +static int __init apu_led_init(void)
> +{
> +	struct platform_device *pdev;
> +	int err;
> +
> +	if (!dmi_match(DMI_SYS_VENDOR, "PC Engines")) {
> +		pr_err("No PC Engines board detected\n");
> +		return -ENODEV;
> +	}
> +	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, "APU2"))) {
> +		printk(KERN_ERR "Unknown PC Engines board: %s\n", dmi_get_system_info(DMI_PRODUCT_NAME));
> +		return -ENODEV;
> +	}
> +
> +	pdev = platform_device_register_simple(KBUILD_MODNAME, -1, NULL, 0);
> +	if (IS_ERR(pdev)) {
> +		pr_err("Device allocation failed\n");
> +		return PTR_ERR(pdev);
> +	}
> +
> +	err = platform_driver_probe(&apu_led_driver, apu_led_probe);
> +	if (err) {
> +		pr_err("Probe platform driver failed\n");
> +		platform_device_unregister(pdev);
> +	}
> +
> +	return err;
> +}
> +
> +static void __exit apu_led_exit(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < apu_led->num_led_instances; i++)
> +		led_classdev_unregister(&apu_led->pled[i].cdev);
> +
> +	platform_device_unregister(apu_led->pdev);
> +	platform_driver_unregister(&apu_led_driver);
> +}
> +
> +module_init(apu_led_init);
> +module_exit(apu_led_exit);
> +
> +MODULE_AUTHOR("Alan Mizrahi");
> +MODULE_DESCRIPTION("PC Engines APU family LED driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:leds_apu");
> 

-- 
Best regards,
Jacek Anaszewski
