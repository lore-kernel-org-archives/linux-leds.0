From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Thu, 16 Nov 2017 09:58:35 -0600
Message-ID: <CAL_Jsq+Rp22D+D5AmCM+HAhiud018NThjMe_A5oW2nMsOyD=Vg@mail.gmail.com>
References: <20171115194203.13572-1-dmurphy@ti.com> <20171116154139.wed7qmpmv2ffyzv2@rob-hp-laptop>
 <d3483e49-650d-1d68-bec6-eeb84d8ac48a@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d3483e49-650d-1d68-bec6-eeb84d8ac48a-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Nov 16, 2017 at 9:45 AM, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org> wrote:
> Rob
>
> Thanks for the review
>
> On 11/16/2017 09:41 AM, Rob Herring wrote:
>> On Wed, Nov 15, 2017 at 01:42:02PM -0600, Dan Murphy wrote:
>>> This adds the devicetree bindings for the LM3692x
>>> I2C LED string driver.
>>>
>>> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>>> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
>>> ---
>>>
>>> v3 - No changes
>>> v2 - No changes - https://patchwork.kernel.org/patch/10056677/
>>>
>>>  .../devicetree/bindings/leds/leds-lm3692x.txt      | 28 ++++++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>> new file mode 100644
>>> index 000000000000..cfef67bd4100
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>> @@ -0,0 +1,28 @@
>>> +* Texas Instruments - LM3692x Highly Efficient Dual-String White LED Driver
>>> +
>>> +The LM36922 is an ultra-compact, highly efficient,
>>> +two string white-LED driver designed for LCD display
>>> +backlighting.
>>> +
>>> +Required properties:
>>> +    - compatible:
>>> +            "ti,lm3692x"
>>
>> Don't use wildcards in compatible strings.
>
> Do you mean to remove the x?  How do we denote a family of parts then?

Yes. With a compatible string for each one. You can have multiple
compatible strings if some are a superset of others.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
