From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [RFC v2 0/2] backlight: pwm_bl: support linear brightness to human eye
Date: Thu, 16 Nov 2017 15:11:49 +0100
Message-ID: <20171116141151.21171-1-enric.balletbo@collabora.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56846 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932257AbdKPOMF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Nov 2017 09:12:05 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Doug Anderson <dianders@google.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Dear all,

This patch series is a second RFC to know your opinion about the way to
solve the problems exposed in the first RFC [1]

The first patch what tries to solve is the problem of granularity for high
resolution PWMs. The idea is simple interpolate between 2 brightness values
so we can have a high PWM duty cycle (a 16 bits PWM is up to 65535 possible
steps) without having to list out every possible value in the dts. I think
that this patch is required to not break backward compability, to be more
flexible and also extend the functionality to be able to use high resolution
PWM with enough steps to have a good UI experience in userspace.

The second patch is a bit more ambicious, the idea is let decide the driver
the brightness-levels required in function of the PWM resolution. To do this
we use a static table filled with the CIE 1931 algorithm values to convert
brightness to PWM duty cycle.

More detailed info is available in the commit message of every patch.

A couple of questions come to my mind:

- What's the amoung of steps we really need? Currently there is 1024 steps
  for a resolution of 16 bits, and 37 steps for a PWM with 8 bits of
  resolution. That seems to work well with both 16 bits and 8 bits. Tested
  on a Samsung Chromebook Plus (16 bits) and a SL50 device (8 bits)

- What about 32 bits or greather resolutions? We need to support it?
  I did a quick look and seems nobody requires it, but I don't really know.
  For now if we set more than 16 bits of resolution the driver triggers
  an error.

Waiting for your feedback.

Chances since v1:
- Add linear interpolation for high resolution PWM.
- Get rid of fixed point calculations and use a table instead.

[1] http://www.spinics.net/lists/devicetree/msg193262.html

Best regards,

Enric Balletbo i Serra (2):
  backlight: pwm_bl: linear interpolation between values of
    brightness-levels
  backlight: pwm_bl: compute brightness of LED linearly to human eye.

 .../bindings/leds/backlight/pwm-backlight.txt      |   2 +
 drivers/video/backlight/pwm_bl.c                   | 209 ++++++++++++++++++---
 include/linux/pwm_backlight.h                      |   3 +
 3 files changed, 191 insertions(+), 23 deletions(-)

-- 
2.9.3
