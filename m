From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 1/2] di: bindings: lm3697: Introduce the lm3697 driver
Date: Mon, 6 Aug 2018 10:32:21 -0500
Message-ID: <044e6bb0-cdd0-a87f-05e8-4f56965c5fad@ti.com>
References: <20180803150231.7172-1-dmurphy@ti.com>
 <b22bf013-f83c-12c1-90e5-8b0dc4145834@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b22bf013-f83c-12c1-90e5-8b0dc4145834@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

Thanks for the review

On 08/04/2018 07:22 AM, Jacek Anaszewski wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> Typo in the patch title:
> 
> s/di: /dt-/
> 
> And maybe let's change the following text to:
> 
> "Add bindings for lm3697 LED driver"

Ack to the above.

> 
> Best regards,
> Jacek Anaszewski
> 
> On 08/03/2018 05:02 PM, Dan Murphy wrote:
>> Introduce the device tree bindings for the lm3697
>> led driver for backlighting and display.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
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
>> +
>> +Optional properties:
>> +	- enable-gpios : gpio pin to enable/disable the device.
>> +	- vled-supply : LED supply
>> +
>> +Required child properties:
>> +	- reg : 0 - LED is Controlled by bank A
>> +		1 - LED is Controlled by bank B
>> +
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
>> +
>> +For more product information please see the link below:
>> +http://www.ti.com/lit/ds/symlink/lm3697.pdf
>>


-- 
------------------
Dan Murphy
