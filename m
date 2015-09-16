From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 0/5] LED core improvements
Date: Wed, 16 Sep 2015 12:47:39 +0200
Message-ID: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54600 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751945AbbIPKr4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 16 Sep 2015 06:47:56 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com, stsp@users.sourceforge.net, pavel@ucw.cz, ospite@studenti.unina.it, davem@davemloft.net, linus.walleij@linaro.org, ricardo.ribalda@gmail.com, p.meerwald@bct-electronic.com, Jacek Anaszewski <j.anaszewski@samsung.com>

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

Jacek Anaszewski (5):
  leds: core: Move LED core callbacks out of led-class.c
  leds: core: Add LED_BLINK_CHANGE and LED_BLINK_DISABLE flags
  leds: Rename brightness_set_sync op to brightness_set_blocking
  leds: core: Add an internal led_set_brightness_nosleep function
  leds: core: Use set_brightness_work for the blocking op

 drivers/leds/led-class-flash.c            |    2 +-
 drivers/leds/led-class.c                  |   69 +-------------
 drivers/leds/led-core.c                   |  140 +++++++++++++++++++++++++++--
 drivers/leds/leds-aat1290.c               |    2 +-
 drivers/leds/leds-ktd2692.c               |    2 +-
 drivers/leds/leds-max77693.c              |    2 +-
 drivers/leds/leds.h                       |   15 +---
 drivers/leds/trigger/ledtrig-backlight.c  |    8 +-
 drivers/leds/trigger/ledtrig-default-on.c |    2 +-
 drivers/leds/trigger/ledtrig-gpio.c       |    6 +-
 drivers/leds/trigger/ledtrig-heartbeat.c  |    4 +-
 drivers/leds/trigger/ledtrig-oneshot.c    |    4 +-
 drivers/leds/trigger/ledtrig-transient.c  |    8 +-
 include/linux/leds.h                      |   21 +++--
 14 files changed, 169 insertions(+), 116 deletions(-)

-- 
1.7.9.5
