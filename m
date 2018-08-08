From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 1/2] dt: bindings: lm3697: Add bindings for lm3697
 driver
Date: Wed, 8 Aug 2018 15:42:46 -0500
Message-ID: <f6b3534b-2ee9-782e-35e5-e103c34528bc@ti.com>
References: <20180807160442.8937-1-dmurphy@ti.com>
 <20180808195903.GB20912@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180808195903.GB20912@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

Thanks for the review

On 08/08/2018 02:59 PM, Pavel Machek wrote:
> On Tue 2018-08-07 11:04:41, Dan Murphy wrote:
>> Add the device tree bindings for the lm3697
>> led driver for backlighting and display.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v2 - Fixed subject and patch commit message - https://lore.kernel.org/patchwork/patch/971326/
>>
>>  .../devicetree/bindings/leds/leds-lm3697.txt  | 64 +++++++++++++++++++
>>  1 file changed, 64 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3697.txt b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>> new file mode 100644
>> index 000000000000..7b8e490f1ea1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>> @@ -0,0 +1,64 @@
>> +* Texas Instruments - LM3697 Highly Efficient White LED Driver
>> +
>> +The LM3697 11-bit LED driver provides high-
>> +performance backlight dimming for 1, 2, or 3 series
>> +LED strings while delivering up to 90% efficiency.
>> +
>> +This device is suitable for Display and Keypad Lighting
>> +
>> +Required properties:
>> +	- compatible:
>> +		"ti,lm3967"
>> +	- reg :  I2C slave address
>> +	- #address-cells : 1
>> +	- #size-cells : 0
>> +	- control-bank-cfg - : Indicates which sink is connected to which control bank
>> +		0 - All HVLED outputs are controlled by bank A
>> +		1 - HVLED1 is controlled bank B, HVLED2/3 are controlled by bank A
>> +		2 - HVLED2 is controlled bank B, HVLED1/3 are controlled by bank A
>> +		3 - HVLED1/2 are controlled by bank B, HVLED3 is controlled by bank A
>> +		4 - HVLED3 is controlled by bank B, HVLED1/2 are controlled by bank A
>> +		5 - HVLED1/3 is controlled by bank B, HVLED2 is controlled by bank A
>> +		6 - (default) HVLED1 is controlled by bank A, HVLED2/3 are controlled by bank B
>> +		7 - All HVLED outputs are controlled by bank B
> 
> This is quite long way to describe a bitmask, no? Could we make
> it so that control-bank-cfg is not needed?

The problem we have here is there is a potential to control
3 different LED string but only 2 sinks.  So control bank A can control 2 LED strings and control
bank b can control 1 LED string.  

These values represent device level control and configuration of the LED strings to a specific control bank.

I racked my brain trying to figure out how to configure the control banks and associated LED strings.
These values are for the device configuration itself and the reg below indicates which control bank the LED
node is assigned to.

> 
>> +Optional properties:
>> +	- enable-gpios : gpio pin to enable/disable the device.
>> +	- vled-supply : LED supply
>> +
>> +Required child properties:
>> +	- reg : 0 - LED is Controlled by bank A
>> +		1 - LED is Controlled by bank B
> 
> Can we compute control-bank-cfg from this?

Don't see how you could compute this.  There is no easy way to give indication to the driver which LED
node belongs to which control bank.  The control-bank-cfg is a device level property and the reg under the
child is a LED string level property denoting the Class node to control bank mapping.

Furthermore there are 2 device configurations that can be configured to only use 1 bank for all 3 LED strings.
This will be answered in your comments in the code.

> 
>> +Optional child properties:
>> +	- label : see Documentation/devicetree/bindings/leds/common.txt
>> +	- linux,default-trigger :
>> +	   see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Example:
>> +
>> +led-controller@36 {
>> +	compatible = "ti,lm3967";
>> +	reg = <0x36>;
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>> +	vled-supply = <&vbatt>;
>> +	control-bank-cfg = <0>;
>> +
>> +	led@0 {
>> +		reg = <0>;
>> +		label = "white:first_backlight_cluster";
>> +		linux,default-trigger = "backlight";
>> +	};
>> +
>> +	led@1 {
>> +		reg = <1>;
>> +		label = "white:second_backlight_cluster";
>> +		linux,default-trigger = "frontlight";
>> +	};
>> +}
> 
> Does the example show correct config? AFAICT all controls go to bank
> A according to control-bank-cfg, yet led@1 describes bank B...

This I can fix it should be a value between 1 and 6

> 
> 									Pavel
> 


-- 
------------------
Dan Murphy
