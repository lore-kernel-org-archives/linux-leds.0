From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 5/5] leds: multicolor: Introduce a multicolor class
 definition
Date: Tue, 2 Apr 2019 14:07:42 -0500
Message-ID: <7e156cac-b654-0d63-be44-efc90ab2decf@ti.com>
References: <20190401173400.14238-1-dmurphy@ti.com>
 <20190401173400.14238-6-dmurphy@ti.com>
 <5f75eeed-41d5-e0d9-38f8-bf00c5045ba1@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5f75eeed-41d5-e0d9-38f8-bf00c5045ba1@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: marek.behun@nic.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Randy

Thank you.

On 4/1/19 4:10 PM, Randy Dunlap wrote:
> Hi,
> 
> On 4/1/19 10:34 AM, Dan Murphy wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The framework allows for dynamically setting individual LEDs
>> or setting brightness levels of LEDs and updating them virtually
>> simultaneously.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  drivers/leds/Kconfig                 |  10 +
>>  drivers/leds/Makefile                |   1 +
>>  drivers/leds/led-class-multicolor.c  | 411 +++++++++++++++++++++++++++
>>  include/linux/led-class-multicolor.h |  69 +++++
>>  4 files changed, 491 insertions(+)
>>  create mode 100644 drivers/leds/led-class-multicolor.c
>>  create mode 100644 include/linux/led-class-multicolor.h
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index a72f97fca57b..477e108fd2a7 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -29,6 +29,16 @@ config LEDS_CLASS_FLASH
>>  	  for the flash related features of a LED device. It can be built
>>  	  as a module.
>>  
>> +config LEDS_CLASS_MULTI_COLOR
>> +	tristate "LED Mulit Color LED Class Support"
> 
> 	              Multi

Ack

> 
>> +	depends on LEDS_CLASS
>> +	help
>> +	  This option enables the flash led sysfs class in /sys/class/leds.
> 
> 	                                LED (?)
> 

HA!  This was a copy paste from the Flash class kconfig.  I need to re-write the description anyway.

So your comments actually will turn into a bug fix for the Kconfig on that flag.

Dan
<snip>
-- 
------------------
Dan Murphy
