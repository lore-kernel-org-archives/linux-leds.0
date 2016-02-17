From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 2/4] leds: core: add color LED sysfs extension
Date: Wed, 17 Feb 2016 13:43:27 +0100
Message-ID: <56C46AEF.8060507@samsung.com>
References: <56C37864.20707@gmail.com> <56C468AB.509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:42264 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965076AbcBQMna (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 17 Feb 2016 07:43:30 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2O00KEMZCGESA0@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 17 Feb 2016 12:43:28 +0000 (GMT)
In-reply-to: <56C468AB.509@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

On 02/17/2016 01:33 PM, Jacek Anaszewski wrote:
> Hi Heiner,
>
> On 02/16/2016 08:28 PM, Heiner Kallweit wrote:
>> Extend brightness sysfs property handling to deal with monochrome
>> and color mode as well.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v2:
>> - split from patch 1
>> ---
>>   drivers/leds/led-class.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index aa84e5b..09e0007 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -32,7 +32,10 @@ static ssize_t brightness_show(struct device *dev,
>>       /* no lock needed for this */
>>       led_update_brightness(led_cdev);
>>
>> -    return sprintf(buf, "%u\n", led_cdev->brightness);
>> +    if (led_cdev->brightness > LED_FULL)
>> +        return sprintf(buf, "%#06x\n", led_cdev->brightness);
>> +    else
>> +        return sprintf(buf, "%u\n", led_cdev->brightness);
>>   }

This change also should remain here.

>>   static ssize_t brightness_store(struct device *dev,
>> @@ -49,11 +52,11 @@ static ssize_t brightness_store(struct device *dev,
>>           goto unlock;
>>       }
>>
>> -    ret = kstrtoul(buf, 10, &state);
>> +    ret = kstrtoul(buf, 0, &state);
>>       if (ret)
>>           goto unlock;
>
> Please leave only this change in the patch, as it extends the scope
> of possible arguments for user space. Remaining changes can be moved
> to 1/4.
>
>
>>
>> -    if (state == LED_OFF)
>> +    if (is_off(state))

Only this should go to 1/4.

>>           led_trigger_remove(led_cdev);
>>       led_set_brightness(led_cdev, state);
>>
>>
>
>


-- 
Best regards,
Jacek Anaszewski
