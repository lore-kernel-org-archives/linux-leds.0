From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH v3 0/4] backlight: pwm_bl: support linear
 interpolation and brightness to human eye
Date: Mon, 18 Jun 2018 07:20:05 +0100
Message-ID: <20180618062005.GE31141@dell>
References: <20180409083333.1249-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180409083333.1249-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Doug Anderson <dianders@google.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@collabora.com
List-Id: linux-leds@vger.kernel.org

On Mon, 09 Apr 2018, Enric Balletbo i Serra wrote:

> Dear all,
> 
> This series is a third patchset (resend )integrating the requested
> changes.
> 
> The first and second patch what tries to solve is the problem of
> granularity for high resolution PWMs. The idea is simple interpolate
> between 2 brightness values so we can have a high PWM duty cycle (a
> 16 bits PWM is up to 65535 possible steps) without having to list
> out every possible value in the dts. I think that this patch is
> required to not break backward compatibility, to be more flexible and
> also extend the functionality to be able to use high resolution PWM
> with enough steps to have a good UI experience in userspace.
> 
> The thirth and fourth patch is a bit more ambicious, the idea is let
> decide the driver the brightness-levels required in function of the PWM
> resolution. To do this create a brightness-levels table filled with the
> CIE 1931 algorithm values to convert brightness to PWM duty cycle.
> 
> More detailed info is available in the commit message of every patch.
> 
> Both functionalities were tested on a Samsung Chromebook Plus (that has
> a 16 bits PWM) and a SL50 device (with a 8 bits PWM)
> 
> Waiting for your feedback.
> 
> Best regards
> 
> Enric Balletbo i Serra (4):
>   backlight: pwm_bl: linear interpolation between brightness-levels
>   dt-bindings: pwm-backlight: add a num-interpolation-steps property.
>   backlight: pwm_bl: compute brightness of LED linearly to human eye.
>   dt-bindings: pwm-backlight: move brightness-levels to optional.
> 
>  .../bindings/leds/backlight/pwm-backlight.txt      |  34 ++-
>  drivers/video/backlight/pwm_bl.c                   | 232 +++++++++++++++++++--
>  2 files changed, 246 insertions(+), 20 deletions(-)

All applied for v4.18, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
