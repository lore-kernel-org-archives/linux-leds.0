From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v8 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Thu, 7 Dec 2017 17:04:47 -0600
Message-ID: <c354b66d-f501-99bc-5928-efcfe33dbd06@ti.com>
References: <20171205204630.12267-1-dmurphy@ti.com>
 <20171207224938.6nvy63ghxe5vwvk4@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171207224938.6nvy63ghxe5vwvk4@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Rob


On 12/07/2017 04:49 PM, Rob Herring wrote:
> On Tue, Dec 05, 2017 at 02:46:29PM -0600, Dan Murphy wrote:
>> This adds the devicetree bindings for the LM3692x
>> I2C LED string driver.
>>
>> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
>> ---
>>
>> v8 - Added address-cells and size-cells as well as child node reg - https://patchwork.kernel.org/patch/10091259/
>> v7 - No changes - https://patchwork.kernel.org/patch/10087475/
>> v6 - No changes -https://patchwork.kernel.org/patch/10085567/
>> v5 - No Changes - https://patchwork.kernel.org/patch/10081071/
>> v4 - Fix example node, added trigger entry, removed ambiguous x for compatible and
>> added common.txt pointer for label - https://patchwork.kernel.org/patch/10060107
>> v3 - No changes
>> v2 - No changes - https://patchwork.kernel.org/patch/10056677/
>>
>>  .../devicetree/bindings/leds/leds-lm3692x.txt      | 47 ++++++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>> new file mode 100644
>> index 000000000000..84f69342d879
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>> @@ -0,0 +1,47 @@
>> +* Texas Instruments - LM3692x Highly Efficient White LED Driver
>> +
>> +The LM3692x is an ultra-compact, highly efficient,
>> +white-LED driver designed for LCD display backlighting.
>> +
>> +The main difference between the LM36922 and LM36923 is the number of
>> +LED strings it supports.  The LM36922 supports two strings while the LM36923
>> +supports three strings.
>> +
>> +Required properties:
>> +	- compatible:
>> +		"ti,lm36922"
>> +		"ti,lm36923"
>> +	- reg :  I2C slave address
>> +	- #address-cells : 1
>> +	- #size-cells : 0
>> +
>> +Optional properties:
>> +	- label : see Documentation/devicetree/bindings/leds/common.txt
> 
> Should be a child prop.

Thanks I forgot to move this to Optional Child Properties.

> 
>> +	- enable-gpios : gpio pin to enable/disable the device.
>> +	- vled-supply : LED supply
>> +	- linux,default-trigger : (optional)
>> +	   see Documentation/devicetree/bindings/leds/common.txt
> 
> Ditto.

Ack

> 
>> +
>> +Required child properties:
>> +	- reg : 0
>> +
>> +Example:
>> +
>> +lm3692x@36 {
> 
> leds@36

Rob why does this need to be leds?  Is this because it would be a child of an I2C node?

Jacek
Would this not cause and issue for your proposal to take the parent node name as part of the LED label?

Dan

> 
> It looks like you could just add the compatible strings to the existing 
> binding you're modifying?
> 
>> +	compatible = "ti,lm3692x";
>> +	reg = <0x36>;
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>> +	vled-supply = <&vbatt>;
>> +
>> +	backlight: backlight@0 {
>> +		reg = <0>;
>> +		label = "backlight_cluster";
>> +		linux,default-trigger = "backlight";
>> +	};
>> +}
>> +
>> +For more product information please see the link below:
>> +http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
>> -- 
>> 2.15.0.124.g7668cbc60
>>


-- 
------------------
Dan Murphy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
