From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 2/4] ARM: Kirkwood: add modes-map property to ns2-leds
 nodes
Date: Sat, 25 Jul 2015 16:42:15 +0200
Message-ID: <55B3A047.70905@free-electrons.com>
References: <1435859803-19583-1-git-send-email-simon.guinot@sequanux.org> <1435859803-19583-3-git-send-email-simon.guinot@sequanux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:50528 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753549AbbGYOmU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 25 Jul 2015 10:42:20 -0400
In-Reply-To: <1435859803-19583-3-git-send-email-simon.guinot@sequanux.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>

Hi Simon, Jacek, Bryan, Richard,

On 02/07/2015 19:56, Simon Guinot wrote:
> From: Vincent Donnefort <vdonnefort@gmail.com>
> 
> Since the LED modes mapping is no longer hardcoded inside the leds-ns2
> driver, then it must be provided through the modes-map property in the
> ns2-leds nodes.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>

As the other patch of the series seem to be merged in the led branch,
then I can apply this patch on mvebu/dt.

It is OK for being in linux-next, however this patch depend on "leds:
leds-ns2: move LED modes mapping outside of the driver", so I will need
to find a way to express this dependency when I will do the pull request
to arm-soc.


Thanks,

Gregory


> ---
>  arch/arm/boot/dts/kirkwood-d2net.dts   | 5 +++++
>  arch/arm/boot/dts/kirkwood-is2.dts     | 5 +++++
>  arch/arm/boot/dts/kirkwood-ns2.dts     | 5 +++++
>  arch/arm/boot/dts/kirkwood-ns2max.dts  | 5 +++++
>  arch/arm/boot/dts/kirkwood-ns2mini.dts | 5 +++++
>  5 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/kirkwood-d2net.dts b/arch/arm/boot/dts/kirkwood-d2net.dts
> index 6b7856025001..e1c25c35e9ce 100644
> --- a/arch/arm/boot/dts/kirkwood-d2net.dts
> +++ b/arch/arm/boot/dts/kirkwood-d2net.dts
> @@ -10,6 +10,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/leds/leds-ns2.h>
>  #include "kirkwood-netxbig.dtsi"
>  
>  / {
> @@ -28,6 +29,10 @@
>  			label = "d2net_v2:blue:sata";
>  			slow-gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
>  			cmd-gpio = <&gpio0 30 GPIO_ACTIVE_HIGH>;
> +			modes-map = <NS_V2_LED_OFF  1 0
> +				     NS_V2_LED_ON   0 1
> +				     NS_V2_LED_ON   1 1
> +				     NS_V2_LED_SATA 0 0>;
>  		};
>  	};
>  
> diff --git a/arch/arm/boot/dts/kirkwood-is2.dts b/arch/arm/boot/dts/kirkwood-is2.dts
> index da674bbd49a8..4121674abd1c 100644
> --- a/arch/arm/boot/dts/kirkwood-is2.dts
> +++ b/arch/arm/boot/dts/kirkwood-is2.dts
> @@ -1,5 +1,6 @@
>  /dts-v1/;
>  
> +#include <dt-bindings/leds/leds-ns2.h>
>  #include "kirkwood-ns2-common.dtsi"
>  
>  / {
> @@ -27,6 +28,10 @@
>  			label = "ns2:blue:sata";
>  			slow-gpio = <&gpio0 29 0>;
>  			cmd-gpio = <&gpio0 30 0>;
> +			modes-map = <NS_V2_LED_OFF  1 0
> +				     NS_V2_LED_ON   0 1
> +				     NS_V2_LED_ON   1 1
> +				     NS_V2_LED_SATA 0 0>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/kirkwood-ns2.dts b/arch/arm/boot/dts/kirkwood-ns2.dts
> index 53368d1022cc..190189d235e6 100644
> --- a/arch/arm/boot/dts/kirkwood-ns2.dts
> +++ b/arch/arm/boot/dts/kirkwood-ns2.dts
> @@ -1,5 +1,6 @@
>  /dts-v1/;
>  
> +#include <dt-bindings/leds/leds-ns2.h>
>  #include "kirkwood-ns2-common.dtsi"
>  
>  / {
> @@ -27,6 +28,10 @@
>  			label = "ns2:blue:sata";
>  			slow-gpio = <&gpio0 29 0>;
>  			cmd-gpio = <&gpio0 30 0>;
> +			modes-map = <NS_V2_LED_OFF  1 0
> +				     NS_V2_LED_ON   0 1
> +				     NS_V2_LED_ON   1 1
> +				     NS_V2_LED_SATA 0 0>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/kirkwood-ns2max.dts b/arch/arm/boot/dts/kirkwood-ns2max.dts
> index 72c78d0b1116..55cc41d9c80c 100644
> --- a/arch/arm/boot/dts/kirkwood-ns2max.dts
> +++ b/arch/arm/boot/dts/kirkwood-ns2max.dts
> @@ -1,5 +1,6 @@
>  /dts-v1/;
>  
> +#include <dt-bindings/leds/leds-ns2.h>
>  #include "kirkwood-ns2-common.dtsi"
>  
>  / {
> @@ -46,6 +47,10 @@
>  			label = "ns2:blue:sata";
>  			slow-gpio = <&gpio0 29 0>;
>  			cmd-gpio = <&gpio0 30 0>;
> +			modes-map = <NS_V2_LED_OFF  1 0
> +				     NS_V2_LED_ON   0 1
> +				     NS_V2_LED_ON   1 1
> +				     NS_V2_LED_SATA 0 0>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/kirkwood-ns2mini.dts b/arch/arm/boot/dts/kirkwood-ns2mini.dts
> index c441bf62c09f..9935f3ec29b4 100644
> --- a/arch/arm/boot/dts/kirkwood-ns2mini.dts
> +++ b/arch/arm/boot/dts/kirkwood-ns2mini.dts
> @@ -1,5 +1,6 @@
>  /dts-v1/;
>  
> +#include <dt-bindings/leds/leds-ns2.h>
>  #include "kirkwood-ns2-common.dtsi"
>  
>  / {
> @@ -47,6 +48,10 @@
>  			label = "ns2:blue:sata";
>  			slow-gpio = <&gpio0 29 0>;
>  			cmd-gpio = <&gpio0 30 0>;
> +			modes-map = <NS_V2_LED_OFF  1 0
> +				     NS_V2_LED_ON   0 1
> +				     NS_V2_LED_ON   1 1
> +				     NS_V2_LED_SATA 0 0>;
>  		};
>  	};
>  };
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
