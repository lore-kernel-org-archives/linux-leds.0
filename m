From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] leds: Add user LED driver for NIC78bx device
Date: Tue, 1 Nov 2016 18:48:07 +0100
Message-ID: <777ec6a8-d5c1-698c-12f0-3158956ff474@gmail.com>
References: <CGME20161027110331epcas3p332bf735529a71e5c5efa66adf4312785@epcas3p3.samsung.com>
 <1477566173-124969-1-git-send-email-hui.chun.ong@ni.com>
 <d61aa980-9519-df29-6fef-cc6e4ac182d6@samsung.com>
 <1477988581.5623.17.camel@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36714 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753481AbcKARss (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Nov 2016 13:48:48 -0400
Received: by mail-wm0-f66.google.com with SMTP id c17so23654141wmc.3
        for <linux-leds@vger.kernel.org>; Tue, 01 Nov 2016 10:48:47 -0700 (PDT)
In-Reply-To: <1477988581.5623.17.camel@ni.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hui Chun Ong <hui.chun.ong@ni.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>
Cc: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, Julia Cartwright <julia.cartwright@ni.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, Jonathan Hearn <jonathan.hearn@ni.com>, Brad Mouring <brad.mouring@ni.com>

Hi Hui.

On 11/01/2016 09:23 AM, Hui Chun Ong wrote:
> Hi Jacek,
>
> On Fri, 2016-10-28 at 12:08 +0200, Jacek Anaszewski wrote:
>> Hi Hui,
>>
>> Thanks for the update.
>>
>> On 10/27/2016 01:02 PM, Hui Chun Ong wrote:
>>>
>>> Add the driver to support User LEDs on PXI Embedded Controller.
>>>
>>> Signed-off-by: Hui Chun Ong <hui.chun.ong@ni.com>
>>> Signed-off-by: Brad Mouring <brad.mouring@ni.com>
>>> ---
>>> v1: Update code to use spinlock.
>>>     Change from acpi_driver to platform_driver.
>>>     Create struct ni78bx_led_data to aggregate static variables.
>>> ---
>>>  drivers/leds/Kconfig       |  11 +++
>>>  drivers/leds/Makefile      |   1 +
>>>  drivers/leds/leds-ni78bx.c | 209 +++++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 221 insertions(+)
>>>  create mode 100644 drivers/leds/leds-ni78bx.c
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 7a628c6..5540795 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -659,6 +659,17 @@ config LEDS_MLXCPLD
>>>  	  This option enabled support for the LEDs on the Mellanox
>>>  	  boards. Say Y to enabled these.
>>>
>>> +config LEDS_NI78BX
>>> +	tristate "LED support for NI PXI NIC78bx devices"
>>> +	depends on LEDS_CLASS
>>> +	depends on X86 && ACPI
>>> +	help
>>> +	  This option enables support for the User1 and User2 LEDs on NI
>>> +	  PXI NIC78bx devices.
>>> +
>>> +	  To compile this driver as a module, choose M here: the module
>>> +	  will be called leds-ni78bx.
>>> +
>>>  comment "LED Triggers"
>>>  source "drivers/leds/trigger/Kconfig"
>>>
>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>> index 3965070..9758d1e 100644
>>> --- a/drivers/leds/Makefile
>>> +++ b/drivers/leds/Makefile
>>> @@ -71,6 +71,7 @@ obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
>>>  obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
>>>  obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>>>  obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
>>> +obj-$(CONFIG_LEDS_NI78BX)		+= leds-ni78bx.o
>>>
>>>  # LED SPI Drivers
>>>  obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
>>> diff --git a/drivers/leds/leds-ni78bx.c b/drivers/leds/leds-ni78bx.c
>>> new file mode 100644
>>> index 0000000..c5682ee
>>> --- /dev/null
>>> +++ b/drivers/leds/leds-ni78bx.c
>>> @@ -0,0 +1,209 @@
>>> +/*
>>> + * Copyright (C) 2016 National Instruments Corp.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#include
>>> +#include
>>> +#include
>>> +#include
>>> +#include
>>> +
>>> +#define NIC78BX_USER1_LED_MASK		0x3
>>> +#define NIC78BX_USER1_GREEN_LED		BIT(0)
>>> +#define NIC78BX_USER1_YELLOW_LED	BIT(1)
>>> +
>>> +#define NIC78BX_USER2_LED_MASK		0xC
>>> +#define NIC78BX_USER2_GREEN_LED		BIT(2)
>>> +#define NIC78BX_USER2_YELLOW_LED	BIT(3)
>>> +
>>> +#define NIC78BX_LOCK_REG_OFFSET		1
>>> +#define NIC78BX_LOCK_VALUE		0xA5
>>> +#define NIC78BX_UNLOCK_VALUE		0x5A
>>> +
>>> +#define USER_LED_IO_SIZE		2
>> This macro also requires prefix.
>>
>>>
>>> +
>>> +struct ni78bx_led_data {
>>> +	u16 io_base;
>>> +	spinlock_t lock;
>>> +	struct platform_device *pdev;
>>> +};
>>> +
>>> +struct ni78bx_led {
>>> +	u8 bit;
>>> +	u8 mask;
>>> +	struct ni78bx_led_data *data;
>>> +	struct led_classdev cdev;
>>> +};
>>> +
>>> +static inline struct ni78bx_led *to_ni78bx_led(struct led_classdev *cdev)
>>> +{
>>> +	return container_of(cdev, struct ni78bx_led, cdev);
>>> +}
>>> +
>>> +static void ni78bx_brightness_set(struct led_classdev *cdev,
>>> +				  enum led_brightness brightness)
>>> +{
>>> +	struct ni78bx_led *nled = to_ni78bx_led(cdev);
>>> +	unsigned long flags;
>>> +	u8 value;
>>> +
>>> +	spin_lock_irqsave(&nled->data->lock, flags);
>>> +	value = inb(nled->data->io_base);
>>> +
>>> +	if (brightness) {
>>> +		value &= ~nled->mask;
>>> +		value |= nled->bit;
>>> +	} else {
>>> +		value &= ~nled->bit;
>>> +	}
>>> +
>>> +	outb(value, nled->data->io_base);
>>> +	spin_unlock_irqrestore(&nled->data->lock, flags);
>>> +}
>>> +
>>> +static enum led_brightness ni78bx_brightness_get(struct led_classdev *cdev)
>>> +{
>>> +	struct ni78bx_led *nled = to_ni78bx_led(cdev);
>>> +	unsigned long flags;
>>> +	u8 value;
>>> +
>>> +	spin_lock_irqsave(&nled->data->lock, flags);
>>> +	value = inb(nled->data->io_base);
>>> +	spin_unlock_irqrestore(&nled->data->lock, flags);
>>> +
>>> +	return (value & nled->bit) ? 1 : LED_OFF;
>>> +}
>>> +
>>> +static struct ni78bx_led ni78bx_leds[] = {
>>> +	{
>>> +		.bit = NIC78BX_USER1_GREEN_LED,
>>> +		.mask = NIC78BX_USER1_LED_MASK,
>>> +		.cdev = {
>>> +			.name = "nilrt:green:user1",
>> Why nilrt prefix? There is some discrepancy in the naming allover
>> this patch. You have:
>>
>> - NIC78bx in the commit title
>> - ni78bx in the function prefixes
>> - nilrt in the LED class device names
>>
>> Please make it uniform. What actually the device name is?
>>
> The device name is NIC78bx. I'll update all ni78bx references to
> nic78bx. However, for the LED class device name, I'm hoping to
> use a more generic name and not device specific name since
> essentially it's just a user controllable LEDs. Something like
> "niled:green:user1" or "green:user1".

LED class devince naming convention is <devicename:colour:function>.
See "LED Device Naming" section in Documentation/leds/leds-class.txt.
Please use nic78bx also for devicename segment.

-- 
Best regards,
Jacek Anaszewski
