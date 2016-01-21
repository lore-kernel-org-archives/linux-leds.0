From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] led: core: fix misleading comment after workqueue removal
 from drivers
Date: Thu, 21 Jan 2016 12:05:07 +0100
Message-ID: <56A0BB63.3060302@samsung.com>
References: <56929204.3080404@gmail.com> <56A09EC8.1080807@samsung.com>
 <CAFSsGVv-7dmjoo2kShhEMXi-597gsPXuKeV1x8Va9zzoYj4A-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9109 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759268AbcAULFL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jan 2016 06:05:11 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1A002ADUSK9C60@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 21 Jan 2016 11:05:08 +0000 (GMT)
In-reply-to: <CAFSsGVv-7dmjoo2kShhEMXi-597gsPXuKeV1x8Va9zzoYj4A-Q@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

On 01/21/2016 10:50 AM, Heiner Kallweit wrote:
> On Thu, Jan 21, 2016 at 10:03 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>> Hi Heiner,
>>
>> On 01/10/2016 06:16 PM, Heiner Kallweit wrote:
>>>
>>> Now that workqueues have been removed from individual drivers and
>>> were replaced with a core-internal workqueue we shouldn't
>>> encourage people to add new workqueues to drivers.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>    include/linux/leds.h | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>> index bc1476f..4429887 100644
>>> --- a/include/linux/leds.h
>>> +++ b/include/linux/leds.h
>>> @@ -50,7 +50,10 @@ struct led_classdev {
>>>    #define LED_DEV_CAP_FLASH     (1 << 23)
>>>
>>>          /* Set LED brightness level */
>>> -       /* Must not sleep, use a workqueue if needed */
>>> +       /* Must not sleep. If no non-blocking version can be provided
>>> +        * set brightness_set_blocking only. The LED core will use an
>>> +        * internal work queue to create a non-blocking version.
>>> +        */
>>
>>
>> This comment isn't easily comprehensible at first glance.
>>
>> How about:
>>
>> "Must not sleep. Use brightness_set_blocking for drivers
>> that can sleep while setting brightness."
>>
> Yes, this is better. It's simpler and clearer.
> Are you going to fix the comment on your own or would you like me
> to submit it as a patch?

Since you are the original author of the patch, feel free to submit
the final version with the agreed comment.

>>>          void            (*brightness_set)(struct led_classdev *led_cdev,
>>>                                            enum led_brightness brightness);
>>>          /*
>>>
>>
>>
>> --
>> Best Regards,
>> Jacek Anaszewski
>
>


-- 
Best Regards,
Jacek Anaszewski
