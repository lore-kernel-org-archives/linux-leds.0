From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] led: core: Use atomic bit-field for the blink-flags
Date: Tue, 8 Nov 2016 13:08:55 +0100
Message-ID: <3987b5f4-fabd-3ea0-7ad6-6de3c7146eef@redhat.com>
References: <20161023194726.24388-1-hdegoede@redhat.com>
 <CGME20161024204440epcas4p457599ba91315070dc8e060f4be9d4eb0@epcas4p4.samsung.com>
 <151bb743-4ca5-d783-a061-f89f9824f673@gmail.com>
 <a434ac6a-c6c9-29c7-5a0c-74f912164378@samsung.com>
 <03b2ba63-37d6-4ad9-e7c9-a465c37c1114@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41522 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932286AbcKHMI7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 8 Nov 2016 07:08:59 -0500
In-Reply-To: <03b2ba63-37d6-4ad9-e7c9-a465c37c1114@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hi,

On 08-11-16 13:04, Jacek Anaszewski wrote:
> Hi Hans,
>
> On 10/25/2016 09:01 AM, Jacek Anaszewski wrote:
>> On 10/24/2016 10:43 PM, Jacek Anaszewski wrote:
>>> Hi Hans,
>>>
>>> Thanks for the patch.
>>>
>>> On 10/23/2016 09:47 PM, Hans de Goede wrote:
>>>> All the LED_BLINK* flags are accessed read-modify-write from e.g.
>>>> led_set_brightness and led_blink_set_oneshot while both
>>>> set_brightness_work and the blink_timer may be running.
>
> [...]
>
>>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>>> index eebcd8c..cff9df7 100644
>>>> --- a/include/linux/leds.h
>>>> +++ b/include/linux/leds.h
>>>> @@ -43,16 +43,13 @@ struct led_classdev {
>>>>  #define LED_UNREGISTERING    (1 << 1)
>>>>      /* Upper 16 bits reflect control information */
>>>>  #define LED_CORE_SUSPENDRESUME    (1 << 16)
>>>> -#define LED_BLINK_SW        (1 << 17)
>>>> -#define LED_BLINK_ONESHOT    (1 << 18)
>>>> -#define LED_BLINK_ONESHOT_STOP    (1 << 19)
>>>> -#define LED_BLINK_INVERT    (1 << 20)
>>>> -#define LED_BLINK_BRIGHTNESS_CHANGE (1 << 21)
>>>> -#define LED_BLINK_DISABLE    (1 << 22)
>>>> -#define LED_SYSFS_DISABLE    (1 << 23)
>>>> -#define LED_DEV_CAP_FLASH    (1 << 24)
>>>> -#define LED_HW_PLUGGABLE    (1 << 25)
>>>> -#define LED_PANIC_INDICATOR    (1 << 26)
>>>> +#define LED_SYSFS_DISABLE    (1 << 17)
>>>> +#define LED_DEV_CAP_FLASH    (1 << 18)
>>>> +#define LED_HW_PLUGGABLE    (1 << 19)
>>>> +#define LED_PANIC_INDICATOR    (1 << 20)
>>>> +
>>>> +    /* set_brightness_work / blink_timer flags, atomic, private. */
>>>> +    unsigned long        work_flags;
>>>
>>> LED_BLINK_SW is now modified in ledtrig-heartbeat.c [0], so it'd have
>>> to remain visible outside of LED subsystem.
>
> Are you OK with leaving the flags in leds.h, changed to identifiers?
> If so, then I can submit version 2.

Yes that is fine, thank you!

Regards,

Hans


>>> I'll do the suitable fixup to patch [0] and will reorder the patches
>>> when this one is applied.
>>
>> Of course not this one, but its updated version, that leaves the
>> flags in leds.h. I didn't express myself accurately above.
>>
>
