From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: leds: Add bindings for lm3697 driver
Date: Wed, 5 Sep 2018 13:21:43 -0500
Message-ID: <01a8f463-67c9-740c-5001-ac63e4a3dc4e@ti.com>
References: <20180817151528.21623-1-dmurphy@ti.com>
 <20180824095515.GB4045@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824095515.GB4045@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

On 08/24/2018 04:55 AM, Pavel Machek wrote:
> On Fri 2018-08-17 10:15:27, Dan Murphy wrote:
>> Add the device tree bindings for the lm3697
>> LED driver for backlighting and display.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> Some nits are below.
> 
>> +The LM3697 11-bit LED driver provides high-
>> +performance backlight dimming for 1, 2, or 3 series
>> +LED strings while delivering up to 90% efficiency.
> 
> LED core is 8-bit only... so full dynamic range can not be currently
> used in linux -- right? Is there any plan to change/fix that?
> 

Jacek answered this.

>> +This device is suitable for Display and Keypad Lighting
> 
> "display and keypad lighting."
> 

Ack

>> +Optional properties:
>> +	- enable-gpios : gpio pin to enable/disable the device.
> 
> Remove "." at end of sentence, for consistency. "GPIO"?
> 
>> +All HVLED strings controlled by control bank A
> 
> ":"?

Not sure what you are asking for here.

> 
>> +led-controller@36 {
>> +	compatible = "ti,lm3967";
>> +	reg = <0x36>;
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>> +	vled-supply = <&vbatt>;
>> +
>> +	led@0 {
>> +		reg = <0>;
>> +		led-sources = <1 1 1>;
>> +		label = "white:backlight_cluster";
>> +		linux,default-trigger = "backlight";
>> +	};
>> +}
>> +
>> +For more product information please see the link below:
>> +http://www.ti.com/lit/ds/symlink/lm3697.pdf
> 


-- 
------------------
Dan Murphy
