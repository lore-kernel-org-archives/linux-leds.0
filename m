From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [RFC 1/2] dt-bindings: pwm-backlight: add brightness-levels-scale
 property
Date: Tue, 5 Sep 2017 12:07:55 +0100
Message-ID: <b1f8c674-fa71-b4a4-9fbf-5c590144c0c5@linaro.org>
References: <20170904153504.27963-1-enric.balletbo@collabora.com>
 <20170904153504.27963-2-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:37929 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750944AbdIELH7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Sep 2017 07:07:59 -0400
Received: by mail-wm0-f48.google.com with SMTP id 187so17375849wmn.1
        for <linux-leds@vger.kernel.org>; Tue, 05 Sep 2017 04:07:58 -0700 (PDT)
In-Reply-To: <20170904153504.27963-2-enric.balletbo@collabora.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Doug Anderson <dianders@google.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/09/17 16:35, Enric Balletbo i Serra wrote:
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
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>   .../bindings/leds/backlight/pwm-backlight.txt       | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> index 764db86..11c5583 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> @@ -17,6 +17,16 @@ Optional properties:
>                  "pwms" property (see PWM binding[0])
>     - enable-gpios: contains a single GPIO specifier for the GPIO which enables
>                     and disables the backlight (see GPIO binding[1])
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

Even if we do keep this property (see first e-mail) this second value 
seems pointless to me; can't the driver just use the actual PWM max 
counter value for this?


Daniel.


>   
>   [0]: Documentation/devicetree/bindings/pwm/pwm.txt
>   [1]: Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -33,3 +43,14 @@ Example:
>   		power-supply = <&vdd_bl_reg>;
>   		enable-gpios = <&gpio 58 0>;
>   	};
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 0 5000000>;
> +
> +		brightness-levels-scale = <255 65535>;
> +		default-brightness-level = <128>;
> +
> +		power-supply = <&vdd_bl_reg>;
> +		enable-gpios = <&gpio 58 0>;
> +	};
> 
