From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v8 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Mon, 11 Dec 2017 09:59:28 -0600
Message-ID: <cba14d9b-baf7-d89d-a099-ec0a2e1dc186@ti.com>
References: <20171205204630.12267-1-dmurphy@ti.com>
 <20171207224938.6nvy63ghxe5vwvk4@rob-hp-laptop>
 <c354b66d-f501-99bc-5928-efcfe33dbd06@ti.com>
 <CAL_JsqLE_qNjZ9qPUKsc3o5LVOimTKz80sd-mUsLNLdrwjHi2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLE_qNjZ9qPUKsc3o5LVOimTKz80sd-mUsLNLdrwjHi2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Rob

On 12/11/2017 09:51 AM, Rob Herring wrote:
> On Thu, Dec 7, 2017 at 5:04 PM, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org> wrote:
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
>>>> +    - compatible:
>>>> +            "ti,lm36922"
>>>> +            "ti,lm36923"
>>>> +    - reg :  I2C slave address
>>>> +    - #address-cells : 1
>>>> +    - #size-cells : 0
>>>> +
>>>> +Optional properties:
>>>> +    - label : see Documentation/devicetree/bindings/leds/common.txt
>>>
>>> Should be a child prop.
>>
>> Thanks I forgot to move this to Optional Child Properties.
>>
>>>
>>>> +    - enable-gpios : gpio pin to enable/disable the device.
>>>> +    - vled-supply : LED supply
>>>> +    - linux,default-trigger : (optional)
>>>> +       see Documentation/devicetree/bindings/leds/common.txt
>>>
>>> Ditto.
>>
>> Ack
>>
>>>
>>>> +
>>>> +Required child properties:
>>>> +    - reg : 0
>>>> +
>>>> +Example:
>>>> +
>>>> +lm3692x@36 {
>>>
>>> leds@36
>>
>> Rob why does this need to be leds?  Is this because it would be a child of an I2C node?
> 
> Because node names are supposed to follow the generic type of device
> they are (e.g. serial, ethernet, bus, etc.), not the model of device.
> And yes, there are many examples that don't follow this.
> 

OK.  I guess I will need to update the code to take the compatible or for my case the extract the name from
the struct i2c_device_id.

Jacek

I am going to have to update the code to extract the name differently when there is no label.  I don't think
pulling the parent node name will scale in the future.


Dan

>> Jacek
>> Would this not cause and issue for your proposal to take the parent node name as part of the LED label?
>>
>> Dan


-- 
------------------
Dan Murphy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
