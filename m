From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/9] Documentation: dt-bindings: mfd: add TI LMU
 device binding information
Date: Mon, 11 Jan 2016 09:46:07 +0000
Message-ID: <20160111094607.GQ14104@x1>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-2-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:37720 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758221AbcAKJqM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 11 Jan 2016 04:46:12 -0500
Received: by mail-wm0-f43.google.com with SMTP id f206so258778935wmf.0
        for <linux-leds@vger.kernel.org>; Mon, 11 Jan 2016 01:46:11 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1448521025-2796-2-git-send-email-milo.kim@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: robh+dt@kernel.org, j.anaszewski@samsung.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 26 Nov 2015, Milo Kim wrote:

> This patch describes overall binding for TI LMU MFD devices.
>=20
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Lee Jones <lee.jones@linaro.org>=20
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-leds@vger.kernel.org=20
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Milo Kim <milo.kim@ti.com>
> ---
>  Documentation/devicetree/bindings/mfd/ti-lmu.txt | 243 +++++++++++++=
++++++++++
>  1 file changed, 243 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti-lmu.txt

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Docum=
entation/devicetree/bindings/mfd/ti-lmu.txt
> new file mode 100644
> index 0000000..c885cf8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> @@ -0,0 +1,243 @@
> +TI LMU (Lighting Management Unit) device tree bindings
> +
> +TI LMU driver supports lighting devices below.
> +
> +   Name                  Child nodes
> +  ------      ---------------------------------
> +  LM3532       Backlight
> +  LM3631       Backlight and regulator
> +  LM3632       Backlight and regulator
> +  LM3633       Backlight, LED and fault monitor
> +  LM3695       Backlight
> +  LM3697       Backlight and fault monitor
> +
> +Required properties:
> +  - compatible: Should be one of:
> +                "ti,lm3532"
> +                "ti,lm3631"
> +                "ti,lm3632"
> +                "ti,lm3633"
> +                "ti,lm3695"
> +                "ti,lm3697"
> +  - reg: I2C slave address.
> +         0x11 for LM3632
> +         0x29 for LM3631
> +         0x36 for LM3633, LM3697
> +         0x38 for LM3532
> +         0x63 for LM3695
> +
> +Optional property:
> +  - enable-gpios: A GPIO specifier for hardware enable pin.
> +
> +Required node:
> +  - backlight: All LMU devices have backlight child nodes.
> +               For the properties, please refer to [1].
> +
> +Optional nodes:
> +  - fault-monitor: Hardware fault monitoring driver for LM3633 and L=
M3697.
> +    Required properties:
> +      - compatible: Should be one of:
> +                    "ti,lm3633-fault-monitor"
> +                    "ti,lm3697-fault-monitor"
> +  - leds: LED properties for LM3633. Please refer to [2].
> +  - regulators: Regulator properties for LM3631 and LM3632.
> +                Please refer to [3].
> +
> +[1] ../leds/backlight/ti-lmu-backlight.txt
> +[2] ../leds/leds-lm3633.txt
> +[3] ../regulator/lm363x-regulator.txt
> +
> +lm3532@38 {
> +	compatible =3D "ti,lm3532";
> +	reg =3D <0x38>;
> +
> +	enable-gpios =3D <&pioC 2 GPIO_ACTIVE_HIGH>;
> +
> +	backlight {
> +		compatible =3D "ti,lm3532-backlight";
> +
> +		lcd {
> +			led-sources =3D <0 1 2>;
> +			ramp-up-msec =3D <30>;
> +			ramp-down-msec =3D <0>;
> +		};
> +	};
> +};
> +
> +lm3631@29 {
> +	compatible =3D "ti,lm3631";
> +	reg =3D <0x29>;
> +
> +	regulators {
> +		compatible =3D "ti,lm363x-regulator";
> +
> +		vboost {
> +			regulator-name =3D "lcd_boost";
> +			regulator-min-microvolt =3D <4500000>;
> +			regulator-max-microvolt =3D <6350000>;
> +			regulator-always-on;
> +		};
> +
> +		vcont {
> +			regulator-name =3D "lcd_vcont";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <3300000>;
> +		};
> +
> +		voref {
> +			regulator-name =3D "lcd_voref";
> +			regulator-min-microvolt =3D <4000000>;
> +			regulator-max-microvolt =3D <6000000>;
> +		};
> +
> +		vpos {
> +			regulator-name =3D "lcd_vpos";
> +			regulator-min-microvolt =3D <4000000>;
> +			regulator-max-microvolt =3D <6000000>;
> +			regulator-boot-on;
> +		};
> +
> +		vneg {
> +			regulator-name =3D "lcd_vneg";
> +			regulator-min-microvolt =3D <4000000>;
> +			regulator-max-microvolt =3D <6000000>;
> +			regulator-boot-on;
> +		};
> +	};
> +
> +	backlight {
> +		compatible =3D "ti,lm3631-backlight";
> +
> +		lcd_bl {
> +			led-sources =3D <0 1>;
> +			ramp-up-msec =3D <300>;
> +		};
> +	};
> +};
> +
> +lm3632@11 {
> +	compatible =3D "ti,lm3632";
> +	reg =3D <0x11>;
> +
> +	enable-gpios =3D <&pioC 2 GPIO_ACTIVE_HIGH>; /* PC2 */
> +
> +	regulators {
> +		compatible =3D "ti,lm363x-regulator";
> +
> +		ti,lcm-en1-gpio =3D <&pioC 0 GPIO_ACTIVE_HIGH>; /* PC0 */
> +		ti,lcm-en2-gpio =3D <&pioC 1 GPIO_ACTIVE_HIGH>; /* PC1 */
> +
> +		vboost {
> +			regulator-name =3D "lcd_boost";
> +			regulator-min-microvolt =3D <4500000>;
> +			regulator-max-microvolt =3D <6400000>;
> +			regulator-always-on;
> +		};
> +
> +		vpos {
> +			regulator-name =3D "lcd_vpos";
> +			regulator-min-microvolt =3D <4000000>;
> +			regulator-max-microvolt =3D <6000000>;
> +		};
> +
> +		vneg {
> +			regulator-name =3D "lcd_vneg";
> +			regulator-min-microvolt =3D <4000000>;
> +			regulator-max-microvolt =3D <6000000>;
> +		};
> +	};
> +
> +	backlight {
> +		compatible =3D "ti,lm3632-backlight";
> +
> +		pwms =3D <&pwm0 0 10000 0>; /* pwm number, period, polarity */
> +		pwm-names =3D "lmu-backlight";
> +
> +		lcd {
> +			led-sources =3D <0 1>;
> +			pwm-period =3D <10000>;
> +		};
> +	};
> +};
> +
> +lm3633@36 {
> +	compatible =3D "ti,lm3633";
> +	reg =3D <0x36>;
> +
> +	enable-gpios =3D <&pioC 2 GPIO_ACTIVE_HIGH>;
> +
> +	backlight {
> +		compatible =3D "ti,lm3633-backlight";
> +
> +		main {
> +			label =3D "main_lcd";
> +			led-sources =3D <1 2>;
> +			ramp-up-msec =3D <500>;
> +			ramp-down-msec =3D <500>;
> +		};
> +
> +		front {
> +			label =3D "front_lcd";
> +			led-sources =3D <0>;
> +			ramp-up-msec =3D <1000>;
> +			ramp-down-msec =3D <0>;
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "ti,lm3633-leds";
> +
> +		chan1 {
> +			label =3D "status";
> +			led-sources =3D <1>;
> +			led-max-microamp =3D <6000>;
> +		};
> +
> +		chan345 {
> +			label =3D "rgb";
> +			led-sources =3D <3 4 5>;
> +			led-max-microamp =3D <10000>;
> +		};
> +	};
> +
> +	fault-monitor {
> +		compatible =3D "ti,lm3633-fault-monitor";
> +	};
> +};
> +
> +lm3695@63 {
> +	compatible =3D "ti,lm3695";
> +	reg =3D <0x63>;
> +
> +	enable-gpios =3D <&pioC 2 GPIO_ACTIVE_HIGH>;
> +
> +	backlight {
> +		compatible =3D "ti,lm3695-backlight";
> +
> +		lcd {
> +			label =3D "bl";
> +			led-sources =3D <0 1>;
> +		};
> +	};
> +};
> +
> +lm3697@36 {
> +	compatible =3D "ti,lm3697";
> +	reg =3D <0x36>;
> +
> +	enable-gpios =3D <&pioC 2 GPIO_ACTIVE_HIGH>;
> +
> +	backlight {
> +		compatible =3D "ti,lm3697-backlight";
> +
> +		lcd {
> +			led-sources =3D <0 1 2>;
> +			ramp-up-msec =3D <200>;
> +			ramp-down-msec =3D <200>;
> +		};
> +	};
> +
> +	fault-monitor {
> +		compatible =3D "ti,lm3697-fault-monitor";
> +	};
> +};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
