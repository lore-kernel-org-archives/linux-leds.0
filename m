From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] led: core: RfC - add RGB LED handling to the core
Date: Thu, 14 Jan 2016 12:14:05 +0100
Message-ID: <569782FD.4040205@samsung.com>
References: <5692BEB6.6040807@gmail.com> <56961C10.7090009@samsung.com>
 <5696AB6B.8040905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:65034 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750939AbcANLOI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jan 2016 06:14:08 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0X008LZWJIU140@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 14 Jan 2016 11:14:06 +0000 (GMT)
In-reply-to: <5696AB6B.8040905@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

On 01/13/2016 08:54 PM, Heiner Kallweit wrote:
> Am 13.01.2016 um 10:42 schrieb Jacek Anaszewski:
>> Hi Heiner,
>>
>> Thank you for the patch. We have to ask a question here - what benefits
>> these modifications bring about. Isn't all of this achievable in the
>> user space? And I think that RGB LED problem can be boiled down to even
>> more generic one, namely: how to make all the sub-LEDs controllable with
>> a single LED class device. This subject pops out from time to time and
>> it'd be good to have it tackled finally. Please refer to [1] and follow
>> the links.
>>
>> [1] http://www.spinics.net/lists/linux-leds/msg04508.html
>>
>> Best Regards,
>> Jacek Anaszewski
>>
>
> Thanks for the prompt feedback, Jacek.
> Regarding RGB support I also think of eventually making setting the color
> available via triggers. This would allow kernel events to use colors.
> I think of use cases like:
> - add RGB support to heartbeat trigger: Then, with increasing load,
>    the color can change from green to red.

What do you mean by increasing load? Heartbeat is just blinking with
specific time intervals and fixed brightness.

> - combine temperature monitoring with a RGB LED trigger.
> - in general visualizing parameters in the kernel with >2 states or a range
>    of possible values
>
> Therefore I think having RGB LED support in the kernel makes sense.
> And we have it anyway also as of today, just in different forms in different
> corners of the kernel code.
> Prerequiste for RGB-based triggers is one central API for controlling RGB LEDs.
>
> When we come to sub-LEDs:
> I'd define sub-LEDs as LEDs which are somehow grouped but basically independent.
> I don't think this definition applies to a RGB LED as the three LEDs are not
> independent.
> I had a look at the referenced mail thread, however the usecase wasn't clear
> to me. I understand that it's about making LEDs blink synchronously but
> there was no example what it could be good for. Can you list some usecases?
> Maybe once I see some usecases for sub-LEDs it becomes clearer what they have
> in common with RGB LEDs.

I got influenced by the fact that led-blinkm driver exposes separate
LED class devices per each color component. It automatically brought
sync subLEDs problem to my mind. The main benefit of synchronizing
subLEDs would be possibility of setting a trigger per group of subLEDs,
but current API doesn't allow for setting different brightness per
triggered subLED, so it wouldn't work properly for RGB LEDs.

It was not an issue in case of flash LEDs, from which the subject
arose originally. Only strobe operation was to be synchronized then
and brightness could had been set in one of the previous steps.

max77693-flash device driver was being developed then
(drivers/leds/leds-max77693.c), which exposes two current outputs, that 
are controlled separately, but can be joint to double the maximum
current for the flash strobe of a single LED.
Synchronization would be beneficial for the case when two separate
LEDs are connected to both outputs and we'd like to synchronize the
flash strobe. Strobing both LEDs required accessing a single register.

All the above seem to be irrelevant for RGB LEDs case.

Nonetheless, one straightforward idea came to my mind - we could expose
RGB LED as a single LED class device and control the intensity of each
color as usual with brightness attribute.

It is of enum type (i.e. at least 4 bytes), so each color component
could be stored in one byte. With this approach no changes would be
needed to the LED core to meet requirements from your RFC. Please let
me know if I missed something?

> The primary question with sub-LEDs most likely is:
> Which properties can be controlled on a per-LED basis and which ones only
> on a LED group basis?



> (Or should it be supported that I can fiddle with properties on a per-LED
> and on a group basis in parallel?)
> I'd assume that the following idea is not brand-new: I could imagine to
> have sysfs nodes for LED groups under /sys/class/leds including:
> - attributes for the LED properties delegated to the group
> - links to the led_classdev nodes of the respective LEDs in the group
>
> Kind Regards, Heiner
>
>> On 01/10/2016 09:27 PM, Heiner Kallweit wrote:
>>> When playing with a ThingM Blink(1) USB RGB LED device I found that there
>>> are few drivers for RGB LED's spread across the kernel and each one
>>> implements the RGB functionality in its own way.
>>> Some examples:
>>> - drivers/hid/hid-thingm.c
>>> - drivers/usb/misc/usbled.c
>>> - drivers/leds/leds-bd2802.c
>>> - drivers/leds/leds-blinkm.c
>>> ...
>>> IMHO it would make sense to add generic RGB functionality to the LED core.
>>>
>>> Things I didn't like too much in other driver implementations:
>>> - one led_classdev per color or at least
>>> - one sysfs attribute per color
>>> Colors are not really independent therefore I'd prefer one led_classdev
>>> per RGB LED. Also userspace should be able to change the color with one
>>> call -> therefore only one sysfs attribute for the RGB values.
>>>
>>> Also the current brightness-related functionality should not be effected
>>> by the RGB extension.
>>>
>>> This patch is intended to demonstrate the idea of the extension. Most likely
>>> it's not ready yet for submission.
>>>
>>> Main idea is to base the effective RGB value on a combination of brightness
>>> and a scaled-to-max RGB value.
>>> The RGB-related callbacks are basically the same as for brightness.
>>> RGB functionally can be switched on with a new flag in the led_classdev.flags
>>> bitmap.
>>>
>>> Experimentally I changed the thingm driver to use this extension and it works
>>> quite well. As one result the driver could be very much simplified.
>>>
>>> Any feedback is appreciated.
>>> [...]
>>
>>
>>
>
>
>


-- 
Best Regards,
Jacek Anaszewski
