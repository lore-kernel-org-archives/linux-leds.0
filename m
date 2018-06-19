From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V3 3/7] backlight: qcom-wled: Add new properties for
 PMI8998
Date: Tue, 19 Jun 2018 16:03:51 -0700
Message-ID: <20180619230351.GG15126@tuxbook-pro>
References: <1529406822-15379-1-git-send-email-kgunda@codeaurora.org>
 <1529406822-15379-4-git-send-email-kgunda@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1529406822-15379-4-git-send-email-kgunda@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kiran Gunda <kgunda@codeaurora.org>
Cc: jingoohan1@gmail.com, lee.jones@linaro.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, Daniel Thompson <daniel.thompson@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue 19 Jun 04:13 PDT 2018, Kiran Gunda wrote:
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
[..]
>  - qcom,num-strings
>  	Usage:        optional
>  	Value type:   <u32>
>  	Definition:   #; number of led strings attached;
> -		      value from 1 to 3. default: 2
> -		      This property is supported only for PM8941.
> +		      value: For PM8941 from 1 to 3. default: 2
> +			     For PMI8998 from 1 to 4. default: 4
[..]
> +- qcom,enabled-strings
> +	Usage:        optional
> +	Value tyoe:   <u32 array>
> +	Definition:   Array of the WLED strings numbered from 0 to 3. Each
> +		      string of leds are operated individually. Specify the
> +		      list of strings used by the device. Any combination of
> +		      led strings can be used.
> +		      for pm8941: Default values are [00 01].
> +		      for pmi8998: Default values are [00 01 02 03].

I would suggest omitting the defaults, as we can see in several places
in this document we end up having to update the document with new
defaults for each platform.

Also, per the defaults of the optional qcom,num-strings these are
already the defaults...

[..]
> +pmi8998-wled@d800 {
> +	compatible = "qcom,pmi8998-wled";
> +	reg = <0xd800 0xd900>;
> +	label = "backlight";
> +
> +	interrupts = <3 0xd8 2 IRQ_TYPE_EDGE_RISING>,
> +		     <3 0xd8 1 IRQ_TYPE_EDGE_RISING>;
> +	interrupt-names = "short", "ovp";
> +	qcom,current-limit-microamp = <25000>;
> +	qcom,current-boost-limit = <805>;
> +	qcom,switching-freq = <1600>;
> +	qcom,ovp-millivolt = <29600>;
> +	qcom,num-strings = <4>;
> +	qcom,enabled-strings = <0x00 0x01 0x02 0x03>;

Please omit the pmi8998 example as well, there's no real benefit of
adding similar examples for each platform.

Regards,
Bjorn
