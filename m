From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 03/24] leds: dt-bindings: Add LED_FUNCTION definitions
Date: Sun, 11 Nov 2018 22:16:54 +0100
Message-ID: <b4314757-51b7-62da-d7bc-f27980248797@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-4-git-send-email-jacek.anaszewski@gmail.com>
 <20181111113157.GK27666@amd> <96296b4d-d49e-2b08-4306-196605a9f5dc@gmail.com>
 <20181111202056.GB20160@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181111202056.GB20160@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

On 11/11/2018 09:20 PM, Pavel Machek wrote:
> Hi!
> 
>>>> +#define LED_FUNCTION_BACKLIGHT "backlight"
>>>> +#define LED_FUNCTION_BACKLIGHT_CLUSTER "backlight_cluster"
>>>
>>> Sounds like one of backlight and backlight_cluster should be deprecated?
>>
>> I think so.
> 
> Agreed.
> 
>>>> +#define LED_FUNCTION_DEBUG "debug"
>>>> +#define LED_FUNCTION_DIA "dia"
>>>
>>> What does this one do?
>>
>> I'd opt for something like "diagnostics", but this is a blind shot.
>> Let's remove it then and, and let people add more meaningful
>> definition in case it is needed.
>>
>>>> +#define LED_FUNCTION_DISK "disk"
>>>
>>> We have disk, hd, hdd and sata. Deprecate some?
>>
>> Disk should be the best choice, especially given that we have
>> identically named trigger.
> 
> Ok.
> 
>>>> +#define LED_FUNCTION_HD "hd"
>>>> +#define LED_FUNCTION_HDD "hdd"
>>>> +#define LED_FUNCTION_HDDERR "hdderr"
>>>
>>> Ok, I'll 
>>
>> Hmm?
> 
> I was going to say that I'll bring it up in different email.
> 
> I believe we should have disk:green:activity and disk:red:error, not
> "green:hdd" and "red:hdderr".

How would you propose to name the section corresponding to "disk",
if "function" is occupied by "activity"? Should it deserve a separate
DT property?

>>>> +#define LED_FUNCTION_HEALTH "health"
>>>> +#define LED_FUNCTION_HEARTBEAT "heartbeat"
>>>
>>> Sounds same as alive, deprecate alive?
>>
>> Heartbeat may be designated specifically for registration
>> for events from the trigger with the same name.
> 
> Ok. What is "alive" then?

Tells whether something is active or not?
In this case it seems to overlap with "pwr" probably.

>>>> +#define LED_FUNCTION_WIFI "wifi"
>>>> +#define LED_FUNCTION_WIRELESS "wireless"
>>>> +#define LED_FUNCTION_WLAN "wlan"
>>>
>>> Same as wifi and wireless, I guess, deprecate some?
>>
>> I'd remove "wireless" and "wlan".
> 
> Actually I'd keep wlan, but... :-).

It may depend of the regional preferences.

> We may want to do add some comments there, and sort it "most
> common/recommended first" or something.
> 
> Best regards (and thanks for doing the work),

I'm doing it also for myself to avoid extra lines for
explaining the LED naming quirks every time a new driver
is submitted :-)

-- 
Best regards,
Jacek Anaszewski
