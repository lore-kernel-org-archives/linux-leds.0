From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 0/4] backlight: pwm_bl: support linear interpolation and brightness to human eye
Date: Thu,  8 Feb 2018 12:30:28 +0100
Message-ID: <20180208113032.27810-1-enric.balletbo@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandru Stan <amstan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Dear all,

This series is a third patchset integrating the requested changes.

The first and second patch what tries to solve is the problem of
granularity for high resolution PWMs. The idea is simple interpolate
between 2 brightness values so we can have a high PWM duty cycle (a
16 bits PWM is up to 65535 possible steps) without having to list
out every possible value in the dts. I think that this patch is
required to not break backward compability, to be more flexible and
also extend the functionality to be able to use high resolution PWM
with enough steps to have a good UI experience in userspace.

The thirth and fourth patch is a bit more ambicious, the idea is let
decide the driver the brightness-levels required in function of the PWM
resolution. To do this create a brightness-levels table filled with the
CIE 1931 algorithm values to convert brightness to PWM duty cycle.

More detailed info is available in the commit message of every patch.

Both functionalities were tested on a Samsung Chromebook Plus (that has
a 16 bits PWM) and a SL50 device (with a 8 bits PWM)

Waiting for your feedback.

Best regards,

Enric Balletbo i Serra (4):
  backlight: pwm_bl: linear interpolation between brightness-levels
  dt-bindings: pwm-backlight: add a num-interpolation-steps property.
  backlight: pwm_bl: compute brightness of LED linearly to human eye.
  dt-bindings: pwm-backlight: move brightness-levels to optional.

 .../bindings/leds/backlight/pwm-backlight.txt      |  34 ++-
 drivers/video/backlight/pwm_bl.c                   | 232 +++++++++++++++++++--
 2 files changed, 246 insertions(+), 20 deletions(-)

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
