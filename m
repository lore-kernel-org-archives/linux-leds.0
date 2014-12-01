From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC v8 09/14] mfd: max77693: adjust
 max77693_led_platform_data
Date: Mon, 01 Dec 2014 13:49:56 +0100
Message-ID: <547C63F4.4060203@samsung.com>
References: <1417166286-27685-1-git-send-email-j.anaszewski@samsung.com>
 <1417166286-27685-10-git-send-email-j.anaszewski@samsung.com>
 <20141201113430.GC15845@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15588 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752835AbaLAMuA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 1 Dec 2014 07:50:00 -0500
In-reply-to: <20141201113430.GC15845@x1>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, SangYoung Son <hello.son@smasung.com>, Samuel Ortiz <sameo@linux.intel.com>

Hi Lee,

Thanks for the review.

On 12/01/2014 12:34 PM, Lee Jones wrote:
> On Fri, 28 Nov 2014, Jacek Anaszewski wrote:
>
>> Add "label" array for Device Tree strings with
>> the name of a LED device and make flash_timeout
>> a two element array, for caching the sub-led
>> related flash timeout.
>
> <------------------------------------------------------------------------->
>
> Please use all of the 75 char buffer.

OK.

>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Cc: SangYoung Son <hello.son@smasung.com>
>> Cc: Samuel Ortiz <sameo@linux.intel.com>
>> ---
>>   include/linux/mfd/max77693.h |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/mfd/max77693.h b/include/linux/mfd/max77693.h
>> index f0b6585..30fa19ea 100644
>> --- a/include/linux/mfd/max77693.h
>> +++ b/include/linux/mfd/max77693.h
>> @@ -88,14 +88,15 @@ enum max77693_led_boost_mode {
>>   };
>>
>>   struct max77693_led_platform_data {
>> +	const char *label[2];
>>   	u32 fleds[2];
>>   	u32 iout_torch[2];
>>   	u32 iout_flash[2];
>>   	u32 trigger[2];
>>   	u32 trigger_type[2];
>> +	u32 flash_timeout[2];
>>   	u32 num_leds;
>>   	u32 boost_mode;
>> -	u32 flash_timeout;
>>   	u32 boost_vout;
>>   	u32 low_vsys;
>>   };
>
> I'm guessing this will effect the other patches in the set?
>

max77692 flash driver depends on it and it has to be
in synch with the related DT bindings patch.

Best Regards,
Jacek Anaszewski
