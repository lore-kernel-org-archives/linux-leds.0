From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/2] dt: bindings: lp50xx: Introduce the lp50xx family
 of RGB drivers
Date: Tue, 15 Jan 2019 22:42:23 +0100
Message-ID: <45f28e71-54c5-dfa8-78b8-c68b2d39c019@gmail.com>
References: <20190114211723.11186-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114211723.11186-1-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, pavel@ucw.cz, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the patch.

Seeing the mess with regs and led-modules I think
it will be better to abide by the regs alone.

Please see below how I would structure that.

On 1/14/19 10:17 PM, Dan Murphy wrote:
> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024 and the LP5018
> RGB LED device driver.  The LP5036/3024/18 can control RGB LEDs individually
> or as part of a control bank group.  These devices have the ability
> to adjust the mixing control for the RGB LEDs to obtain different colors
> independent of the overall brightness of the LED grouping.
> 
> Datasheet:
> http://www.ti.com/lit/ds/symlink/lp5024.pdf
> http://www.ti.com/lit/ds/symlink/lp5036.pdf
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - Added the LP5030/36 devices, defined the modules vs banked properties
> renamed the file from lp5024 to lp50xx. - https://lore.kernel.org/patchwork/patch/1026514/
> 
>   .../devicetree/bindings/leds/leds-lp50xx.txt  | 143 ++++++++++++++++++
>   1 file changed, 143 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.txt b/Documentation/devicetree/bindings/leds/leds-lp50xx.txt
> new file mode 100644
> index 000000000000..7bc6843ddba4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.txt
> @@ -0,0 +1,143 @@
> +* Texas Instruments - LP5018/24/30/36 RGB LED driver
> +
> +The LP50XX is multi-channel, I2C RGB LED Drivers that can group RGB LEDs into
> +a LED group or control them individually.
> +
> +The difference in these RGB LED drivers is the number of supported RGB strings.

Maybe it would be better to replace "strings" with "modules"?
Strings usually mean LEDs connected in a row, which is specific
to backlights.

> +Required properties:
> +	- compatible:
> +		"ti,lp5018"
> +		"ti,lp5024"
> +		"ti,lp5030"
> +		"ti,lp5036"
> +	- reg :  I2C slave address
> +		lp5018/24 - 0x28
> +		lp5030/36 - 0x30
> +	- #address-cells : 1
> +	- #size-cells : 0
> +
> +Optional properties:
> +	- enable-gpios : gpio pin to enable/disable the device.
> +	- vled-supply : LED supply
> +
> +Required child properties:
> +	- reg : Is the child node iteration.

Let's change it to:

- reg : RGB LED module number. For the node describing RGB cluster bank
         it should match first element of ti,led-bank array.

> +
> +Required Child properties but only one should be defined per child:
> +Either one of these two properties are required for each node.  The
> +property ti,led-bank takes precedence over the ti,led-module within the same
> +node.
> +
> +	- ti,led-module : This property denotes the single LED module number
> +			  that will be controlled in the LED class instance.

It will be not needed then.

> +	- ti,led-bank : This property denotes the LED module numbers that will
> +			be controlled as a single RGB cluster.  Each LED module
> +			number will be controlled by a single LED class instance.
> +			There can only be one instance of the ti,led-bank
> +			property for each device node.
> +
> +The LED outpus associated with the LED modules are defined in Table 1 of the
> +corresponding data sheets.
> +
> +LP5018 - 6 Total RGB cluster LED outputs 0-5
> +LP5024 - 8 Total RGB cluster LED outputs 0-7
> +LP5030 - 10 Total RGB cluster LED outputs 0-9
> +LP5036 - 12 Total RGB cluster LED outputs 0-11
> +
> +Optional child properties:
> +	- label : see Documentation/devicetree/bindings/leds/common.txt
> +	- linux,default-trigger :
> +	   see Documentation/devicetree/bindings/leds/common.txt
> +
> +Examples:
> +LP5018 and LP5024 example:
> +led-controller@29 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	compatible = "ti,lp5024";
> +	reg = <0x29>;
> +	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +	vled-supply = <&vmmcsd_fixed>;
> +
> +	led@0 {
> +	        reg = <0>;
> +	        label = "led1_mod";
> +		ti,led-module = <1>;
> +	};
> +
> +	led@1 {
> +	        reg = <1>;
> +	        label = "banked_leds";
> +		ti,led-bank = <0 2 5 3 >;
> +	};
> +
> +	led@2 {
> +	        reg = <2>;
> +	        label = "led4_mod";
> +		ti,led-module = <4>;
> +	};
> +
> +	led@3 {
> +	        reg = <3>;
> +	        label = "led7_mod";
> +		ti,led-module = <7>;
> +	};
> +
> +	led@4 {
> +	        reg = <4>;
> +	        label = "led6_mod";
> +		ti,led-module = <6>;
> +	};

Without ti,led-module it will look like below:


led@0 {
         reg = <0>;
         label = "banked_leds";
         ti,led-bank = <0 2 5 3 >;
};

led@1 {
         reg = <1>;
         label = "led1_mod";
};


led@4 {
         reg = <4>;
         label = "led4_mod";
};

led@6 {
         reg = <6>;
         label = "led6_mod";
};

led@7 {
         reg = <7>;
         label = "led7_mod";
};



> +};
> +
> +LP5030 and LP5036 example:
> +led-controller@30 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	compatible = "ti,lp5036";
> +	reg = <0x30>;
> +	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +	vled-supply = <&vmmcsd_fixed>;
> +
> +	led@0 {
> +	        reg = <0>;
> +	        label = "led1_mod";
> +		ti,led-module = <1>;
> +	};
> +
> +	led@1 {
> +	        reg = <1>;
> +	        label = "led_banked";
> +		ti,led-bank = <0 2 5 3 9 10 >;
> +	};
> +
> +	led@2 {
> +	        reg = <2>;
> +	        label = "led4_mod";
> +		ti,led-module = <4>;
> +	};
> +
> +	led@3 {
> +	        reg = <3>;
> +	        label = "led7_mod";
> +		ti,led-module = <7>;
> +	};
> +
> +	led@4 {
> +	        reg = <4>;
> +	        label = "led6_mod";
> +		ti,led-module = <6>;
> +	};
> +
> +	led@5 {
> +	        reg = <5>;
> +	        label = "led8_mod";
> +		ti,led-module = <8>;
> +	};
> +};
> +
> +
> +For more product information please see the link below:
> +http://www.ti.com/lit/ds/symlink/lp5024.pdf
> +http://www.ti.com/lit/ds/symlink/lp5036.pdf
> 

-- 
Best regards,
Jacek Anaszewski
