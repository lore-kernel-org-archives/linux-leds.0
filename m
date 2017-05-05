From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/3]: Add PCEngines APU1 LEDs driver
Date: Fri, 5 May 2017 22:03:41 +0200
Message-ID: <d661e1a2-5e98-89de-3f34-b4b6a58bf934@gmail.com>
References: <e4bd8a8f-382c-57b6-084a-2f766660c6a9@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34013 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751245AbdEEUE0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 May 2017 16:04:26 -0400
Received: by mail-wm0-f67.google.com with SMTP id z129so3353947wmb.1
        for <linux-leds@vger.kernel.org>; Fri, 05 May 2017 13:04:25 -0700 (PDT)
In-Reply-To: <e4bd8a8f-382c-57b6-084a-2f766660c6a9@gmx.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Luigi Baldoni <aloisio@gmx.com>, linux-leds@vger.kernel.org

Hi Luigi,

Thanks for the patch. I have a couple of remarks, please refer below.

Starting from the patch title - let's stick to the LED subsystem scheme
- you'll get the flavor of it by executing "git log drivers/leds".

I'd see it as "leds: Add driver for PCEngines APU1/APU2 LEDs"

It's a common pattern to have a single driver for the same device
family.

On 05/04/2017 12:59 PM, Luigi Baldoni wrote:
> This patch adds the driver for the PCEngines APU1 LEDs.
> 
> Signed-off-by: Christian Herzog <daduke@daduke.org>
> 
> ---
>  drivers/leds/leds-apu.c  |  213 +++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 213 insertions(+)
> 
> Index: b/drivers/leds/leds-apu.c
> ===================================================================
> --- /dev/null
> +++ b/drivers/leds/leds-apu.c

You probably generated these patches with use of diff command, whereas
"git format-patch" should be used for that purpose.

The patch should apply properly with "git am" command.
Currently it doesn't.

> @@ -0,0 +1,213 @@
> +/*
> + * LEDs driver for PCEngines apu
> + *
> + * Copyright (C) 2017 Christian Herzog <daduke@daduke.org>, based on
> + * Petr Leibman's leds-alix
> + * Based on leds-wrap.c

Let's skip "based on" credits, this is very simple platform driver.

> + * Hardware info taken from
> http://www.dpie.com/manuals/miniboards/kontron/\
> +    KTD-S0043-0_KTA55_SoftwareGuide.pdf

This link is invalid.

> + * many thanks to Luigi Baldoni for his help

Please list Lugi as co-author or skip this line entirely.

If this is Christian who should appear as the driver author in the git
history, then he should commit the code with "git commit", and it will
be preserved no matter who will send the patch, provided that
"git format-patch" is used for generating the patch followed by
"git send-email" to finalize the submission.

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +#include <linux/leds.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/dmi.h>

Please sort these include directives in the lexicographical manner.

> +
> +#define DRVNAME            "apu-led"
> +#define FCH_ACPI_MMIO_BASE    0xFED80000
> +#define FCH_GPIO_BASE        (FCH_ACPI_MMIO_BASE + 0x1BD)
> +#define LEDON            0x8
> +#define LEDOFF            0xC8A

We have LED_ON and LED_OFF enums in linux/leds.h. These macros should
have APU_ namespacing prefix. But see below.

> +#define APU_NUM_GPIO        3
> +
> +
> +MODULE_AUTHOR("Christian Herzog <daduke@daduke.org>");
> +MODULE_DESCRIPTION("PCEngines apu LED driver");
> +MODULE_LICENSE("GPL");

Please move these entries at the bottom of the file.

> +
> +static int __init apu_led_dmi_callback(const struct dmi_system_id *id)
> +{
> +    pr_info("'%s' found\n", id->ident);
> +    return 1;
> +}
> +
> +static struct dmi_system_id apu_led_dmi_table[] __initdata = {
> +    {
> +        .callback = apu_led_dmi_callback,
> +        .ident = "apu",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "PCEngines"),
> +            DMI_MATCH(DMI_PRODUCT_NAME, "APU")
> +        }
> +    },
> +    { }
> +};
> +MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);

You're not calling dmi_match() anywhere.

I suggest you to follow leds-mlxcpld.c. You could create
apu1_led_profile and apu2_led_profile arrays similarly to
mlxcpld_led_msn2100_profile. The array element could contain
also led_on and led_off values to be written to the relevant
registers, which would allow you to avoid LEDON and LEDOFF macros.

> +static u8 gpio_offset[APU_NUM_GPIO] = {0, 1, 2};

Offsets should also go the that array.

> +static void __iomem *gpio_addr[APU_NUM_GPIO];
> +
> +static struct platform_device *pdev;
> +
> +static void apu_led_set_1(struct led_classdev *led_cdev,
> +        enum led_brightness value) {

You need spin lock protection here.

> +    if (value)
> +        iowrite8(LEDON, gpio_addr[0]);
> +    else
> +        iowrite8(LEDOFF, gpio_addr[0]);
> +}
> +
> +static void apu_led_set_2(struct led_classdev *led_cdev,
> +        enum led_brightness value) {
> +    if (value)
> +        iowrite8(LEDON, gpio_addr[1]);
> +    else
> +        iowrite8(LEDOFF, gpio_addr[1]);
> +}
> +
> +static void apu_led_set_3(struct led_classdev *led_cdev,
> +        enum led_brightness value) {
> +    if (value)
> +        iowrite8(LEDON, gpio_addr[2]);
> +    else
> +        iowrite8(LEDOFF, gpio_addr[2]);
> +}
> +
> +static struct led_classdev apu_led_1 = {
> +    .name        = "apu:1",
> +    .brightness_set    = apu_led_set_1,
> +};
> +
> +static struct led_classdev apu_led_2 = {
> +    .name        = "apu:2",
> +    .brightness_set    = apu_led_set_2,
> +};
> +
> +static struct led_classdev apu_led_3 = {
> +    .name        = "apu:3",
> +    .brightness_set    = apu_led_set_3,
> +};
> +
> +#ifdef CONFIG_PM
> +static int apu_led_suspend(struct platform_device *dev,
> +        pm_message_t state)
> +{
> +    led_classdev_suspend(&apu_led_1);
> +    led_classdev_suspend(&apu_led_2);
> +    led_classdev_suspend(&apu_led_3);
> +    return 0;
> +}
> +
> +static int apu_led_resume(struct platform_device *dev)
> +{
> +    led_classdev_resume(&apu_led_1);
> +    led_classdev_resume(&apu_led_2);
> +    led_classdev_resume(&apu_led_3);
> +    return 0;
> +}
> +#else
> +#define apu_led_suspend NULL
> +#define apu_led_resume NULL
> +#endif

Power management is handled by the LED core. You'd need to do special
handling in the driver if the device had some bits for setting it
in a power down mode, other than just setting the LEDs state to off.

If it was the case, then you should set those bits when all LEDs are
turned off and exit power down mode if at least one of the LEDs is on.
Either way, all the code surrounded with above #ifdef guards is
redundant, please remove it.

> +static int apu_led_probe(struct platform_device *pdev)
> +{
> +    int ret;
> +
> +    ret = led_classdev_register(&pdev->dev, &apu_led_1);

Please use devm_ prefixed version.

> +    if (ret)
> +        goto error1;
> +
> +    ret = led_classdev_register(&pdev->dev, &apu_led_2);
> +    if (ret)
> +        goto error2;
> +
> +    ret = led_classdev_register(&pdev->dev, &apu_led_3);
> +    if (ret)
> +        goto error3;
> +
> +    return 0;
> +
> +error3:
> +    led_classdev_unregister(&apu_led_2);
> +error2:
> +    led_classdev_unregister(&apu_led_1);
> +error1:
> +    return ret;
> +
> +}
> +
> +static int apu_led_remove(struct platform_device *pdev)
> +{
> +    led_classdev_unregister(&apu_led_3);
> +    led_classdev_unregister(&apu_led_2);
> +    led_classdev_unregister(&apu_led_1);
> +    return 0;
> +}
> +
> +static struct platform_driver apu_led_driver = {
> +    .probe        = apu_led_probe,
> +    .remove        = apu_led_remove,
> +    .suspend    = apu_led_suspend,
> +    .resume        = apu_led_resume,

Remove suspend and resume initialization since it is already
handled in drivers/leds/led-class.c. Refer to leds_init()
and the line:

leds_class->pm = &leds_class_dev_pm_ops

> +    .driver        = {
> +        .name        = DRVNAME,
> +        .owner        = THIS_MODULE,
> +    },
> +};
> +
> +static int __init apu_led_init(void)
> +{
> +    void __iomem *addr;
> +    int ret;
> +    int i;
> +
> +    ret = platform_driver_register(&apu_led_driver);
> +    if (ret < 0)
> +        goto error_driver;
> +
> +    pdev = platform_device_register_simple(DRVNAME, -1, NULL, 0);
> +    if (IS_ERR(pdev)) {
> +        ret = PTR_ERR(pdev);
> +        goto error_register;
> +    }
> +
> +    ret = -ENOMEM;
> +    for (i = 0; i < APU_NUM_GPIO; i++) {
> +        addr = devm_ioremap(&pdev->dev,
> +                FCH_GPIO_BASE +
> +                (gpio_offset[i] * sizeof(char)),
> +                sizeof(char));
> +        if (!addr)
> +            goto error_ioremap;
> +        gpio_addr[i] = addr;
> +    }
> +    return 0;
> +
> +error_ioremap:
> +    platform_device_unregister(pdev);
> +error_register:
> +    platform_driver_unregister(&apu_led_driver);
> +error_driver:
> +    return ret;
> +}
> +
> +static void __exit apu_led_exit(void)
> +{
> +    platform_device_unregister(pdev);
> +    platform_driver_unregister(&apu_led_driver);
> +}
> +
> +module_init(apu_led_init);
> +module_exit(apu_led_exit);
> 

-- 
Best regards,
Jacek Anaszewski
