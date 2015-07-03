From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v3 3/7] leds: Add an internal led_set_brightness_nosleep
 function
Date: Fri, 03 Jul 2015 15:10:48 +0200
Message-ID: <1435929052-8736-4-git-send-email-j.anaszewski@samsung.com>
References: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49392 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755173AbbGCNOV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jul 2015 09:14:21 -0400
In-reply-to: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@epfl.ch, raph@

This patch adds led_set_brightness_nosleep function as well
as LED_BRIGHTNESS_FAST flag. The flag, when set by a driver
means that its brightness_set op is guaranteed not to sleep.
Basing on this information the function decides whether
brightness should be set in an asynchronous or synchronous
way.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds.h  |   18 ++++++++++++++++++
 include/linux/leds.h |    1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index ca38f6a..6c56142 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -2,8 +2,10 @@
  * LED Core
  *
  * Copyright 2005 Openedhand Ltd.
+ * Copyright 2014, 2015 Samsung Electronics Co., Ltd.
  *
  * Author: Richard Purdie <rpurdie@openedhand.com>
+ * Author: Jacek Anaszewski <j.anaszewski@samsung.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -23,6 +25,22 @@ static inline void led_set_brightness_async(struct led_classdev *led_cdev,
 	schedule_work(&led_cdev->set_brightness_work);
 }
 
+static inline void led_set_brightness_nosleep(struct led_classdev *led_cdev,
+					      enum led_brightness value)
+{
+	if (led_cdev->flags & LED_BRIGHTNESS_FAST) {
+		led_set_brightness_sync(led_cdev, value);
+		return;
+	}
+
+	/*
+	 * Delegate setting brightness to a work queue task only for slow
+	 * LEDs as the FAST ones are guaranteed not to sleep while setting
+	 * brightness.
+	 */
+	led_set_brightness_async(led_cdev, value);
+}
+
 static inline int led_get_brightness(struct led_classdev *led_cdev)
 {
 	return led_cdev->brightness;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index bf4a938..a982626 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -49,6 +49,7 @@ struct led_classdev {
 #define SET_BRIGHTNESS_SYNC	(1 << 22)
 #define LED_DEV_CAP_FLASH	(1 << 23)
 #define LED_BLINK_DISABLE	(1 << 24)
+#define LED_BRIGHTNESS_FAST	(1 << 25)
 
 	/* Set LED brightness level */
 	/* Must not sleep, use a workqueue if needed */
-- 
1.7.9.5
