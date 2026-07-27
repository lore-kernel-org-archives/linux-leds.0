Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176E2386425;
	Mon, 27 Jul 2026 06:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133331; cv=none; b=MmcjpBxZSA4aGmz+UUqXF3CWBkaSMx0z7jgxFTuw+edlSqBqeWt+PBga6dMAN/Ux5eP8hsMXqsmKPKGEI8Jar/vWyLnbItMMKYj2qcuo/xd22HN7HA7GNJyLYICE3OpR2OFm75HRB3cEUA1fHW/uOMPU4q0WgWnLwxzetXC4uwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133331; c=relaxed/simple;
	bh=wxGYBhe1Uaa1LRu9PtPMoliOy7ej4VRkaWo5YWR/tWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tc52Gm0AxhQS8/hJWsnNVi47wE9sjAsCwcUeUqrunM0v4G9oiX2nuIujjCZGVzBJiNWoNOoNOEbcB3lf5/edUBOtrnjOBiQ53hx43g+e+MG7/CYtsKXvm5dGVRso4Tia8Z0BFeo4h7WCWTvXsAh+zZ1loV1sanaR/aua+1A2WDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9JClWtY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9JClWtY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694031F000E9;
	Mon, 27 Jul 2026 06:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785133329;
	bh=AeunN7pEac2AVzCh8XaSzbjktAbNrKHTuClx0wvfD9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H9JClWtYyo3tBfjpJfGtslB76krAyHOGf8FASFCBtd8caBPXCWUdJqGjOBMW2k22g
	 FJSotDkBcGXmP/3Qtoj7FXNmHUXzZA+gvsdDvfFY+5WBPD/hMRPkc2TN74C4656SK+
	 DHuEh9b2QxG6XgM35Y5tMqxnnN7R61qSN54UyGQUJRE2kmdXUHeBzStORqKGTgQAbX
	 aWfKEnbyuKREh0okfcKa0l92KNWP5MpEvDLw7vxVme1ptLxbkujh/0UgxlSWMuJ3bW
	 qYuZkhqHfnzw90JPEhX75E/YSGjiF/lwH909LOVQFEUWAXEMOVTyc8zh/5whjroWaC
	 JY1VLCcnQFTiQ==
Date: Mon, 27 Jul 2026 08:22:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Message-ID: <20260727-mellow-iguana-of-drizzle-ebcced@quoll>
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
 <20260724-monza-leds-v7-2-0125a3bfea98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-monza-leds-v7-2-0125a3bfea98@oss.qualcomm.com>

On Fri, Jul 24, 2026 at 09:48:16AM +0200, Loic Poulain wrote:
>      then:
>        patternProperties:
> -        "^led@[0-9a-f]+$":
> +        "^.*led@[0-9a-f]$":
>            properties:
>              reg:
>                maximum: 3
> +        "^multi-led@[0-9a-f]$":
> +          patternProperties:
> +            "^led@[0-9a-f]$":
> +              properties:
> +                reg:
> +                  maximum: 3
>    - if:
>        properties:
>          compatible:
> @@ -96,10 +136,16 @@ allOf:
>                - nxp,pca9634
>      then:
>        patternProperties:
> -        "^led@[0-9a-f]+$":
> +        "^.*led@[0-9a-f]$":

Why changing this? multi-led is below, so maybe you wanted to combine
both?

>            properties:
>              reg:
>                maximum: 7
> +        "^multi-led@[0-9a-f]$":
> +          patternProperties:
> +            "^led@[0-9a-f]$":
> +              properties:
> +                reg:
> +                  maximum: 7
>  
>  additionalProperties: false
>  
> @@ -143,4 +189,50 @@ examples:
>          };
>      };
>  
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@62 {
> +            compatible = "nxp,pca9633";
> +            reg = <0x62>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            /* Three channels controlling one RGB LED */
> +            multi-led@0 {
> +                    reg = <0>;

Messed indentation.
> +                    color = <LED_COLOR_ID_RGB>;
> +                    function = LED_FUNCTION_STATUS;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    led@0 {
> +                            reg = <0>;
> +                            color = <LED_COLOR_ID_RED>;
> +                    };
> +
> +                    led@1 {
> +                            reg = <1>;
> +                            color = <LED_COLOR_ID_GREEN>;
> +                    };
> +
> +                    led@2 {
> +                            reg = <2>;
> +                            color = <LED_COLOR_ID_BLUE>;
> +                    };
> +            };
> +
> +            /* Remaining channel used as a plain white LED */
> +            led@3 {
> +                    reg = <3>;
> +                    color = <LED_COLOR_ID_WHITE>;
> +                    function = LED_FUNCTION_STATUS;
> +            };
> +        };
> +    };
> +
>  ...
> 
> -- 
> 2.34.1
> 
