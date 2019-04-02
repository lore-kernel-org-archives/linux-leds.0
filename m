From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [RFC PATCH 2/5] dt: bindings: Add multicolor class dt bindings
 documention
Date: Tue, 2 Apr 2019 21:51:59 +0200
Message-ID: <75627633-57ed-4bd2-5802-132b39ba0f7d@gmail.com>
References: <20190401173400.14238-1-dmurphy@ti.com>
 <20190401173400.14238-3-dmurphy@ti.com> <20190401212921.GB14681@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401212921.GB14681@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, marek.behun@nic.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
List-Id: linux-leds@vger.kernel.org

On 4/1/19 11:29 PM, Pavel Machek wrote:
> Hi!
> 
> 
>>   .../bindings/leds/leds-class-multicolor.txt   | 140 ++++++++++++++++++
>>   1 file changed, 140 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>> new file mode 100644
>> index 000000000000..4b1a26104c79
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>> @@ -0,0 +1,140 @@
>> +* Multicolor LED properties
>> +
>> +Multicolor LEDs can consist of a RGB, RGBW or a RGBA LED clusters.  These devices
>> +can be grouped together and also provide a modeling mechanism so that the
>> +cluster LEDs can vary in hue and intensity to produce a wide range of colors.
>> +
>> +The nodes and properties defined in this document are unique to the multicolor
>> +LED class.  Common LED nodes and properties are inherited from the common.txt
>> +within this documentation directory.
>> +
>> +Required LED Child properties:
>> +	- color : This is the color ID of the LED.  Definitions can be found
>> +		  in include/linux/leds/common.txt
>> +
>> +Optional LED Child properties:
>> +	- available-brightness-models : This is the phandle to the brightness-model
>> +					node(s) that this LED cluster can support.
>> +
>> +Required Brightness model properties
>> +	- led-brightness-model : This flag alerts the device driver and class
>> +				 code that this node is a brightness model node
>> +				 and to process the properties differently.
>> +
>> +Required Brightness model child properties
>> +	- model_name : This is the name of the model presented to the user.  This
>> +		       should be a color that the LED cluster can produce for
>> +		       the device it is attached to.
>> +	- layout : This is the LED layout for the levels.  This layout will
>> +		   determine the color order of the levels.  The layout and
>> +		   level-x properties array should be the same size.
>> +	- level-x : These are the values for the LEDs to produce the color that
>> +		    is defined.  These values are placed in the array according
>> +		    to the layout property.
> 
>> +led-controller@30 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	compatible = "ti,lp5024";
>> +	reg = <0x29>;
>> +
>> +	lp5024_model_yellow: brightness-models {
>> +		led-brightness-model;
>> +		model@0 {
>> +			model_name = "yellow";
>> +			layout = <LED_COLOR_ID_RED
>> +				  LED_COLOR_ID_GREEN
>> +				  LED_COLOR_ID_BLUE>;
>> +			level-1 = <255 227 40>;
>> +			level-2 = <255 240 136>;
>> +			level-3 = <255 247 196>;
>> +		};
>> +	};
> 
> I don't think this works. RGB LED can show millions of colors. Do you
> propose to have millions of entries in dts?

Pavel, you know very well what is going on here and what is the
background of this design. I suppose you've just entered your trolling
mode - you lately admitted that it sometimes happens :-) [0]

This aims at solving the problem with multi color LED support in
a backward compatible way, which is especially important in relation
to existing triggers.

This is our attempt of addressing that problem in a color space
agnostic way. It was inspired by out-of-tree approach presented
by Vesa few months ago.

[0] https://www.spinics.net/lists/linux-leds/msg11388.html

-- 
Best regards,
Jacek Anaszewski
