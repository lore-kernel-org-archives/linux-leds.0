From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 00/36] Remove work queues from LED class drivers
Date: Thu, 20 Aug 2015 16:43:30 +0200
Message-ID: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51751 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751690AbbHTOo0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 20 Aug 2015 10:44:26 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>

This is sixth version of the RFC aiming at removing work queues
from LED class drivers, as well as getting rid of complimentary
functionalities introduced along with addition of LED flash class
extension.

======================
Changes from version 5
======================
- avoided changing semantics of brightness_set op in favour
  of introducing brightness_set_blocking op, which also allowed
  to get rid of LED_BRIGHTNESS_BLOCKING flag - Andrew thanks for
  the hints
- made new brightness_set_blocking op returning int, which entailed
  the need for extending the scope of modifications in the drivers
  from which work queues are removed. Those affected drivers now
  implement the new op instead of brightness_set, which returns void
- since LED_BRIGHTNESS_FAST flags is not needed with the new
  approach, its introduction has been postponed

======================
Changes from version 4
======================
- switched to using two separate ops for blocking and non-blocking way
  of setting brightness as requested by Pavel Machek.
- improved patches for leds-lm3533, leds-regulator, leds-lp3944
  and leds-ipaq-micro drivers in response to review remarks

======================
Changes from version 3
======================
- fixed return value in one of intermediary patches
- changed the comment over the brightness_set op member
  of struct led_classdev
- added patches adjusting LED subsystem drivers to the introduced
  modifications - they have been only compile-tested

======================
Changes from version 2
======================

- split changes to several incremental patches
- removed SET_BRIGHTNESS_SYNC and SET_BRIGHTNESS_ASYNC flags
- fixed led_set_brightness_async function instead of renaming it

======================
Changes from version 1
======================

V2 includes also patches for one LED class driver
and two LED flash class drivers, that show how the
drivers will benefit from the optimization being
introduced in the first patch of this patch set.

I was able to test only the LED Flash class drivers.

Original message from the patch 483a3122 ("leds: Use set_brightness_work for
brightness_set ops that can sleep") that was sent previously as a single one:

Hi All,

Since this patch will affect all the LED subsystem drivers
I'd like it was tested by as many developers as possible
to make sure that I haven't missed something.

For the drivers which can sleep in their brightness_set ops
(e.g. use mutex or gpio "cansleep" API) you only need to
remove the work queues and move the code executed currently
in the work queue task to the brightness_set op, as now
LED core does the job.

For drivers that are capable of setting brightness with use
of MMIO you need to set the LED_BRIGHTNESS_FAST flag, so
that LED core would know that it doesn't have to employ
work queue.

After the patch is positively verified I will create relevant
patches for every LED class driver.

This patch is based on linux-next_20150622.

I am looking forward to your cooperation.

Best Regards,
Jacek Anaszewski

Andrew Lunn (23):
  leds: tlc591xx: Remove work queue
  leds: 88pm860x: Remove work queue
  leds: adp5520: Remove work queue
  leds: bd2802: Remove work queue
  leds: blinkm: Remove work queue
  leds: lm3533: Remove work queue
  leds: lm3642: Remove work queue
  leds: pca9532: Remove work queue for LEDs.
  leds: lp3944: Remove work queue
  leds: lp55xx: Remove work queue
  leds: lp8788: Remove work queue
  leds: lp8860: Remove work queue
  leds: pca955x: Remove work queue
  leds: pca963x: Remove work queue
  leds: wm831x: Remove work queue
  leds: da903x: Remove work queue
  leds: da9052: Remove work queue
  leds: dac124d085: Remove work queue
  leds: lt3593: Remove work queue
  leds: max8997: Remove unneeded workqueue include
  leds: mc13783: Remove work queue
  leds: regulator: Remove work queue
  leds: wm8350: Remove work queue

Jacek Anaszewski (13):
  leds: Add brightness_set_blocking op
  leds: Add led_set_brightness_sync to the public LED subsystem API
  leds: Improve asynchronous path of setting brightness
  leds: Add an internal led_set_brightness_nosleep function
  leds: Improve setting brightness in a non sleeping way
  leds: Drivers shouldn't enforce SYNC/ASYNC brightness setting
  Documentation: leds: Add description of brightness_set* ops
  leds: ktd2692: Remove work queue
  leds: aat1290: Remove work queue
  leds: max77693: Remove work queue
  leds: gpio: Remove work queue
  leds: pwm: remove work queue
  leds: lm355x: Remove work queue

 Documentation/leds/leds-class.txt         |   11 ++++
 drivers/leds/led-class-flash.c            |    7 ---
 drivers/leds/led-class.c                  |   22 +++++---
 drivers/leds/led-core.c                   |   79 ++++++++++++++++++++------
 drivers/leds/leds-88pm860x.c              |   23 +++-----
 drivers/leds/leds-aat1290.c               |   50 +++++------------
 drivers/leds/leds-adp5520.c               |   26 ++-------
 drivers/leds/leds-bd2802.c                |   39 +++++--------
 drivers/leds/leds-blinkm.c                |   87 ++++++-----------------------
 drivers/leds/leds-da903x.c                |   46 ++++++---------
 drivers/leds/leds-da9052.c                |   39 ++++---------
 drivers/leds/leds-dac124s085.c            |   38 ++++---------
 drivers/leds/leds-gpio.c                  |   64 +++++++--------------
 drivers/leds/leds-ktd2692.c               |   41 ++------------
 drivers/leds/leds-lm3533.c                |   30 ++--------
 drivers/leds/leds-lm355x.c                |   85 +++++++++-------------------
 drivers/leds/leds-lm3642.c                |   73 ++++++++----------------
 drivers/leds/leds-lp3944.c                |   32 +++--------
 drivers/leds/leds-lp5521.c                |   11 ++--
 drivers/leds/leds-lp5523.c                |   10 ++--
 drivers/leds/leds-lp5562.c                |   11 ++--
 drivers/leds/leds-lp55xx-common.c         |   12 ++--
 drivers/leds/leds-lp55xx-common.h         |    6 +-
 drivers/leds/leds-lp8501.c                |   11 ++--
 drivers/leds/leds-lp8788.c                |   48 +++++++---------
 drivers/leds/leds-lp8860.c                |   27 +++------
 drivers/leds/leds-lt3593.c                |   33 ++++-------
 drivers/leds/leds-max77693.c              |   57 +++----------------
 drivers/leds/leds-max8997.c               |    1 -
 drivers/leds/leds-mc13783.c               |   35 +++---------
 drivers/leds/leds-pca9532.c               |   28 ++++------
 drivers/leds/leds-pca955x.c               |   39 +++----------
 drivers/leds/leds-pca963x.c               |   80 ++++++++------------------
 drivers/leds/leds-pwm.c                   |   34 +++++------
 drivers/leds/leds-regulator.c             |   46 ++++-----------
 drivers/leds/leds-tlc591xx.c              |   31 +++-------
 drivers/leds/leds-wm831x-status.c         |   25 +++------
 drivers/leds/leds-wm8350.c                |   64 +++++++++------------
 drivers/leds/leds.h                       |   26 +++------
 drivers/leds/trigger/ledtrig-backlight.c  |    8 +--
 drivers/leds/trigger/ledtrig-default-on.c |    2 +-
 drivers/leds/trigger/ledtrig-gpio.c       |    6 +-
 drivers/leds/trigger/ledtrig-heartbeat.c  |    4 +-
 drivers/leds/trigger/ledtrig-oneshot.c    |    4 +-
 drivers/leds/trigger/ledtrig-transient.c  |    8 +--
 include/linux/leds.h                      |   31 +++++++---
 include/linux/mfd/wm8350/pmic.h           |    1 -
 47 files changed, 512 insertions(+), 979 deletions(-)

-- 
1.7.9.5
