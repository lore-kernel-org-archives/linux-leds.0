From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 3/3] DT: leds: Add Qualcomm Light Pulse Generator
 binding
Date: Sun, 16 Jul 2017 20:49:34 +0200
Message-ID: <aefc36fc-9c16-e8da-b684-6e77ec96c662@gmail.com>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:35673 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751230AbdGPSuS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Jul 2017 14:50:18 -0400
In-Reply-To: <20170714224520.467-4-bjorn.andersson@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>

Hi Bjorn,

On 07/15/2017 12:45 AM, Bjorn Andersson wrote:
> This adds the binding document describing the three hardware blocks
> related to the Light Pulse Generator found in a wide range of Qualcomm
> PMICs.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Dropped custom pattern properties
> - Renamed cell-index to qcom,lpg-channel to clarify its purpose
> 
>  .../devicetree/bindings/leds/leds-qcom-lpg.txt     | 145 +++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> new file mode 100644
> index 000000000000..cc9ffee6586b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> @@ -0,0 +1,145 @@
> +Binding for Qualcomm Light Pulse Generator
> +
> +The Qualcomm Light Pulse Generator consists of three different hardware blocks;

Is there a freely available documentation thereof?

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

Why a user would prefer one option over the other? I assume that both
controllers offer at least slightly different capabilities.
If so, then it could be the driver which would decide which one fits
better for the requested LED class device configuration.

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
> +- qcom,lpg-channel:
> +	Usage: required, when referencing a LUT
> +	Value type: <u32>
> +	Definition: identifier of the LPG channel, used to associate the LPG
> +		    with a particular ramp generator in the LUT block
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
> +into a LED.
> +
> +&spmi_bus {
> +	pmic@3 {
> +		compatible = "qcom,pmi8994", "qcom,spmi-pmic";
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
> +			default-state = "on";
> +		};
> +
> +		pmi8994_tri_led: tri-led@d000 {
> +			compatible = "qcom,spmi-tri-led";
> +			reg = <0xd000>;
> +
> +			qcom,power-source = <1>;
> +		};

Such a design is uncommon for LED class DT bindings. It should
suffice to have a single DT LED node per LED. I have an impression
that you're exposing too many hardware details here.
You can use led-sources property (see Documentation/devicetree/bindings
/leds/common.txt and drivers/leds/leds-max77693.c where it is used).

It is also not clear to me why single green color LED presented here
would have to use tri-led sink? I suppose that the sink is predestined
for three-color LEDs.

-- 
Best regards,
Jacek Anaszewski
