From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Mon, 11 Dec 2017 09:56:47 -0600
Message-ID: <CAL_JsqJngcPWRbsfqYb83np7fPkR_5EUCVSg0=ghnukCuc08Cw@mail.gmail.com>
References: <20171205204630.12267-1-dmurphy@ti.com> <20171207224938.6nvy63ghxe5vwvk4@rob-hp-laptop>
 <c354b66d-f501-99bc-5928-efcfe33dbd06@ti.com> <a6f2c0a6-4166-383a-95ce-8e55b8bff40c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a6f2c0a6-4166-383a-95ce-8e55b8bff40c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Sat, Dec 9, 2017 at 3:21 PM, Jacek Anaszewski
<jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 12/08/2017 12:04 AM, Dan Murphy wrote:
>> Rob
>>
>>
>> On 12/07/2017 04:49 PM, Rob Herring wrote:
>>> On Tue, Dec 05, 2017 at 02:46:29PM -0600, Dan Murphy wrote:
>>>> This adds the devicetree bindings for the LM3692x
>>>> I2C LED string driver.
>>>>
>>>> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>>>> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
>>>> ---
>>>>
>>>> v8 - Added address-cells and size-cells as well as child node reg - https://patchwork.kernel.org/patch/10091259/
>>>> v7 - No changes - https://patchwork.kernel.org/patch/10087475/
>>>> v6 - No changes -https://patchwork.kernel.org/patch/10085567/
>>>> v5 - No Changes - https://patchwork.kernel.org/patch/10081071/
>>>> v4 - Fix example node, added trigger entry, removed ambiguous x for compatible and
>>>> added common.txt pointer for label - https://patchwork.kernel.org/patch/10060107
>>>> v3 - No changes
>>>> v2 - No changes - https://patchwork.kernel.org/patch/10056677/
>>>>
>>>>  .../devicetree/bindings/leds/leds-lm3692x.txt      | 47 ++++++++++++++++++++++
>>>>  1 file changed, 47 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>>> new file mode 100644
>>>> index 000000000000..84f69342d879
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>>> @@ -0,0 +1,47 @@
>>>> +* Texas Instruments - LM3692x Highly Efficient White LED Driver
>>>> +
>>>> +The LM3692x is an ultra-compact, highly efficient,
>>>> +white-LED driver designed for LCD display backlighting.
>>>> +
>>>> +The main difference between the LM36922 and LM36923 is the number of
>>>> +LED strings it supports.  The LM36922 supports two strings while the LM36923
>>>> +supports three strings.
>>>> +
>>>> +Required properties:
>>>> +   - compatible:
>>>> +           "ti,lm36922"
>>>> +           "ti,lm36923"
>>>> +   - reg :  I2C slave address
>>>> +   - #address-cells : 1
>>>> +   - #size-cells : 0
>>>> +
>>>> +Optional properties:
>>>> +   - label : see Documentation/devicetree/bindings/leds/common.txt
>>>
>>> Should be a child prop.
>>
>> Thanks I forgot to move this to Optional Child Properties.
>>
>>>
>>>> +   - enable-gpios : gpio pin to enable/disable the device.
>>>> +   - vled-supply : LED supply
>>>> +   - linux,default-trigger : (optional)
>>>> +      see Documentation/devicetree/bindings/leds/common.txt
>>>
>>> Ditto.
>>
>> Ack
>>
>>>
>>>> +
>>>> +Required child properties:
>>>> +   - reg : 0
>>>> +
>>>> +Example:
>>>> +
>>>> +lm3692x@36 {
>>>
>>> leds@36
>>
>> Rob why does this need to be leds?  Is this because it would be a child of an I2C node?
>>
>> Jacek
>> Would this not cause and issue for your proposal to take the parent node name as part of the LED label?
>
> Yes, it would.
>
> Rob, does something prevent us from adding a requirement that
> LED controller DT node has to contain the chip name (besides the
> unit address)? Many current LED controller nodes apply this pattern.

Only because we've been lax on the naming. We want to use generic
names because the DT spec says to and it provides a way to match nodes
to validation checks.

I only think we should use the chip name if the device doesn't fit
some standard class.

> Also, I would appreciate if you could express your opinion on
> the patch [0].
>
> [0] https://patchwork.kernel.org/patch/10089047/

I'll have to go find it. It is not in my queue, so it wasn't sent to
the DT list.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
