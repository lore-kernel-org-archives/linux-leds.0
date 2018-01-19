From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: pwm-backlight: add a
 num-interpolation-steps property.
Date: Fri, 19 Jan 2018 14:52:49 -0600
Message-ID: <20180119205249.fcbdyu6652ffsdmg@rob-hp-laptop>
References: <20180110223046.17696-1-enric.balletbo@collabora.com>
 <20180110223046.17696-3-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:34564 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752220AbeASUwv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Jan 2018 15:52:51 -0500
Content-Disposition: inline
In-Reply-To: <20180110223046.17696-3-enric.balletbo@collabora.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Doug Anderson <dianders@google.com>, Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 10, 2018 at 11:30:44PM +0100, Enric Balletbo i Serra wrote:
> The num-interpolated-steps property specifies the number of
> interpolated steps between each value of brightness-level table. This is
> useful for high resolution PWMs to not have to list out every possible
> value in the brightness-level array.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  .../bindings/leds/backlight/pwm-backlight.txt       | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> index 310810906613..605432c910c5 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> @@ -21,6 +21,11 @@ Optional properties:
>                            and enabling the backlight using GPIO.
>    - pwm-off-delay-ms: Delay in ms between disabling the backlight using GPIO
>                        and setting PWM value to 0.
> +  - num-interpolated-steps: Number of interpolated steps between each value
> +                            of brightness-levels table. This way a high
> +                            resolution pwm duty cycle can be used without
> +                            having to list out every possible value in the
> +                            brightness-level array.
>  
>  [0]: Documentation/devicetree/bindings/pwm/pwm.txt
>  [1]: Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -39,3 +44,19 @@ Example:
>  		post-pwm-on-delay-ms = <10>;
>  		pwm-off-delay-ms = <10>;
>  	};
> +
> +Example using num-interpolation-steps:
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 0 5000000>;
> +
> +		brightness-levels = <0 65535>;
> +		num-interpolated-steps = <4096>;

How does this make sense with only 2 defined levels other than having 
fewer steps? I thought the purpose of this was to have a piecewise 
linear curve. 

> +		default-brightness-level = <6>;

Aren't valid values 0, 16, 32, 48, etc.?

Rob
