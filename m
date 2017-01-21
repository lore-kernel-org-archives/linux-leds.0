From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: leds: document new led-triggers property
Date: Sat, 21 Jan 2017 17:24:38 +0100
Message-ID: <CACna6rx-qJ5eLMOUbMcaAxaOp9avrj1sa-8zZo2m+rVvY+Kvjw@mail.gmail.com>
References: <20170120215605.15728-1-zajec5@gmail.com> <29f27028-20f3-3eb9-502f-1b51958640f9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <29f27028-20f3-3eb9-502f-1b51958640f9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 20 January 2017 at 23:35, Jacek Anaszewski
<jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 01/20/2017 10:56 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> Some LEDs can be related to particular devices described in DT. This
>> property allows specifying such relations. E.g. USB LED should usually
>> be used to indicate some USB port(s) state.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>> ---
>> V2: Replace "usb-ports" with "led-triggers" property which is more gener=
ic and
>>     allows specifying other devices as well.
>>
>> When bindings patch is related to some followup implementation, they usu=
ally go
>> through the same tree.
>>
>> Greg: this patch is based on top of e64b8cc72bf9 ("DT: leds: Improve exa=
mples by
>> adding some context") from kernel/git/j.anaszewski/linux-leds.git . Is t=
here any
>> way to solve this dependency issue? Or should this patch wait until 3.11=
 is
>> released?
>> ---
>>  Documentation/devicetree/bindings/leds/common.txt | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documen=
tation/devicetree/bindings/leds/common.txt
>> index 24b656014089..17632a041196 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -49,6 +49,17 @@ Optional properties for child nodes:
>>  - panic-indicator : This property specifies that the LED should be used=
,
>>                   if at all possible, as a panic indicator.
>>
>> +- led-triggers : List of devices that should trigger this LED activity.=
 Some
>> +              LEDs can be related to a specific device and should someh=
ow
>> +              indicate its state. E.g. USB 2.0 LED may react to device(=
s) in
>> +              a USB 2.0 port(s). Another common example is switch or ro=
uter
>> +              with multiple Ethernet ports each of them having its own =
LED
>> +              assigned (assuminled-trigger-usbportg they are not hardwi=
red).
>> +              In such cases this property should contain phandle(s) of
>> +              related device(s). In many cases LED can be related to mo=
re
>> +              than one device (e.g. one USB LED vs. multiple USB ports)=
 so a
>> +              list of entries can be specified.
>> +
>
> This implies that it is possible to define multiple triggers for
> a LED class device but it is not supported by LED Trigger core.
> There is linux,default-trigger property which allows to define one
> trigger that will be initially assigned.

I think we owe some extra explanation to people not closely familiar
with the triggers.

Linux has multiple trigger drivers each supporting some *type* of
events. Linux supports assigning only one trigger driver to LED at a
time.
This means you can use e.g.:
1) "usbport" trigger driver that supports USB events
XOR
2) "timer" trigger driver that uses timer to control LED
XOR
3) "cpu" trigger driver that supports CPU events
at once.

With proposed "led-triggers" property one could assign different
trigger *sources* to a LED. You could e.g. assign 2 USB ports, network
device & CPU to a single LED. For reason explained above Linux
couldn't support all of them at once.


> I am aware that this is renamed usb-ports property from v1,
> that attempts to address Rob's comment, but we can't do that this way.
> Maybe usb-ports property could be documented in led-trigger-usbport's
> specific bindings and a reference to it could be added next to the
> related entry on the list of the available LED triggers (which is
> actually missing) in Documentation/devicetree/bindings/leds/common.txt.

I'm wondering if we need to care about this Linux limitation and if it
should stop us from adding this flexible DT property. Maybe we could
live with Linux having limitation of supporting one trigger type at a
time? So e.g. if one assigns 2 USB ports + network device + CPU and
decides to use "usport" trigger driver he'll get LED indicating status
of USB ports only.

I think we could live with such limitation in Linux support for this
generic "led-triggers" property. I think it's also not very common to
have LED with different types of devices assigned. Personally I've
never seen devices with LED label "USB & CPU" or whatever.

What do you think about this? Maybe we could also document this
limitation in trigger docs.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
