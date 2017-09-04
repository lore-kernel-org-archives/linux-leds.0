From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [RFC 0/2] backlight: pwm_bl: support linear brightness to human eye
Date: Mon,  4 Sep 2017 17:35:02 +0200
Message-ID: <20170904153504.27963-1-enric.balletbo@collabora.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46148 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753748AbdIDPfP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Sep 2017 11:35:15 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Doug Anderson <dianders@google.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Dear all,

This patch series is a first RFC to know your opinion about implement
support to create brightness levels tables dinamically. I tried to argue
in every patch the specific reasons we think this can be interesting, to
sumup, the idea behind these patches is be able to pass via device tree
two parameters to the driver so it can calculate the brightness levels
based on the CIE 1931 lightness formula, which is what actually describes
how we perceive light.

I think that at least the maths involved can be improved, and I've still
some doubts. With current code if you create a table with a max PWM
value of 255 and 127 steps, the first numbers are repeated so I'm thinking
that maybe we should skip/remove the repeated values. i.e. have a table
like this,

[0, 1, 2, 3  ...  235, 240, 245, 250, 255]

instead of

[0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3  ...  235, 240, 245, 250, 255]

Well, I know there are things to improve but lets see your feedback first
before dedicate more time on it. The patches were tested on a couple of
devices but I'll test on more devices meanwhile we discuss about it.

Best regards,

Enric Balletbo i Serra (2):
  dt-bindings: pwm-backlight: add brightness-levels-scale property
  backlight: pwm_bl: compute brightness of LED linearly to human eye.

 .../bindings/leds/backlight/pwm-backlight.txt      |  21 ++++
 drivers/video/backlight/pwm_bl.c                   | 111 +++++++++++++++++++--
 2 files changed, 123 insertions(+), 9 deletions(-)

-- 
2.9.3
