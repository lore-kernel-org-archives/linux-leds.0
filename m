From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v3 00/10] LED core improvements
Date: Wed, 07 Oct 2015 11:10:38 +0200
Message-ID: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, pavel@ucw.cz, sakari.ailus@linux.intel.com, andrew@lunn.ch, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

This is a third version of the patch set preparing the
ground for removing work queues from LED class drivers.
It is based on RFC [1].
Andrew, Pavel, Sakari - thanks for a review.

================
Changes from v2:
================
- added led_set_brightness_nopm() to be used from pm ops,
  and modified led_set_brightness_nosleep() to call the former
- removed patch that renames EXPORT_SYMBOL to EXPORT_SYMBOL_GPL
  in the led-core.c - it is postponed until clear consensus is reached on it
- added acks from Pavel Machek
- removed from the set a patch that has been applied:
  [PATCH 1/5] leds: core: Move LED core callbacks out of led-class.c

================
Changes from v1:
================
- removed useless use of else in led_set_brightness()
- switched to removing error code instead of emitting
  warning from led_set_brightness_sync() in case software
  blink fallback is enabled
- moved __led_set_brightness() contents to set_brightness_delayed()
- removed description of internal led_set_brightness_nosleep() from
  led-class.txt documentation, and modified description of
  led_set_brightness() and led_set_brightness_sync()
- renamed LED_BLINK_CHANGE flag to more meaningful
  LED_BLINK_BRIGHTNESS_CHANGE
- Fixed stylistic issues in a few comments
- Adopted old brightness_set_sync() op description to
  a new brightness_set_blocking() op
- Fixed led_set_brightness_nosleep to avoid scheduling
  spurious set_brightness_work
- made LED core using EXPORT_SYMBOL_GPL consistently
- switched v4l2-flash-led-class wrapper to using
  led_set_brightness_sync API for setting torch brightness
- merged with patch set
  "LED flash: Set brightness in a sync way on demand"


======================
Original cover letter:
======================

This patch set prepares the ground for removing work queues
from LED class drivers, and is a follow up of the patch set [1].
LED core modifications have been reorganized to make them
more clear and easier to review. The patch set is reduced
in comparison to it its predecessor, to expose the modifications
indispensable for the LED core to gain the capability of handling
brightness_set_blocking ops, that is without work queues.

Thanks,
Jacek Anaszewski

[1] https://lkml.org/lkml/2015/8/20/426

Jacek Anaszewski (10):
  leds: core: Add two new LED_BLINK_ flags
  leds: Rename brightness_set_sync op to brightness_set_blocking
  leds: core: Add led_set_brightness_nosleep{nopm} functions
  leds: core: Use set_brightness_work for the blocking op
  leds: core: Drivers shouldn't enforce SYNC/ASYNC brightness setting
  Documentation: leds: Add description of brightness setting API
  leds: max77693: Remove work queue
  leds: aat1290: Remove work queue
  leds: ktd2692: Remove work queue
  media: flash: use led_set_brightness_sync for torch brightness

 Documentation/leds/leds-class.txt              |   13 +++
 drivers/leds/led-class-flash.c                 |    6 +-
 drivers/leds/led-class.c                       |    6 +-
 drivers/leds/led-core.c                        |  116 ++++++++++++++++++------
 drivers/leds/leds-aat1290.c                    |   50 +++-------
 drivers/leds/leds-ktd2692.c                    |   41 ++-------
 drivers/leds/leds-max77693.c                   |   57 ++----------
 drivers/leds/leds.h                            |   27 +-----
 drivers/leds/trigger/ledtrig-backlight.c       |    8 +-
 drivers/leds/trigger/ledtrig-default-on.c      |    2 +-
 drivers/leds/trigger/ledtrig-gpio.c            |    6 +-
 drivers/leds/trigger/ledtrig-heartbeat.c       |    4 +-
 drivers/leds/trigger/ledtrig-oneshot.c         |    4 +-
 drivers/leds/trigger/ledtrig-transient.c       |    8 +-
 drivers/media/v4l2-core/v4l2-flash-led-class.c |    8 +-
 include/linux/leds.h                           |   27 ++++--
 16 files changed, 177 insertions(+), 206 deletions(-)

-- 
1.7.9.5
