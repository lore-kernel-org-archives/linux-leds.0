From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/2] led: core: Use atomic bit-field for the blink-flags
Date: Tue, 08 Nov 2016 13:04:41 +0100
Message-ID: <03b2ba63-37d6-4ad9-e7c9-a465c37c1114@samsung.com>
References: <20161023194726.24388-1-hdegoede@redhat.com>
 <CGME20161024204440epcas4p457599ba91315070dc8e060f4be9d4eb0@epcas4p4.samsung.com>
 <151bb743-4ca5-d783-a061-f89f9824f673@gmail.com>
 <a434ac6a-c6c9-29c7-5a0c-74f912164378@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:16770 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752997AbcKHMEq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Nov 2016 07:04:46 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGB00F4BO7VBB10@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 08 Nov 2016 12:04:43 +0000 (GMT)
In-reply-to: <a434ac6a-c6c9-29c7-5a0c-74f912164378@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hi Hans,

On 10/25/2016 09:01 AM, Jacek Anaszewski wrote:
> On 10/24/2016 10:43 PM, Jacek Anaszewski wrote:
>> Hi Hans,
>>
>> Thanks for the patch.
>>
>> On 10/23/2016 09:47 PM, Hans de Goede wrote:
>>> All the LED_BLINK* flags are accessed read-modify-write from e.g.
>>> led_set_brightness and led_blink_set_oneshot while both
>>> set_brightness_work and the blink_timer may be running.

[...]

>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>> index eebcd8c..cff9df7 100644
>>> --- a/include/linux/leds.h
>>> +++ b/include/linux/leds.h
>>> @@ -43,16 +43,13 @@ struct led_classdev {
>>>  #define LED_UNREGISTERING    (1 << 1)
>>>      /* Upper 16 bits reflect control information */
>>>  #define LED_CORE_SUSPENDRESUME    (1 << 16)
>>> -#define LED_BLINK_SW        (1 << 17)
>>> -#define LED_BLINK_ONESHOT    (1 << 18)
>>> -#define LED_BLINK_ONESHOT_STOP    (1 << 19)
>>> -#define LED_BLINK_INVERT    (1 << 20)
>>> -#define LED_BLINK_BRIGHTNESS_CHANGE (1 << 21)
>>> -#define LED_BLINK_DISABLE    (1 << 22)
>>> -#define LED_SYSFS_DISABLE    (1 << 23)
>>> -#define LED_DEV_CAP_FLASH    (1 << 24)
>>> -#define LED_HW_PLUGGABLE    (1 << 25)
>>> -#define LED_PANIC_INDICATOR    (1 << 26)
>>> +#define LED_SYSFS_DISABLE    (1 << 17)
>>> +#define LED_DEV_CAP_FLASH    (1 << 18)
>>> +#define LED_HW_PLUGGABLE    (1 << 19)
>>> +#define LED_PANIC_INDICATOR    (1 << 20)
>>> +
>>> +    /* set_brightness_work / blink_timer flags, atomic, private. */
>>> +    unsigned long        work_flags;
>>
>> LED_BLINK_SW is now modified in ledtrig-heartbeat.c [0], so it'd have
>> to remain visible outside of LED subsystem.

Are you OK with leaving the flags in leds.h, changed to identifiers?
If so, then I can submit version 2.

>> I'll do the suitable fixup to patch [0] and will reorder the patches
>> when this one is applied.
>
> Of course not this one, but its updated version, that leaves the
> flags in leds.h. I didn't express myself accurately above.
>

-- 
Best regards,
Jacek Anaszewski
