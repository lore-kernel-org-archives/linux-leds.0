From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 2/3] ARM: Kirkwood: add LED DT entries for netxbig
 boards
Date: Mon, 29 Jun 2015 14:45:15 +0200
Message-ID: <55913DDB.2000008@free-electrons.com>
References: <1434628373-11834-1-git-send-email-simon.guinot@sequanux.org> <1434628373-11834-3-git-send-email-simon.guinot@sequanux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:47229 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752016AbbF2MpS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jun 2015 08:45:18 -0400
In-Reply-To: <1434628373-11834-3-git-send-email-simon.guinot@sequanux.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Vincent Donnefort <vdonnefort@gmail.com>

Hi Simon,

On 18/06/2015 13:52, Simon Guinot wrote:
> This patch adds DT entries for the LEDs found on the Kirkwood-based
> LaCie boards 2Big and 5Big Network v2.
> 
> Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> ---

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Thanks,

Gregory


>  arch/arm/boot/dts/kirkwood-net5big.dts  | 60 +++++++++++++++++++++++++
>  arch/arm/boot/dts/kirkwood-netxbig.dtsi | 80 +++++++++++++++++++++++++++++++++
>  2 files changed, 140 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/kirkwood-net5big.dts b/arch/arm/boot/dts/kirkwood-net5big.dts
> index 36155b749d9f..3cc5e469df06 100644
> --- a/arch/arm/boot/dts/kirkwood-net5big.dts
> +++ b/arch/arm/boot/dts/kirkwood-net5big.dts
> @@ -86,6 +86,66 @@
>  			 clock-frequency = <32768>;
>  	       };
>  	};
> +
> +	netxbig-leds {
> +		blue-sata2 {
> +			label = "netxbig:blue:sata2";
> +			mode-addr = <5>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 7
> +				    NETXBIG_LED_SATA 1
> +				    NETXBIG_LED_TIMER1 3>;
> +			bright-addr = <2>;
> +			bright-max = <7>;
> +		};
> +		red-sata2 {
> +			label = "netxbig:red:sata2";
> +			mode-addr = <5>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 2
> +				    NETXBIG_LED_TIMER1 4>;
> +			bright-addr = <2>;
> +			bright-max = <7>;
> +		};
> +		blue-sata3 {
> +			label = "netxbig:blue:sata3";
> +			mode-addr = <6>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 7
> +				    NETXBIG_LED_SATA 1
> +				    NETXBIG_LED_TIMER1 3>;
> +			bright-addr = <2>;
> +			bright-max = <7>;
> +		};
> +		red-sata3 {
> +			label = "netxbig:red:sata3";
> +			mode-addr = <6>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 2
> +				    NETXBIG_LED_TIMER1 4>;
> +			bright-addr = <2>;
> +			bright-max = <7>;
> +		};
> +		blue-sata4 {
> +			label = "netxbig:blue:sata4";
> +			mode-addr = <7>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 7
> +				    NETXBIG_LED_SATA 1
> +				    NETXBIG_LED_TIMER1 3>;
> +			bright-addr = <2>;
> +			bright-max = <7>;
> +		};
> +		red-sata4 {
> +			label = "netxbig:red:sata4";
> +			mode-addr = <7>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 2
> +				    NETXBIG_LED_TIMER1 4>;
> +			bright-addr = <2>;
> +			bright-max = <7>;
> +		};
> +	};
>  };
>  
>  &mdio {
> diff --git a/arch/arm/boot/dts/kirkwood-netxbig.dtsi b/arch/arm/boot/dts/kirkwood-netxbig.dtsi
> index b0cfb7cd30b9..5e7ed1c7e1b2 100644
> --- a/arch/arm/boot/dts/kirkwood-netxbig.dtsi
> +++ b/arch/arm/boot/dts/kirkwood-netxbig.dtsi
> @@ -13,6 +13,7 @@
>   * warranty of any kind, whether express or implied.
>  */
>  
> +#include <dt-bindings/leds/leds-netxbig.h>
>  #include "kirkwood.dtsi"
>  #include "kirkwood-6281.dtsi"
>  
> @@ -105,6 +106,85 @@
>  			gpio = <&gpio0 16 GPIO_ACTIVE_HIGH>;
>  		};
>  	};
> +
> +	netxbig_gpio_ext: netxbig-gpio-ext {
> +		compatible = "lacie,netxbig-gpio-ext";
> +
> +		addr-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH
> +			      &gpio1 16 GPIO_ACTIVE_HIGH
> +			      &gpio1 17 GPIO_ACTIVE_HIGH>;
> +		data-gpios = <&gpio1 12 GPIO_ACTIVE_HIGH
> +			      &gpio1 13 GPIO_ACTIVE_HIGH
> +			      &gpio1 14 GPIO_ACTIVE_HIGH>;
> +		enable-gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	netxbig-leds {
> +		compatible = "lacie,netxbig-leds";
> +
> +		gpio-ext = <&netxbig_gpio_ext>;
> +
> +		timers = <NETXBIG_LED_TIMER1 500 500
> +			  NETXBIG_LED_TIMER2 500 1000>;
> +
> +		blue-power {
> +			label = "netxbig:blue:power";
> +			mode-addr = <0>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 1
> +				    NETXBIG_LED_TIMER1 3
> +				    NETXBIG_LED_TIMER2 7>;
> +			bright-addr = <1>;
> +			bright-max = <7>;
> +		};
> +		red-power {
> +			label = "netxbig:red:power";
> +			mode-addr = <0>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 2
> +				    NETXBIG_LED_TIMER1 4>;
> +			bright-addr = <1>;
> +			bright-max = <7>;
> +		};
> +		blue-sata0 {
> +			label = "netxbig:blue:sata0";
> +			mode-addr = <3>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 7
> +				    NETXBIG_LED_SATA 1
> +				    NETXBIG_LED_TIMER1 3>;
> +			bright-addr = <2>;
> +			bright-max = <7>;
> +		};
> +		red-sata0 {
> +			label = "netxbig:red:sata0";
> +			mode-addr = <3>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 2
> +				    NETXBIG_LED_TIMER1 4>;
> +			bright-addr = <2>;
> +			bright-max = <7>;
> +		};
> +		blue-sata1 {
> +			label = "netxbig:blue:sata1";
> +			mode-addr = <4>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 7
> +				    NETXBIG_LED_SATA 1
> +				    NETXBIG_LED_TIMER1 3>;
> +			bright-addr = <2>;
> +			bright-max = <7>;
> +		};
> +		red-sata1 {
> +			label = "netxbig:red:sata1";
> +			mode-addr = <4>;
> +			mode-val = <NETXBIG_LED_OFF 0
> +				    NETXBIG_LED_ON 2
> +				    NETXBIG_LED_TIMER1 4>;
> +			bright-addr = <2>;
> +			bright-max = <7>;
> +		};
> +	};
>  };
>  
>  &mdio {
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
