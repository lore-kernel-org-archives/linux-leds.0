From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v2 10/19] leds: Remove SEAD3 driver
Date: Tue, 30 Aug 2016 15:42:09 +0100
Message-ID: <a3339cb1-e405-dfb8-9a73-42756bb4fe67@imgtec.com>
References: <20160826141751.13121-1-paul.burton@imgtec.com>
 <20160826141751.13121-11-paul.burton@imgtec.com>
 <5f2e6c11-d4a7-dfa0-e94a-cf2a1cd66541@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:7065 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751530AbcH3OmY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Aug 2016 10:42:24 -0400
In-Reply-To: <5f2e6c11-d4a7-dfa0-e94a-cf2a1cd66541@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 29/08/16 09:55, Jacek Anaszewski wrote:
> Hi Paul,
> 
> On 08/26/2016 04:17 PM, Paul Burton wrote:
>> SEAD3 is now using the generic syscon & regmap based register-bit-led
>> driver, so remove the unused custom SEAD3 LED driver.
>>
>> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
>> ---
>>
>> Changes in v2: None
>>
>>  drivers/leds/Kconfig      | 10 ------
>>  drivers/leds/Makefile     |  1 -
>>  drivers/leds/leds-sead3.c | 78 -----------------------------------------------
>>  3 files changed, 89 deletions(-)
>>  delete mode 100644 drivers/leds/leds-sead3.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 9dcc9b1..025de7e 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -574,16 +574,6 @@ config LEDS_KTD2692
>>
>>        Say Y to enable this driver.
>>
>> -config LEDS_SEAD3
>> -    tristate "LED support for the MIPS SEAD 3 board"
>> -    depends on LEDS_CLASS && MIPS_SEAD3
>> -    help
>> -      Say Y here to include support for the FLED and PLED LEDs on SEAD3 eval
>> -      boards.
>> -
>> -      This driver can also be built as a module. If so the module
>> -      will be called leds-sead3.
>> -
>>  config LEDS_IS31FL32XX
>>      tristate "LED support for ISSI IS31FL32XX I2C LED controller family"
>>      depends on LEDS_CLASS && I2C && OF
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 0684c86..da594cf 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -66,7 +66,6 @@ obj-$(CONFIG_LEDS_VERSATILE)        += leds-versatile.o
>>  obj-$(CONFIG_LEDS_MENF21BMC)        += leds-menf21bmc.o
>>  obj-$(CONFIG_LEDS_KTD2692)        += leds-ktd2692.o
>>  obj-$(CONFIG_LEDS_POWERNV)        += leds-powernv.o
>> -obj-$(CONFIG_LEDS_SEAD3)        += leds-sead3.o
>>  obj-$(CONFIG_LEDS_IS31FL32XX)        += leds-is31fl32xx.o
>>
>>  # LED SPI Drivers
>> diff --git a/drivers/leds/leds-sead3.c b/drivers/leds/leds-sead3.c
>> deleted file mode 100644
>> index eb97a32..0000000
>> --- a/drivers/leds/leds-sead3.c
>> +++ /dev/null
>> @@ -1,78 +0,0 @@
>> -/*
>> - * This file is subject to the terms and conditions of the GNU General Public
>> - * License.  See the file "COPYING" in the main directory of this archive
>> - * for more details.
>> - *
>> - * Copyright (C) 2012 MIPS Technologies, Inc.  All rights reserved.
>> - * Copyright (C) 2015 Imagination Technologies, Inc.
>> - */
>> -#include <linux/kernel.h>
>> -#include <linux/module.h>
>> -#include <linux/init.h>
>> -#include <linux/platform_device.h>
>> -#include <linux/leds.h>
>> -#include <linux/err.h>
>> -#include <linux/io.h>
>> -
>> -#include <asm/mips-boards/sead3-addr.h>
>> -
>> -static void sead3_pled_set(struct led_classdev *led_cdev,
>> -        enum led_brightness value)
>> -{
>> -    writel(value, (void __iomem *)SEAD3_CPLD_P_LED);
>> -}
>> -
>> -static void sead3_fled_set(struct led_classdev *led_cdev,
>> -        enum led_brightness value)
>> -{
>> -    writel(value, (void __iomem *)SEAD3_CPLD_F_LED);
>> -}
>> -
>> -static struct led_classdev sead3_pled = {
>> -    .name        = "sead3::pled",
>> -    .brightness_set = sead3_pled_set,
>> -    .flags        = LED_CORE_SUSPENDRESUME,
>> -};
>> -
>> -static struct led_classdev sead3_fled = {
>> -    .name        = "sead3::fled",
>> -    .brightness_set = sead3_fled_set,
>> -    .flags        = LED_CORE_SUSPENDRESUME,
>> -};
>> -
>> -static int sead3_led_probe(struct platform_device *pdev)
>> -{
>> -    int ret;
>> -
>> -    ret = led_classdev_register(&pdev->dev, &sead3_pled);
>> -    if (ret < 0)
>> -        return ret;
>> -
>> -    ret = led_classdev_register(&pdev->dev, &sead3_fled);
>> -    if (ret < 0)
>> -        led_classdev_unregister(&sead3_pled);
>> -
>> -    return ret;
>> -}
>> -
>> -static int sead3_led_remove(struct platform_device *pdev)
>> -{
>> -    led_classdev_unregister(&sead3_pled);
>> -    led_classdev_unregister(&sead3_fled);
>> -
>> -    return 0;
>> -}
>> -
>> -static struct platform_driver sead3_led_driver = {
>> -    .probe        = sead3_led_probe,
>> -    .remove        = sead3_led_remove,
>> -    .driver        = {
>> -        .name        = "sead3-led",
>> -    },
>> -};
>> -
>> -module_platform_driver(sead3_led_driver);
>> -
>> -MODULE_AUTHOR("Kristian Kielhofner <kris@krisk.org>");
>> -MODULE_DESCRIPTION("SEAD3 LED driver");
>> -MODULE_LICENSE("GPL");
>>
> 
> Currently the patch doesn't apply cleanly on the linux-leds.git,
> for-next branch, due to the fresh changes in the surrounding code in
> the drivers/leds/Makefile and Kconfig. Does this patch depend on
> the previous patches in this series, or I can take it now and apply
> to the LEDs git?

Hi Jacek,

Ideally the patches to the SEAD-3 board code & DT would go in first such
that the board switches to the register-bit-led driver before this
custom driver is removed. Otherwise we'll lose support for the LEDs in
between you applying this patch & Ralf applying the rest.

Having said that I doubt anyone actually uses the SEAD-3 LEDs so I don't
mind so much if you & Ralf decide that's the easiest path forwards.

Thanks,
    Paul
