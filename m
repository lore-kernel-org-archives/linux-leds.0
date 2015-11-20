From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH RESEND 15/16] leds: add LM3633 driver
Date: Fri, 20 Nov 2015 10:22:52 +0100
Message-ID: <564EE66C.5010709@samsung.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-16-git-send-email-milo.kim@ti.com>
 <5638DD99.9070502@samsung.com> <56419F0C.90009@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <56419F0C.90009@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kim, Milo" <milo.kim@ti.com>
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 11/10/2015 08:38 AM, Kim, Milo wrote:
[...]
>>> +                cat /sys/class/leds/<led>/pattern_levels
>>> +                low brightness: 0, high brightness: 255
>>> +
>>> +What:        /sys/class/leds/<led>/run_pattern
>>> +Date:        Oct 2015
>>> +KernelVersion:    4.3
>>> +Contact:    Milo Kim <milo.kim@ti.com>
>>> +Description:    write only
>>> +                After 'pattern_times' and 'pattern_levels' are updated,
>>> +                run the pattern by writing 1 to 'run_pattern'.
>>> +                To stop running pattern, writes 0 to 'run_pattern'.
>>
>> I wonder how registering an in-driver trigger would work. It would
>> allow for hiding above pattern attributes when the trigger is inactive,
>> and thus making the sysfs interface more transparent. You could avoid
>> the need for run_pattern attribute, as setting the trigger would itself
>> activate the pattern, and setting brightness to 0 would turn it off.
>
> I like this idea, let me try to fix it.

After thinking it over, I came to conclusion that implementing it as
an in-driver trigger is not a proper way to go, since triggers are
defined as kernel based source of LED events.

This is somehow abused in case of timer trigger which takes hardware 
blinking feature as a first choice and applies software blinking as
a fallback only. To be consistent with that, we could go for adding
generic pattern trigger and add a led_pattern_set() API, similarly
to existing led_blink_set().

The problem is that different LED controllers may implement blinking
patterns that are configured with different set of parameters. This
subject would definitely require thorough analysis.

For now, please just expose pattern settings as separate sysfs
attributes of a LED class device.

-- 
Best Regards,
Jacek Anaszewski
