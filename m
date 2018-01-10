From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 0/4] backlight: pwm_bl: support linear interpolation and brightness to human eye
Date: Wed, 10 Jan 2018 23:30:42 +0100
Message-ID: <20180110223046.17696-1-enric.balletbo@collabora.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36944 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751733AbeAJWaz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Jan 2018 17:30:55 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>, Doug Anderson <dianders@google.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Dear all,

This series is a first patchset based on the discussion of two previous RFCs
[1] and [2].

The first and second patch what tries to solve is the problem of granularity
for high resolution PWMs. The idea is simple interpolate between 2
brightness values so we can have a high PWM duty cycle (a 16 bits PWM is up
to 65535 possible steps) without having to list out every possible value in
the dts. I think that this patch is required to not break backward
compability, to be more flexible and also extend the functionality to be
able to use high resolution PWM with enough steps to have a good UI
experience in userspace.

The thirth and fourth patch is a bit more ambicious, the idea is let decide
the driver the brightness-levels required in function of the PWM resolution.
To do this create a brightness-levels table filled with the CIE 1931
algorithm values to convert brightness to PWM duty cycle.

More detailed info is available in the commit message of every patch.

Both functionalities were tested on a Samsung Chromebook Plus (that has a
16 bits PWM) and a SL50 device (with a 8 bits PWM)

Waiting for your feedback.

[1] http://www.spinics.net/lists/devicetree/msg193262.html
[2] https://lkml.org/lkml/2017/11/16/301

Best regards,

Enric Balletbo i Serra (4):
  backlight: pwm_bl: linear interpolation between brightness-levels
  dt-bindings: pwm-backlight: add a num-interpolation-steps property.
  backlight: pwm_bl: compute brightness of LED linearly to human eye.
  dt-bindings: pwm-backlight: move brightness-levels to optional.

 .../bindings/leds/backlight/pwm-backlight.txt      |  36 +++-
 drivers/video/backlight/pwm_bl.c                   | 237 +++++++++++++++++++--
 2 files changed, 253 insertions(+), 20 deletions(-)

-- 
2.15.1
