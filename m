From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: leds: document new led-triggers
 property
Date: Wed, 1 Feb 2017 08:38:48 +0100
Message-ID: <eeb92b4d-cdfa-407c-8aea-c2e05716f772@gmail.com>
References: <20170120215605.15728-1-zajec5@gmail.com>
 <29f27028-20f3-3eb9-502f-1b51958640f9@gmail.com>
 <CACna6rx-qJ5eLMOUbMcaAxaOp9avrj1sa-8zZo2m+rVvY+Kvjw@mail.gmail.com>
 <46084d98-fddb-1b92-e9ca-d55957a442ae@gmail.com>
 <CACna6rx5HsSb=rXCjVth_2ed87tUSBJEZHHxTC_S1YOztLjp1A@mail.gmail.com>
 <ccc870b2-5857-507a-9c54-9a14ea60d3e5@gmail.com>
 <f9bda1d6-4265-8fe6-58ba-d6da5b462a0c@milecki.pl>
 <c4f1d3c4-d972-e305-abb9-a5c6e9e184e9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34425 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751080AbdBAHi5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Feb 2017 02:38:57 -0500
In-Reply-To: <c4f1d3c4-d972-e305-abb9-a5c6e9e184e9@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>

On 01/31/2017 10:34 PM, Jacek Anaszewski wrote:
> On 01/31/2017 05:11 PM, Rafał Miłecki wrote:
>> On 01/25/2017 10:04 PM, Jacek Anaszewski wrote:
>>> On 01/25/2017 10:03 AM, Rafał Miłecki wrote:
>>>> On 21 January 2017 at 22:42, Jacek Anaszewski
>>>> <jacek.anaszewski@gmail.com> wrote:
>>>>> On 01/21/2017 05:24 PM, Rafał Miłecki wrote:
>>>>>> On 20 January 2017 at 23:35, Jacek Anaszewski
>>>>>> <jacek.anaszewski@gmail.com> wrote:
>>>>>>> On 01/20/2017 10:56 PM, Rafał Miłecki wrote:
>>>>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>>>>
>>>>>>>> Some LEDs can be related to particular devices described in DT. This
>>>>>>>> property allows specifying such relations. E.g. USB LED should
>>>>>>>> usually
>>>>>>>> be used to indicate some USB port(s) state.
>>>>>>>>
>>>>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>>>>> ---
>>>>>>>> V2: Replace "usb-ports" with "led-triggers" property which is
>>>>>>>> more generic and
>>>>>>>>     allows specifying other devices as well.
>>>>>>>>
>>>>>>>> When bindings patch is related to some followup implementation,
>>>>>>>> they usually go
>>>>>>>> through the same tree.
>>>>>>>>
>>>>>>>> Greg: this patch is based on top of e64b8cc72bf9 ("DT: leds:
>>>>>>>> Improve examples by
>>>>>>>> adding some context") from kernel/git/j.anaszewski/linux-leds.git
>>>>>>>> . Is there any
>>>>>>>> way to solve this dependency issue? Or should this patch wait
>>>>>>>> until 3.11 is
>>>>>>>> released?
>>>>>>>> ---
>>>>>>>>  Documentation/devicetree/bindings/leds/common.txt | 16
>>>>>>>> ++++++++++++++++
>>>>>>>>  1 file changed, 16 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/leds/common.txt
>>>>>>>> b/Documentation/devicetree/bindings/leds/common.txt
>>>>>>>> index 24b656014089..17632a041196 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/leds/common.txt
>>>>>>>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>>>>>>>> @@ -49,6 +49,17 @@ Optional properties for child nodes:
>>>>>>>>  - panic-indicator : This property specifies that the LED should
>>>>>>>> be used,
>>>>>>>>                   if at all possible, as a panic indicator.
>>>>>>>>
>>>>>>>> +- led-triggers : List of devices that should trigger this LED
>>>>>>>> activity. Some
>>>>>>>> +              LEDs can be related to a specific device and
>>>>>>>> should somehow
>>>>>>>> +              indicate its state. E.g. USB 2.0 LED may react to
>>>>>>>> device(s) in
>>>>>>>> +              a USB 2.0 port(s). Another common example is
>>>>>>>> switch or router
>>>>>>>> +              with multiple Ethernet ports each of them having
>>>>>>>> its own LED
>>>>>>>> +              assigned (assuminled-trigger-usbportg they are not
>>>>>>>> hardwired).
>>>>>>>> +              In such cases this property should contain
>>>>>>>> phandle(s) of
>>>>>>>> +              related device(s). In many cases LED can be
>>>>>>>> related to more
>>>>>>>> +              than one device (e.g. one USB LED vs. multiple USB
>>>>>>>> ports) so a
>>>>>>>> +              list of entries can be specified.
>>>>>>>> +
>>>>>>>
>>>>>>> This implies that it is possible to define multiple triggers for
>>>>>>> a LED class device but it is not supported by LED Trigger core.
>>>>>>> There is linux,default-trigger property which allows to define one
>>>>>>> trigger that will be initially assigned.
>>>>>
>>>>>> With proposed "led-triggers" property one could assign different
>>>>>> trigger *sources* to a LED. You could e.g. assign 2 USB ports, network
>>>>>> device & CPU to a single LED. For reason explained above Linux
>>>>>> couldn't support all of them at once.
>>>>>>
>>>>>>
>>>>>>> I am aware that this is renamed usb-ports property from v1,
>>>>>>> that attempts to address Rob's comment, but we can't do that this
>>>>>>> way.
>>>>>>> Maybe usb-ports property could be documented in led-trigger-usbport's
>>>>>>> specific bindings and a reference to it could be added next to the
>>>>>>> related entry on the list of the available LED triggers (which is
>>>>>>> actually missing) in
>>>>>>> Documentation/devicetree/bindings/leds/common.txt.
>>>>>>
>>>>>> I'm wondering if we need to care about this Linux limitation and if it
>>>>>> should stop us from adding this flexible DT property. Maybe we could
>>>>>> live with Linux having limitation of supporting one trigger type at a
>>>>>> time?
>>>>>
>>>>> That's what I meant. Generally I have objections to the generic
>>>>> property for defining list of allowed triggers. That's why I proposed
>>>>> to stay by usb-ports property that would be specific to only one
>>>>> trigger: led-trigger-usbport.
>>>>>
>>>>> led-trigger-usbport in fact is an entirely new type of LED trigger.
>>>>> LED triggers is a kernel based source of events. All existing triggers
>>>>> react only to a single, well defined source of events, whereas
>>>>> led-trigger-usbport allows to define the scope of events (usb ports)
>>>>> to notify about. Activity on each port is treated similarly and the LED
>>>>> class device that listens to the trigger notifications doesn't know
>>>>> which exact port triggered the notification.
>>>>>
>>>>> From this POV led-trigger-usbport is kind of facade, which allows
>>>>> for it to fit well into the LED Trigger design and API, and usb ports
>>>>> are not identical with LED triggers, but sit rather one level below.
>>>>> It is led-trigger-usbport which is visible to the LED subsystem, and
>>>>> not every single usb port.
>>>>>
>>>>>> So e.g. if one assigns 2 USB ports + network device + CPU and
>>>>>> decides to use "usport" trigger driver he'll get LED indicating status
>>>>>> of USB ports only.
>>>>>
>>>>> How would it be different from the current state? Only in limiting
>>>>> the scope of triggers available for a LED class device.
>>>>
>>>> It won't differ from the current state. I just wanted to make it clear
>>>> Linux trigger drivers may respect only selected "led-triggers" values
>>>> (phandles). Like "usbport" respecting USB port phandles but ignoring
>>>> CPU ones, net ones, etc.
>>>
>>> This is the ambiguity I want to avoid. According to my analysis from
>>> the previous message, physical usb port is one level below usbport LED
>>> trigger, and it should be reflected in DT binding documentation. You
>>> can't write usb1-port1 (using the convention from Documentation/leds/
>>> ledtrig-usbport.txt) to the "triggers" sysfs file. You can only register
>>> usbport trigger which can be configured to notify about activity on
>>> usb1-port1.
>>>
>>> That's why I proposed linux,trigger-sources name for that.
>>> Let's not confuse LED triggers with events originating from physical
>>> devices or other sources of kernel events, being in turn translated by
>>> LED triggers to LED brightness changes.
>>>
>>> This is a thing about naming. It is tempting to call sources of kernel
>>> events "triggers", but they are not LED triggers on they own. LED
>>> trigger is a driver that registers itself in LED Trigger core using
>>> led_trigger_register() API.
>>
>> Thanks a lot Jacek for this explanation (and sorry but I needed a bit of
>> time to
>> think about this). I can finally see your point, I think we're on the
>> same page
>> now.
>>
>> I think that for all this time I was thinking from the pure DT
>> perspective. If
>> you ignore fact that Linux has multiple LED trigger drivers, then
>> "led-triggers"
>> may not sound that bad.
>>
>> After reading your description however I can see this property can be
>> misleading
>> as Linux people may think "drivers" when seeing "triggers".
>>
>> I still think this is a useful property and I hope we can still find a
>> way to
>> name it in a sane way: to be nice from DT PoV and march Linux LEDs
>> subsystem.
>
> I also see the need for this property.
>
>> I think we should still work on some generic property (without linux,
>> prefix) as
>> this seems to be something generic, not really specific to Linux
>> implementation.
>> Specifying relation between LED and devices is something than AFAICS can be
>> reused by other systems as well.
>>
>> So my suggestion is to try some new name & leave linux,default-trigger
>> to allow
>> specifying one single trigger driver as required by current Linux
>> implementation.
>>
>> What do you think about this?
>>
>> There are few suggestions to came to my mind:
>> "trigger-sources"
>> "trigger-devices"
>> "led-trigger-devices"
>> "led-related-devices"
>> "led-event-devices"
>
> trigger-devices would work in this specific use case,
> where we can give phandles to usb ports. Nonetheless, we
> have also other kernel based events serving as trigger
> sources - e.g. timer.
>
> In this case I'd go for trigger-sources, but we'd need
> to have some generic way of defining the source like timer.

OK, let's try "trigger-sources" then!

I'll rename this property and send V3 with hopefully a better description.
