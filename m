From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] DT: leds: Add Qualcomm Light Pulse Generator binding
Date: Wed, 29 Mar 2017 12:26:40 -0700
Message-ID: <20170329192640.GO20094@minitux>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323055435.29197-2-bjorn.andersson@linaro.org>
 <20170329022649.wp5uvt2akufgihwh@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170329022649.wp5uvt2akufgihwh@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Tue 28 Mar 19:26 PDT 2017, Rob Herring wrote:

> On Wed, Mar 22, 2017 at 10:54:35PM -0700, Bjorn Andersson wrote:
> > This adds the binding document describing the three hardware blocks
> > related to the Light Pulse Generator found in a wide range of Qualcomm
> > PMICs.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../devicetree/bindings/leds/leds-qcom-lpg.txt     | 194 +++++++++++++++++++++
> >  1 file changed, 194 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> > new file mode 100644
> > index 000000000000..fb9edd89119d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> > @@ -0,0 +1,194 @@
> > +Binding for Qualcomm Light Pulse Generator
> > +
> > +The Qualcomm Light Pulse Generator consists of three different hardware blocks;
> > +a ramp generator with lookup table, the light pulse generator and a three
> > +channel current sink. These blocks are found in a wide range of Qualcomm PMICs.
> > +Each of these are described individually below.
> > +
> > += Lookup Table (LUT)
> > +
> > +- compatible:
> > +	Usage: required
> > +	Value type: <stringlist>
> > +	Definition: must be "qcom,spmi-lpg-lut"
> > +
> > +- reg:
> > +	Usage: required
> > +	Value type: <prop-encoded-array>
> > +	Definition: base address of the LUT block
> > +
> > +- qcom,lut-size:
> > +	Usage: required
> > +	Value type: <u32>
> > +	Definition: number of elements available in the lookup table
> > +
> > += Light Pulse Generator (LPG)
> > +The Light Pulse Generator can operate either as a standard PWM controller or in
> > +a more advanced lookup-table based mode. These are described separately below.
> > +
> > +- compatible:
> > +	Usage: required
> > +	Value type: <stringlist>
> > +	Definition: must be "qcom,spmi-lpg"
> > +
> > +- reg:
> > +	Usage: required
> > +	Value type: <prop-encoded-array>
> > +	Definition: base address of the LPG block
> > +
> > +== PWM mode
> > +
> > +- #pwm-cells:
> > +	Usage: required
> > +	Value type: <u32>
> > +	Definition: must be 1
> > +
> > +== Lookup-table mode
> > +
> > +- cell-index:
> 
> This is a standard though not used property name. Perhaps "reg" or a 
> vendor property instead.
> 

The node already has a "reg", this is the "natural" id of the
LPG-channel, as used to reference a certain ramp-generator in the LUT.

I did model this as an argument of the qcom,lut property below, but felt
it's not a question of "which LUT" or any "configuration of the LUT" it
is a property of the LPG.

I can convert this to a qcom,lpg-id or something like that if you
prefer.

> > +	Usage: required, when referencing a LUT
> > +	Value type: <u32>
> > +	Definition: id of the LPG, used to associate the LPG with a particular
> > +		    ramp generator in the LUT block
> > +
> > +- default-state:
> > +	Usage: optional
> > +	Value type: <string>
> > +	Definition: default state, as defined in common.txt
> > +
> > +- label:
> > +	Usage: optional
> > +	Value type: <string>
> > +	Definition: label of the LED, as defined in common.txt
> > +
> > +- linux,default-trigger:
> > +	Usage: optional
> > +	Value type: <string>
> > +	Definition: default trigger, as defined in common.txt
> > +
> > +- qcom,tri-led:
> > +	Usage: optional
> > +	Value type: <prop-encoded-array>
> > +	Definition: a phandle of a TRILED node and a single u32 denoting which
> > +		    output channel to control
> > +
> > +- qcom,lut:
> > +	Usage: optional
> > +	Value type: <prop-encoded-array>
> > +	Definition: phandle of a LUT node
> > +
> > +- qcom,dtest:
> > +	Usage: optional
> > +	Value type: <prop-encoded-array>
> > +	Definition: configures the output into an internal test line of the
> > +		    pmic. A first u32 defines which test line to use and the
> > +		    second cell configures how the value should be outputed
> > +		    (available lines and configuration differs between PMICs)
> > +
> > +- qcom,pattern:
> > +	Usage: optional
> > +	Value type: <u16-list>
> > +	Definition: list of 16 bit duty cycle values to make up the pattern to
> > +		    be programmed into the LUT. Values should be in the range
> > +		    [0,512).
> > +
> > +- qcom,pattern-length-ms:
> > +	Usage: optional
> > +	Value type: <u32>
> > +	Definition: duration, in milliseconds, of the ramp generator running
> > +		    one pass over the defined pattern
> > +
> > +- qcom,pattern-pause-lo-ms:
> > +	Usage: optional
> > +	Value type: <u32>
> > +	Definition: duration, in milliseconds, for the ramp generator to pause
> > +		    before iterating over the pattern
> > +
> > +- qcom,pattern-pause-hi-ms:
> > +	Usage: optional
> > +	Value type: <u32>
> > +	Definition: duration, in milliseconds, for the ramp generator to pause
> > +		    after iterating over the pattern
> > +
> > +- qcom,pattern-ping-pong:
> > +	Usage: optional
> > +	Value type: <boolean>
> > +	Definition: denotes that the ramp generator should reverse direction
> > +		    when reaching the end of the pattern, instead of wrapping
> > +		    to the beginning
> > +
> > +- qcom,pattern-oneshot:
> > +	Usage: optional
> > +	Value type: <boolean>
> > +	Definition: denotes that the ramp generator should stop after a single
> > +		    pass over the pattern
> > +
> > +- qcom,pattern-reverse:
> > +	Usage: optional
> > +	Value type: <boolean>
> > +	Definition: denotes that the ramp generator should operate backwards
> > +		    over the pattern
> 
> The pattern related properties should be common if we put them in DT 
> which I think is debatable.
> 

A few years back I saw one other chip that had a similar pattern style,
using these properties for the LP5xx - that is what's being requested -
would have to be implemented by something reading the pattern and
generating firmware to be run on the chip. This should be possible to
do, but there are a lot functionality in the LP55xx chips that you would
not be able to use with such an approach.

> > +
> > += LED Current Sink (TRILED)
> > +
> > +- compatible:
> > +	Usage: required
> > +	Value type: <stringlist>
> > +	Definition: must be "qcom,spmi-tri-led"
> > +
> > +- reg:
> > +	Usage: required
> > +	Value type: <prop-encoded-array>
> > +	Definition: base address of the TRILED block
> > +
> > +- qcom,power-source:
> > +	Usage: required
> > +	Value type: <u32>
> > +	Definition: power-source used to drive the output, as defined in the
> > +		    datasheet
> > +
> > += EXAMPLE:
> > +The following example defines a single output of the PMI8994, sinking current
> > +into a LED in a natural pulsating pattern:
> > +
> > +&spmi_bus {
> > +	pmic@3 {
> > +		compatible = "qcom,pmi8994", "qcom,spmi-pmic";
> 
> typo.
> 

Sorry, I don't see the typo.

> > +		reg = <0x3 SPMI_USID>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		pmi8994_lpg_lut: lpg-lut@b000 {
> > +			compatible = "qcom,spmi-lpg-lut";
> > +			reg = <0xb000>;
> > +
> > +			qcom,lut-size = <24>;
> > +		};
> > +
> > +		lpg@b200 {
> > +			compatible = "qcom,spmi-lpg";
> > +			reg = <0xb200>;
> > +
> > +			cell-index = <2>;
> > +
> > +			label = "lpg:green:user0";
> > +
> > +			qcom,tri-led = <&pmi8994_tri_led 1>;
> > +			qcom,lut = <&pmi8994_lpg_lut>;
> > +
> > +			qcom,pattern = /bits/ 16 <9 20 42 86 158 256 353
> > +						  425 469 491 502 507>;
> > +			qcom,pattern-length-ms = <1337>;
> > +			qcom,pattern-ping-pong;
> > +
> > +			default-state = "on";
> > +		};
> > +
> > +		pmi8994_tri_led: tri-led@d000 {
> 
> It may make more sense to make the LED(s) and their properties a sub 
> node of this. You could always use the PWM binding to link back to the 
> LPG. The pattern/LUT is really just a queue of PWM settings. That's not 
> all that different than a PWM based audio buzzer. There was a DMA based 
> PWM binding the other day for audio.
> 

The TRILED is a separate hardware block from the LPG and for 3
(predefined) LPG channel it serves as one of the options for routing the
signal out of the PMIC. 

As an example, on DB820c I drive the fourth user-LED by routing one of
the LPG channels to a MPP configured as current-sink.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
