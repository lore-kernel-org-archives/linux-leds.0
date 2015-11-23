From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RESEND 15/16] leds: add LM3633 driver
Date: Mon, 23 Nov 2015 12:17:15 +0100
Message-ID: <5652F5BB.8090205@samsung.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-16-git-send-email-milo.kim@ti.com>
 <5638DD99.9070502@samsung.com> <56419F0C.90009@ti.com>
 <564EE66C.5010709@samsung.com> <56525262.60308@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <56525262.60308-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Kim, Milo" <milo.kim-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Milo,

On 11/23/2015 12:40 AM, Kim, Milo wrote:
> Hi Jacek,
>
> On 11/20/2015 6:22 PM, Jacek Anaszewski wrote:
>> On 11/10/2015 08:38 AM, Kim, Milo wrote:
>> [...]
>>>>> +                cat /sys/class/leds/<led>/pattern_levels
>>>>> +                low brightness: 0, high brightness: 255
>>>>> +
>>>>> +What:        /sys/class/leds/<led>/run_pattern
>>>>> +Date:        Oct 2015
>>>>> +KernelVersion:    4.3
>>>>> +Contact:    Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
>>>>> +Description:    write only
>>>>> +                After 'pattern_times' and 'pattern_levels' are
>>>>> updated,
>>>>> +                run the pattern by writing 1 to 'run_pattern'.
>>>>> +                To stop running pattern, writes 0 to 'run_pattern'.
>>>>
>>>> I wonder how registering an in-driver trigger would work. It would
>>>> allow for hiding above pattern attributes when the trigger is inactive,
>>>> and thus making the sysfs interface more transparent. You could avoid
>>>> the need for run_pattern attribute, as setting the trigger would itself
>>>> activate the pattern, and setting brightness to 0 would turn it off.
>>>
>>> I like this idea, let me try to fix it.
>>
>> After thinking it over, I came to conclusion that implementing it as
>> an in-driver trigger is not a proper way to go, since triggers are
>> defined as kernel based source of LED events.
>>
>> This is somehow abused in case of timer trigger which takes hardware
>> blinking feature as a first choice and applies software blinking as
>> a fallback only. To be consistent with that, we could go for adding
>> generic pattern trigger and add a led_pattern_set() API, similarly
>> to existing led_blink_set().
>>
>> The problem is that different LED controllers may implement blinking
>> patterns that are configured with different set of parameters. This
>> subject would definitely require thorough analysis.
>>
>> For now, please just expose pattern settings as separate sysfs
>> attributes of a LED class device.
>>
>
> Thanks for your suggestion.
> Then, LM3633 LED driver will support 8 device attributes.
>
>      pattern_time_delay
>      pattern_time_rise
>      pattern_time_high
>      pattern_time_fall
>      pattern_time_low
>      pattern_brightness_low
>      pattern_brightness_high
>      pattern_run_pattern
>
> Details will be updated in
> Documentation/ABI/testing/sysfs-class-led-lm3633.

OK, it looks reasonable.

-- 
Best Regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
