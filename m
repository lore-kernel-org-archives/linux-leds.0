From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] cleanup LED documentation and make it match reality
Date: Mon, 03 Oct 2016 11:54:24 +0200
Message-ID: <1ac5bea8-4b43-73f3-b609-8dc5625b1cef@samsung.com>
References: <CGME20161003081122eucas1p1d125c5f55f171b1ca5e4e1d28a3ad4b1@eucas1p1.samsung.com>
 <20161003081049.GA12419@amd>
 <a9dcb6e9-a1bf-df4e-7030-8480392a7955@samsung.com> <20161003093841.GA9131@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20161003093841.GA9131@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>
List-Id: linux-leds@vger.kernel.org

On 10/03/2016 11:38 AM, Pavel Machek wrote:
> Hi!
>
>> Thanks for the patch.
>>
>> On 10/03/2016 10:10 AM, Pavel Machek wrote:
>>>
>>> sysfs-class-led fails to mention some important details. Also fix led
>>> vs LED and english.
>>>
>>> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>>>
>>> --- a/Documentation/ABI/testing/sysfs-class-led
>>> +++ b/Documentation/ABI/testing/sysfs-class-led
>>> @@ -4,16 +4,25 @@ KernelVersion:	2.6.17
>>> Contact:	Richard Purdie <rpurdie@rpsys.net>
>>> Description:
>>> 		Set the brightness of the LED. Most LEDs don't
>>> -		have hardware brightness support so will just be turned on for
>>> +		have hardware brightness support, so will just be turned on for
>>> 		non-zero brightness settings. The value is between 0 and
>>> 		/sys/class/leds/<led>/max_brightness.
>>>
>>> +		Writing 0 to this file clears active trigger.
>>> +
>>> +		Writing non-zero to this file while trigger is active changes the
>>> +		top brightness trigger is going to use.
>>
>> This is true only in case of timer trigger, as it uses blink_brightness
>> property from struct led_classdev to cache current brightness, when the
>> the LED is in the off cycle. This is part of software blink fallback
>> functionality.
>>
>> In case of heartbeat trigger max_brightness is always used for top level
>> brightness. We'd need to refactor the trigger a bit to allow for
>> different top brightness levels.
>
> Ok, do you think you could update the documenation to match the
> reality? It is quite important to know what is the intended behaviour
> and what are the bugs.

I'd prefer to improve the trigger. I'll try to do that in the coming
days, and apply your patch afterwards.

-- 
Best regards,
Jacek Anaszewski
