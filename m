From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC v13 04/13] DT: Add documentation for the mfd Maxim
 max77693
Date: Mon, 23 Mar 2015 12:07:43 +0000
Message-ID: <20150323120743.GG24422@x1>
References: <1426175114-14876-1-git-send-email-j.anaszewski@samsung.com>
 <1426175114-14876-5-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426175114-14876-5-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch requires a DT Ack.

> This patch adds device tree binding documentation for
> the flash cell of the Maxim max77693 multifunctional device.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---
>  Documentation/devicetree/bindings/mfd/max77693.txt |   61 ++++++++++=
++++++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Doc=
umentation/devicetree/bindings/mfd/max77693.txt
> index 38e6440..15c546e 100644
> --- a/Documentation/devicetree/bindings/mfd/max77693.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77693.txt
> @@ -76,7 +76,53 @@ Optional properties:
>      Valid values: 4300000, 4700000, 4800000, 4900000
>      Default: 4300000
> =20
> +- led : the LED submodule device node
> +
> +There are two LED outputs available - FLED1 and FLED2. Each of them =
can
> +control a separate LED or they can be connected together to double
> +the maximum current for a single connected LED. One LED is represent=
ed
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
> +- maxim,boost-mode :
> +	In boost mode the device can produce up to 1.2A of total current
> +	on both outputs. The maximum current on each output is reduced
> +	to 625mA then. If not enabled explicitly, boost setting defaults to
> +	LEDS_BOOST_FIXED in case both current sources are used.
> +	Possible values:
> +		LEDS_BOOST_OFF (0) - no boost,
> +		LEDS_BOOST_ADAPTIVE (1) - adaptive mode,
> +		LEDS_BOOST_FIXED (2) - fixed mode.
> +- maxim,boost-mvout : Output voltage of the boost module in millivol=
ts.
> +- maxim,mvsys-min : Low input voltage level in millivolts. Flash is =
not fired
> +	if chip estimates that system voltage could drop below this level d=
ue
> +	to flash power consumption.
> +
> +Required properties of the LED child node:
> +- led-sources : see Documentation/devicetree/bindings/leds/common.tx=
t;
> +		device current output identifiers: 0 - FLED1, 1 - FLED2
> +
> +Optional properties of the LED child node:
> +- label : see Documentation/devicetree/bindings/leds/common.txt
> +- max-microamp : see Documentation/devicetree/bindings/leds/common.t=
xt
> +		Range: 15625 - 250000
> +- flash-max-microamp : see Documentation/devicetree/bindings/leds/co=
mmon.txt
> +		Range: 15625 - 1000000
> +- flash-timeout-us : see Documentation/devicetree/bindings/leds/comm=
on.txt
> +		Range: 62500 - 1000000
> +
>  Example:
> +#include <dt-bindings/leds/common.h>
> +
>  	max77693@66 {
>  		compatible =3D "maxim,max77693";
>  		reg =3D <0x66>;
> @@ -117,5 +163,20 @@ Example:
>  			maxim,thermal-regulation-celsius =3D <75>;
>  			maxim,battery-overcurrent-microamp =3D <3000000>;
>  			maxim,charge-input-threshold-microvolt =3D <4300000>;
> +
> +		led {
> +			compatible =3D "maxim,max77693-led";
> +			maxim,trigger-type =3D <LEDS_TRIG_TYPE_LEVEL>;
> +			maxim,boost-mode =3D <LEDS_BOOST_FIXED>;
> +			maxim,boost-mvout =3D <5000>;
> +			maxim,mvsys-min =3D <2400>;
> +
> +			camera_flash: flash-led {
> +				label =3D "max77693-flash";
> +				led-sources =3D <0>, <1>;
> +				max-microamp =3D <500000>;
> +				flash-max-microamp =3D <1250000>;
> +				flash-timeout-us =3D <1000000>;
> +			};
>  		};
>  	};


--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
