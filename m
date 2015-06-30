From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v2 0/5] Remove work queues from LED class drivers
Date: Tue, 30 Jun 2015 15:55:34 +0200
Message-ID: <1435672534-4004-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34630 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311AbbF3N4D (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jun 2015 09:56:03 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@epfl.ch, raph@

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

Jacek Anaszewski (5):
  leds: Use set_brightness_work for brightness_set ops that can sleep
  leds: pwm: remove work queue
  led: flash: remove check for brightness_set_sync op
  leds: max77693: remove work queue
  leds: aat1290: remove work queue

 drivers/leds/led-class-flash.c            |    3 --
 drivers/leds/led-class.c                  |   18 ++++++----
 drivers/leds/led-core.c                   |   50 +++++++++++++++-----------
 drivers/leds/leds-aat1290.c               |   50 +++++++-------------------
 drivers/leds/leds-max77693.c              |   55 ++++-------------------------
 drivers/leds/leds-pwm.c                   |   24 +++----------
 drivers/leds/leds.h                       |   41 ++++++++++++---------
 drivers/leds/trigger/ledtrig-backlight.c  |    8 ++---
 drivers/leds/trigger/ledtrig-default-on.c |    2 +-
 drivers/leds/trigger/ledtrig-gpio.c       |    6 ++--
 drivers/leds/trigger/ledtrig-heartbeat.c  |    4 +--
 drivers/leds/trigger/ledtrig-oneshot.c    |    4 +--
 drivers/leds/trigger/ledtrig-transient.c  |    8 ++---
 include/linux/leds.h                      |    9 ++---
 14 files changed, 107 insertions(+), 175 deletions(-)

-- 
1.7.9.5
