From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] led: core: RfC - add RGB LED handling to the core
Date: Thu, 14 Jan 2016 13:05:29 +0100
Message-ID: <56978F09.7050204@samsung.com>
References: <5692BEB6.6040807@gmail.com> <56961C10.7090009@samsung.com>
 <5696AB6B.8040905@gmail.com> <569782FD.4040205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:25123 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752932AbcANMFe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jan 2016 07:05:34 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0X00D9XYX7N760@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 14 Jan 2016 12:05:31 +0000 (GMT)
In-reply-to: <569782FD.4040205@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

On 01/14/2016 12:14 PM, Jacek Anaszewski wrote:
> On 01/13/2016 08:54 PM, Heiner Kallweit wrote:
>> Am 13.01.2016 um 10:42 schrieb Jacek Anaszewski:
>>> Hi Heiner,
>>>
>>> Thank you for the patch. We have to ask a question here - what benefits
>>> these modifications bring about. Isn't all of this achievable in the
>>> user space? And I think that RGB LED problem can be boiled down to even
>>> more generic one, namely: how to make all the sub-LEDs controllable with
>>> a single LED class device. This subject pops out from time to time and
>>> it'd be good to have it tackled finally. Please refer to [1] and follow
>>> the links.
>>>
>>> [1] http://www.spinics.net/lists/linux-leds/msg04508.html
>>>
>>> Best Regards,
>>> Jacek Anaszewski
>>>
>>
>> Thanks for the prompt feedback, Jacek.
>> Regarding RGB support I also think of eventually making setting the color
>> available via triggers. This would allow kernel events to use colors.
>> I think of use cases like:
>> - add RGB support to heartbeat trigger: Then, with increasing load,
>>    the color can change from green to red.
>
> What do you mean by increasing load? Heartbeat is just blinking with
> specific time intervals and fixed brightness.
>
>> - combine temperature monitoring with a RGB LED trigger.
>> - in general visualizing parameters in the kernel with >2 states or a
>> range
>>    of possible values
>>
>> Therefore I think having RGB LED support in the kernel makes sense.
>> And we have it anyway also as of today, just in different forms in
>> different
>> corners of the kernel code.
>> Prerequiste for RGB-based triggers is one central API for controlling
>> RGB LEDs.
>>
>> When we come to sub-LEDs:
>> I'd define sub-LEDs as LEDs which are somehow grouped but basically
>> independent.
>> I don't think this definition applies to a RGB LED as the three LEDs
>> are not
>> independent.
>> I had a look at the referenced mail thread, however the usecase wasn't
>> clear
>> to me. I understand that it's about making LEDs blink synchronously but
>> there was no example what it could be good for. Can you list some
>> usecases?
>> Maybe once I see some usecases for sub-LEDs it becomes clearer what
>> they have
>> in common with RGB LEDs.
>
> I got influenced by the fact that led-blinkm driver exposes separate
> LED class devices per each color component. It automatically brought
> sync subLEDs problem to my mind. The main benefit of synchronizing
> subLEDs would be possibility of setting a trigger per group of subLEDs,
> but current API doesn't allow for setting different brightness per
> triggered subLED, so it wouldn't work properly for RGB LEDs.
>
> It was not an issue in case of flash LEDs, from which the subject
> arose originally. Only strobe operation was to be synchronized then
> and brightness could had been set in one of the previous steps.
>
> max77693-flash device driver was being developed then
> (drivers/leds/leds-max77693.c), which exposes two current outputs, that
> are controlled separately, but can be joint to double the maximum
> current for the flash strobe of a single LED.
> Synchronization would be beneficial for the case when two separate
> LEDs are connected to both outputs and we'd like to synchronize the
> flash strobe. Strobing both LEDs required accessing a single register.
>
> All the above seem to be irrelevant for RGB LEDs case.
>
> Nonetheless, one straightforward idea came to my mind - we could expose
> RGB LED as a single LED class device and control the intensity of each
> color as usual with brightness attribute.
>
> It is of enum type (i.e. at least 4 bytes), so each color component
> could be stored in one byte. With this approach no changes would be
> needed to the LED core to meet requirements from your RFC. Please let
> me know if I missed something?

Of course I missed that we need both brightness and rgb value.
In this case, some of changes you proposed by are indeed required.
I'll add more comments in the response to your RFC.

-- 
Best Regards,
Jacek Anaszewski
