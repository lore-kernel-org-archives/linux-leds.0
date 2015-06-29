From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH -next] leds: fix aat1290 build errors
Date: Mon, 29 Jun 2015 10:08:50 -0700
Message-ID: <CAK5ve-Lm94KscMQNh-6s_nunxemxi3fe61fA3THv4vh+anV31g@mail.gmail.com>
References: <558DA144.6050203@infradead.org> <559159C2.40305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-yk0-f179.google.com ([209.85.160.179]:32778 "EHLO
	mail-yk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752627AbbF2RJL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jun 2015 13:09:11 -0400
In-Reply-To: <559159C2.40305@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

On Mon, Jun 29, 2015 at 7:44 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Randy,
>
> Thanks for the patch.
>
>
> On 06/26/2015 09:00 PM, Randy Dunlap wrote:
>>
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> Fix build errors when LEDS_AAT1290=y and V4L2_FLASH_LED_CLASS=m
>> by restricting LEDS_AAT1290 to =m if V4L2_FLASH_LED_CLASS=m.
>>
>> drivers/built-in.o: In function `aat1290_led_remove':
>> leds-aat1290.c:(.text+0xe5d77): undefined reference to
>> `v4l2_flash_release'
>> drivers/built-in.o: In function `aat1290_led_probe':
>> leds-aat1290.c:(.text+0xe6494): undefined reference to `v4l2_flash_init'
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Cc: Bryan Wu <cooloney@gmail.com>
>> Cc: Richard Purdie <rpurdie@rpsys.net>
>> ---
>>   drivers/leds/Kconfig |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> --- linux-next-20150626.orig/drivers/leds/Kconfig
>> +++ linux-next-20150626/drivers/leds/Kconfig
>> @@ -42,6 +42,7 @@ config LEDS_88PM860X
>>   config LEDS_AAT1290
>>         tristate "LED support for the AAT1290"
>>         depends on LEDS_CLASS_FLASH
>> +       depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
>>         depends on GPIOLIB
>>         depends on OF
>>         depends on PINCTRL
>>
>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>

Good fix. thanks.
I merged into my tree.
-Bryan
