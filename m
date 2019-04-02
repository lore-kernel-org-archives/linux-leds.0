From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [RFC PATCH 2/5] dt: bindings: Add multicolor class dt bindings
 documention
Date: Tue, 2 Apr 2019 22:40:12 +0200
Message-ID: <660390a5-0c3a-cfcf-119d-817f86d1659d@gmail.com>
References: <20190401173400.14238-1-dmurphy@ti.com>
 <20190401173400.14238-3-dmurphy@ti.com> <20190401212921.GB14681@amd>
 <f8655180-0c3a-7292-3a49-57d997473992@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f8655180-0c3a-7292-3a49-57d997473992@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: robh+dt@kernel.org, marek.behun@nic.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 4/2/19 1:40 PM, Dan Murphy wrote:
> Pavel
> 
> On 4/1/19 4:29 PM, Pavel Machek wrote:
>> Hi!
>>
>>
>>>   .../bindings/leds/leds-class-multicolor.txt   | 140 ++++++++++++++++++
>>>   1 file changed, 140 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>> new file mode 100644
>>> index 000000000000..4b1a26104c79
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>> @@ -0,0 +1,140 @@
>>> +* Multicolor LED properties
>>> +
>>> +Multicolor LEDs can consist of a RGB, RGBW or a RGBA LED clusters.  These devices
>>> +can be grouped together and also provide a modeling mechanism so that the
>>> +cluster LEDs can vary in hue and intensity to produce a wide range of colors.
>>> +
>>> +The nodes and properties defined in this document are unique to the multicolor
>>> +LED class.  Common LED nodes and properties are inherited from the common.txt
>>> +within this documentation directory.
>>> +
>>> +Required LED Child properties:
>>> +	- color : This is the color ID of the LED.  Definitions can be found
>>> +		  in include/linux/leds/common.txt
>>> +
>>> +Optional LED Child properties:
>>> +	- available-brightness-models : This is the phandle to the brightness-model
>>> +					node(s) that this LED cluster can support.
>>> +
>>> +Required Brightness model properties
>>> +	- led-brightness-model : This flag alerts the device driver and class
>>> +				 code that this node is a brightness model node
>>> +				 and to process the properties differently.
>>> +
>>> +Required Brightness model child properties
>>> +	- model_name : This is the name of the model presented to the user.  This
>>> +		       should be a color that the LED cluster can produce for
>>> +		       the device it is attached to.
>>> +	- layout : This is the LED layout for the levels.  This layout will
>>> +		   determine the color order of the levels.  The layout and
>>> +		   level-x properties array should be the same size.
>>> +	- level-x : These are the values for the LEDs to produce the color that
>>> +		    is defined.  These values are placed in the array according
>>> +		    to the layout property.
>>
>>> +led-controller@30 {
>>> +	#address-cells = <1>;
>>> +	#size-cells = <0>;
>>> +	compatible = "ti,lp5024";
>>> +	reg = <0x29>;
>>> +
>>> +	lp5024_model_yellow: brightness-models {
>>> +		led-brightness-model;
>>> +		model@0 {
>>> +			model_name = "yellow";
>>> +			layout = <LED_COLOR_ID_RED
>>> +				  LED_COLOR_ID_GREEN
>>> +				  LED_COLOR_ID_BLUE>;
>>> +			level-1 = <255 227 40>;
>>> +			level-2 = <255 240 136>;
>>> +			level-3 = <255 247 196>;
>>> +		};
>>> +	};
>>
>> I don't think this works. RGB LED can show millions of colors. Do you
>> propose to have millions of entries in dts?
>> 									Pavel
>>
> 
> I have had off line conversations with Jacek about this brightness model node.
> 
> Your concern was actually one of my concerns as well.  Not only millions of entries but also having a huge
> DT binary.
> 
> We wanted to RFC this to get feedback.  And this is why I have not added any support for this in the framework code.

We all know that nobody sane is going to add millions of color entries.
It is just a holistic solution to the problem, without the need to worry
about different colors being produced by different LED elements, either
due to their inherent properties, due to different parameters of LED
controllers and board designs, or due to aging. Of course the last
case will be possible to fix only by update of DTB blob.

Regarding the possible size of DTB blob, I made some calculations and
even compiled sample dts. Here is my reasoning from one of the replies
to Dan during our private discussion:

-------------------------------------------------------------------------

Brightness models will be reusable between modules. There could be
arbitrary number of brightness models, limited only by maximum dtb blob
size.

In uboot it can be configured with "setenv fdt_high". For the dtbs
appended to zImage for ARM the limit is 2MB AFAIK. Brightness models
will be what consumes the most of memory with this proposed DT design.

Let's calculate.

4 bytes for single brightness value (we allow for values > 255).

I think quite exaggerated exemplary quantities:

number of colors in the mcled_dev: 10
number of levels per model: 256
number of models: 100

bytes required = 4 * 10 * 256 * 100 = 1024000, i.e. less than 1MB

And average mainline dtbs usually don't exceed 100kB, so I think
we are safe. I've even just tried it out by adding such 10 models
of 255 levels * 10 values * 4-byte to versatile-pb.dts and I got dtb
size ~150kB.

But to be sure it would be good to get early ack from DT guys.

-------------------------------------------------------------------------

And now is this moment - we'd like to hear the feedback from DT guys.

-- 
Best regards,
Jacek Anaszewski
