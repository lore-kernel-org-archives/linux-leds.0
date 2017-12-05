From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 4/6] dt: bindings: lp8860: Update the bindings to the
 standard
Date: Tue, 5 Dec 2017 07:06:22 -0600
Message-ID: <d68fa3d3-1280-b9ae-bf11-7784a73b1719@ti.com>
References: <20171201165613.10358-1-dmurphy@ti.com>
 <20171201165613.10358-4-dmurphy@ti.com>
 <a07f883c-4c4c-780d-2dac-f023907a2629@gmail.com>
 <20171204223500.f6ukdorpcmerzwot@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171204223500.f6ukdorpcmerzwot@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Rob

On 12/04/2017 04:35 PM, Rob Herring wrote:
> On Sun, Dec 03, 2017 at 02:27:20PM +0100, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 12/01/2017 05:56 PM, Dan Murphy wrote:
>>> Update the lp8860 dt binding to the LED standard where
>>> the LED should have a child node and also adding a
>>> LED trigger entry.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
>>> ---
>>>
>>> v6 - New patch to fix binding documentation
>>>
>>>  Documentation/devicetree/bindings/leds/leds-lp8860.txt | 15 +++++++++++----
>>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>>> index aad38dd94d4b..4cf396de6eba 100644
>>> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>>> +++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>>> @@ -12,17 +12,24 @@ Required properties:
>>>  	- label - Used for naming LEDs
>>>  
>>>  Optional properties:
>>> -	- enable-gpio - gpio pin to enable/disable the device.
>>> -	- supply - "vled" - LED supply
>>> +	- enable-gpios : gpio pin to enable/disable the device.
>>> +	- vled-supply : LED supply
>>> +	- label : see Documentation/devicetree/bindings/leds/common.txt
>>> +	- linux,default-trigger : (optional)
>>> +	   see Documentation/devicetree/bindings/leds/common.txt
>>>  
>>>  Example:
>>>  
>>> -leds: leds@6 {
>>> +lp8860@2d {
> 
> leds@2d

Ack

> 
>>>  	compatible = "ti,lp8860";
>>>  	reg = <0x2d>;
>>> -	label = "display_cluster";
>>>  	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>>>  	vled-supply = <&vbatt>;
>>> +
>>> +	backlight: backlight@0 {
> 
> unit-address requires a 'reg' property. Building your dts files with W=1 
> will tell you this.

I will add this.  There is so much noise when enabling this option on the dts
I missed the warning.

Dan

<snip>

-- 
------------------
Dan Murphy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
