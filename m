From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 0/5] LED flash: Set brightness in a sync way on demand
Date: Mon, 21 Sep 2015 16:29:25 +0200
Message-ID: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52813 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752699AbbIUOaz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 21 Sep 2015 10:30:55 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com, Jacek Anaszewski <j.anaszewski@samsung.com>

Since it has become apparent that user should decide whether brightness
is to be set in a synchronous or an asynchronousi way, export internal
led_set_brightness_sync API and remove SET_BRIGHTNESS_SYNC and
SET_BRIGHTNESS_ASYNC flags from the LED core. After patch set [1] flash
LED drivers don't longer have to implement brightness_set op and use work
queues internally. Remove the redundant code from them.

Thanks,
Jacek Anaszewski

[1] https://lkml.org/lkml/2015/9/16/299 

Jacek Anaszewski (5):
  leds: core: Drivers shouldn't enforce SYNC/ASYNC brightness setting
  Documentation: leds: Add description of brightness setting API
  leds: max77693: Remove work queue
  leds: aat1290: Remove work queue
  leds: ktd2692: Remove work queue

 Documentation/leds/leds-class.txt |   21 ++++++++++++++
 drivers/leds/led-class-flash.c    |    4 ---
 drivers/leds/led-class.c          |    2 --
 drivers/leds/led-core.c           |   33 ++++++++++++---------
 drivers/leds/leds-aat1290.c       |   50 +++++++++-----------------------
 drivers/leds/leds-ktd2692.c       |   41 ++++----------------------
 drivers/leds/leds-max77693.c      |   57 ++++++-------------------------------
 drivers/leds/leds.h               |   13 ---------
 include/linux/leds.h              |   19 +++++++++++--
 9 files changed, 84 insertions(+), 156 deletions(-)

-- 
1.7.9.5
