From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/2] ARM: dts: motorola-cpcap-mapphone: add LEDs
Date: Mon, 6 Mar 2017 08:11:18 -0800
Message-ID: <20170306161118.GI20572@atomide.com>
References: <20170305172234.24120-1-sre@kernel.org>
 <20170305172234.24120-2-sre@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:38016 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752709AbdCFQMk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 Mar 2017 11:12:40 -0500
Content-Disposition: inline
In-Reply-To: <20170305172234.24120-2-sre@kernel.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

* Sebastian Reichel <sre@kernel.org> [170305 09:24]:
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>  arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 30 ++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
> index 9970985e685b..e02982d69854 100644
> --- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
> +++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
> @@ -38,6 +38,36 @@
>  
>  			interrupts = <23 IRQ_TYPE_NONE>;
>  		};
> +
> +		led_red: led-red {
> +			compatible = "motorola,cpcap-led-red";
> +			vdd-supply = <&sw5>;
> +			label = "status-led:red";
> +		};
> +
> +		led_green: led-green {
> +			compatible = "motorola,cpcap-led-green";
> +			vdd-supply = <&sw5>;
> +			label = "status-led:green";
> +		};
> +
> +		led_blue: led-blue {
> +			compatible = "motorola,cpcap-led-blue";
> +			vdd-supply = <&sw5>;
> +			label = "status-led:blue";
> +		};
> +
> +		led_adl: led-adl {
> +			compatible = "motorola,cpcap-led-adl";
> +			vdd-supply = <&sw5>;
> +			label = "button-backlight";
> +		};
> +
> +		led_cp: led-cp {
> +			compatible = "motorola,cpcap-led-cp";
> +			vdd-supply = <&sw5>;
> +			label = "shift-key-light";
> +		};
>  	};
>  };

Applying into omap-for-v4.12/dt-droid4 thanks. I added minimal
description to the patch saying "Add LEDs".

Regards,

Tony
