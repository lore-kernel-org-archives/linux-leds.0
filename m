From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 1/4] drivers/mfd/menf21bmc: introduce MEN 14F021P00
 BMC MFD Core driver
Date: Wed, 27 Aug 2014 06:37:19 -0700
Message-ID: <53FDDF0F.2080607@roeck-us.net>
References: <cover.1409074255.git.andreas.werner@men.de> <67faa70de03924edc768002df17b02e47256260c.1409074255.git.andreas.werner@men.de> <20140827072633.GY26707@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:57297 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934514AbaH0NhX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 27 Aug 2014 09:37:23 -0400
In-Reply-To: <20140827072633.GY26707@lee--X1>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Andreas Werner <andreas.werner@men.de>
Cc: linux-kernel@vger.kernel.org, sameo@linux.intel.com, wim@iguana.be, linux-watchdog@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jdelvare@suse.de, lm-sensors@lm-sensors.org, johannes.thumshirn@men.de

On 08/27/2014 12:26 AM, Lee Jones wrote:
> On Tue, 26 Aug 2014, Andreas Werner wrote:
>> The MEN 14F021P00 Board Management Controller provides an
>> I2C interface to the host to access the feature implemented in the BMC.
>> The BMC is a PIC Microntroller assembled on CPCI Card from MEN Mikroelektronik
>> and on a few Box/Display Computer.
>>
>> Added MFD Core driver, supporting the I2C communication to the device.
>>
>> The MFD driver currently supports the following features:
>>   	- Watchdog
>>   	- LEDs
>> 	- Hwmon (voltage monitoring)
>>

>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, menf21bmc_id_table);
>> +
>> +static struct i2c_driver menf21bmc_driver = {
>> +	.driver.name	= "menf21bmc",
>> +	.id_table	= menf21bmc_id_table,
>> +	.probe		= menf21bmc_probe,
>> +	.remove		= menf21bmc_remove,
>> +};
>
> No DT support?
>
i2c devices auto-instantiate from dt entries even if there is no
explicit devicetree configuration here. The devicetree entry
would have to be something like "men,menf21bmc", ie it needs
to match the driver name.

Guenter
