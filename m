From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: leds: document new led-triggers
 property
Date: Wed, 25 Jan 2017 10:18:06 +0100
Message-ID: <2aed99c3-7ebe-8b16-5d75-8d0d5b20c27e@gmail.com>
References: <20170120215605.15728-1-zajec5@gmail.com>
 <29f27028-20f3-3eb9-502f-1b51958640f9@gmail.com>
 <20170123164537.ldq6de64adjkefbr@rob-hp-laptop>
 <d54867f6-5b29-c5a1-db26-ae9d9640e22c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35671 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751376AbdAYJSK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Jan 2017 04:18:10 -0500
In-Reply-To: <d54867f6-5b29-c5a1-db26-ae9d9640e22c@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

On 01/23/2017 09:51 PM, Jacek Anaszewski wrote:
> On 01/23/2017 05:45 PM, Rob Herring wrote:
>> On Fri, Jan 20, 2017 at 11:35:20PM +0100, Jacek Anaszewski wrote:
>>> Hi Rafał,
>>>
>>> On 01/20/2017 10:56 PM, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> Some LEDs can be related to particular devices described in DT. This
>>>> property allows specifying such relations. E.g. USB LED should usually
>>>> be used to indicate some USB port(s) state.
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>> V2: Replace "usb-ports" with "led-triggers" property which is more generic and
>>>>     allows specifying other devices as well.
>>>>
>>>> When bindings patch is related to some followup implementation, they usually go
>>>> through the same tree.
>>>>
>>>> Greg: this patch is based on top of e64b8cc72bf9 ("DT: leds: Improve examples by
>>>> adding some context") from kernel/git/j.anaszewski/linux-leds.git . Is there any
>>>> way to solve this dependency issue? Or should this patch wait until 3.11 is
>>>> released?
>>>> ---
>>>>  Documentation/devicetree/bindings/leds/common.txt | 16 ++++++++++++++++
>>>>  1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
>>>> index 24b656014089..17632a041196 100644
>>>> --- a/Documentation/devicetree/bindings/leds/common.txt
>>>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>>>> @@ -49,6 +49,17 @@ Optional properties for child nodes:
>>>>  - panic-indicator : This property specifies that the LED should be used,
>>>>  		    if at all possible, as a panic indicator.
>>>>
>>>> +- led-triggers : List of devices that should trigger this LED activity. Some
>>>> +		 LEDs can be related to a specific device and should somehow
>>>> +		 indicate its state. E.g. USB 2.0 LED may react to device(s) in
>>>> +		 a USB 2.0 port(s). Another common example is switch or router
>>>> +		 with multiple Ethernet ports each of them having its own LED
>>>> +		 assigned (assuminled-trigger-usbportg they are not hardwired).
>>>> +		 In such cases this property should contain phandle(s) of
>>>> +		 related device(s). In many cases LED can be related to more
>>>> +		 than one device (e.g. one USB LED vs. multiple USB ports) so a
>>>> +		 list of entries can be specified.
>>>> +
>>>
>>> This implies that it is possible to define multiple triggers for
>>> a LED class device but it is not supported by LED Trigger core.
>>
>> Not really relevant for designing (and future proofing) a binding.
>
> But relevant for LED Trigger ABI, which would have to be changed to
> support the semantics in this form. I think that changing the property
> name to linux,trigger-sources would make its purpose more clear.
>
> Note that we have to also associate somehow this property with the
> triggers that will make use of the information it provides. I can
> imagine also other compound triggers that could benefit on it.
>
> What follows, the trigger sources would trigger LED activity only
> if the LED class device was assigned appropriate trigger. We need to
> define somewhere which triggers support this property.
>
> Trigger specific bindings?

Maybe this is something I'm missing. Why adding this "led-triggers" property
would mean/require ABI breakage?

AFAIU adding support for "led-triggers" to the "usbport" trigger driver (see
patch 2/2) didn't break anything, I hope?
