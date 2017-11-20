From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 3/3] DT: leds: Add Qualcomm Light Pulse Generator
 binding
Date: Mon, 20 Nov 2017 11:58:12 -0800
Message-ID: <20171120195812.GY28761@minitux>
References: <20171115071345.24331-1-bjorn.andersson@linaro.org>
 <20171115071345.24331-4-bjorn.andersson@linaro.org>
 <a97a6cd3-b624-5127-003d-7ffd7d9d67e9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a97a6cd3-b624-5127-003d-7ffd7d9d67e9@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

On Sun 19 Nov 13:35 PST 2017, Jacek Anaszewski wrote:

> Hi Bjorn,
> 
> Thanks for the update.
> 
> On 11/15/2017 08:13 AM, Bjorn Andersson wrote:
> > This adds the binding document describing the three hardware blocks
> > related to the Light Pulse Generator found in a wide range of Qualcomm
> > PMICs.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v2:
> > - Squashed all things into one node
> > - Removed quirks from the binding, compatible implies number of channels, their
> >   configuration etc.
> > - Binding describes LEDs connected as child nodes
> > - Support describing multi-channel LEDs
> > - Change style of the binding document, to match other LED bindings
> > 
> > Changes since v1:
> > - Dropped custom pattern properties
> > - Renamed cell-index to qcom,lpg-channel to clarify its purpose
> > 
> >  .../devicetree/bindings/leds/leds-qcom-lpg.txt     | 66 ++++++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> > new file mode 100644
> > index 000000000000..9cee6f9f543c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> > @@ -0,0 +1,66 @@
> > +Binding for Qualcomm Light Pulse Generator
> > +
> > +The Qualcomm Light Pulse Generator consists of three different hardware blocks;
> > +a ramp generator with lookup table, the light pulse generator and a three
> > +channel current sink. These blocks are found in a wide range of Qualcomm PMICs.
> > +
> > +Required properties:
> > +- compatible: one of:
> > +	      "qcom,pm8916-pwm",
> > +	      "qcom,pm8941-lpg",
> > +	      "qcom,pm8994-lpg",
> > +	      "qcom,pmi8994-lpg",
> > +	      "qcom,pmi8998-lpg",
> > +
> > +Optional properties:
> > +- qcom,power-source: power-source used to drive the output, as defined in the
> > +		     datasheet. Should be specified if the TRILED block is
> > +		     present
> 
> Range of possible values is missing here.
> 

There seems to be a 4-way mux in all variants, but the wiring is
different in the different products. E.g. in pm8941 1 represents VPH_PWR
while in pmi8994 this is pulled from a dedicated pin named VIN_RGB.

Would you like me to list the 4 options for each compatible?

> > +- qcom,dtest: configures the output into an internal test line of the
> > +	      pmic. Specified by a list of u32 pairs, one pair per channel,
> > +	      where each pair denotes the test line to drive and the second
> > +	      configures how the value should be outputed, as defined in the
> > +	      datasheet
> > +- #pwm-cells: should be 2, see ../pwm/pwm.txt
> > +
> > +LED subnodes:
> > +A set of subnodes can be used to specify LEDs connected to the LPG. Channels
> > +not associated with a LED are available as pwm channels, see ../pwm/pwm.txt.
> > +
> > +Required properties:
> > +- led-sources: list of channels associated with this LED, starting at 1 for the
> > +	       first LPG channel
> > +
> > +Optional properties:
> > +- label: see Documentation/devicetree/bindings/leds/common.txt
> > +- default-state: see Documentation/devicetree/bindings/leds/common.txt
> > +- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
> > +
> > +Example:
> > +The following example defines a RGB LED attached to the PM8941.
> > +
> > +&spmi_bus {
> > +	pm8941@1 {
> > +		lpg {
> > +			compatible = "qcom,pm8941-lpg";
> > +			qcom,power-source = <1>;
> > +
> > +			rgb {
> > +				led-sources = <7 6 5>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +The following example defines the single PWM channel of the PM8916, which can
> > +be muxed by the MPP4 as a current sink.
> > +
> > +&spmi_bus {
> > +	pm8916@1 {
> > +		pm8916_pwm: pwm {
> > +			compatible = "qcom,pm8916-pwm";
> > +
> > +			#pwm-cells = <2>;
> 
> LED has to be represented as a child node -
> see Documentation/devicetree/bindings/leds/common.txt
> 

Some use cases for this hardware block is to use it as a "traditional"
PWM source, so any channels not allocated to a LED are available as pwm
channels.

So this is from the Dragonboard410c, where the example application is to
wire this pwm signal as control signal to a backlight controller; i.e.
using pwm-backlight associated with the display panel.


For testing purposes I did route the signal to another gpio with a LED
on the board, added a LED node here and saw that I can control that as
well.

I did include this example here, even though there's no LED, just to
show how this could be done.

> > +		};
> > +	};
> > +};
> > 
> 
> Could you please also provide an example of the arrangement on the
> board DragonBoard820c, you were describing in the discussions under
> the previous version of the patch set. i.e. three green LEDs connected
> to TRILED and one to the GPIO sink?
> 

Of course.

> Also any other non-trivial board configurations supported by the
> driver would allow to increase our comprehensions of the device
> capabilities.
> 

There is a few other hardware components that can be fed the output of
the LPG as control signal, but I think the GPIO sink case above does
showcase the power.

Regards,
Bjorn
