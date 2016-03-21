From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] leds: use config symbol LEDS_CLASS_RGB consistently
Date: Mon, 21 Mar 2016 18:24:08 +0100
Message-ID: <56F02E38.8030606@gmail.com>
References: <56EFD39A.50800@gmail.com> <56F01700.30407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:35884 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756751AbcCURe2 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 21 Mar 2016 13:34:28 -0400
Received: by mail-wm0-f50.google.com with SMTP id r129so60272689wmr.1
        for <linux-leds@vger.kernel.org>; Mon, 21 Mar 2016 10:34:28 -0700 (PDT)
In-Reply-To: <56F01700.30407@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Am 21.03.2016 um 16:45 schrieb Jacek Anaszewski:
> Hi Heiner,
> 
> Please note that you don't need to submit incremental patches
> for the code that is not in mainline yet. You can send just
> a new version and I'll replace the old one with it.

OK, I see. Then I'll send a v8 of the patch.

Heiner
> 
> Thanks,
> Jacek Anaszewski
> 
> On 03/21/2016 11:57 AM, Heiner Kallweit wrote:
>> Config symbol LEDS_RGB was renamed to LEDS_CLASS_RGB.
>> This makes sense, but the change wasn't done consistently.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   drivers/leds/Kconfig  | 4 ++--
>>   drivers/leds/Makefile | 2 +-
>>   drivers/leds/leds.h   | 2 +-
>>   3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 4d819ba..f213c06 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -624,9 +624,9 @@ config LEDS_VERSATILE
>>         This option enabled support for the LEDs on the ARM Versatile
>>         and RealView boards. Say Y to enabled these.
>>
>> -if LEDS_RGB
>> +if LEDS_CLASS_RGB
>>   comment "RGB LED drivers"
>> -endif # LEDS_RGB
>> +endif # LEDS_CLASS_RGB
>>
>>   comment "LED Triggers"
>>   source "drivers/leds/trigger/Kconfig"
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 9419dbf..e36ef69 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -2,7 +2,7 @@
>>   # LED Core
>>   obj-$(CONFIG_NEW_LEDS)            += led-core-objs.o
>>   led-core-objs-y                := led-core.o
>> -led-core-objs-$(CONFIG_LEDS_RGB)    += led-rgb-core.o
>> +led-core-objs-$(CONFIG_LEDS_CLASS_RGB)    += led-rgb-core.o
>>   obj-$(CONFIG_LEDS_CLASS)        += led-class.o
>>   obj-$(CONFIG_LEDS_CLASS_FLASH)        += led-class-flash.o
>>   obj-$(CONFIG_LEDS_TRIGGERS)        += led-triggers.o
>> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
>> index b853f54..9c5f3fe 100644
>> --- a/drivers/leds/leds.h
>> +++ b/drivers/leds/leds.h
>> @@ -35,7 +35,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
>>                   enum led_brightness value);
>>   void led_set_brightness_nosleep(struct led_classdev *led_cdev,
>>                   enum led_brightness value);
>> -#if IS_ENABLED(CONFIG_LEDS_RGB)
>> +#if IS_ENABLED(CONFIG_LEDS_CLASS_RGB)
>>   enum led_brightness led_confine_brightness(struct led_classdev *led_cdev,
>>                          enum led_brightness value);
>>   #else
>>
> 
> 
> 
