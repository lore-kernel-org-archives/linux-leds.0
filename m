From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Mon, 11 Dec 2017 09:51:33 -0600
Message-ID: <CAL_JsqLE_qNjZ9qPUKsc3o5LVOimTKz80sd-mUsLNLdrwjHi2w@mail.gmail.com>
References: <20171205204630.12267-1-dmurphy@ti.com> <20171207224938.6nvy63ghxe5vwvk4@rob-hp-laptop>
 <c354b66d-f501-99bc-5928-efcfe33dbd06@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752546AbdLKPvz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 11 Dec 2017 10:51:55 -0500
In-Reply-To: <c354b66d-f501-99bc-5928-efcfe33dbd06@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, Dec 7, 2017 at 5:04 PM, Dan Murphy <dmurphy@ti.com> wrote:
> Rob
>
>
> On 12/07/2017 04:49 PM, Rob Herring wrote:
>> On Tue, Dec 05, 2017 at 02:46:29PM -0600, Dan Murphy wrote:
>>> This adds the devicetree bindings for the LM3692x
>>> I2C LED string driver.
>>>
>>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>
>>> v8 - Added address-cells and size-cells as well as child node reg - https://patchwork.kernel.org/patch/10091259/
>>> v7 - No changes - https://patchwork.kernel.org/patch/10087475/
>>> v6 - No changes -https://patchwork.kernel.org/patch/10085567/
>>> v5 - No Changes - https://patchwork.kernel.org/patch/10081071/
>>> v4 - Fix example node, added trigger entry, removed ambiguous x for compatible and
>>> added common.txt pointer for label - https://patchwork.kernel.org/patch/10060107
>>> v3 - No changes
>>> v2 - No changes - https://patchwork.kernel.org/patch/10056677/
>>>
>>>  .../devicetree/bindings/leds/leds-lm3692x.txt      | 47 ++++++++++++++++++++++
>>>  1 file changed, 47 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>> new file mode 100644
>>> index 000000000000..84f69342d879
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>> @@ -0,0 +1,47 @@
>>> +* Texas Instruments - LM3692x Highly Efficient White LED Driver
>>> +
>>> +The LM3692x is an ultra-compact, highly efficient,
>>> +white-LED driver designed for LCD display backlighting.
>>> +
>>> +The main difference between the LM36922 and LM36923 is the number of
>>> +LED strings it supports.  The LM36922 supports two strings while the LM36923
>>> +supports three strings.
>>> +
>>> +Required properties:
>>> +    - compatible:
>>> +            "ti,lm36922"
>>> +            "ti,lm36923"
>>> +    - reg :  I2C slave address
>>> +    - #address-cells : 1
>>> +    - #size-cells : 0
>>> +
>>> +Optional properties:
>>> +    - label : see Documentation/devicetree/bindings/leds/common.txt
>>
>> Should be a child prop.
>
> Thanks I forgot to move this to Optional Child Properties.
>
>>
>>> +    - enable-gpios : gpio pin to enable/disable the device.
>>> +    - vled-supply : LED supply
>>> +    - linux,default-trigger : (optional)
>>> +       see Documentation/devicetree/bindings/leds/common.txt
>>
>> Ditto.
>
> Ack
>
>>
>>> +
>>> +Required child properties:
>>> +    - reg : 0
>>> +
>>> +Example:
>>> +
>>> +lm3692x@36 {
>>
>> leds@36
>
> Rob why does this need to be leds?  Is this because it would be a child of an I2C node?

Because node names are supposed to follow the generic type of device
they are (e.g. serial, ethernet, bus, etc.), not the model of device.
And yes, there are many examples that don't follow this.

> Jacek
> Would this not cause and issue for your proposal to take the parent node name as part of the LED label?
>
> Dan
