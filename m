From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: leds: Add binding for axp20x-led
 device driver
Date: Sat, 23 Feb 2019 14:02:32 +0100
Message-ID: <07d9d8f2-6263-8966-19da-ecaa761b3db9@gmail.com>
References: <20190215115013.11098-1-stefan@olimex.com>
 <20190215115013.11098-4-stefan@olimex.com> <20190222195109.GA17753@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222195109.GA17753@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Stefan Mavrodiev <stefan@olimex.com>
Cc: Pavel Machek <pavel@ucw.cz>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-leds@vger.kernel.org

On 2/22/19 8:51 PM, Rob Herring wrote:
> On Fri, Feb 15, 2019 at 01:50:08PM +0200, Stefan Mavrodiev wrote:
>> This adds the devicetree bindings for charge led indicator found
>> on most of X-Powers AXP20X PMICs.
>>
>> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
>> ---
>>   .../devicetree/bindings/leds/leds-axp20x.txt  | 74 +++++++++++++++++++
>>   1 file changed, 74 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-axp20x.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-axp20x.txt b/Documentation/devicetree/bindings/leds/leds-axp20x.txt
>> new file mode 100644
>> index 000000000000..5a83ad06796d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-axp20x.txt
>> @@ -0,0 +1,74 @@
>> +Device Tree Bindings for LED support on X-Powers PMIC
>> +
>> +Most of the X-Powers PMICs have integrated battery charger with LED indicator.
>> +The output is open-drain, so the state is either high-Z or output-low. The
>> +driver is a subnode of AXP20X MFD driver, since it uses shared bus with all
>> +other cells.
>> +The LED can be controlled either manually or automatically. Then in automatic
>> +(controlled by the charger) there are two indication modes:
>> +
>> +Mode-A
>> +======
>> +- output-low:		Charging
>> +- high-Z		Not charging
>> +- 1Hz flashing:		Abnormal alarm
>> +- 4Hz flashing		Overvoltage alarm
>> +
>> +Mode-B
>> +======
>> +- output-low:		Battery full
>> +- high-Z		Not charging
>> +- 1Hz flashing:		Charging
>> +- 4Hz flashing		Overvoltage or abnormal alarm
>> +
>> +The control and the mode can be changed from sysfs.
>> +
>> +For AXP20X MFD bindings see:
>> +Documentation/devicetree/bindings/mfd/axp20x.txt
>> +
>> +Required properties:
>> +- compatible : Must be "x-powers,axp20x-led"
>> +
>> +Supported common LED properties, see ./common.txt for more informationn
>> +- label : See Documentation/devicetree/bindings/leds/common.txt
>> +- linux,default-trigger : See Documentation/devicetree/bindings/leds/common.txt
>> +- default-state: See Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Optional properties:
>> +- x-powers,charger-mode: 0 for Mode-A, 1 for Mode-B
>> +			 If omitted, then the control is set to manual mode.
>> +			 On invalid value, Mode-A is used.
>> +
>> +
>> +Example:
>> +
>> +	axp803: pmic@3a3 {
>> +		compatible = "x-powers,axp803";
>> +
>> +		...
>> +
>> +		led@0 {
> 
> What's the 0 for? A unit address without a reg property is not valid.

It was done on my request, but now I see it was an omission.

Since this node describes a LED controller, then it should
be called "led-controller".

>> +			compatible = "x-powers,axp20x-led";
>> +			status = "okay";

And below part should be in a child node.

Stefan, please compare
Documentation/devicetree/bindings/leds/common.txt and
other LED bindings.

>> +			label = "axp20x:yellow:chgled";

Moreover "axp20x:" part should be removed from here added in the driver.

Please refer to drivers/leds/leds-cr0014114.c on how we
do that now.

>> +			linux,default-trigger = "timer";
>> +			default-state = "on";
>> +		};
>> +	};
>> +
>> +or
>> +
>> +	axp803: pmic@3a3 {
>> +		compatible = "x-powers,axp803";
>> +
>> +		...
>> +
>> +		led@0 {
>> +			compatible = "x-powers,axp20x-led";
>> +			status = "okay";
>> +
>> +			label = "axp20x:yellow:chgled";
>> +			x-powers,charger-mode = <1>;
>> +		};
>> +	};
>> -- 
>> 2.17.1
>>
> 

-- 
Best regards,
Jacek Anaszewski
