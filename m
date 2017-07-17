From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/3] DT: leds: Add Qualcomm Light Pulse Generator
 binding
Date: Sun, 16 Jul 2017 21:44:30 -0700
Message-ID: <20170717044430.GW1618@tuxbook>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-4-bjorn.andersson@linaro.org>
 <aefc36fc-9c16-e8da-b684-6e77ec96c662@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:34853 "EHLO
        mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751248AbdGQEoe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Jul 2017 00:44:34 -0400
Received: by mail-pf0-f175.google.com with SMTP id e199so9418687pfh.2
        for <linux-leds@vger.kernel.org>; Sun, 16 Jul 2017 21:44:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <aefc36fc-9c16-e8da-b684-6e77ec96c662@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>

On Sun 16 Jul 11:49 PDT 2017, Jacek Anaszewski wrote:
> On 07/15/2017 12:45 AM, Bjorn Andersson wrote:
> > diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> > new file mode 100644
> > index 000000000000..cc9ffee6586b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> > @@ -0,0 +1,145 @@
> > +Binding for Qualcomm Light Pulse Generator
> > +
> > +The Qualcomm Light Pulse Generator consists of three different hardware blocks;
> 
> Is there a freely available documentation thereof?
> 

The only publicly available Qualcomm PMIC documentation that I'm aware
of only have the PWM hardware block, so it will be possible to use this
driver but with limited functionality.

[..]
> > += Light Pulse Generator (LPG)
> > +The Light Pulse Generator can operate either as a standard PWM controller or in
> > +a more advanced lookup-table based mode. These are described separately below.
> 
> Why a user would prefer one option over the other? I assume that both
> controllers offer at least slightly different capabilities.
> If so, then it could be the driver which would decide which one fits
> better for the requested LED class device configuration.
> 

I have never seen this hardware block been used as a PWM, but I imagine
it to be used when someone has another driver that expects to be able to
use the PWM API to control an output.

In this case the node would need a #pwm-cells property, which it doesn't
when it's acting as a LED and it wouldn't make much sense to expose the
pin as a LED at the same time.

Perhaps I overthought this? Maybe I should just leave the PWM mode out
for now and it could be added in the future?

[..]
> > +&spmi_bus {
> > +	pmic@3 {
> > +		compatible = "qcom,pmi8994", "qcom,spmi-pmic";
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
> > +			default-state = "on";
> > +		};
> > +
> > +		pmi8994_tri_led: tri-led@d000 {
> > +			compatible = "qcom,spmi-tri-led";
> > +			reg = <0xd000>;
> > +
> > +			qcom,power-source = <1>;
> > +		};
> 
> Such a design is uncommon for LED class DT bindings. It should
> suffice to have a single DT LED node per LED. I have an impression
> that you're exposing too many hardware details here.
> You can use led-sources property (see Documentation/devicetree/bindings
> /leds/common.txt and drivers/leds/leds-max77693.c where it is used).
> 

The LUT is shared among the (up to) 8 LPG blocks, so while I did
consider just including the LUT in each LPG block it didn't look nice
and I had to implement the LUT as a singleton in the driver itself.

The TRILED is only one of the available current sinks in the PMIC that
can be driven by the LPG; the other one I use so far is a special GPIO
pin acting as a current sink.

Also the power-source configuration is shared among the three channels
of the TRILED, so it doesn't really make sense to put this configuration
in the LPG blocks themselves.


And note that these are different blocks within the Qualcomm PMIC, with
my design only one of them is actually representing the LED instance.

> It is also not clear to me why single green color LED presented here
> would have to use tri-led sink? I suppose that the sink is predestined
> for three-color LEDs.
> 

The board I'm working on (DragonBoard820c) has 4 green LEDs, the first 3
are connected to the 3 channels of the TRILED and the fourth is
connected to a special GPIO in current sink mode. But I choose to
shorted the example to one channel.

So I end up having one LUT node, four LPG nodes, one TRILED and one GPIO
node and the user space is presented with a unified interface to all
four.

Regards,
Bjorn
