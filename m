From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Thu, 16 Nov 2017 09:41:39 -0600
Message-ID: <20171116154139.wed7qmpmv2ffyzv2@rob-hp-laptop>
References: <20171115194203.13572-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171115194203.13572-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Wed, Nov 15, 2017 at 01:42:02PM -0600, Dan Murphy wrote:
> This adds the devicetree bindings for the LM3692x
> I2C LED string driver.
> 
> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
> ---
> 
> v3 - No changes
> v2 - No changes - https://patchwork.kernel.org/patch/10056677/
> 
>  .../devicetree/bindings/leds/leds-lm3692x.txt      | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> new file mode 100644
> index 000000000000..cfef67bd4100
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> @@ -0,0 +1,28 @@
> +* Texas Instruments - LM3692x Highly Efficient Dual-String White LED Driver
> +
> +The LM36922 is an ultra-compact, highly efficient,
> +two string white-LED driver designed for LCD display
> +backlighting.
> +
> +Required properties:
> +	- compatible:
> +		"ti,lm3692x"

Don't use wildcards in compatible strings.

> +	- reg -  I2C slave address
> +
> +Optional properties:
> +	- label - Used for naming LEDs
> +	- enable-gpio - gpio pin to enable/disable the device.

enable-gpios is the preferred form.

> +	- supply - "vled" - LED supply

vled-supply - ...

> +
> +Example:
> +
> +leds: leds@6 {
> +	compatible = "ti,lm3692x";
> +	reg = <0x36>;
> +	label = "backlight_cluster";
> +	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +	vled-supply = <&vbatt>;
> +}
> +
> +For more product information please see the link below:
> +http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
> -- 
> 2.15.0.124.g7668cbc60
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
