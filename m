From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: leds: document new led-triggers
 property
Date: Wed, 1 Feb 2017 22:55:15 +0100
Message-ID: <438140b2-896f-6a58-2529-9d30db6d4fde@gmail.com>
References: <20170120215605.15728-1-zajec5@gmail.com>
 <29f27028-20f3-3eb9-502f-1b51958640f9@gmail.com>
 <CACna6rx-qJ5eLMOUbMcaAxaOp9avrj1sa-8zZo2m+rVvY+Kvjw@mail.gmail.com>
 <46084d98-fddb-1b92-e9ca-d55957a442ae@gmail.com>
 <CACna6rx5HsSb=rXCjVth_2ed87tUSBJEZHHxTC_S1YOztLjp1A@mail.gmail.com>
 <ccc870b2-5857-507a-9c54-9a14ea60d3e5@gmail.com>
 <f9bda1d6-4265-8fe6-58ba-d6da5b462a0c@milecki.pl>
 <c4f1d3c4-d972-e305-abb9-a5c6e9e184e9@gmail.com>
 <d3535c2c-2a7c-4e8d-552c-666f76043b7d@gmail.com>
 <93896405-5ee0-ea85-72b1-5774c13a0c36@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34405 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751832AbdBAVzX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Feb 2017 16:55:23 -0500
In-Reply-To: <93896405-5ee0-ea85-72b1-5774c13a0c36@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>

On 02/01/2017 10:26 PM, Jacek Anaszewski wrote:
> On 02/01/2017 04:56 PM, Rafał Miłecki wrote:
>> On 01/31/2017 10:34 PM, Jacek Anaszewski wrote:
>>> On 01/31/2017 05:11 PM, Rafał Miłecki wrote:
>>>> Thanks a lot Jacek for this explanation (and sorry but I needed a bit of
>>>> time to
>>>> think about this). I can finally see your point, I think we're on the
>>>> same page
>>>> now.
>>>>
>>>> I think that for all this time I was thinking from the pure DT
>>>> perspective. If
>>>> you ignore fact that Linux has multiple LED trigger drivers, then
>>>> "led-triggers"
>>>> may not sound that bad.
>>>>
>>>> After reading your description however I can see this property can be
>>>> misleading
>>>> as Linux people may think "drivers" when seeing "triggers".
>>>>
>>>> I still think this is a useful property and I hope we can still find a
>>>> way to
>>>> name it in a sane way: to be nice from DT PoV and march Linux LEDs
>>>> subsystem.
>>>
>>> I also see the need for this property.
>>>
>>>> I think we should still work on some generic property (without linux,
>>>> prefix) as
>>>> this seems to be something generic, not really specific to Linux
>>>> implementation.
>>>> Specifying relation between LED and devices is something than AFAICS
>>>> can be
>>>> reused by other systems as well.
>>>>
>>>> So my suggestion is to try some new name & leave linux,default-trigger
>>>> to allow
>>>> specifying one single trigger driver as required by current Linux
>>>> implementation.
>>>>
>>>> What do you think about this?
>>>>
>>>> There are few suggestions to came to my mind:
>>>> "trigger-sources"
>>>> "trigger-devices"
>>>> "led-trigger-devices"
>>>> "led-related-devices"
>>>> "led-event-devices"
>>>
>>> trigger-devices would work in this specific use case,
>>> where we can give phandles to usb ports. Nonetheless, we
>>> have also other kernel based events serving as trigger
>>> sources - e.g. timer.
>>>
>>> In this case I'd go for trigger-sources, but we'd need
>>> to have some generic way of defining the source like timer.
>>
>> I'd leave timer for later discussion but I'm glad you brought this problem.
>> Maybe we could discuss this on another example that is more supported like
>> GPIOs?
>>
>> We know this property allows specifying USB ports and we want it to support
>> mixing various sources. So a very simple sample case seems to be using
>> it for
>> specifying GPIO as trigger source.
>>
>> Is this possible to mix various entries in a list assigned to single
>> property?
>> Let's say:
>> trigger-sources =
>>     <&ohci_port1>,
>>     <&ehci_port1>,
>>     <&gpio 1 GPIO_ACTIVE_HIGH>;
>
> According to my knowledge all elements in the list are elements
> of one array, no matter if they are comma separated or space separated
> in "<>" brackets. DT maintainer would have to confirm that though.

This matches my knowledge as well.


>> Is this possible to support this? If so, which function I can use to detect
>> what is pointed by a phandle?
>> I'm not that familiar with DT and I'm not sure how to handle this.
>
> I wonder if this is correct way to go. Maybe we should think of
> creating entirely new trigger mechanism that would allow for having
> multiple active triggers at a time.

I'm OK with reworking Linux's triggers if it need be. I think we should agree
on binding(s) first though.


> Of course trigger-sources would be still useful for defining
> a list of devices of the same type like in case of usbport trigger.
> Nonetheless, I have a problem with this property being a part of
> LED class device DT bindings. Triggers are not tightly coupled with
> LED class devices, but trigger-sources being a list of usb ports
> would be applicable only to usbport trigger. What if there was
> another combo trigger e.g. for reporting activity on mulitple GPIOs?

That was exactly my point with above trigger-sources example including 2 USB
ports & GPIO.


> Should we have separate list of trigger sources per any possible
> existing trigger type? Aren't we going to far from pure hardware
> description the Device Tree was initially predestined to?

That would simplify things, but it gets us back to *multiple* properties like
led-usb-triggers (or led-usb-trigger-sources)
led-pci-triggers (or led-pci-trigger-sources)
led-gpio-triggers (or led-gpio-trigger-sources)
etc.

Last time Rob said he's not going to accept something like this, see:

On 23 January 2017 at 17:45, Rob Herring <robh@kernel.org> wrote:
 > I'm not going to accept something specific to USB. So the choice is make
 > the existing property work for USB or design something more flexible and
 > generic.

So I think the main question right now is if this is possible to support mixed
entries in a list like that
trigger-sources =
	<&ohci_port1>,
	<&ehci_port1>,
	<&gpio 1 GPIO_ACTIVE_HIGH>;

I posted as example.

I was also trying to find help on IRC #devicetree channel but didn't get any
response:
[09:15] <rmilecki> hi, i've a question about mixing various entries in a single list
[09:16] <rmilecki> is this possible to have different /syntax/ in every list element
[09:16] <rmilecki> and have driver detect what does it reference?
[09:16] <rmilecki> i'll post an example
[09:17] <rmilecki> trigger-sources = <&ohci_port1>, <&ehci_port1>, <&gpio 1 GPIO_ACTIVE_HIGH>;
[09:18] <rmilecki> this question is related to my work in [PATCH V2 1/2] dt-bindings: leds: document new led-triggers property
[09:18] <rmilecki> beware, there is a long discussion in that thread

Rob: do you still follow this thread? We'd like to use single property as you
suggested, but is it possible to work with something like trigger-sources
example posted above?
