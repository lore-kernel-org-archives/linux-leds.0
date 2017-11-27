From: Doug Anderson <dianders@google.com>
Subject: Re: [RFC v2 1/2] backlight: pwm_bl: linear interpolation between
 values of brightness-levels
Date: Mon, 27 Nov 2017 15:52:37 -0800
Message-ID: <CAD=FV=XfXk3xSAf3p64z2cJJGRG+7Fvq=ez=f1opD+KH_b7kHA@mail.gmail.com>
References: <20171116141151.21171-1-enric.balletbo@collabora.com> <20171116141151.21171-2-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:35424 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753237AbdK0Xwj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Nov 2017 18:52:39 -0500
Received: by mail-vk0-f67.google.com with SMTP id n63so18614470vkf.2
        for <linux-leds@vger.kernel.org>; Mon, 27 Nov 2017 15:52:39 -0800 (PST)
In-Reply-To: <20171116141151.21171-2-enric.balletbo@collabora.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi,

On Thu, Nov 16, 2017 at 6:11 AM, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
> Setting use-linear-interpolation in the dts will allow you to have linear
> interpolation between values of brightness-levels.
>
> There are now 256 between each of the values of brightness-levels. If
> something is requested halfway between 2 values, we'll use linear
> interpolation.
>
> This way a high resolution pwm duty cycle can be used without having to
> list out every possible value in the dts. This system also allows for
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
>
>  [0]: Documentation/devicetree/bindings/pwm/pwm.txt
>  [1]: Documentation/devicetree/bindings/gpio/gpio.txt
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index 9bd1768..59b1bfb 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -24,6 +24,8 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>
> +#define NSTEPS 256

I'm not sure this is quite the ideal way to specify it.  I could sorta
imagine wanting to specify just:

  brightness-levels = <0 65535>

...and in such a case you'll only give 256 steps in between.  256
isn't quite granular enough and the human eye can notice each step.  I
could fake it by putting this in the device tree:

  brightness-levels = <0 4095 8191 ... ... 61439 65535>

...but that's kinda silly.  I'd rather just say that when we're using
interpolation we just say that there will be a certain number of steps
(like 32768).  Is there really a huge advantage of picking 256 steps
between each specified value instead of just picking a fixed number of
brightness levels?
