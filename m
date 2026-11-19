Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114934;
	b=aOTa386/SIpeenIeL4TpQAOH95cdc63LD0S6CqtT0fbvBsTzMMQcixUgcndyOZ7t6aRE
	 shgeJPyWJ7RnST4RZ5oCvPqTbOamiYRlzhpTn/fihP4AwgGRjXlYhOz5eiODDffXCYB3N
	 +o34FiS4GGq8uXVD94edvOcqtD09NbK8MMH7TGVhTO12pNXezrm9JaMQYMKlKrgDmmBbm
	 EHsKDC0TarKy/XZy5LEwdI1f9f7z/bHh1Z0tM9qzoV79anqNGw5qCuKefUhfc2wqM/S9a
	 bXtv9XLLwO+Lhrz/UH+6TwaCw/R+qyZdJwl2uvKJ1fjxtbtMf9sMDBoO5kwvWXl6nEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114934;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=yW9CLK3VCbPV9uHrJRzlV05f12UIycKqO4K90lvCbqs=;
	b=e9R4/RHyik5m6NuhFpKyuUAWF00TmPo4wfLzEZz9/Rm/9ckbxPoVS/4W94Gdk/P9WwK+
	 XUskDaP4BqSyGavIe2O2sriaE/ju/pq9cm0o5SD9yfVIIgElBCCZmFKKwtP3GUh7+cVc+
	 1yMeFU4bQPGStaRluyUXikBFKJ5D2Eo0JNLLDFTg6wuC58DX+82gj9nwl9ehEwEHWADeC
	 ADnQ3ay3IyEtqZDhWUVNYixwe6GhzV9wiW9deccwC9SKkSU7DBZwMNlcxMISq2spzt/Xn
	 XfItp0bFCwmikuinMFY43BrByvDejgSWrY3ygAjbQtgATv+9xV1UI5flpQSkvVsuF2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nx4ge4Tb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5287606A320;
	Thu, 19 Nov 2026 19:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nx4ge4Tb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7C61F000C8;
	Thu, 19 Nov 2026 19:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795114934;
	bh=yW9CLK3VCbPV9uHrJRzlV05f12UIycKqO4K90lvCbqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nx4ge4TbiYzaE4xxOddbb0h1zqryiaLduVDMCacNw+Vg49Wq93xKPpR8Kp8by7+uV
	 fx62BZz/7ENB6KOpDXs8TGRslr0I+7imguO5LDZDFOiasJD+kaWInZ6M2AfdIg/FGR
	 iPLEn10bqDRRiMFeEDaPrd19nrG88Ma+y395gd6j6s1FxKh3QcCdCnfMasxpP3FaG0
	 nqVMnIfwWWhexy0bh/UUVuQKjPPTfiAj9xuYg/CR49ib+cqAXmmymU//Ee4Z8nXyaU
	 s/Gdpqgr/DyX4b8gPRtWe1tXx8L0vAGFt2G9uvyFbo4YT/KoJOqH67efj2TtBxIrMq
	 21oqH5qXKAN1w==
Date: Thu, 19 Nov 2026 19:02:09 +0000
From: Lee Jones <lee@kernel.org>
To: filipescu.cristian@gmail.com
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH RFC] leds: DT: migrating existing labels to function/color
Message-ID: <179510277952.63755.11124972443142013738@kernel.org>
References: <179489221679.1.1429296960451969532.led-label-policy-rfc@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179489221679.1.1429296960451969532.led-label-policy-rfc@gmail.com>
X-AI-Review-Draft: <179489221679.1.1429296960451969532.led-label-policy-rfc@gmail.com>

I'm not exactly sure what to do with this patch, but not a patch, submission?

Sashiko already had some things to say.

> From: Cristian Filipescu <filipescu.cristian@gmail.com>
>
> Hi,

This does not belong in a commit message.

> The common LED binding deprecates label in favour of function and color.
> Is removing existing labels desirable when it changes established LED class
> names, or should existing board descriptions retain them for compatibility?

Removing existing 'label' properties will change the sysfs directory
names under /sys/class/leds/ and risk breaking existing user-space tools
and scripts that rely on them.  Existing board descriptions should
retain their 'label' properties for backwards compatibility, though
'function' and 'color' can be used for any newly added nodes.

> For example, the Orange Pi H6 descriptions could replace their labels with
> LED_FUNCTION_POWER/STATUS and LED_COLOR_ID_RED/GREEN. With gpio-leds, this
> would change the names under /sys/class/leds:
>
>   orangepi:red:power    -> red:power
>   orangepi:green:status -> green:status
>
> The example below changes two files and affects Orange Pi 3, 3 LTS, Lite2
> and One Plus. GPIOs, polarity, pinctrl, defaults and triggers are unchanged.
> All four DTBs compile before and after; comparison found only the intended
> label/function/color changes. The renamed LEDs have not been tested on
> hardware.
>
> I was thinking of converting all the deprecated LED labels, but I wanted
> to see if this was something maintainers wanted, since it would touch a lot
> of files. Would you prefer retaining existing labels (potentially adding
> function and color alongside them), or reviewing migrations with the name
> changes explicitly documented?
>
> This is a discussion example, not a patch for inclusion. Preparation and
> static checks were assisted by OpenAI Codex.
>
> Thanks,
> Cristian

This does not constitute as a SoB.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> index ce82aa265..8e4117057 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> @@ -8,6 +8,7 @@
>  #include "sun50i-h6-gpu-opp.dtsi"
>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>
>  / {
>  	model = "OrangePi 3";
> @@ -45,13 +46,15 @@ leds {
>  		compatible = "gpio-leds";
>
>  		led-0 {
> -			label = "orangepi:red:power";
> +			function = LED_FUNCTION_POWER;
> +			color = <LED_COLOR_ID_RED>;
>  			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
>  			default-state = "on";
>  		};
>
>  		led-1 {
> -			label = "orangepi:green:status";
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
>  			gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index 57b137755..49f3d2fc8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -9,6 +9,7 @@
>  #include "sun50i-h6-gpu-opp.dtsi"
>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>
>  / {
>  	model = "OrangePi One Plus";
> @@ -45,13 +46,15 @@ leds {
>  		compatible = "gpio-leds";
>
>  		led-0 {
> -			label = "orangepi:red:power";
> +			function = LED_FUNCTION_POWER;
> +			color = <LED_COLOR_ID_RED>;
>  			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
>  			default-state = "on";
>  		};
>
>  		led-1 {
> -			label = "orangepi:green:status";
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
>  			gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
>  		};
>  	};
>
>

-- 
Lee Jones
