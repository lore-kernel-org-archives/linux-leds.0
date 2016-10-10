From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/10] mfd: dt-bindings: Add bindings for the Juniper
 I2CS MFD
Date: Mon, 10 Oct 2016 15:23:41 -0500
Message-ID: <20161010202341.GA5652@rob-hp-laptop>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1475853669-22480-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1475853669-22480-3-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, Oct 07, 2016 at 06:21:01PM +0300, Pantelis Antoniou wrote:
> From: Georgi Vlaev <gvlaev@juniper.net>
> 
> Add device tree bindings for the Juniper I2CS MFD driver.
> 
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> [Ported from Juniper kernel]
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  Documentation/devicetree/bindings/mfd/jnx-i2cs.txt | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/jnx-i2cs.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/jnx-i2cs.txt b/Documentation/devicetree/bindings/mfd/jnx-i2cs.txt
> new file mode 100644
> index 0000000..0ec103b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/jnx-i2cs.txt
> @@ -0,0 +1,68 @@
> +Device-Tree bindings for Juniper Networks I2CS FPGA MFD
> +
> +Required properties:
> +- compatible - Must be one of:
> +	"jnx,i2cs-rcb"	(Routing Engine or Control Board FRUs)
> +	"jnx,i2cs-fpc"	(Flexible Port Concentrator FRUs)
> +	"jnx,i2cs-sib"	(Switching Interface Board FRUs)
> +	"jnx,i2cs-fan"	(Fan Tray FRUs)
> +
> +Optional properties:
> +
> +Depending on the FRU, the I2CS MFD has varied group of sub-devices:
> +
> +Device                   Description
> +------                   -----------
> +jnx,i2cs-gpio		: Virtual gpio mapping driver
> +jnx,i2cs-fan-hwmon	: hwmon driver for fan trays
> +jnx,i2c-mux-i2cs	: I2C Mux driver for FPC FRUs
> +jnx,leds-i2cs		: Led driver
> +
> +All these optional nodes are described in their respective binding
> +documents.
> +
> +Example node:
> +
> +i2cs@54 {
> +	compatible = "jnx,i2cs-fpc";
> +	reg = <0x54>;
> +	#address-cells = <0>;
> +	#size-cells = <0>;
> +
> +	fpc2_mux {

Generic node names please.

mux { 

> +		compatible = "jnx,i2c-mux-i2cs";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		fpc2i2c0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +	};
> +
> +	fpc2_gpiomap: gpio-jnx-i2cs {

gpio@54 {

> +		compatible = "jnx,gpio-i2cs";
> +		reg = <0x54>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		interrupt-controller;
> +
> +		/*
> +		 * Map bits [0-3] of reg 0x21 as gpio inputs, bits [4-7]
> +		 * as gpio outputs
> +		 */
> +		i2c-gpio-map = <0x21 0x0f>;
> +	};
> +
> +	leds-jnx-i2cs {

leds {

> +		compatible = "jnx,leds-i2cs";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		sib8-active {
> +			reg = <0>;
> +			linux,default-trigger = "sib8-active";
> +		};
> +	};
> +};
> -- 
> 1.9.1
> 
