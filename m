From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] DT: Add documentation for the mfd Maxim max77693
Date: Mon, 30 Mar 2015 12:57:29 +0100
Message-ID: <20150330115729.GG17971@leverpostej>
References: <1427709149-15014-1-git-send-email-j.anaszewski@samsung.com>
 <1427709149-15014-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427709149-15014-2-git-send-email-j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "pavel-+ZI9xUNit7I@public.gmane.org" <pavel-+ZI9xUNit7I@public.gmane.org>, "cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "sakari.ailus-X3B1VOXEql0@public.gmane.org" <sakari.ailus-X3B1VOXEql0@public.gmane.org>, "s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Mar 30, 2015 at 10:52:28AM +0100, Jacek Anaszewski wrote:
> This patch adds device tree binding documentation for
> the flash cell of the Maxim max77693 multifunctional device.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  Documentation/devicetree/bindings/mfd/max77693.txt |   63 ++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> - added range to maxim,boost-mvout and maxim,mvsys-min description
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Documentation/devicetree/bindings/mfd/max77693.txt
> index 38e6440..3d2103a 100644
> --- a/Documentation/devicetree/bindings/mfd/max77693.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77693.txt
> @@ -76,7 +76,55 @@ Optional properties:
>      Valid values: 4300000, 4700000, 4800000, 4900000
>      Default: 4300000
>  
> +- led : the LED submodule device node
> +
> +There are two LED outputs available - FLED1 and FLED2. Each of them can
> +control a separate LED or they can be connected together to double
> +the maximum current for a single connected LED. One LED is represented
> +by one child node.
> +
> +Required properties:
> +- compatible : Must be "maxim,max77693-led".
> +
> +Optional properties:
> +- maxim,trigger-type : Flash trigger type.
> +	Possible trigger types:
> +		LEDS_TRIG_TYPE_EDGE (0) - Rising edge of the signal triggers
> +			the flash,
> +		LEDS_TRIG_TYPE_LEVEL (1) - Strobe pulse length controls duration
> +			of the flash.

Surely this is required? What should be assumed if this property isn't
present?

Otherwise this looks OK, but I'm not that familiar with LED/flash
bindings.

Mark.

> +- maxim,boost-mode :
> +	In boost mode the device can produce up to 1.2A of total current
> +	on both outputs. The maximum current on each output is reduced
> +	to 625mA then. If not enabled explicitly, boost setting defaults to
> +	LEDS_BOOST_FIXED in case both current sources are used.
> +	Possible values:
> +		LEDS_BOOST_OFF (0) - no boost,
> +		LEDS_BOOST_ADAPTIVE (1) - adaptive mode,
> +		LEDS_BOOST_FIXED (2) - fixed mode.
> +- maxim,boost-mvout : Output voltage of the boost module in millivolts.
> +		Range: 3300 - 5500
> +- maxim,mvsys-min : Low input voltage level in millivolts. Flash is not fired
> +	if chip estimates that system voltage could drop below this level due
> +	to flash power consumption.
> +		Range: 2400 - 3400
> +
> +Required properties of the LED child node:
> +- led-sources : see Documentation/devicetree/bindings/leds/common.txt;
> +		device current output identifiers: 0 - FLED1, 1 - FLED2
> +
> +Optional properties of the LED child node:
> +- label : see Documentation/devicetree/bindings/leds/common.txt
> +- max-microamp : see Documentation/devicetree/bindings/leds/common.txt
> +		Range: 15625 - 250000
> +- flash-max-microamp : see Documentation/devicetree/bindings/leds/common.txt
> +		Range: 15625 - 1000000
> +- flash-timeout-us : see Documentation/devicetree/bindings/leds/common.txt
> +		Range: 62500 - 1000000
> +
>  Example:
> +#include <dt-bindings/leds/common.h>
> +
>  	max77693@66 {
>  		compatible = "maxim,max77693";
>  		reg = <0x66>;
> @@ -117,5 +165,20 @@ Example:
>  			maxim,thermal-regulation-celsius = <75>;
>  			maxim,battery-overcurrent-microamp = <3000000>;
>  			maxim,charge-input-threshold-microvolt = <4300000>;
> +
> +		led {
> +			compatible = "maxim,max77693-led";
> +			maxim,trigger-type = <LEDS_TRIG_TYPE_LEVEL>;
> +			maxim,boost-mode = <LEDS_BOOST_FIXED>;
> +			maxim,boost-mvout = <5000>;
> +			maxim,mvsys-min = <2400>;
> +
> +			camera_flash: flash-led {
> +				label = "max77693-flash";
> +				led-sources = <0>, <1>;
> +				max-microamp = <500000>;
> +				flash-max-microamp = <1250000>;
> +				flash-timeout-us = <1000000>;
> +			};
>  		};
>  	};
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
