From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V4 3/8] backlight: qcom-wled: Add new properties for
 PMI8998
Date: Mon, 6 Aug 2018 22:23:55 -0700
Message-ID: <20180807052355.GA23866@tuxbook-pro>
References: <1531131741-19971-1-git-send-email-kgunda@codeaurora.org>
 <1531131741-19971-4-git-send-email-kgunda@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531131741-19971-4-git-send-email-kgunda@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kiran Gunda <kgunda@codeaurora.org>
Cc: jingoohan1@gmail.com, lee.jones@linaro.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon 09 Jul 03:22 PDT 2018, Kiran Gunda wrote:
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
[..]
>  - qcom,num-strings
>  	Usage:        optional
>  	Value type:   <u32>
>  	Definition:   #; number of led strings attached;
> -		      value from 1 to 3. default: 2
> -		      This property is supported only for PM8941.
> +		      value: For PM8941 from 1 to 3.
> +			     For PMI8998 from 1 to 4.
[..]
> +- qcom,enabled-strings
> +	Usage:        optional
> +	Value tyoe:   <u32 array>
> +	Definition:   Array of the WLED strings numbered from 0 to 3. Each
> +		      string of leds are operated individually. Specify the
> +		      list of strings used by the device. Any combination of
> +		      led strings can be used.
[..]
>  
>  Example:
>  
> @@ -99,4 +146,5 @@ pm8941-wled@d800 {
>  	qcom,switching-freq = <1600>;
>  	qcom,ovp = <29>;
>  	qcom,num-strings = <2>;
> +	qcom,enabled-strings = <0x00 0x01>;

Nit. I would assume that specifying qcom,num-strings = <2> implies that
the first 2 strings are used, so one would not also specify
qcom,enabled-strings.

(And you should use decimal for natural numbers)


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
