From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v3 6/7] media: flash: use led_set_brightness_sync for torch
 brightness
Date: Fri, 03 Jul 2015 15:10:51 +0200
Message-ID: <1435929052-8736-7-git-send-email-j.anaszewski@samsung.com>
References: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44552 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755216AbbGCNPa (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jul 2015 09:15:30 -0400
In-reply-to: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@epfl.ch, raph@

LED subsystem shifted responsibility for choosing between SYNC or ASYNC
way of setting brightness from drivers to the caller. Adapt the wrapper
to those changes.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/media/v4l2-core/v4l2-flash-led-class.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
index 4e19dac..b3b082e 100644
--- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
+++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
@@ -107,10 +107,10 @@ static void v4l2_flash_set_led_brightness(struct v4l2_flash *v4l2_flash,
 		if (ctrls[LED_MODE]->val != V4L2_FLASH_LED_MODE_TORCH)
 			return;
 
-		led_set_brightness(&v4l2_flash->fled_cdev->led_cdev,
+		led_set_brightness_sync(&v4l2_flash->fled_cdev->led_cdev,
 					brightness);
 	} else {
-		led_set_brightness(&v4l2_flash->iled_cdev->led_cdev,
+		led_set_brightness_sync(&v4l2_flash->iled_cdev->led_cdev,
 					brightness);
 	}
 }
@@ -206,11 +206,11 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
 	case V4L2_CID_FLASH_LED_MODE:
 		switch (c->val) {
 		case V4L2_FLASH_LED_MODE_NONE:
-			led_set_brightness(led_cdev, LED_OFF);
+			led_set_brightness_sync(led_cdev, LED_OFF);
 			return led_set_flash_strobe(fled_cdev, false);
 		case V4L2_FLASH_LED_MODE_FLASH:
 			/* Turn the torch LED off */
-			led_set_brightness(led_cdev, LED_OFF);
+			led_set_brightness_sync(led_cdev, LED_OFF);
 			if (ctrls[STROBE_SOURCE]) {
 				external_strobe = (ctrls[STROBE_SOURCE]->val ==
 					V4L2_FLASH_STROBE_SOURCE_EXTERNAL);
-- 
1.7.9.5
