From: Milo Kim <milo.kim@ti.com>
Subject: Re: brightness units
Date: Wed, 2 Apr 2014 08:42:24 +0900
Message-ID: <533B4EE0.9000402@ti.com>
References: <533A6905.3010600@samsung.com> <CAK5ve-LNU_BGUB_HxsbgiO4baM-39C7PWHRVx0DL=JTYfJGSuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:58255 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753245AbaDAXmp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 1 Apr 2014 19:42:45 -0400
In-Reply-To: <CAK5ve-LNU_BGUB_HxsbgiO4baM-39C7PWHRVx0DL=JTYfJGSuA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Sakari Ailus <sakari.ailus@iki.fi>

Hi Jacek and Bryan,

On 04/02/2014 07:09 AM, Bryan Wu wrote:
> On Tue, Apr 1, 2014 at 12:21 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>> I am currently integrating LED subsystem and V4L2 Flash API.
>> V4L2 Flash API defines units of torch and flash intensity
>> in milliampers. In the LED subsystem documentation I can't
>> find any reference to the brightness units. On the other
>> hand there is led_brightness enum defined in the <linux/leds.h>
>> header, with LED_FULL = 255, but not all leds drivers use it.
>> I am aware that there are LEDs that can be only turned on/off
>> without any possibility to set the current and in such cases
>> LED_FULL doesn't reflect the current set.
>>
>
> Actually led_brightness is an logic concept not like milliampers,
> since different led drivers has different implementation which is
> hardware related. Like PWM led driver, it will be converted to duty
> cycles.
>
> For current control I do see some specific driver like LP55xx have it
> but not for every one.
>
>> So far I've assumed that brightness is expressed in milliampers
>> and I don't stick to the LED_FULL limit. It allows for passing
>> flash/torch intensity from V4L2 controls to the leds API
>> without conversion. I am not sure if the units should be
>> fixed to milliampers in the LED subsystem or not. It would
>> clarify the situation, but if the existing LED drivers don't
>> stick to this unit then it would make a confusion.
>>
>
> We probably need to convert those intensity to brightness numbers, for
> example mapping the intensity value to 0 ~ 255 brightness level and
> pass it to LED subsystem.
>
>> In view of the above I'd like to ask for any advice on
>> how to proceed.

In LP55xx drivers, brightness and current are separate feature.
Brightness is PWM output from the LED device. It's exactly matched with 
LED subsystem.
Current setting is used for output limit of each LED channel. This is 
the device specific feature. It's not max brightness domain.
To support various LED components, we need this feature. If the output 
current is too big, some LED components will be burned.

My opinion, it would be better if you could scale the flash/torch 
intensity and pass to the brightness of LED subsystem.
Specific milliamps value is device specific, so we may need generic 
interface to set the intensity by using LED subsystem.

Best regards,
Milo
