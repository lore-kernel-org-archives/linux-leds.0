From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: leds: Add binding for axp20x-led
 device driver
Date: Fri, 22 Feb 2019 13:51:09 -0600
Message-ID: <20190222195109.GA17753@bogus>
References: <20190215115013.11098-1-stefan@olimex.com>
 <20190215115013.11098-4-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190215115013.11098-4-stefan@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Mavrodiev <stefan@olimex.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Feb 15, 2019 at 01:50:08PM +0200, Stefan Mavrodiev wrote:
> This adds the devicetree bindings for charge led indicator found
> on most of X-Powers AXP20X PMICs.
> 
> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> ---
>  .../devicetree/bindings/leds/leds-axp20x.txt  | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-axp20x.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-axp20x.txt b/Documentation/devicetree/bindings/leds/leds-axp20x.txt
> new file mode 100644
> index 000000000000..5a83ad06796d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-axp20x.txt
> @@ -0,0 +1,74 @@
> +Device Tree Bindings for LED support on X-Powers PMIC
> +
> +Most of the X-Powers PMICs have integrated battery charger with LED indicator.
> +The output is open-drain, so the state is either high-Z or output-low. The
> +driver is a subnode of AXP20X MFD driver, since it uses shared bus with all
> +other cells.
> +The LED can be controlled either manually or automatically. Then in automatic
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
> +Supported common LED properties, see ./common.txt for more informationn
> +- label : See Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger : See Documentation/devicetree/bindings/leds/common.txt
> +- default-state: See Documentation/devicetree/bindings/leds/common.txt
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
> +		led@0 {

What's the 0 for? A unit address without a reg property is not valid.

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
> +		led@0 {
> +			compatible = "x-powers,axp20x-led";
> +			status = "okay";
> +
> +			label = "axp20x:yellow:chgled";
> +			x-powers,charger-mode = <1>;
> +		};
> +	};
> -- 
> 2.17.1
> 
