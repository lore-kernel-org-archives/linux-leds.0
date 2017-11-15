From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 0/3] Qualcomm Light Pulse Generator
Date: Tue, 14 Nov 2017 23:13:42 -0800
Message-ID: <20171115071345.24331-1-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This series introduces a generic pattern interface in the LED class and
a driver for the Qualcomm Light Pulse Generator.

Bjorn Andersson (3):
  leds: core: Introduce generic pattern interface
  leds: Add driver for Qualcomm LPG
  DT: leds: Add Qualcomm Light Pulse Generator binding

 Documentation/ABI/testing/sysfs-class-led          |   20 +
 .../devicetree/bindings/leds/leds-qcom-lpg.txt     |   66 ++
 drivers/leds/Kconfig                               |    7 +
 drivers/leds/Makefile                              |    1 +
 drivers/leds/led-class.c                           |  150 +++
 drivers/leds/leds-qcom-lpg.c                       | 1232 ++++++++++++++++++++
 include/linux/leds.h                               |   21 +
 7 files changed, 1497 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
 create mode 100644 drivers/leds/leds-qcom-lpg.c

-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
