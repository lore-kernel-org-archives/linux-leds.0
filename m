From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: leds: Add binding for axp20x-led device
 driver
Date: Thu, 31 Jan 2019 22:37:25 +0100
Message-ID: <990611bd-9c6f-aa03-6cb9-431d9415891d@gmail.com>
References: <20190131082308.22522-1-stefan@olimex.com>
 <20190131082308.22522-3-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131082308.22522-3-stefan@olimex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Mavrodiev <stefan@olimex.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Stefan,

Thank you for the patch.

I have few nits below.

On 1/31/19 9:23 AM, Stefan Mavrodiev wrote:
> This adds the devicetree bindings for charge led indicator found
> on most of X-Powers AXP20X PMICs.
> 
> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> ---
>   .../devicetree/bindings/leds/leds-axp20x.txt  | 74 +++++++++++++++++++
>   1 file changed, 74 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-axp20x.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-axp20x.txt b/Documentation/devicetree/bindings/leds/leds-axp20x.txt
> new file mode 100644
> index 000000000000..73fae22ffe29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-axp20x.txt
> @@ -0,0 +1,74 @@
> +Device Tree Bindings for LED support on X-Powers PMIC
> +
> +Most of the X-Powers PMICs have integrated battery charger with LED indicator.
> +The output is open-drain, so the state is either high-Z or output-low. The
> +driver is subnode of AXP20X MFD driver, since it uses shared bus with all

s/is subnode/is a subnode/

> +other cells.
> +The LED can be controlled either manually or automatic. Then in automatic

s/or automatic/or automatically/

> +(controlled by the charger) there are two indication modes:
> +
> +Mode-A
> +======
> +- output-low:		Charging
> +- high-Z		Not charging
> +- 1Hz flashing:		Abnormal alarm
> +- 4Hz flashing		Overvoltage alarm
> +
> +Mode-B
> +======
> +- output-low:		Battery full
> +- high-Z		Not charging
> +- 1Hz flashing:		Charging
> +- 4Hz flashing		Overvoltage or abnormal alarm
> +
> +The control and the mode can be changed from sysfs.
> +
> +For AXP20X MFD bindings see:
> +Documentation/devicetree/bindings/mfd/axp20x.txt
> +
> +Required properties:
> +- compatible : Must be "x-powers,axp20x-led"
> +
> +Supported common leds properties, see ./common.txt for more information:

s/leds/LED/

Please remove ", see ./common.txt for more information" in favor
of references indicated below.

> +- label : sets LED label. If omitted, dt device node is used

Please change it to:
- label : See Documentation/devicetree/bindings/leds/common.txt

> +- linux,default-trigger : See
> +- default-state:

- linux,default-trigger : See 
Documentation/devicetree/bindings/leds/common.txt

> +
> +Optional properties:
> +- x-powers,charger-mode: 0 for Mode-A, 1 for Mode-B
> +			 If omitted, then the control is set to manual mode.
> +			 On invalid value, Mode-A is used.
> +
> +
> +Example:
> +
> +	axp803: pmic@3a3 {
> +		compatible = "x-powers,axp803";
> +
> +		...
> +
> +		axp20x-led {

s/axp20x-led/led@0/

> +			compatible = "x-powers,axp20x-led";
> +			status = "okay";
> +
> +			label = "axp20x:yellow:chgled";
> +			linux,default-trigger = "timer";
> +			default-state = "on";
> +		};
> +	};
> +
> +or
> +
> +	axp803: pmic@3a3 {
> +		compatible = "x-powers,axp803";
> +
> +		...
> +
> +		axp20x-led {

s/axp20x-led/led@0/

> +			compatible = "x-powers,axp20x-led";
> +			status = "okay";
> +
> +			label = "axp20x:yellow:chgled";
> +			x-powers,charger-mode = "mode-b";
> +		};
> +	};
> 

-- 
Best regards,
Jacek Anaszewski
