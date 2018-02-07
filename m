From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: pwm-backlight: move
 brightness-levels to optional.
Date: Wed, 7 Feb 2018 16:10:57 +0000
Message-ID: <20180207161057.fkgrspfkdtnp5ymk@oak.lan>
References: <20180207141337.22247-1-enric.balletbo@collabora.com>
 <20180207141337.22247-5-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:35854 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754231AbeBGQLB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Feb 2018 11:11:01 -0500
Received: by mail-wr0-f194.google.com with SMTP id y3so1637106wrh.3
        for <linux-leds@vger.kernel.org>; Wed, 07 Feb 2018 08:11:01 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180207141337.22247-5-enric.balletbo@collabora.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Doug Anderson <dianders@google.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 07, 2018 at 03:13:37PM +0100, Enric Balletbo i Serra wrote:
> The patch 'backlight: pwm_bl: compute brightness of LED linearly to
> human eye' introduced a default brightness-levels table that is used
> when brightness-levels is not available in the dts. So move
> brightness-levels and default-brightness-level to be optional.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
> Changes since v1:
> - Fix a couple of typos as requested by Rob.
>   - s/availablel/available/
>   - s/move move/move/
>   - "so move..." should be a new sentence.
> - Add Reviewed-by: Rob Herring <robh@kernel.org>
>  
>  .../devicetree/bindings/leds/backlight/pwm-backlight.txt  | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> index ce9b5746b774..64fa2fbd98c9 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> @@ -3,13 +3,6 @@ pwm-backlight bindings
>  Required properties:
>    - compatible: "pwm-backlight"
>    - pwms: OF device-tree PWM specification (see PWM binding[0])
> -  - brightness-levels: Array of distinct brightness levels. Typically these
> -      are in the range from 0 to 255, but any range starting at 0 will do.
> -      The actual brightness level (PWM duty cycle) will be interpolated
> -      from these values. 0 means a 0% duty cycle (darkest/off), while the
> -      last value in the array represents a 100% duty cycle (brightest).
> -  - default-brightness-level: the default brightness level (index into the
> -      array defined by the "brightness-levels" property)
>    - power-supply: regulator for supply voltage
>  
>  Optional properties:
> @@ -21,6 +14,14 @@ Optional properties:
>                            and enabling the backlight using GPIO.
>    - pwm-off-delay-ms: Delay in ms between disabling the backlight using GPIO
>                        and setting PWM value to 0.
> +  - brightness-levels: Array of distinct brightness levels. Typically these
> +                       are in the range from 0 to 255, but any range starting at
> +                       0 will do. The actual brightness level (PWM duty cycle)
> +                       will be interpolated from these values. 0 means a 0% duty
> +                       cycle (darkest/off), while the last value in the array
> +                       represents a 100% duty cycle (brightest).
> +  - default-brightness-level: The default brightness level (index into the
> +                              array defined by the "brightness-levels" property).
>    - num-interpolated-steps: Number of interpolated steps between each value
>                              of brightness-levels table. This way a high
>                              resolution pwm duty cycle can be used without
> -- 
> 2.15.1
> 
