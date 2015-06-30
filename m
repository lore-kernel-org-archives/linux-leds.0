From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v2 5/5] leds: aat1290: remove work queue
Date: Tue, 30 Jun 2015 15:59:30 +0200
Message-ID: <1435672770-4261-5-git-send-email-j.anaszewski@samsung.com>
References: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39531 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753483AbbF3OEB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jun 2015 10:04:01 -0400
In-reply-to: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@epfl.ch, raph@

Commit 483a3122 ("leds: Use set_brightness_work for brightness_set
ops that can sleep") removed from LED subsystem drivers the
responsibility of using work queues internally.
Modify the driver to benefit from this modification.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-aat1290.c |   50 +++++++++++--------------------------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index 1ac525b..318bcf0 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -20,7 +20,6 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 #include <media/v4l2-flash-led-class.h>
 
 #define AAT1290_MOVIE_MODE_CURRENT_ADDR	17
@@ -82,8 +81,6 @@ struct aat1290_led {
 
 	/* brightness cache */
 	unsigned int torch_brightness;
-	/* assures led-triggers compatibility */
-	struct work_struct work_brightness_set;
 };
 
 static struct aat1290_led *fled_cdev_to_led(
@@ -92,6 +89,12 @@ static struct aat1290_led *fled_cdev_to_led(
 	return container_of(fled_cdev, struct aat1290_led, fled_cdev);
 }
 
+static struct led_classdev_flash *led_cdev_to_fled_cdev(
+				struct led_classdev *led_cdev)
+{
+	return container_of(led_cdev, struct led_classdev_flash, led_cdev);
+}
+
 static void aat1290_as2cwire_write(struct aat1290_led *led, int addr, int value)
 {
 	int i;
@@ -134,9 +137,14 @@ static void aat1290_set_flash_safety_timer(struct aat1290_led *led,
 							flash_tm_reg);
 }
 
-static void aat1290_brightness_set(struct aat1290_led *led,
+/* LED subsystem callbacks */
+
+static void aat1290_led_brightness_set(struct led_classdev *led_cdev,
 					enum led_brightness brightness)
 {
+	struct led_classdev_flash *fled_cdev = led_cdev_to_fled_cdev(led_cdev);
+	struct aat1290_led *led = fled_cdev_to_led(fled_cdev);
+
 	mutex_lock(&led->lock);
 
 	if (brightness == 0) {
@@ -160,37 +168,6 @@ static void aat1290_brightness_set(struct aat1290_led *led,
 	mutex_unlock(&led->lock);
 }
 
-/* LED subsystem callbacks */
-
-static void aat1290_brightness_set_work(struct work_struct *work)
-{
-	struct aat1290_led *led =
-		container_of(work, struct aat1290_led, work_brightness_set);
-
-	aat1290_brightness_set(led, led->torch_brightness);
-}
-
-static void aat1290_led_brightness_set(struct led_classdev *led_cdev,
-					enum led_brightness brightness)
-{
-	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
-	struct aat1290_led *led = fled_cdev_to_led(fled_cdev);
-
-	led->torch_brightness = brightness;
-	schedule_work(&led->work_brightness_set);
-}
-
-static int aat1290_led_brightness_set_sync(struct led_classdev *led_cdev,
-					enum led_brightness brightness)
-{
-	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
-	struct aat1290_led *led = fled_cdev_to_led(fled_cdev);
-
-	aat1290_brightness_set(led, brightness);
-
-	return 0;
-}
-
 static int aat1290_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
 					 bool state)
 
@@ -510,10 +487,8 @@ static int aat1290_led_probe(struct platform_device *pdev)
 
 	/* Initialize LED Flash class device */
 	led_cdev->brightness_set = aat1290_led_brightness_set;
-	led_cdev->brightness_set_sync = aat1290_led_brightness_set_sync;
 	led_cdev->max_brightness = led_cfg.max_brightness;
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
-	INIT_WORK(&led->work_brightness_set, aat1290_brightness_set_work);
 
 	aat1290_init_flash_timeout(led, &led_cfg);
 
@@ -548,7 +523,6 @@ static int aat1290_led_remove(struct platform_device *pdev)
 
 	v4l2_flash_release(led->v4l2_flash);
 	led_classdev_flash_unregister(&led->fled_cdev);
-	cancel_work_sync(&led->work_brightness_set);
 
 	mutex_destroy(&led->lock);
 
-- 
1.7.9.5
