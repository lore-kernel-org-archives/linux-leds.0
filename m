From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC v2 1/2] backlight: pwm_bl: linear interpolation between
 values of brightness-levels
Date: Mon, 20 Nov 2017 12:58:35 -0600
Message-ID: <20171120185835.r4ded43i62wnu3jo@rob-hp-laptop>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-2-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:42739 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752459AbdKTS6h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Nov 2017 13:58:37 -0500
Content-Disposition: inline
In-Reply-To: <20171116141151.21171-2-enric.balletbo@collabora.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Doug Anderson <dianders@google.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 16, 2017 at 03:11:50PM +0100, Enric Balletbo i Serra wrote:
> Setting use-linear-interpolation in the dts will allow you to have linear
> interpolation between values of brightness-levels.
> 
> There are now 256 between each of the values of brightness-levels. If
> something is requested halfway between 2 values, we'll use linear
> interpolation.
> 
> This way a high resolution pwm duty cycle can be used without having to
> list out every possible value in the dts. 

I thought we already had a way to do that.

> This system also allows for
> gamma corrected values (eg: "brightness-levels = <0 2 4 8 16 32>;").
> 
> Patch based on the Alexandru M Stan work done for ChromeOS kernels.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  .../bindings/leds/backlight/pwm-backlight.txt      |  2 +
>  drivers/video/backlight/pwm_bl.c                   | 55 +++++++++++++++++-----
>  include/linux/pwm_backlight.h                      |  2 +
>  3 files changed, 47 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> index 764db86..7c48f20 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> @@ -17,6 +17,8 @@ Optional properties:
>                 "pwms" property (see PWM binding[0])
>    - enable-gpios: contains a single GPIO specifier for the GPIO which enables
>                    and disables the backlight (see GPIO binding[1])
> +  - use-linear-interpolation: set this propriety to enable linear interpolation
> +                              between each of the values of brightness-levels.

Isn't this really just whether you allow values not listed because what 
other kind of interpolation would you do? Seems like you should just be 
able to query the resolution of the PWM and decide if it can take more 
values than listed.

Rob
