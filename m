From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 05/25] dt-bindings: leds: Add function and color
 properties
Date: Mon, 11 Mar 2019 18:24:10 +0100
Message-ID: <796a13a7-fb8c-9b5b-6bd5-dfb7458731fe@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
 <20190310182836.20841-6-jacek.anaszewski@gmail.com>
 <98c1a41e-77bb-5ffd-b5b3-772a28c0f0a6@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <98c1a41e-77bb-5ffd-b5b3-772a28c0f0a6@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Dan,

On 3/11/19 1:26 PM, Dan Murphy wrote:
> On 3/10/19 1:28 PM, Jacek Anaszewski wrote:
>> Introduce dedicated properties for conveying information about
>> LED function and color. Mark old "label" property as deprecated.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Baolin Wang <baolin.wang@linaro.org>
>> Cc: Daniel Mack <daniel@zonque.org>
>> Cc: Dan Murphy <dmurphy@ti.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Cc: Simon Shields <simon@lineageos.org>
>> ---
>>   Documentation/devicetree/bindings/leds/common.txt | 55 +++++++++++++++++++----
>>   1 file changed, 47 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
>> index aa1399814a2a..3402b0e1cec9 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -10,14 +10,23 @@ can influence the way of the LED device initialization, the LED components
>>   have to be tightly coupled with the LED device binding. They are represented
>>   by child nodes of the parent LED device binding.
>>   
>> +
>>   Optional properties for child nodes:
>>   - led-sources : List of device current outputs the LED is connected to. The
>>   		outputs are identified by the numbers that must be defined
>>   		in the LED device binding documentation.
>> +- function: LED functon. Use one of the LED_FUNCTION_* prefixed definitions
>> +	    from the header include/dt-bindings/leds/common.h.
>> +	    If there is no matching LED_FUNCTION available, add a new one.
>> +- color : Color of the LED. Use one of the LED_COLOR_NAME_* prefixed definitions
>> +	    from the header include/dt-bindings/leds/common.h.
>> +	    If there is no matching LED_COLOR_NAME available, add a new one.
>> +
> 
> I am assuming multi color can re-use this property as well?

I intended it to be a string, but indeed it would be better if we will
make it an integer to be consistent with the discussed LED multi color
design.


>>   - label : The label for this LED. If omitted, the label is taken from the node
>>   	  name (excluding the unit address). It has to uniquely identify
>>   	  a device, i.e. no other LED class device can be assigned the same
>> -	  label.
>> +	  label. This property is deprecated - use 'function' and 'color'
>> +	  properties instead.
>>   
>>   - default-state : The initial state of the LED. Valid values are "on", "off",
>>     and "keep". If the LED is already on or off and the default-state property is
>> @@ -87,29 +96,59 @@ Required properties for trigger source:
>>   
>>   * Examples
>>   
>> -gpio-leds {
>> +#include <dt-bindings/leds/common.h>
>> +
>> +led-controller@0 {
>>   	compatible = "gpio-leds";
>>   
>> -	system-status {
>> -		label = "Status";
>> +	led0 {
>> +		function = LED_FUNCTION_STATUS;
> 
> Missing color for example unless there is a reason to omit it for GPIO LEDs

It is on purpose - to show that it is an optional property for
monochrome LEDs.

> 
> Also missing reg here

Also on purpose. leds-gpio bindings don't require reg here.
And when reg is absent the unit address in the node name should
be omitted as Rob stated in one of recent reviews.

>>   		linux,default-trigger = "heartbeat";
>>   		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
>>   	};
>>   
>> -	usb {
>> +	led1 {
>> +		function = LED_FUNCTION_USB;
> 
> Same as above
> Also missing reg here
>>   		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
>>   		trigger-sources = <&ohci_port1>, <&ehci_port1>;
>>   	};
>>   };
>>   
>> -max77693-led {
>> +led-controller@0 {
>>   	compatible = "maxim,max77693-led";
>>   
>> -	camera-flash {
>> -		label = "Flash";
>> +	led {
>> +		function = LED_FUNCTION_FLASH;
>> +		color = LED_COLOR_NAME_WHITE;
>>   		led-sources = <0>, <1>;
>>   		led-max-microamp = <50000>;
>>   		flash-max-microamp = <320000>;
>>   		flash-max-timeout-us = <500000>;
>>   	};
>>   };
>> +
>> +led-controller@30 {
>> +        compatible = "panasonic,an30259a";
>> +        reg = <0x30>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        led@1 {
>> +                reg = <1>;
>> +                linux,default-trigger = "heartbeat";
>> +                function = LED_FUNCTION_INDICATOR;
>> +                color = LED_COLOR_NAME_RED;
>> +        };
>> +
>> +        led@2 {
>> +                reg = <2>;
>> +                function = LED_FUNCTION_INDICATOR;
>> +                color = LED_COLOR_NAME_GREEN;
>> +        };
>> +
>> +        led@3 {
>> +                reg = <3>;
>> +                function = LED_FUNCTION_INDICATOR;
>> +                color = LED_COLOR_NAME_BLUE;
>> +        };
>> +};
>>
> 
> 

-- 
Best regards,
Jacek Anaszewski
