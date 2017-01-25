From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: leds: document new led-triggers
 property
Date: Wed, 25 Jan 2017 10:08:59 +0100
Message-ID: <d791bf97-d2f0-1f33-724a-9dd0c4f631ae@gmail.com>
References: <20170120215605.15728-1-zajec5@gmail.com>
 <29f27028-20f3-3eb9-502f-1b51958640f9@gmail.com>
 <20170123164537.ldq6de64adjkefbr@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170123164537.ldq6de64adjkefbr@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 01/23/2017 05:45 PM, Rob Herring wrote:
> On Fri, Jan 20, 2017 at 11:35:20PM +0100, Jacek Anaszewski wrote:
>> Hi Rafał,
>>
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
>>>  		    if at all possible, as a panic indicator.
>>>
>>> +- led-triggers : List of devices that should trigger this LED activity. Some
>>> +		 LEDs can be related to a specific device and should somehow
>>> +		 indicate its state. E.g. USB 2.0 LED may react to device(s) in
>>> +		 a USB 2.0 port(s). Another common example is switch or router
>>> +		 with multiple Ethernet ports each of them having its own LED
>>> +		 assigned (assuminled-trigger-usbportg they are not hardwired).
>>> +		 In such cases this property should contain phandle(s) of
>>> +		 related device(s). In many cases LED can be related to more
>>> +		 than one device (e.g. one USB LED vs. multiple USB ports) so a
>>> +		 list of entries can be specified.
>>> +
>>
>> This implies that it is possible to define multiple triggers for
>> a LED class device but it is not supported by LED Trigger core.
>
> Not really relevant for designing (and future proofing) a binding.

This is what I really like in this "led-triggers" property: it's future proof. I
will be able to reuse it in other trigger drivers and I won't be trying to sneak
properties like
* usb-port-triggers
* net-interface-triggers
* cpu-triggers
etc.

Saying that thanks Rob for rejecting my initial "usb-ports" property try :P
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
