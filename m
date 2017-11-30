From: Doug Anderson <dianders@google.com>
Subject: Re: [RFC v2 2/2] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Wed, 29 Nov 2017 16:44:34 -0800
Message-ID: <CAD=FV=WY-2MmjRxGGaJrQjyeWt+k4_k7j12M4LxAnnZxJF7sXw@mail.gmail.com>
References: <20171116141151.21171-1-enric.balletbo@collabora.com> <20171116141151.21171-3-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171116141151.21171-3-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi,

On Thu, Nov 16, 2017 at 6:11 AM, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
> When you want to change the brightness using a PWM signal, one thing you
> need to consider is how human perceive the brightness. Human perceive the
> brightness change non-linearly, we have better sensitivity at low
> luminance than high luminance, so to achieve perceived linear dimming, th=
e
> brightness must be matches to the way our eyes behave. The CIE 1931
> lightness formula is what actually describes how we perceive light.
>
> This patch adds support to compute the brightness levels based on a stati=
c
> table filled with the numbers provided by the CIE 1931 algorithm, for now
> it only supports PWM resolutions up to 65535 (16 bits) with 1024 steps.
> Lower PWM resolutions are implemented using the same curve but with less
> steps, e.g. For a PWM resolution of 256 (8 bits) we have 37 steps.

Your patch assumes that the input to your formula (luminance, I think)
scales linearly with PWM duty cycle.  I don't personally know this,
but has anyone confirmed it's common in reality, or at least is a
close enough approximation of reality?


> The calculation of the duty cycle using the CIE 1931 algorithm is enabled=
 by
> default when you do not define the 'brightness-levels' propriety in your
> device tree.

One note is that you probably still want at least a "min" duty cycle.
I seem to remember some PWM backlights don't work well when the duty
cycle is too low and it would still be nice to be able to use your
table.


> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  drivers/video/backlight/pwm_bl.c | 160 +++++++++++++++++++++++++++++++++=
++----
>  include/linux/pwm_backlight.h    |   1 +
>  2 files changed, 147 insertions(+), 14 deletions(-)

Something I'd like to see in a patch somewhere in this series is a way
to expose the backlight "units" to userspace.  As far as I know right
now the backlight exposed to userspace is "unitless", but it would be
nice for userspace to query that the backlight is now linear to human
perception.  For old code, it could always expose the unit as
"unknown".


> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/p=
wm_bl.c
> index 59b1bfb..ea96358 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -26,6 +26,112 @@
>
>  #define NSTEPS 256
>
> +/*
> + * CIE lightness to PWM conversion table. The CIE 1931 lightness formula=
 is what
> + * actually describes how we perceive light:
> + *
> + *          Y =3D (L* / 902.3)           if L* =E2=89=A4 0.08856
> + *          Y =3D ((L* + 16) / 116)^3    if L* > 0.08856
> + *
> + * Where Y is the luminance (output) between 0.0 and 1.0, and L* is the
> + * lightness (input) between 0 and 100.

Just because I'm stupid and not 100% sure, I think:

luminance =3D the amount of light coming out of the screen
lightness =3D how bright a human perceives the screen to be

Is that right?  If so could you add it to the comments?  So "output"
here is the output to the PWM and "input" is the input from userspace
(and thus should be expressed in terms of human perception).


> +       0, 7, 14, 21, 28, 35, 43, 50, 57, 64, 71, 78, 85, 92, 99, 106, 11=
4, 121,

Seems like you could save space (and nicely use the previous patch) by
using the linear interpolation code from the previous patch, since

0 + 7 =3D 7
+ 7 =3D 14
+ 7 =3D 21
+ 7 =3D 28
+ 7 =3D 35

...and it would likely be OK to keep going and be slight off, so:

+ 7 =3D 42
+ 7 =3D 49
+ 7 =3D 56
+ 7 =3D 63
+ 7 =3D 70
...
...

In other words it seems like you're just providing a default table...

-Doug
