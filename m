From: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 0/2] Add RT5033 Flash LED driver
Date: Wed, 25 Nov 2015 19:22:26 +0900
Message-ID: <1448446948-13729-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This is a sixth version of the patch set to support RT5033 Flash Led.
It is based on RFC [1] from Jacek's patch set.

Changes since v6:
 - Make functions to convert from LED config data to register value
 - Add variables to save LED config data in rt5033_led struct
 - Rename some functions suitably
 - Change to set register of flash brightness / timeout when it was changed.

Changes since v5:
 - Rebase on Jacek's devel branch
   git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
 - Remove work queue from driver.
 - Change brightness_set_sync ops to brightness_set_blocking ops.
 - Remove "iout_torch_max" and "iout_flash_max" values in rt5033_led struct.
 - Add missed case for distinguishing between setting brightness.
   for iout_joint case and for individual LEDs.
 - Add missed mutex_lock.
 - Remove guard to check dev->of_node.
 - Change type of value to const __be32 to get return value of of_find_property.

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

Original cover letter:
 This patch supports flash led of RT5033 PMIC.

[1] https://lkml.org/lkml/2015/8/20/426

Ingi Kim (2):
  leds: rt5033: Add DT binding for RT5033
  leds: rt5033: Add RT5033 Flash led device driver

 .../devicetree/bindings/leds/leds-rt5033.txt       |  46 ++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-rt5033.c                         | 541 +++++++++++++++++++++
 include/linux/mfd/rt5033-private.h                 |  51 ++
 5 files changed, 647 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5033.txt
 create mode 100644 drivers/leds/leds-rt5033.c

-- 
2.0.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
