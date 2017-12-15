From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/6] dt: bindings: lp8860: Update DT label binding
Date: Fri, 15 Dec 2017 16:59:14 -0600
Message-ID: <20171215225914.62lqxhcmwajf4hpy@rob-hp-laptop>
References: <20171212220143.31210-1-dmurphy@ti.com>
 <20171212220143.31210-3-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171212220143.31210-3-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Tue, Dec 12, 2017 at 04:01:39PM -0600, Dan Murphy wrote:
> Update the lp8860 label binding to the LED
> standard as documented in
> 
> Documentation/devicetree/bindings/leds/common.txt
> 
> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
> ---
> 
> v4 - No changes
> 
> v3 - Added address and size cells, updated label with color and inserted spaces
> around the reg node - https://patchwork.kernel.org/patch/10093749/
> v2 - Added reg to child node and made it required
> 
>  Documentation/devicetree/bindings/leds/leds-lp8860.txt | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> index b9d09acbaa73..c3d64ade1e26 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> @@ -9,20 +9,33 @@ Required properties:
>  	- compatible :
>  		"ti,lp8860"
>  	- reg : I2C slave address
> -	- label : Used for naming LEDs
> +	- #address-cells : 1
> +	- #size-cells : 0
>  
>  Optional properties:
>  	- enable-gpios : gpio pin to enable (active high)/disable the device.
>  	- vled-supply : LED supply
>  
> +Required child properties:
> +	- reg : 0
> +

This should be in previous patch?

> +Optional child properties:
> +	- label : see Documentation/devicetree/bindings/leds/common.txt
> +
>  Example:
>  
>  led-controller@2d {
>  	compatible = "ti,lp8860";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  	reg = <0x2d>;
> -	label = "display_cluster";
>  	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>  	vled-supply = <&vbatt>;
> +
> +	led@0 {
> +		reg = <0>;
> +		label = "white:display_cluster";
> +	};
>  }
>  
>  For more product information please see the link below:
> -- 
> 2.15.0.124.g7668cbc60
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
