From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/6] dt: bindings: lp8860: Update bindings for lp8860
Date: Thu, 7 Dec 2017 16:42:29 -0600
Message-ID: <20171207224229.wd6nc4ukiksebxw4@rob-hp-laptop>
References: <20171205204327.12111-1-dmurphy@ti.com>
 <20171205204327.12111-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171205204327.12111-2-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

gOn Tue, Dec 05, 2017 at 02:43:22PM -0600, Dan Murphy wrote:
> Update the lp8860 bindings to fix various issues
> found.  Add address-cells and size-cells, rename
> enable-gpio to enable-gpios, update the node name
> to the device name and indent the node example.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - New patch
> 
>  .../devicetree/bindings/leds/leds-lp8860.txt       | 28 ++++++++++++----------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> index aad38dd94d4b..1b2fab05ec6a 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> @@ -6,24 +6,28 @@ current sinks that can be controlled by a PWM input
>  signal, a SPI/I2C master, or both.
>  
>  Required properties:
> -	- compatible:
> +	- compatible :
>  		"ti,lp8860"
> -	- reg -  I2C slave address
> -	- label - Used for naming LEDs
> +	- reg : I2C slave address
> +	- label : Used for naming LEDs
> +	- #address-cells : 1
> +	- #size-cells : 0
>  
>  Optional properties:
> -	- enable-gpio - gpio pin to enable/disable the device.
> -	- supply - "vled" - LED supply
> +	- enable-gpios : gpio pin to enable/disable the device.

Needs to state active high or low.

> +	- supply : "vled" - LED supply

"vled-supply : ..."

>  
>  Example:
>  
> -leds: leds@6 {
> -	compatible = "ti,lp8860";
> -	reg = <0x2d>;
> -	label = "display_cluster";
> -	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> -	vled-supply = <&vbatt>;
> -}
> +	lp8860@2d {

leds@2d

There's not really any point in adding the indentation.

> +		compatible = "ti,lp8860";

> +		#address-cells: 1
> +		#size-cells: 0

s/:/=/

Though, these aren't necessary without any child nodes. Is there more 
than 1 LED channel/driver?

> +		reg = <0x2d>;
> +		label = "display_cluster";
> +		enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +		vled-supply = <&vbatt>;
> +	}
>  
>  For more product information please see the link below:
>  http://www.ti.com/product/lp8860-q1
> -- 
> 2.15.0.124.g7668cbc60
> 
