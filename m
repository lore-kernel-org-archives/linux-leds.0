From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: leds: document new led-triggers
 property
Date: Sat, 21 Jan 2017 22:42:44 +0100
Message-ID: <46084d98-fddb-1b92-e9ca-d55957a442ae@gmail.com>
References: <20170120215605.15728-1-zajec5@gmail.com>
 <29f27028-20f3-3eb9-502f-1b51958640f9@gmail.com>
 <CACna6rx-qJ5eLMOUbMcaAxaOp9avrj1sa-8zZo2m+rVvY+Kvjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rx-qJ5eLMOUbMcaAxaOp9avrj1sa-8zZo2m+rVvY+Kvjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 01/21/2017 05:24 PM, Rafał Miłecki wrote:
> On 20 January 2017 at 23:35, Jacek Anaszewski
> <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 01/20/2017 10:56 PM, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>>
>>> Some LEDs can be related to particular devices described in DT. This
>>> property allows specifying such relations. E.g. USB LED should usually
>>> be used to indicate some USB port(s) state.
>>>
>>> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>> ---
>>> V2: Replace "usb-ports" with "led-triggers" property which is more generic and
>>>     allows specifying other devices as well.
>>>
>>> When bindings patch is related to some followup implementation, they usually go
>>> through the same tree.
>>>
>>> Greg: this patch is based on top of e64b8cc72bf9 ("DT: leds: Improve examples by
>>> adding some context") from kernel/git/j.anaszewski/linux-leds.git . Is there any
>>> way to solve this dependency issue? Or should this patch wait until 3.11 is
>>> released?
>>> ---
>>>  Documentation/devicetree/bindings/leds/common.txt | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
>>> index 24b656014089..17632a041196 100644
>>> --- a/Documentation/devicetree/bindings/leds/common.txt
>>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>>> @@ -49,6 +49,17 @@ Optional properties for child nodes:
>>>  - panic-indicator : This property specifies that the LED should be used,
>>>                   if at all possible, as a panic indicator.
>>>
>>> +- led-triggers : List of devices that should trigger this LED activity. Some
>>> +              LEDs can be related to a specific device and should somehow
>>> +              indicate its state. E.g. USB 2.0 LED may react to device(s) in
>>> +              a USB 2.0 port(s). Another common example is switch or router
>>> +              with multiple Ethernet ports each of them having its own LED
>>> +              assigned (assuminled-trigger-usbportg they are not hardwired).
>>> +              In such cases this property should contain phandle(s) of
>>> +              related device(s). In many cases LED can be related to more
>>> +              than one device (e.g. one USB LED vs. multiple USB ports) so a
>>> +              list of entries can be specified.
>>> +
>>
>> This implies that it is possible to define multiple triggers for
>> a LED class device but it is not supported by LED Trigger core.
>> There is linux,default-trigger property which allows to define one
>> trigger that will be initially assigned.
> 
> I think we owe some extra explanation to people not closely familiar
> with the triggers.
> 
> Linux has multiple trigger drivers each supporting some *type* of
> events. Linux supports assigning only one trigger driver to LED at a
> time.
> This means you can use e.g.:
> 1) "usbport" trigger driver that supports USB events
> XOR
> 2) "timer" trigger driver that uses timer to control LED
> XOR
> 3) "cpu" trigger driver that supports CPU events
> at once.

Correct.

> With proposed "led-triggers" property one could assign different
> trigger *sources* to a LED. You could e.g. assign 2 USB ports, network
> device & CPU to a single LED. For reason explained above Linux
> couldn't support all of them at once.
> 
> 
>> I am aware that this is renamed usb-ports property from v1,
>> that attempts to address Rob's comment, but we can't do that this way.
>> Maybe usb-ports property could be documented in led-trigger-usbport's
>> specific bindings and a reference to it could be added next to the
>> related entry on the list of the available LED triggers (which is
>> actually missing) in Documentation/devicetree/bindings/leds/common.txt.
> 
> I'm wondering if we need to care about this Linux limitation and if it
> should stop us from adding this flexible DT property. Maybe we could
> live with Linux having limitation of supporting one trigger type at a
> time?

That's what I meant. Generally I have objections to the generic
property for defining list of allowed triggers. That's why I proposed
to stay by usb-ports property that would be specific to only one
trigger: led-trigger-usbport.

led-trigger-usbport in fact is an entirely new type of LED trigger.
LED triggers is a kernel based source of events. All existing triggers
react only to a single, well defined source of events, whereas
led-trigger-usbport allows to define the scope of events (usb ports)
to notify about. Activity on each port is treated similarly and the LED
class device that listens to the trigger notifications doesn't know
which exact port triggered the notification.

>From this POV led-trigger-usbport is kind of facade, which allows
for it to fit well into the LED Trigger design and API, and usb ports
are not identical with LED triggers, but sit rather one level below.
It is led-trigger-usbport which is visible to the LED subsystem, and
not every single usb port.

Therefore it isn't logically justified to rename usb-ports property
to led-triggers. The property should be specific to this trigger.

> So e.g. if one assigns 2 USB ports + network device + CPU and
> decides to use "usport" trigger driver he'll get LED indicating status
> of USB ports only.

How would it be different from the current state? Only in limiting
the scope of triggers available for a LED class device.

> I think we could live with such limitation in Linux support for this
> generic "led-triggers" property. I think it's also not very common to
> have LED with different types of devices assigned. Personally I've
> never seen devices with LED label "USB & CPU" or whatever.

I agree. Nonetheless led-triggers seems to support such a design.

> What do you think about this? Maybe we could also document this
> limitation in trigger docs.

I'm not entirely sure if I got your point. Your reasoning seems
self contradicting to me in few places.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
