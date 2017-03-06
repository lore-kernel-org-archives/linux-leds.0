From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-bindings: leds: document property for LED triggers
Date: Mon, 6 Mar 2017 07:06:32 +0100
Message-ID: <b80fe65c-2fc9-94ac-9de2-29aee6b62033@milecki.pl>
References: <20170228120452.10043-1-zajec5@gmail.com>
 <a6d25fb5-db5e-5643-b150-23588944674a@gmail.com>
 <290ed068-2518-50ef-4d02-394bef8b7ee9@gmail.com>
 <CAL_JsqL-N4HfsG=py+w1NsBOJZzS1kbRM5J6dC-EE-rg9r9C2g@mail.gmail.com>
 <386c5b7b-0bc0-d286-6cbb-745a5adbc1e9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <386c5b7b-0bc0-d286-6cbb-745a5adbc1e9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 03/01/2017 10:04 PM, Jacek Anaszewski wrote:
> On 02/28/2017 11:12 PM, Rob Herring wrote:
>> On Tue, Feb 28, 2017 at 3:51 PM, Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 02/28/2017 10:38 PM, Jacek Anaszewski wrote:
>>>>
>>>> I think that it would be simpler if we could initially see
>>>> a complete sample dts implementation containing all required DT
>>>> nodes. The example could contain timer trigger as well as usb-port
>>>> trigger specific bindings.
>>>
>>>
>>> Please take a look at attached patch. I used it on Tenda AC9 with:
>>
>> I'm not sure about this extra level of indirection. I don't see the need.
>>
>>> usb_trigger: usb-trigger {
>>>         trigger-type = "usbport";
>>
>> Why do we need to know the type? The trigger device knows what type it
>> is. All we should need to know here is what device(s) controls an LED.
>> The rest the kernel can figure out.
>
> The thing is that in the proposed approach the trigger is not necessary
> a device. The trigger node is here only a container with initialization
> data.
>
> We could have e,g, two such nodes with different set of ports
> (say usb1-trigger and usb2-trigger). Then if we had two LED nodes usb1
> and usb2, the former could have its triggers property initialized
> to &usb1-trigger and the latter to &usb2-trigger. Thanks to that both
> LEDs after executing "echo usbport > triggers" would listen to events
> from different set of usb ports.
>
> Also, e.g. for the timer trigger we could define two separate DT nodes
> with different delay intervals.

Hi Rob, what do you think about this?

Jacek is correct, we could have e.g.
timer-trigger-1 {
	trigger-type = "timer";
	delay-on = <200>;
	delay-off = <500>;
};
timer-trigger-2 {
	trigger-type = "timer";
	delay-on = <500>;
	delay-off = <1000>;
};

or something like:
usbport-2-0-trigger {
	trigger-type = "usbport";
	ports = <&ohci_port1>, <&ehci_port1>;
};
usbport-3-0-trigger {
	trigger-type = "usbport";
	ports = <&xhci_port1>;
};

Does it make more sense?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
