From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v4 00/51] Remove work queues from LED class drivers
Date: Fri, 17 Jul 2015 10:46:46 +0200
Message-ID: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53892 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751190AbbGQIrt (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 04:47:49 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>

This is a fourth version of the RFC aiming at removing work queues
from LED class drivers, as well as getting rid of complimentary
functionalities introduced along with addition of LED flash class
extension.

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

Andrew Lunn (21):
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

Jacek Anaszewski (30):
  leds: Add led_set_brightness_sync to the public LED subsystem API
  leds: Improve asynchronous path of setting brightness
  leds: Add an internal led_set_brightness_nosleep function
  leds: Improve setting brightness in a non sleeping way
  leds: Drivers shouldn't enforce SYNC/ASYNC brightness setting
  media: flash: use led_set_brightness_sync for torch brightness
  leds: regulator: Remove work queue
  leds: wm8350: Remove work queue
  leds: pwm: remove work queue
  leds: lm355x: Remove work queue
  leds: gpio: Remove work queue
  leds: cobalt-raq: Mark the LED fast
  leds: bcm6328: Mark the LED fast
  leds: bcm6358: Mark the LED fast
  leds: syscon: Mark the LED fast
  leds: ot200: Mark the LED fast
  leds: s3c24xx: Mark the LED fast
  leds: ss4200: Mark the LED fast
  leds: versatile: Mark the LED fast
  leds: wrap: Mark the LED fast
  leds: net48xx: Mark the LED fast
  leds: asic3: Mark the LED fast
  leds: cobalt-qube: Mark the LED fast
  leds: fsg: Mark the LED fast
  leds: hp6xx: Mark the LED fast
  leds: locomo: Mark the LED fast
  leds: dell: Mark the LED fast
  leds: rb532: Mark the LED fast
  leds: sunfire: Mark the LED fast
  leds: ipaq-micro: Mark the LED fast

 drivers/leds/dell-led.c                        |    2 +-
 drivers/leds/led-class-flash.c                 |    7 ---
 drivers/leds/led-class.c                       |   20 +++----
 drivers/leds/led-core.c                        |   42 +++++++--------
 drivers/leds/leds-88pm860x.c                   |   21 ++------
 drivers/leds/leds-aat1290.c                    |   50 +++++-------------
 drivers/leds/leds-adp5520.c                    |   22 ++------
 drivers/leds/leds-asic3.c                      |    1 +
 drivers/leds/leds-bcm6328.c                    |    1 +
 drivers/leds/leds-bcm6358.c                    |    1 +
 drivers/leds/leds-bd2802.c                     |   24 +++------
 drivers/leds/leds-blinkm.c                     |   66 ++----------------------
 drivers/leds/leds-cobalt-qube.c                |    1 +
 drivers/leds/leds-cobalt-raq.c                 |    2 +
 drivers/leds/leds-da903x.c                     |   32 ++++--------
 drivers/leds/leds-da9052.c                     |   35 ++++---------
 drivers/leds/leds-dac124s085.c                 |   33 +++---------
 drivers/leds/leds-fsg.c                        |   12 ++---
 drivers/leds/leds-gpio.c                       |   50 +++++-------------
 drivers/leds/leds-hp6xx.c                      |    4 +-
 drivers/leds/leds-ipaq-micro.c                 |    2 +-
 drivers/leds/leds-ktd2692.c                    |   41 ++-------------
 drivers/leds/leds-lm3533.c                     |   30 +++--------
 drivers/leds/leds-lm355x.c                     |   58 ++++-----------------
 drivers/leds/leds-lm3642.c                     |   54 ++++---------------
 drivers/leds/leds-locomo.c                     |    2 +
 drivers/leds/leds-lp3944.c                     |   15 +-----
 drivers/leds/leds-lp5521.c                     |    6 +--
 drivers/leds/leds-lp5523.c                     |    6 +--
 drivers/leds/leds-lp5562.c                     |    6 +--
 drivers/leds/leds-lp55xx-common.c              |    8 ++-
 drivers/leds/leds-lp55xx-common.h              |    6 +--
 drivers/leds/leds-lp8501.c                     |    6 +--
 drivers/leds/leds-lp8788.c                     |   22 ++------
 drivers/leds/leds-lp8860.c                     |   24 ++-------
 drivers/leds/leds-lt3593.c                     |   27 +++-------
 drivers/leds/leds-max77693.c                   |   55 +++-----------------
 drivers/leds/leds-max8997.c                    |    1 -
 drivers/leds/leds-mc13783.c                    |   31 +++--------
 drivers/leds/leds-net48xx.c                    |    2 +-
 drivers/leds/leds-ot200.c                      |    1 +
 drivers/leds/leds-pca9532.c                    |   20 +++----
 drivers/leds/leds-pca955x.c                    |   37 +++----------
 drivers/leds/leds-pca963x.c                    |   56 +++-----------------
 drivers/leds/leds-pwm.c                        |   24 ++-------
 drivers/leds/leds-rb532.c                      |    1 +
 drivers/leds/leds-regulator.c                  |   34 ++++--------
 drivers/leds/leds-s3c24xx.c                    |    2 +-
 drivers/leds/leds-ss4200.c                     |    1 +
 drivers/leds/leds-sunfire.c                    |    1 +
 drivers/leds/leds-syscon.c                     |    1 +
 drivers/leds/leds-tlc591xx.c                   |   24 ++-------
 drivers/leds/leds-versatile.c                  |    1 +
 drivers/leds/leds-wm831x-status.c              |   23 +++------
 drivers/leds/leds-wm8350.c                     |   31 +++--------
 drivers/leds/leds-wrap.c                       |    6 +--
 drivers/leds/leds.h                            |   34 ++++++------
 drivers/leds/trigger/ledtrig-backlight.c       |    8 +--
 drivers/leds/trigger/ledtrig-default-on.c      |    2 +-
 drivers/leds/trigger/ledtrig-gpio.c            |    6 +--
 drivers/leds/trigger/ledtrig-heartbeat.c       |    4 +-
 drivers/leds/trigger/ledtrig-oneshot.c         |    4 +-
 drivers/leds/trigger/ledtrig-transient.c       |    8 +--
 drivers/media/v4l2-core/v4l2-flash-led-class.c |    8 +--
 include/linux/leds.h                           |   38 ++++++++++----
 include/linux/mfd/wm8350/pmic.h                |    1 -
 66 files changed, 319 insertions(+), 885 deletions(-)

-- 
1.7.9.5
