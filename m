From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/9] Documentation: dt-bindings: leds: backlight: add
 TI LMU backlight binding information
Date: Mon, 11 Jan 2016 09:53:47 +0000
Message-ID: <20160111095347.GR14104@x1>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-3-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448521025-2796-3-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: robh+dt@kernel.org, j.anaszewski@samsung.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, 26 Nov 2015, Milo Kim wrote:

> LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697 use common dt-bindi=
ngs
> for describing backlight device.
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
>  .../bindings/leds/backlight/ti-lmu-backlight.txt   | 65 ++++++++++++=
++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/=
ti-lmu-backlight.txt

Any reason that Jingoo wasn't Cc'ed here?

> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti-lmu-=
backlight.txt b/Documentation/devicetree/bindings/leds/backlight/ti-lmu=
-backlight.txt
> new file mode 100644
> index 0000000..c2c35b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti-lmu-backlig=
ht.txt
> @@ -0,0 +1,65 @@
> +TI LMU backlight device tree bindings
> +
> +Required property:
> +  - compatible: Should be one of:
> +                "ti,lm3532-backlight"
> +                "ti,lm3631-backlight"
> +                "ti,lm3632-backlight"
> +                "ti,lm3633-backlight"
> +                "ti,lm3695-backlight"
> +                "ti,lm3697-backlight"
> +
> +Optional properties:
> +  There are two backlight control mode. One is I2C, the other is PWM=
 mode.
> +  Following properties are only specified in PWM mode.
> +  Please note that LMU backlight device can have only one PWM channe=
l.
> +
> +  - pwms: OF device-tree PWM specification.
> +  - pwm-names: a list of names for the PWM devices specified in the =
"pwms"
> +               property.
> +
> +  For the PWM user nodes, please refer to [1].
> +
> +Child nodes:
> +  LMU backlight is represented as sub-nodes of the TI LMU device [2]=
=2E
> +  So, LMU backlight should have more than one backlight child node.
> +  Each node exactly matches with backlight control bank configuratio=
n.
> +  Maximum numbers of child nodes depend on the device.
> +  1 =3D LM3631, LM3632, LM3695
> +  2 =3D LM3633, LM3697
> +  3 =3D LM3532
> +
> +  Required property of a child node:
> +  - led-sources: List of enabled channels from 0 to 2.
> +                 Please refer to LED binding [3].
> +                 For output channels, please refer to the datasheets=
 [4].
> +
> +  Optional properties of a child node:
> +  - label: Backlight channel identification.
> +           Please refer to LED binding [3].
> +  - default-brightness-level: Backlight initial brightness value.
> +                              Type is <u32>. It is set as soon as ba=
cklight
> +                              device is created.
> +                              0 ~ 2047 =3D LM3631, LM3632, LM3633, L=
M3695 and
> +                                         LM3697
> +                              0 ~ 255  =3D LM3532
> +  - ramp-up-msec, ramp-down-msec: Light dimming effect properties.
> +                                  Type is <u32>. Unit is millisecond=
=2E
> +                                  0 ~ 65 msec    =3D LM3532
> +                                  0 ~ 4000 msec  =3D LM3631
> +                                  0 ~ 16000 msec =3D LM3633 and LM36=
97
> +  - pwm-period: PWM period. Only valid in PWM brightness mode.
> +                Type is <u32>. If this property is missing, then con=
trol
> +                mode is set to I2C by default.
> +
> +Examples: Please refer to ti-lmu dt-bindings. [2].
> +
> +[1] ../pwm/pwm.txt
> +[2] ../mfd/ti-lmu.txt
> +[3] ../leds/common.txt
> +[4] LM3532: http://www.ti.com/product/LM3532/datasheet
> +    LM3631: http://www.ti.com/product/LM3631/datasheet
> +    LM3632: http://www.ti.com/product/LM3632A/datasheet
> +    LM3633: http://www.ti.com/product/LM3633/datasheet
> +    LM3695: Datasheet is not opened yet, but only two strings are us=
ed.
> +    LM3697: http://www.ti.com/product/LM3697/datasheet

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
