From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] leds: pca9532: Add device tree binding
Date: Thu, 7 Apr 2016 12:57:55 -0500
Message-ID: <20160407175755.GN32257@rob-hp-laptop>
References: <1459912250-50878-1-git-send-email-preid@electromag.com.au>
 <1459912250-50878-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459912250-50878-2-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, riku.voipio-X3B1VOXEql0@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Wed, Apr 06, 2016 at 11:10:50AM +0800, Phil Reid wrote:
> This patch adds basic device tree support for the pca9532 LEDs.
> 
> Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
> ---
>  .../devicetree/bindings/leds/leds-pca9532.txt      | 32 +++++++++++
>  drivers/leds/leds-pca9532.c                        | 63 ++++++++++++++++++++--
>  include/dt-bindings/leds/leds-pca9532.h            | 18 +++++++
>  include/linux/leds-pca9532.h                       |  8 ++-
>  4 files changed, 112 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.txt
>  create mode 100644 include/dt-bindings/leds/leds-pca9532.h
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> new file mode 100644
> index 0000000..b48c223
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt

Would leds-pca953x.txt be more appropriate.

> @@ -0,0 +1,32 @@
> +*NXP - pca9532 PWM LED Driver
> +
> +The PCA9532 family is SMBus I/O expander optimized for dimming LEDs.
> +The PWM support 256 steps.

supports

> +
> +Required properties:
> +	- compatible:
> +		"nxp,pca9530"
> +		"nxp,pca9531"
> +		"nxp,pca9532"
> +		"nxp,pca9533"
> +	- reg -  I2C slave address
> +
> +Each led is represented as a sub-node of the nxp,pca9530.
> +
> +LED sub-node properties:

What are sub-node names and how many?

> +- type: Output configuration
> +	0 = NONE, 1 = LED, 2 = N2100_BEEP, 3 = GPIO

Add vendor prefix.

> +
> +Example:
> +
> +  ledBL: pca9530@60 {
> +    compatible = "nxp,pca9530";
> +    reg = <0x60>;
> +
> +    led0 {
> +      type = <PCA9532_TYPE_LED>;
> +    };
> +  };
> +
> +For more product information please see the link below:
> +http://nxp.com/documents/data_sheet/PCA9532.pdf

Move this up to the top.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
