From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V3 2/7] backlight: qcom-wled: restructure the qcom-wled
 bindings
Date: Tue, 19 Jun 2018 15:56:15 -0700
Message-ID: <20180619225615.GF15126@tuxbook-pro>
References: <1529406822-15379-1-git-send-email-kgunda@codeaurora.org>
 <1529406822-15379-3-git-send-email-kgunda@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1529406822-15379-3-git-send-email-kgunda@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kiran Gunda <kgunda@codeaurora.org>
Cc: jingoohan1@gmail.com, lee.jones@linaro.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, Daniel Thompson <daniel.thompson@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue 19 Jun 04:13 PDT 2018, Kiran Gunda wrote:

> Restructure the qcom-wled bindings for the better readability.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 110 ++++++++++++++++-----
>  1 file changed, 85 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> index fb39e32..14f28f2 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> @@ -1,30 +1,90 @@
>  Binding for Qualcomm Technologies, Inc. WLED driver
>  
> -Required properties:
> -- compatible: should be "qcom,pm8941-wled"
> -- reg: slave address
> -
> -Optional properties:
> -- default-brightness: brightness value on boot, value from: 0-4095
> -	default: 2048
> -- label: The name of the backlight device
> -- qcom,cs-out: bool; enable current sink output
> -- qcom,cabc: bool; enable content adaptive backlight control
> -- qcom,ext-gen: bool; use externally generated modulator signal to dim
> -- qcom,current-limit: mA; per-string current limit; value from 0 to 25
> -	default: 20mA
> -- qcom,current-boost-limit: mA; boost current limit; one of:
> -	105, 385, 525, 805, 980, 1260, 1400, 1680
> -	default: 805mA
> -- qcom,switching-freq: kHz; switching frequency; one of:
> -	600, 640, 685, 738, 800, 872, 960, 1066, 1200, 1371,
> -	1600, 1920, 2400, 3200, 4800, 9600,
> -	default: 1600kHz
> -- qcom,ovp: V; Over-voltage protection limit; one of:
> -	27, 29, 32, 35
> -	default: 29V
> -- qcom,num-strings: #; number of led strings attached; value from 1 to 3
> -	default: 2
> +WLED (White Light Emitting Diode) driver is used for controlling display
> +backlight that is part of PMIC on Qualcomm Technologies, Inc. reference
> +platforms. The PMIC is connected to the host processor via SPMI bus.
> +
> +- compatible
> +	Usage:        required
> +	Value type:   <string>
> +	Definition:   should be one of:
> +			"qcom,pm8941-wled"
> +			"qcom,pmi8998-wled"
> +			"qcom,pm660l-wled"
> +
> +- reg
> +	Usage:        required
> +	Value type:   <prop encoded array>
> +	Definition:   Base address of the WLED modules.
> +
> +- default-brightness
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   brightness value on boot, value from: 0-4095
> +		      Default: 2048
> +
> +- label
> +	Usage:        required
> +	Value type:   <string>
> +	Definition:   The name of the backlight device
> +
> +- qcom,cs-out
> +	Usage:        optional
> +	Value type:   <bool>
> +	Definition:   enable current sink output.
> +		      This property is supported only for PM8941.
> +
> +- qcom,cabc
> +	Usage:        optional
> +	Value type:   <bool>
> +	Definition:   enable content adaptive backlight control.
> +
> +- qcom,ext-gen
> +	Usage:        optional
> +	Value type:   <bool>
> +	Definition:   use externally generated modulator signal to dim.
> +		      This property is supported only for PM8941.
> +
> +- qcom,current-limit
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   mA; per-string current limit
> +		      value: For pm8941: from 0 to 25 with 5 mA step
> +			     Default 20 mA.
> +			     For pmi8998: from 0 to 30 with 5 mA step
> +			     Default 25 mA.
> +
> +- qcom,current-boost-limit
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   mA; boost current limit.
> +		      For pm8941: one of: 105, 385, 525, 805, 980, 1260, 1400,
> +		      1680. Default: 805 mA
> +		      For pmi8998: one of: 105, 280, 450, 620, 970, 1150, 1300,
> +		      1500. Default: 970 mA
> +
> +- qcom,switching-freq
> +	Usage:        optional
> +	Value type:   <u32>
> +	 Definition:   kHz; switching frequency; one of: 600, 640, 685, 738,
> +		       800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200,
> +		       4800, 9600.
> +		       Default: for pm8941: 1600 kHz
> +				for pmi8998: 800 kHz
> +
> +- qcom,ovp
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   V; Over-voltage protection limit; one of:
> +		      27, 29, 32, 35. default: 29V
> +		      This property is supported only for PM8941.
> +
> +- qcom,num-strings
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   #; number of led strings attached;
> +		      value from 1 to 3. default: 2
> +		      This property is supported only for PM8941.
>  
>  Example:
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
> 
