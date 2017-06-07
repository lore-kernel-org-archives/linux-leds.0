From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/2] leds: leds-qti-rgb: Add LED driver for QTI
 TRI_LED module
Date: Wed, 7 Jun 2017 17:08:17 -0500
Message-ID: <20170607220817.psmcljxaqlwrqxnm@rob-hp-laptop>
References: <20170601072723.12760-1-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170601072723.12760-1-fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, subbaram-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, aghayal-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, wruan-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, kgunda-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Thu, Jun 01, 2017 at 03:25:01PM +0800, fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org wrote:
> From: Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 
> QTI TRI_LED module has 3 current sinks for LED driver and each is
> controlled by a PWM channel used for LED dimming or blinking. Add
> the driver to support it.
> 
> Signed-off-by: Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../devicetree/bindings/leds/leds-qti-rgb.txt      |  46 ++

It's preferred to make bindings a separate patch.

>  drivers/leds/Kconfig                               |   8 +
>  drivers/leds/Makefile                              |   1 +
>  drivers/leds/leds-qti-rgb.c                        | 623 +++++++++++++++++++++
>  4 files changed, 678 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-qti-rgb.txt
>  create mode 100644 drivers/leds/leds-qti-rgb.c
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-qti-rgb.txt b/Documentation/devicetree/bindings/leds/leds-qti-rgb.txt
> new file mode 100644
> index 0000000..2ca93f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-qti-rgb.txt
> @@ -0,0 +1,46 @@
> +Qualcomm Technologies, Inc. TRI_LED driver specific bindings
> +
> +This binding document describes the properties of TRI_LED module in
> +Qualcomm Technologies, Inc. PMIC chips.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: Must be "qcom,leds-rgb".

If the block is called TRI_LED, then use "tri-led" in the name.

> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: Register base of the TRI_LED module and length.
> +
> +- pwm-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: A list of string to label the PWM devices defined in pwms
> +		property which are using for controlling LEDs.
> +		It must be: "red", "green", "blue".
> +
> +- pwms:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: A list of the PWM devices (phandles) used for controlling
> +		LEDs.
> +
> +- qcom,support-blink:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: An array of integer values to indicate if "red", "green",
> +		"blue" LED support blink control. The values are listed as
> +		the fixed order for "red", "green", "blue" LED.
> +
> +Example:
> +
> +	pmi8998_rgb: rgb@d000{

Need to state somewhere this must be a sub-node of the PMIC and show 
that here.

Also, need a space before {.

> +		compatible = "qcom,leds-rgb";
> +		reg = <0xd000 0x100>;
> +		pwm-names = "red", "green", "blue";
> +		pwms =  <&pmi8998_pwm_5 0 1000000>,
> +			<&pmi8998_pwm_4 0 1000000>,
> +			<&pmi8998_pwm_3 0 1000000>;
> +		qcom,support-blink = <1 1 1>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
