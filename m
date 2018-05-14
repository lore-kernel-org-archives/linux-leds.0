From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH V1 2/5] backlight: qcom-wled: Add support for WLED4
 peripheral
Date: Mon, 14 May 2018 18:57:55 +0200
Message-ID: <20180514165755.GB27984@xo-6d-61-c0.localdomain>
References: <1525341432-15818-1-git-send-email-kgunda@codeaurora.org>
 <1525341432-15818-3-git-send-email-kgunda@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1525341432-15818-3-git-send-email-kgunda@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kiran Gunda <kgunda@codeaurora.org>
Cc: bjorn.andersson@linaro.org, Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

> WLED4 peripheral is present on some PMICs like pmi8998
> and pm660l. It has a different register map and also
> configurations are different. Add support for it.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 172 ++++-
>  drivers/video/backlight/qcom-wled.c                | 749 +++++++++++++++------
>  2 files changed, 696 insertions(+), 225 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> index fb39e32..0ceffa1 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> @@ -1,30 +1,129 @@
>  Binding for Qualcomm Technologies, Inc. WLED driver
>  
> -Required properties:
> -- compatible: should be "qcom,pm8941-wled"
> -- reg: slave address
> -
> -Optional properties:
> -- default-brightness: brightness value on boot, value from: 0-4095
> -	default: 2048
> +- compatible
> +	Usage:        required
> +	Value type:   <string>
> +	Definition:   should be "qcom,pm8941-wled" or "qcom,pmi8998-wled".
> +		      or "qcom,pm660l-wled".
> +
> +- reg
> +	Usage:        required
> +	Value type:   <prop encoded array>
> +	Definition:   Base address of the WLED modules.

I'm not sure if this change of format is good idea here...

									Pavel
