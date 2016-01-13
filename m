From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] led: core: RfC - add RGB LED handling to the core
Date: Wed, 13 Jan 2016 20:54:19 +0100
Message-ID: <5696AB6B.8040905@gmail.com>
References: <5692BEB6.6040807@gmail.com> <56961C10.7090009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:33480 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933420AbcAMTyd (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 13 Jan 2016 14:54:33 -0500
Received: by mail-wm0-f51.google.com with SMTP id f206so310279856wmf.0
        for <linux-leds@vger.kernel.org>; Wed, 13 Jan 2016 11:54:32 -0800 (PST)
In-Reply-To: <56961C10.7090009@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Am 13.01.2016 um 10:42 schrieb Jacek Anaszewski:
> Hi Heiner,
> 
> Thank you for the patch. We have to ask a question here - what benefits
> these modifications bring about. Isn't all of this achievable in the
> user space? And I think that RGB LED problem can be boiled down to even
> more generic one, namely: how to make all the sub-LEDs controllable with
> a single LED class device. This subject pops out from time to time and
> it'd be good to have it tackled finally. Please refer to [1] and follow
> the links.
> 
> [1] http://www.spinics.net/lists/linux-leds/msg04508.html
> 
> Best Regards,
> Jacek Anaszewski
> 

Thanks for the prompt feedback, Jacek.
Regarding RGB support I also think of eventually making setting the color
available via triggers. This would allow kernel events to use colors.
I think of use cases like:
- add RGB support to heartbeat trigger: Then, with increasing load,
  the color can change from green to red.
- combine temperature monitoring with a RGB LED trigger.
- in general visualizing parameters in the kernel with >2 states or a range
  of possible values

Therefore I think having RGB LED support in the kernel makes sense.
And we have it anyway also as of today, just in different forms in different
corners of the kernel code.
Prerequiste for RGB-based triggers is one central API for controlling RGB LEDs.

When we come to sub-LEDs:
I'd define sub-LEDs as LEDs which are somehow grouped but basically independent.
I don't think this definition applies to a RGB LED as the three LEDs are not
independent.
I had a look at the referenced mail thread, however the usecase wasn't clear
to me. I understand that it's about making LEDs blink synchronously but
there was no example what it could be good for. Can you list some usecases?
Maybe once I see some usecases for sub-LEDs it becomes clearer what they have
in common with RGB LEDs.

The primary question with sub-LEDs most likely is:
Which properties can be controlled on a per-LED basis and which ones only
on a LED group basis?
(Or should it be supported that I can fiddle with properties on a per-LED
and on a group basis in parallel?)
I'd assume that the following idea is not brand-new: I could imagine to
have sysfs nodes for LED groups under /sys/class/leds including:
- attributes for the LED properties delegated to the group
- links to the led_classdev nodes of the respective LEDs in the group

Kind Regards, Heiner

> On 01/10/2016 09:27 PM, Heiner Kallweit wrote:
>> When playing with a ThingM Blink(1) USB RGB LED device I found that there
>> are few drivers for RGB LED's spread across the kernel and each one
>> implements the RGB functionality in its own way.
>> Some examples:
>> - drivers/hid/hid-thingm.c
>> - drivers/usb/misc/usbled.c
>> - drivers/leds/leds-bd2802.c
>> - drivers/leds/leds-blinkm.c
>> ...
>> IMHO it would make sense to add generic RGB functionality to the LED core.
>>
>> Things I didn't like too much in other driver implementations:
>> - one led_classdev per color or at least
>> - one sysfs attribute per color
>> Colors are not really independent therefore I'd prefer one led_classdev
>> per RGB LED. Also userspace should be able to change the color with one
>> call -> therefore only one sysfs attribute for the RGB values.
>>
>> Also the current brightness-related functionality should not be effected
>> by the RGB extension.
>>
>> This patch is intended to demonstrate the idea of the extension. Most likely
>> it's not ready yet for submission.
>>
>> Main idea is to base the effective RGB value on a combination of brightness
>> and a scaled-to-max RGB value.
>> The RGB-related callbacks are basically the same as for brightness.
>> RGB functionally can be switched on with a new flag in the led_classdev.flags
>> bitmap.
>>
>> Experimentally I changed the thingm driver to use this extension and it works
>> quite well. As one result the driver could be very much simplified.
>>
>> Any feedback is appreciated.
>> [...]
> 
> 
> 
