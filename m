From: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 0/2] Add RT5033 Flash LED driver
Date: Tue, 10 Nov 2015 11:17:42 +0900
Message-ID: <1447121864-15460-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This patch supports flash led of RT5033 PMIC.

Changes since v4:
 - Use of_node_put() when DT parse miss
 - Move struct(rt5033_led) from include/linux/mfd/rt5033.h
   to local driver/leds/leds-rt5033.c
 - Remove MODULE_DEVICE_TABLE
 - Add interface to handle two LEDs.

Changes since v3:
 - Use mutex and work queue
 - Split brightness set func (sync / async)
 - Add flash API (flash_brightness_set)
 - Move struct(rt5033_led_config_data) to local area
 - Code clean

Changes since v2:
 - Split MFC code from rt5033 flash led patch
 - Fix typo error
 - Change naming of mfd register back again
 - Fix compile error

Ingi Kim (2):
  leds: rt5033: Add DT binding for RT5033
  leds: rt5033: Add RT5033 Flash led device driver

 .../devicetree/bindings/leds/leds-rt5033.txt       |  46 ++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-rt5033.c                         | 502 +++++++++++++++++++++
 include/linux/mfd/rt5033-private.h                 |  51 +++
 5 files changed, 608 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5033.txt
 create mode 100644 drivers/leds/leds-rt5033.c

-- 
2.0.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
