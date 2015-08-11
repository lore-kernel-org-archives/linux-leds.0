From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 00/57] Remove work queues from LED class drivers
Date: Tue, 11 Aug 2015 11:37:13 +0200
Message-ID: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53544 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934010AbbHKJiU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2015 05:38:20 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>

This is a fifth version of the RFC aiming at removing work queues
from LED class drivers, as well as getting rid of complimentary
functionalities introduced along with addition of LED flash class
extension.

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

Jacek Anaszewski (34):
  leds: Add brightness_set_nonblocking op
  leds: Add LED_BRIGHTNESS_BLOCKING flag
  leds: Add led_set_brightness_sync to the public LED subsystem API
  leds: Improve asynchronous path of setting brightness
  leds: Add an internal led_set_brightness_nosleep function
  leds: Improve setting brightness in a non sleeping way
  leds: Drivers shouldn't enforce SYNC/ASYNC brightness setting
  leds: ktd2692: Remove work queue
  leds: aat1290: Remove work queue
  leds: max77693: Remove work queue
  Documentation: leds: Add description of brightness_set* ops
  leds: gpio: Remove work queue
  leds: pwm: remove work queue
  leds: lm355x: Remove work queue
  leds: cobalt-raq: Use brightness_set_nonblocking op
  leds: bcm6328: Use brightness_set_nonblocking op
  leds: bcm6358: Use brightness_set_nonblocking op
  leds: syscon: Use brightness_set_nonblocking op
  leds: ot200: Use brightness_set_nonblocking op
  leds: s3c24xx: Use brightness_set_nonblocking op
  leds: ss4200: Use brightness_set_nonblocking op
  leds: versatile: Use brightness_set_nonblocking op
  leds: wrap: Use brightness_set_nonblocking op
  leds: net48xx: Use brightness_set_nonblocking op
  leds: asic3: Use brightness_set_nonblocking op
  leds: cobalt-qube: Use brightness_set_nonblocking op
  leds: fsg: Use brightness_set_nonblocking op
  leds: hp6xx: Use brightness_set_nonblocking op
  leds: locomo: Use brightness_set_nonblocking op
  leds: dell: Use brightness_set_nonblocking op
  leds: rb532: Use brightness_set_nonblocking op
  leds: sunfire: Use brightness_set_nonblocking op
  leds: ipaq-micro: Set LED_BRIGHTNESS_BLOCKING flag
  leds: clevo-mail: Set LED_BRIGHTNESS_BLOCKING flag

 Documentation/leds/leds-class.txt         |   20 +++++++++
 drivers/leds/dell-led.c                   |   12 ++---
 drivers/leds/led-class-flash.c            |    7 ---
 drivers/leds/led-class.c                  |   20 +++++----
 drivers/leds/led-core.c                   |   58 ++++++++++++++++--------
 drivers/leds/leds-88pm860x.c              |   22 +++------
 drivers/leds/leds-aat1290.c               |   52 ++++++----------------
 drivers/leds/leds-adp5520.c               |   23 ++--------
 drivers/leds/leds-asic3.c                 |    2 +-
 drivers/leds/leds-bcm6328.c               |    2 +-
 drivers/leds/leds-bcm6358.c               |    2 +-
 drivers/leds/leds-bd2802.c                |   32 ++++++-------
 drivers/leds/leds-blinkm.c                |   69 ++++-------------------------
 drivers/leds/leds-clevo-mail.c            |    3 +-
 drivers/leds/leds-cobalt-qube.c           |    8 ++--
 drivers/leds/leds-cobalt-raq.c            |   10 ++---
 drivers/leds/leds-da903x.c                |   33 +++++---------
 drivers/leds/leds-da9052.c                |   36 +++++----------
 drivers/leds/leds-dac124s085.c            |   34 +++-----------
 drivers/leds/leds-fsg.c                   |   36 +++++++--------
 drivers/leds/leds-gpio.c                  |   59 +++++++-----------------
 drivers/leds/leds-hp6xx.c                 |   16 +++----
 drivers/leds/leds-ipaq-micro.c            |    3 +-
 drivers/leds/leds-ktd2692.c               |   44 +++---------------
 drivers/leds/leds-lm3533.c                |   27 +++--------
 drivers/leds/leds-lm355x.c                |   61 +++++--------------------
 drivers/leds/leds-lm3642.c                |   57 +++++-------------------
 drivers/leds/leds-locomo.c                |   12 ++---
 drivers/leds/leds-lp3944.c                |   30 +++----------
 drivers/leds/leds-lp5521.c                |    6 +--
 drivers/leds/leds-lp5523.c                |    6 +--
 drivers/leds/leds-lp5562.c                |    6 +--
 drivers/leds/leds-lp55xx-common.c         |    9 ++--
 drivers/leds/leds-lp55xx-common.h         |    6 +--
 drivers/leds/leds-lp8501.c                |    6 +--
 drivers/leds/leds-lp8788.c                |   23 +++-------
 drivers/leds/leds-lp8860.c                |   25 +++--------
 drivers/leds/leds-lt3593.c                |   29 ++++--------
 drivers/leds/leds-max77693.c              |   57 ++++--------------------
 drivers/leds/leds-max8997.c               |    1 -
 drivers/leds/leds-mc13783.c               |   32 ++++---------
 drivers/leds/leds-net48xx.c               |    6 +--
 drivers/leds/leds-ot200.c                 |    3 +-
 drivers/leds/leds-pca9532.c               |   21 ++++-----
 drivers/leds/leds-pca955x.c               |   38 ++++------------
 drivers/leds/leds-pca963x.c               |   57 ++++--------------------
 drivers/leds/leds-pwm.c                   |   29 ++++--------
 drivers/leds/leds-rb532.c                 |    8 ++--
 drivers/leds/leds-regulator.c             |   43 +++++-------------
 drivers/leds/leds-s3c24xx.c               |    2 +-
 drivers/leds/leds-ss4200.c                |    2 +-
 drivers/leds/leds-sunfire.c               |    2 +-
 drivers/leds/leds-syscon.c                |    2 +-
 drivers/leds/leds-tlc591xx.c              |   25 +++--------
 drivers/leds/leds-versatile.c             |    2 +-
 drivers/leds/leds-wm831x-status.c         |   24 ++++------
 drivers/leds/leds-wm8350.c                |   33 +++-----------
 drivers/leds/leds-wrap.c                  |   20 ++++-----
 drivers/leds/leds.h                       |   48 ++++++++++++++------
 drivers/leds/trigger/ledtrig-backlight.c  |    8 ++--
 drivers/leds/trigger/ledtrig-default-on.c |    2 +-
 drivers/leds/trigger/ledtrig-gpio.c       |    6 +--
 drivers/leds/trigger/ledtrig-heartbeat.c  |    4 +-
 drivers/leds/trigger/ledtrig-oneshot.c    |    4 +-
 drivers/leds/trigger/ledtrig-transient.c  |    8 ++--
 include/linux/leds.h                      |   35 ++++++++++-----
 include/linux/mfd/wm8350/pmic.h           |    1 -
 67 files changed, 469 insertions(+), 960 deletions(-)

-- 
1.7.9.5
