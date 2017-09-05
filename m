From: Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 1/2] dt-bindings: pwm-backlight: add brightness-levels-scale property
Date: Tue, 5 Sep 2017 06:45:23 -0700
Message-ID: <CABXOdTcjOfk0+FSkOTDU=vARVht9Q3d7nQOeUe75bfb7s-SvQw@mail.gmail.com>
References: <20170904153504.27963-1-enric.balletbo@collabora.com> <20170904153504.27963-2-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170904153504.27963-2-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Sep 4, 2017 at 8:35 AM, Enric Balletbo i Serra
<enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
> Brightness is not perceived linearly; rather, it typically follows some
> kind of parabolic curve. We can support this by skipping values in the
> brightness-levels array in a pseudo-quadratic curve. Typically we used
> less than 256 levels, which yields no more than 1KiB of memory in our
> device tree. But, we've noticed that on some devices the backlight
> performs much smoother at lower ranges if we have more than 256-levels of
> granularity. On kevin device, for example, if we support all 64K, that
> will waste us at least 256KiB in our device tree.
>
> Let's avoid to waste memory and have a huge table of numbers in our device
> tree of numbers by adding a brightness-levels-scale property to let the
> driver compute the brightness levels based on one algorithm and their
> property parameters.
>

Given Daniel's comments, would it possibly make sense to provide
something like "brightness-level-range = <0, 65536>" instead and let
the driver handle details ?

Thanks,
Guenter

> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  .../bindings/leds/backlight/pwm-backlight.txt       | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> index 764db86..11c5583 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> @@ -17,6 +17,16 @@ Optional properties:
>                 "pwms" property (see PWM binding[0])
>    - enable-gpios: contains a single GPIO specifier for the GPIO which enables
>                    and disables the backlight (see GPIO binding[1])
> +  - brightness-levels-scale: this can be used instead of 'brightness-levels',
> +                             to represent the perceived luminance. So rather
> +                             than specifying 'brightness-levels = <0
> +                             1 2 ... 65535>', one can simply say
> +                             'brightness-levels-scale = <255 65535>', where the
> +                             first number is the max number of levels and the
> +                             second number is the max PWM value that represent a
> +                             100% duty cycle (brightest). The result is a
> +                             correction table for PWM values to create linear
> +                             brightness based on the CIE1931 algorithm.
>
>  [0]: Documentation/devicetree/bindings/pwm/pwm.txt
>  [1]: Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -33,3 +43,14 @@ Example:
>                 power-supply = <&vdd_bl_reg>;
>                 enable-gpios = <&gpio 58 0>;
>         };
> +
> +       backlight {
> +               compatible = "pwm-backlight";
> +               pwms = <&pwm 0 5000000>;
> +
> +               brightness-levels-scale = <255 65535>;
> +               default-brightness-level = <128>;
> +
> +               power-supply = <&vdd_bl_reg>;
> +               enable-gpios = <&gpio 58 0>;
> +       };
> --
> 2.9.3
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
