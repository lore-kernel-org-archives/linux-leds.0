From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: Add bindings for lm3697 driver
Date: Fri, 7 Sep 2018 08:20:08 -0500
Message-ID: <b8ac9d52-f16d-5fc4-0e9a-9246b9f984c5@ti.com>
References: <20180906135005.6718-1-dmurphy@ti.com>
 <20180906211617.GB16899@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906211617.GB16899@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

On 09/06/2018 04:16 PM, Pavel Machek wrote:
> Hi!
> 
>> Add the device tree bindings for the lm3697
>> LED driver for backlighting and display.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v6 - Fix minor issues - https://lore.kernel.org/patchwork/patch/975387/
>>
>> v5 - Fix the comment for the example - https://lore.kernel.org/patchwork/patch/975060/
>> v4 - Removed HVLED definition in favor of HVLED place definition - https://lore.kernel.org/patchwork/patch/974812/
>> v3 - Updated subject with prefered title - https://lore.kernel.org/patchwork/patch/972337/
>> v2 - Fixed subject and patch commit message - https://lore.kernel.org/patchwork/patch/971326/
>>
>>  .../devicetree/bindings/leds/leds-lm3697.txt  | 86 +++++++++++++++++++
>>  1 file changed, 86 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3697.txt b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>> new file mode 100644
>> index 000000000000..3256dec21075
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>> @@ -0,0 +1,86 @@
>> +* Texas Instruments - LM3697 Highly Efficient White LED Driver
>> +
>> +The LM3697 11-bit LED driver provides high-
>> +performance backlight dimming for 1, 2, or 3 series
>> +LED strings while delivering up to 90% efficiency.
> 
> Hmm. We already have second set of bindings for 3697:
> 
> ./devicetree/bindings/mfd/ti-lmu.txt
> 
> (Sorry for not noticing that earlier). Advantage is that those have
> had discussion with device tree people and have acks:
> 
> What to do there?

UGH!  IMO this should have not been accepted without the support code.
I think this MFD driver is complete over kill to try to commonize features
into a MFD device.  The LM3631 and LM3632 seem to be the only true MFD devices
here since they provide regulator support.

The LM3697 fault monitoring is only for test purposes according to the data
sheet.  Not sure the customer can trust this or they should be warned at boot
that the Fault monitoring is for test purposes only.

And I think Jacek pointed out that the bindings references in this bindings
don't even exist.

I am thinking we need to deprecate this MFD driver and consolidate these drivers
in the LED directory as we indicated before.  I did not find any ti-lmu support
code.

ti-lmu common core code and then the LED children appending the feature differentiation.

Need some maintainer weigh in here.

Dan

> 
> 								Pavel
> commit 287cce719d85311f61d1b6b7f7b0d93f7907cd46
> Author: Milo Kim <milo.kim@ti.com>
> Date:   Tue Feb 28 15:45:14 2017 +0900
> 
>     dt-bindings: mfd: Add TI LMU device binding information
> 
>     This patch describes overall binding for TI LMU MFD devices.
> 
>     Signed-off-by: Milo Kim <milo.kim@ti.com>
>         Acked-by: Rob Herring <robh+dt@kernel.org>
> 	    Acked-by: Tony Lindgren <tony@atomide.com>
> 	        Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 		
> 
> commit d774c7e447ac911e73a1b3c775e6d89f0422218c
> Author: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> Date:   Mon Aug 27 09:15:08 2018 -0700
> 
>     dt-bindings: mfd: ti-lmu: update for backlight
>     
>     Update binding to integrate the backlight feature directly into
>     the main node, as suggested by Rob Herring.
>     
>     Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> index c885cf8..b3433e9 100644
> --- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> +++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> @@ -28,10 +28,9 @@ Required properties:
>  
>  Optional property:
>    - enable-gpios: A GPIO specifier for hardware enable pin.
> -
> -Required node:
> -  - backlight: All LMU devices have backlight child nodes.
> -               For the properties, please refer to [1].
> +  - pwm-names: Should be either "lmu-backlight" or unset
> +  - pwm: This should be a PWM specifier following ../pwm/pwm.txt and must
> +         only be specified, if the backlight should be used in PWM mode.
>  
>  Optional nodes:
>    - fault-monitor: Hardware fault monitoring driver for LM3633 and LM3697.
> @@ -42,8 +41,31 @@ Optional nodes:
>    - leds: LED properties for LM3633. Please refer to [2].
>    - regulators: Regulator properties for LM3631 and LM3632.
>                  Please refer to [3].
> +  - bank0, bank1, bank2: This contains the backlight configuration
> +                         for each backlight control bank.
> +
> +Required properties in the bank subnodes:
> +  - label: A string describing the backlight. Should contain "keyboard"
> +           for a keyboard backlight and "lcd" for LCD panel backlights.
> +  - ti,led-sources: A list of channels, that should be driven. Each channel
> +                    should only be driven by one bank.
> +
> +Optional properties in the bank subnodes:
> +  - default-brightness-level: Backlight initial brightness value.
> +                              Type is <u32>. It is set as soon as backlight
> +			      device is created.
> +			      0 ~ 2047 = LM3631, LM3632, LM3633, LM3695 and
> +					 LM3697
> +			      0 ~ 255  = LM3532
> +  - ti,ramp-up-ms, ti,ramp-down-ms: Light dimming effect properties.
> +				    Type is <u32>. Unit is millisecond.
> +					0 ~ 65 ms    = LM3532
> +					0 ~ 4000 ms  = LM3631
> +					0 ~ 16000 ms = LM3633 and LM3697
> +  - pwm-period: PWM period. Only valid in PWM brightness mode.
> +                Type is <u32>. If this property is missing, then control
> +		mode is set to I2C by default.
>  
> -[1] ../leds/backlight/ti-lmu-backlight.txt
>  [2] ../leds/leds-lm3633.txt
>  [3] ../regulator/lm363x-regulator.txt
>  
> @@ -53,14 +75,11 @@ lm3532@38 {
>  
>  	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
>  
> -	backlight {
> -		compatible = "ti,lm3532-backlight";
> -
> -		lcd {
> -			led-sources = <0 1 2>;
> -			ramp-up-msec = <30>;
> -			ramp-down-msec = <0>;
> -		};
> +	bank0 {
> +		label = "lcd";
> +		led-sources = <0 1 2>;
> +		ramp-up-msec = <30>;
> +		ramp-down-msec = <0>;
>  	};
>  };
>  
> @@ -105,13 +124,10 @@ lm3631@29 {
>  		};
>  	};
>  
> -	backlight {
> -		compatible = "ti,lm3631-backlight";
> -
> -		lcd_bl {
> -			led-sources = <0 1>;
> -			ramp-up-msec = <300>;
> -		};
> +	bank0 {
> +		label = "lcd_bl";
> +		led-sources = <0 1>;
> +		ramp-up-msec = <300>;
>  	};
>  };
>  
> @@ -147,16 +163,13 @@ lm3632@11 {
>  		};
>  	};
>  
> -	backlight {
> -		compatible = "ti,lm3632-backlight";
> -
> -		pwms = <&pwm0 0 10000 0>; /* pwm number, period, polarity */
> -		pwm-names = "lmu-backlight";
> +	pwms = <&pwm0 0 10000 0>; /* pwm number, period, polarity */
> +	pwm-names = "lmu-backlight";
>  
> -		lcd {
> -			led-sources = <0 1>;
> -			pwm-period = <10000>;
> -		};
> +	bank0 {
> +		label = "lcd";
> +		led-sources = <0 1>;
> +		pwm-period = <10000>;
>  	};
>  };
>  
> @@ -166,22 +179,18 @@ lm3633@36 {
>  
>  	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
>  
> -	backlight {
> -		compatible = "ti,lm3633-backlight";
> -
> -		main {
> -			label = "main_lcd";
> -			led-sources = <1 2>;
> -			ramp-up-msec = <500>;
> -			ramp-down-msec = <500>;
> -		};
> +	bank0 {
> +		label = "main_lcd";
> +		led-sources = <1 2>;
> +		ramp-up-msec = <500>;
> +		ramp-down-msec = <500>;
> +	};
>  
> -		front {
> -			label = "front_lcd";
> -			led-sources = <0>;
> -			ramp-up-msec = <1000>;
> -			ramp-down-msec = <0>;
> -		};
> +	bank1 {
> +		label = "front_lcd";
> +		led-sources = <0>;
> +		ramp-up-msec = <1000>;
> +		ramp-down-msec = <0>;
>  	};
>  
>  	leds {
> @@ -211,13 +220,9 @@ lm3695@63 {
>  
>  	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
>  
> -	backlight {
> -		compatible = "ti,lm3695-backlight";
> -
> -		lcd {
> -			label = "bl";
> -			led-sources = <0 1>;
> -		};
> +	bank0 {
> +		label = "lcd_bl";
> +		led-sources = <0 1>;
>  	};
>  };
>  
> @@ -227,14 +232,10 @@ lm3697@36 {
>  
>  	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
>  
> -	backlight {
> -		compatible = "ti,lm3697-backlight";
> -
> -		lcd {
> -			led-sources = <0 1 2>;
> -			ramp-up-msec = <200>;
> -			ramp-down-msec = <200>;
> -		};
> +	bank0 {
> +		led-sources = <0 1 2>;
> +		ramp-up-msec = <200>;
> +		ramp-down-msec = <200>;
>  	};
>  
>  	fault-monitor {
> 


-- 
------------------
Dan Murphy
