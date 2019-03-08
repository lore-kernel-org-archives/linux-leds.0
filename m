From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/4] ARM: dts: omap4-droid4: Update backlight dt
 properties
Date: Fri, 8 Mar 2019 09:45:11 -0600
Message-ID: <6d9a5821-a634-8ea2-4fe3-0603af757668@ti.com>
References: <20190307220947.20057-1-dmurphy@ti.com>
 <20190307220947.20057-2-dmurphy@ti.com> <20190308151422.GA10378@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190308151422.GA10378@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, tony@atomide.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

Thanks for the review.

On 3/8/19 9:14 AM, Pavel Machek wrote:
> Hi!
> 
>> Update the properties for the lm3532 device node for droid4.
>> With this change the backlight LED string and the keypad
>> LED strings will be controlled separately.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  arch/arm/boot/dts/omap4-droid4-xt894.dts | 27 +++++++++++++++++-------
>>  1 file changed, 19 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
>> index e21ec929f096..94e3d53dbcf3 100644
>> --- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
>> +++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
>> @@ -6,6 +6,7 @@
>>  /dts-v1/;
>>  
>>  #include <dt-bindings/input/input.h>
>> +#include <dt-bindings/leds/leds-lm3532.h>
>>  #include "omap443x.dtsi"
>>  #include "motorola-cpcap-mapphone.dtsi"
>>  
>> @@ -383,20 +384,30 @@
>>  };
>>  
>>  &i2c1 {
>> -	lm3532@38 {
>> +	led-controller@38 {
>>  		compatible = "ti,lm3532";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>>  		reg = <0x38>;
>>  
>>  		enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
>>  
>> -		lcd_backlight: backlight {
>> -			compatible = "ti,lm3532-backlight";
>> +		ramp-up-ms = <LM3532_RAMP_1024us>;
>> +		ramp-down-ms = <LM3532_RAMP_65536us>;
> 
> I guess dt people will have some comments here. I'd expect
> 
> ramp-up-us = <1024> would be more natural.
> 

Actually ramp-up-us/ramp-down-us is more correct this is an error in this dt definition
and will be fixed in v2


>> +		lcd_backlight: led@0 {
>> +			reg = <0>;
>> +			led-sources = <2>;
>> +			ti,led-mode = <LM3532_BL_MODE_MANUAL>;
>> +			label = "backlight";
> 
> Ok, so we'll have lm3532::backlight. That is not too useful, as it
> does not tell userland what kaclight it is.
> 
> main_display::backlight ?
> 
> OTOH this one is not too important as backlight subsystem should
> handle this.
> 

For Droid4 I am not particular to any specific label.

And if the series in https://lkml.org/lkml/2018/11/7/144
is ever implemented then the label may change as well.

The driver forces the lm3532 string to be part of the label.

This was a discussion a while back with Jacek when I submitted other drivers.

>> +		led@1 {
>> +			reg = <1>;
>> +			led-sources = <1>;
>> +			ti,led-mode = <LM3532_BL_MODE_MANUAL>;
>> +			label = "keypad";
> 
> I guess best variant would be inputX::backlight here, but that might
> be tricky to implement.
> 

Yeah because we don't know what input the keyboard would be on.
Unless there are APIs to retrieve that info.  I have not looked at the input
framework in a while.

Dan

> 									Pavel
> 


-- 
------------------
Dan Murphy
