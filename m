From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 02/10] DT: Add documentation for the mfd Maxim max77693
Date: Wed, 29 Apr 2015 13:34:12 +0100
Message-ID: <20150429123412.GL9169@x1>
References: <1429080520-10687-1-git-send-email-j.anaszewski@samsung.com>
 <1429080520-10687-3-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429080520-10687-3-git-send-email-j.anaszewski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

LED Ack please Bryan.

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
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/mfd/max77693.txt |   67 ++++++++++=
++++++++++
>  1 file changed, 67 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Doc=
umentation/devicetree/bindings/mfd/max77693.txt
> index 38e6440..d342584 100644
> --- a/Documentation/devicetree/bindings/mfd/max77693.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77693.txt
> @@ -76,7 +76,60 @@ Optional properties:
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
> +	Valid values: 3300 - 5500, step by 25 (rounded down)
> +	Default: 3300
> +- maxim,mvsys-min : Low input voltage level in millivolts. Flash is =
not fired
> +	if chip estimates that system voltage could drop below this level d=
ue
> +	to flash power consumption.
> +	Valid values: 2400 - 3400, step by 33 (rounded down)
> +	Default: 2400
> +
> +Required properties for the LED child node:
> +- led-sources : see Documentation/devicetree/bindings/leds/common.tx=
t;
> +		device current output identifiers: 0 - FLED1, 1 - FLED2
> +- led-max-microamp : see Documentation/devicetree/bindings/leds/comm=
on.txt
> +	Valid values for a LED connected to one FLED output:
> +		15625 - 250000, step by 15625 (rounded down)
> +	Valid values for a LED connected to both FLED outputs:
> +		15625 - 500000, step by 15625 (rounded down)
> +- flash-max-microamp : see Documentation/devicetree/bindings/leds/co=
mmon.txt
> +	Valid values for a single LED connected to one FLED output:
> +	(boost mode must be turned off):
> +		15625 - 1000000, step by 15625 (rounded down)
> +	Valid values for a single LED connected to both FLED outputs:
> +		15625 - 1250000, step by 15625 (rounded down)
> +	Valid values for two LEDs case:
> +		15625 - 625000, step by 15625 (rounded down)
> +- flash-max-timeout-us : see Documentation/devicetree/bindings/leds/=
common.txt
> +	Valid values: 62500 - 1000000, step by 62500 (rounded down)
> +
> +Optional properties for the LED child node:
> +- label : see Documentation/devicetree/bindings/leds/common.txt
> +
>  Example:
> +#include <dt-bindings/leds/common.h>
> +
>  	max77693@66 {
>  		compatible =3D "maxim,max77693";
>  		reg =3D <0x66>;
> @@ -117,5 +170,19 @@ Example:
>  			maxim,thermal-regulation-celsius =3D <75>;
>  			maxim,battery-overcurrent-microamp =3D <3000000>;
>  			maxim,charge-input-threshold-microvolt =3D <4300000>;
> +
> +		led {
> +			compatible =3D "maxim,max77693-led";
> +			maxim,boost-mode =3D <LEDS_BOOST_FIXED>;
> +			maxim,boost-mvout =3D <5000>;
> +			maxim,mvsys-min =3D <2400>;
> +
> +			camera_flash: flash-led {
> +				label =3D "max77693-flash";
> +				led-sources =3D <0>, <1>;
> +				led-max-microamp =3D <500000>;
> +				flash-max-microamp =3D <1250000>;
> +				flash-max-timeout-us =3D <1000000>;
> +			};
>  		};
>  	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
