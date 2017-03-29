From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] DT: leds: Add Qualcomm Light Pulse Generator binding
Date: Tue, 28 Mar 2017 21:26:49 -0500
Message-ID: <20170329022649.wp5uvt2akufgihwh@rob-hp-laptop>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323055435.29197-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170323055435.29197-2-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Wed, Mar 22, 2017 at 10:54:35PM -0700, Bjorn Andersson wrote:
> This adds the binding document describing the three hardware blocks
> related to the Light Pulse Generator found in a wide range of Qualcomm
> PMICs.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/leds/leds-qcom-lpg.txt     | 194 +++++++++++++++++++++
>  1 file changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> new file mode 100644
> index 000000000000..fb9edd89119d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> @@ -0,0 +1,194 @@
> +Binding for Qualcomm Light Pulse Generator
> +
> +The Qualcomm Light Pulse Generator consists of three different hardware blocks;
> +a ramp generator with lookup table, the light pulse generator and a three
> +channel current sink. These blocks are found in a wide range of Qualcomm PMICs.
> +Each of these are described individually below.
> +
> += Lookup Table (LUT)
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "qcom,spmi-lpg-lut"
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: base address of the LUT block
> +
> +- qcom,lut-size:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: number of elements available in the lookup table
> +
> += Light Pulse Generator (LPG)
> +The Light Pulse Generator can operate either as a standard PWM controller or in
> +a more advanced lookup-table based mode. These are described separately below.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "qcom,spmi-lpg"
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: base address of the LPG block
> +
> +== PWM mode
> +
> +- #pwm-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be 1
> +
> +== Lookup-table mode
> +
> +- cell-index:

This is a standard though not used property name. Perhaps "reg" or a 
vendor property instead.

> +	Usage: required, when referencing a LUT
> +	Value type: <u32>
> +	Definition: id of the LPG, used to associate the LPG with a particular
> +		    ramp generator in the LUT block
> +
> +- default-state:
> +	Usage: optional
> +	Value type: <string>
> +	Definition: default state, as defined in common.txt
> +
> +- label:
> +	Usage: optional
> +	Value type: <string>
> +	Definition: label of the LED, as defined in common.txt
> +
> +- linux,default-trigger:
> +	Usage: optional
> +	Value type: <string>
> +	Definition: default trigger, as defined in common.txt
> +
> +- qcom,tri-led:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: a phandle of a TRILED node and a single u32 denoting which
> +		    output channel to control
> +
> +- qcom,lut:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: phandle of a LUT node
> +
> +- qcom,dtest:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: configures the output into an internal test line of the
> +		    pmic. A first u32 defines which test line to use and the
> +		    second cell configures how the value should be outputed
> +		    (available lines and configuration differs between PMICs)
> +
> +- qcom,pattern:
> +	Usage: optional
> +	Value type: <u16-list>
> +	Definition: list of 16 bit duty cycle values to make up the pattern to
> +		    be programmed into the LUT. Values should be in the range
> +		    [0,512).
> +
> +- qcom,pattern-length-ms:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: duration, in milliseconds, of the ramp generator running
> +		    one pass over the defined pattern
> +
> +- qcom,pattern-pause-lo-ms:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: duration, in milliseconds, for the ramp generator to pause
> +		    before iterating over the pattern
> +
> +- qcom,pattern-pause-hi-ms:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: duration, in milliseconds, for the ramp generator to pause
> +		    after iterating over the pattern
> +
> +- qcom,pattern-ping-pong:
> +	Usage: optional
> +	Value type: <boolean>
> +	Definition: denotes that the ramp generator should reverse direction
> +		    when reaching the end of the pattern, instead of wrapping
> +		    to the beginning
> +
> +- qcom,pattern-oneshot:
> +	Usage: optional
> +	Value type: <boolean>
> +	Definition: denotes that the ramp generator should stop after a single
> +		    pass over the pattern
> +
> +- qcom,pattern-reverse:
> +	Usage: optional
> +	Value type: <boolean>
> +	Definition: denotes that the ramp generator should operate backwards
> +		    over the pattern

The pattern related properties should be common if we put them in DT 
which I think is debatable.

> +
> += LED Current Sink (TRILED)
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "qcom,spmi-tri-led"
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: base address of the TRILED block
> +
> +- qcom,power-source:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: power-source used to drive the output, as defined in the
> +		    datasheet
> +
> += EXAMPLE:
> +The following example defines a single output of the PMI8994, sinking current
> +into a LED in a natural pulsating pattern:
> +
> +&spmi_bus {
> +	pmic@3 {
> +		compatible = "qcom,pmi8994", "qcom,spmi-pmic";

typo.

> +		reg = <0x3 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmi8994_lpg_lut: lpg-lut@b000 {
> +			compatible = "qcom,spmi-lpg-lut";
> +			reg = <0xb000>;
> +
> +			qcom,lut-size = <24>;
> +		};
> +
> +		lpg@b200 {
> +			compatible = "qcom,spmi-lpg";
> +			reg = <0xb200>;
> +
> +			cell-index = <2>;
> +
> +			label = "lpg:green:user0";
> +
> +			qcom,tri-led = <&pmi8994_tri_led 1>;
> +			qcom,lut = <&pmi8994_lpg_lut>;
> +
> +			qcom,pattern = /bits/ 16 <9 20 42 86 158 256 353
> +						  425 469 491 502 507>;
> +			qcom,pattern-length-ms = <1337>;
> +			qcom,pattern-ping-pong;
> +
> +			default-state = "on";
> +		};
> +
> +		pmi8994_tri_led: tri-led@d000 {

It may make more sense to make the LED(s) and their properties a sub 
node of this. You could always use the PWM binding to link back to the 
LPG. The pattern/LUT is really just a queue of PWM settings. That's not 
all that different than a PWM based audio buzzer. There was a DMA based 
PWM binding the other day for audio.

Rob

> +			compatible = "qcom,spmi-tri-led";
> +			reg = <0xd000>;
> +
> +			qcom,power-source = <1>;
> +		};
> +	};
> +};
> -- 
> 2.12.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
