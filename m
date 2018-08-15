From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add bindings for lm3697 driver
Date: Wed, 15 Aug 2018 13:19:52 -0500
Message-ID: <4974c577-9c40-1f30-deac-47167d1afd03@ti.com>
References: <20180815161734.18159-1-dmurphy@ti.com>
 <e278d4f2-7848-d156-01ec-3cd77803e4de@gmail.com>
 <e855cda3-4314-645c-f6b9-a86aceafbd0b@ti.com>
 <77f11321-8876-2e34-f05e-dd855d62095c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <77f11321-8876-2e34-f05e-dd855d62095c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 08/15/2018 01:09 PM, Jacek Anaszewski wrote:
> Dan,
> 
> On 08/15/2018 07:30 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 08/15/2018 11:56 AM, Jacek Anaszewski wrote:
>>> Hi Dan,
>>>
>>> Thank you for the update.
>>>
>>> On 08/15/2018 06:17 PM, Dan Murphy wrote:
>>>> Add the device tree bindings for the lm3697
>>>> LED driver for backlighting and display.
>>>>
>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>> ---
>>>>
>>>> v3 - Updated subject with prefered title - https://lore.kernel.org/patchwork/patch/972337/
>>>> v2 - Fixed subject and patch commit message - https://lore.kernel.org/patchwork/patch/971326/
>>>>
>>>>  .../devicetree/bindings/leds/leds-lm3697.txt  | 89 +++++++++++++++++++
>>>>  1 file changed, 89 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3697.txt b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>>> new file mode 100644
>>>> index 000000000000..34403a48a0ce
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>>> @@ -0,0 +1,89 @@
>>>> +* Texas Instruments - LM3697 Highly Efficient White LED Driver
>>>> +
>>>> +The LM3697 11-bit LED driver provides high-
>>>> +performance backlight dimming for 1, 2, or 3 series
>>>> +LED strings while delivering up to 90% efficiency.
>>>> +
>>>> +This device is suitable for Display and Keypad Lighting
>>>> +
>>>> +Required properties:
>>>> +	- compatible:
>>>> +		"ti,lm3967"
>>>> +	- reg :  I2C slave address
>>>> +	- #address-cells : 1
>>>> +	- #size-cells : 0
>>>> +
>>>> +Optional properties:
>>>> +	- enable-gpios : gpio pin to enable/disable the device.
>>>> +	- vled-supply : LED supply
>>>> +
>>>> +Required child properties:
>>>> +	- reg : 0 - LED is Controlled by bank A
>>>> +		1 - LED is Controlled by bank B
>>>> +	- led-sources - Indicates which HVLED string is associated to which
>>>> +			control bank.  The HVLED string cannot be associated with
>>>> +			two control banks.  This property is an array of 3 and
>>>> +			all positions in the array must be populated.
>>>> +			Additional information is contained
>>>> +			in Documentation/devicetree/bindings/leds/common.txt
>>>> +			0 - End of array if all 3 LEDs are not declared for a
>>>> +			    single control bank.
>>>
>>> This is needless complication. I propose to define led-sources as
>>> an array of three boolean values, whose state signifies which LED
>>> strings are controlled by the bank defined by the reg property in the
>>> given child node. I.e. <HVLED1 HVLED2 HVLED3>.
>>
>> I struggled a bit with this definition.  Once I got it working it ended up producing
>> an overly complex control bank algorithm.
>>
>> I will take a look at implementing the suggestion but the complication comes in the
>> numerous DT configurations we could encounter.  Part of the issue is that the user
>> can connect to CTRL bank b only or CTRL bank a only or a combination of that
>>
>> 2^3
> 
> I tried to play a bit with that and here is what I got (simplified
> DT parsing):
> 

Thanks for the attempt.  I think with my current code patch I might be able to get this to work.
As per your suggestion.  It just takes a while to test all the combos
Dan

> int used_hvleds[3] = {0, 0 ,0};
> int used_control_banks[2] = {0, 0};
> 
> int parse_child_node(struct fwnode_handle *child)
> {
> 	int bank_hvleds[3];
> 
> 	fwnode_property_read_u32_array(child, "led-sources",
> 		bank_hvleds, LM3697_MAX_LED_STRINGS);
> 
> 	for (i = 0; i <= 3; i++) {
> 		if (bank_hvleds[i] && used_hvleds[i])
> 			return -EINVAL;
> 		used_hvleds[i] = 1;
> 	}
> 
> 	return 0;
> }
> 
> struct fwnode_handle *child = NULL;
> 
> device_for_each_child_node(priv->dev, child)
> 	fwnode_property_read_u32(child, "reg", &control_bank);
> 	if (used_control_banks[control_bank])
> 		goto err;
> 	used_control_banks[control_bank] = 1;
> 	if (parse_child_node(child))
> 		goto err;
> 
> 
>>>
>>> I modified your examples below accordingly.
>>>
>>>> +			1 - HVLED 1 string
>>>> +			2 - HVLED 2 string
>>>> +			3 - HVLED 3 string
>>>> +
>>>> +Optional child properties:
>>>> +	- label : see Documentation/devicetree/bindings/leds/common.txt
>>>> +	- linux,default-trigger :
>>>> +	   see Documentation/devicetree/bindings/leds/common.txt
>>>> +
>>>> +Example:
>>>> +
>>>> +HVLED string 1 and 2 controlled by control bank A and HVLED string controlled by
>>>> +control bank B.
>>>> +
>>>> +led-controller@36 {
>>>> +	compatible = "ti,lm3967";
>>>> +	reg = <0x36>;
>>>> +	#address-cells = <1>;
>>>> +	#size-cells = <0>;
>>>> +
>>>> +	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>>>> +	vled-supply = <&vbatt>;
>>>> +
>>>> +	led@0 {
>>>> +		reg = <0>;
>>>> +		led-sources = <0x1 0x2 0x0>
>>>
>>> 		led-sources = <1 1 0>;
>>> ;
>>>> +		label = "white:first_backlight_cluster";
>>>> +		linux,default-trigger = "backlight";
>>>> +	};
>>>> +
>>>> +	led@1 {
>>>> +		reg = <1>;
>>>> +		led-sources = <0x3 0x0 0x0>;
>>>
>>> 		led-sources = <0 0 1>;
>>>
>>>> +		label = "white:second_backlight_cluster";
>>>> +		linux,default-trigger = "backlight";
>>>> +	};
>>>> +}
>>>> +
>>>> +All HVLED strings controlled by control bank A
>>>> +
>>>> +led-controller@36 {
>>>> +	compatible = "ti,lm3967";
>>>> +	reg = <0x36>;
>>>> +	#address-cells = <1>;
>>>> +	#size-cells = <0>;
>>>> +
>>>> +	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>>>> +	vled-supply = <&vbatt>;
>>>> +
>>>> +	led@0 {
>>>> +		reg = <0>;
>>>> +		led-sources = <0x1 0x2 0x3>;
>>>
>>> 		led-sources = <1 1 1>;
>>>
>>>> +		label = "white:backlight_cluster";
>>>> +		linux,default-trigger = "backlight";
>>>> +	};
>>>> +}
>>>> +
>>>> +For more product information please see the link below:
>>>> +http://www.ti.com/lit/ds/symlink/lm3697.pdf
>>>>
>>>
>>
>>
> 


-- 
------------------
Dan Murphy
