From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/9] dt: bindings: Add multicolor class dt bindings
 documention
Date: Fri, 14 Jun 2019 12:18:21 -0500
Message-ID: <c234361e-f5f7-f8d7-18c6-9cc8ef74ac99@ti.com>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-3-dmurphy@ti.com> <20190614170011.GA3277@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614170011.GA3277@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Rob

Thanks for the review

On 6/14/19 12:00 PM, Rob Herring wrote:
> On Thu, May 23, 2019 at 02:08:13PM -0500, Dan Murphy wrote:
>> Add DT bindings for the LEDs multicolor class framework.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../bindings/leds/leds-class-multicolor.txt   | 97 +++++++++++++++++++
>>   1 file changed, 97 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>> new file mode 100644
>> index 000000000000..e2a2ce3279cb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>> @@ -0,0 +1,97 @@
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
>> +	- color : For multicolor LED support this property should be defined as
>> +		  LED_COLOR_ID_MULTI and further definition can be found in
>> +		  include/linux/leds/common.h.
>> +
>> +led-controller@30 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	compatible = "ti,lp5024";
>> +	reg = <0x29>;
>> +
>> +	multi-led@4 {
> Typically we sort by address order.

These are not addresses these end up being the "module" number that the 
LEDs below are associated to.


>
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <4>;
>> +		color = <LED_COLOR_ID_MULTI>;
>> +		function = LED_FUNCTION_ACTIVITY;
>> +
>> +		led@12 {
>> +			reg = <12>;
>> +			color = <LED_COLOR_ID_RED>;
>> +		};
>> +
>> +		led@13 {
>> +			reg = <13>;
>> +			color = <LED_COLOR_ID_GREEN>;
>> +		};
>> +
>> +		led@14 {
>> +			reg = <14>;
>> +			color = <LED_COLOR_ID_BLUE>;
>> +		};
>> +	};
>> +
>> +	/* Only support RGB no model defined */
> I don't understand this comment.

Artifact can be removed


>
>> +	multi-led@1 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <1>;
>> +		color = <LED_COLOR_ID_MULTI>;
>> +		function = LED_FUNCTION_;
> ??

I meant to change that but missed it in the example.

Dan


>
>> +
>> +
>> +		led@3 {
>> +			reg = <3>;
>> +			color = <LED_COLOR_ID_RED>;
>> +		};
>> +
>> +		led@4 {
>> +			reg = <4>;
>> +			color = <LED_COLOR_ID_GREEN>;
>> +		};
>> +
>> +		led@5 {
>> +			reg = <5>;
>> +			color = <LED_COLOR_ID_BLUE>;
>> +		};
>> +	};
>> +
>> +	multi-led@2 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		color = <LED_COLOR_ID_MULTI>;
>> +		function = LED_FUNCTION_ACTIVITY;
>> +		reg = <2>;
>> +		ti,led-bank = <2 3 5>;
>> +
>> +		led@6 {
>> +			reg = <0x6>;
>> +			color = <LED_COLOR_ID_RED>;
>> +			led-sources = <6 9 15>;
>> +		};
>> +
>> +		led@7 {
>> +			reg = <0x7>;
>> +			color = <LED_COLOR_ID_GREEN>;
>> +			led-sources = <7 10 16>;
>> +		};
>> +
>> +		led@8 {
>> +			reg = <0x8>;
>> +			color = <LED_COLOR_ID_BLUE>;
>> +			led-sources = <8 11 17>;
>> +		};
>> +	};
>> +
>> +};
>> -- 
>> 2.21.0.5.gaeb582a983
>>
