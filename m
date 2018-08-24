From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: leds: Add bindings for lm3697 driver
Date: Fri, 24 Aug 2018 21:32:31 +0200
Message-ID: <e868002d-be40-4049-ab0f-16c4a7b47c89@gmail.com>
References: <20180817151528.21623-1-dmurphy@ti.com>
 <20180824095515.GB4045@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824095515.GB4045@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 08/24/2018 11:55 AM, Pavel Machek wrote:
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
> LED core is 8-bit only... 

That's not true since this commit:

commit 1bd465e6b0e2b559db47420fea686507a01cfab0
Author: Guennadi Liakhovetski <lg@denx.de>
Date:   Sat Jan 10 18:54:39 2009 +0000

    leds: allow led-drivers to use a variable range of brightness values

    This patch allows drivers to override the default maximum brightness
value
    of 255.  We take care to preserve backwards-compatibility as much as
    possible, so that user-space ABI doesn't change for existing drivers.
    LED trigger code has also been updated to use the per-LED maximum.

    Signed-off-by: Guennadi Liakhovetski <lg@denx.de>
    Signed-off-by: Richard Purdie <rpurdie@linux.intel.com>


but I missed that max_brightness is not initialized in the driver,
so the core will set it to LED_FULL (255) anyway.

> so full dynamic range can not be currently
> used in linux -- right? Is there any plan to change/fix that?
> 
>> +This device is suitable for Display and Keypad Lighting
> 
> "display and keypad lighting."
> 
>> +Optional properties:
>> +	- enable-gpios : gpio pin to enable/disable the device.
> 
> Remove "." at end of sentence, for consistency. "GPIO"?
> 
>> +All HVLED strings controlled by control bank A
> 
> ":"?
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
Best regards,
Jacek Anaszewski
