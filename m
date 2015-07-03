From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v3 1/7] leds: Add led_set_brightness_sync to the public LED
 subsystem API
Date: Fri, 03 Jul 2015 15:10:46 +0200
Message-ID: <1435929052-8736-2-git-send-email-j.anaszewski@samsung.com>
References: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46737 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754323AbbGCNMQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jul 2015 09:12:16 -0400
In-reply-to: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@epfl.ch, raph@

led_set_brightness_sync function was visible only internally to the
LED subsystem. It is now being made publicly available since it has
become apparent that this is a caller who should decide whether
brightness is to be set in a synchronous or an asynchronous way.
The function is modified to use brightness_set op as the second
option if brightness_set_sync is not implemented. Eventually all
LED subsystem drivers will be modfified to set brightness only in
a synchronous way with use of brightness_set op and brightness_set_sync
op will be removed. LED core will take care of calling brightness_set
op asynchronously if needed.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds.h  |   13 -------------
 include/linux/leds.h |   29 +++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index bc89d7a..1c026c9 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -26,19 +26,6 @@ static inline void led_set_brightness_async(struct led_classdev *led_cdev,
 		led_cdev->brightness_set(led_cdev, value);
 }
 
-static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
-					enum led_brightness value)
-{
-	int ret = 0;
-
-	led_cdev->brightness = min(value, led_cdev->max_brightness);
-
-	if (!(led_cdev->flags & LED_SUSPENDED))
-		ret = led_cdev->brightness_set_sync(led_cdev,
-						led_cdev->brightness);
-	return ret;
-}
-
 static inline int led_get_brightness(struct led_classdev *led_cdev)
 {
 	return led_cdev->brightness;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b122eea..9b62a3c 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -160,6 +160,35 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
  */
 extern void led_set_brightness(struct led_classdev *led_cdev,
 			       enum led_brightness brightness);
+
+/**
+ * led_set_brightness_sync - set LED brightness synchronously
+ * @led_cdev: the LED to set
+ * @brightness: the brightness to set it to
+ *
+ * Set an LED's brightness immediately. This function will block
+ * the caller for the time required for accessing device register,
+ * and it can sleep.
+ */
+static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
+					  enum led_brightness value)
+{
+	int ret = 0;
+
+	led_cdev->brightness = min(value, led_cdev->max_brightness);
+
+	if (led_cdev->flags & LED_SUSPENDED)
+		return 0;
+
+	if (led_cdev->brightness_set_sync)
+		ret = led_cdev->brightness_set_sync(led_cdev,
+						    led_cdev->brightness);
+	else
+		led_cdev->brightness_set(led_cdev, led_cdev->brightness);
+
+	return 0;
+}
+
 /**
  * led_update_brightness - update LED brightness
  * @led_cdev: the LED to query
-- 
1.7.9.5
