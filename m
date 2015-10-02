From: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] Add RT5033 Flash LED driver
Date: Fri, 02 Oct 2015 18:41:13 +0900
Message-ID: <1443778875-18261-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

This patch adds ktd2692 Flash LED driver with LED Flash class

Ingi Kim (2):
  leds: rt5033: add DT binding for RT5033
  leds: rt5033: Add RT5033 Flash led device driver

 .../devicetree/bindings/leds/leds-rt5033.txt       |  38 ++++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-rt5033.c                         | 222 +++++++++++++++++++++
 drivers/mfd/rt5033.c                               |   3 +
 include/linux/mfd/rt5033-private.h                 |  67 ++++++-
 include/linux/mfd/rt5033.h                         |  27 ++-
 7 files changed, 355 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5033.txt
 create mode 100644 drivers/leds/leds-rt5033.c

-- 
2.0.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
