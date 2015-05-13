From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH] leds: remove redundant SET_BRIGHTNESS_SYNC flag
Date: Wed, 13 May 2015 18:41:05 +0300
Message-ID: <55537091.7040306@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp24.mail.ru ([94.100.181.179]:38323 "EHLO smtp24.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964958AbbEMPlV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 13 May 2015 11:41:21 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Stas Sergeev <stsp@users.sourceforge.net>


There is a complimentary flag called SET_BRIGHTNESS_ASYNC.
Having both is redundant. This patch removes the unneeded flag
without any functionality change.

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-class-flash.c |    1 -
 drivers/leds/led-core.c        |    4 +---
 include/linux/leds.h           |    2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 3b25734..bb67364 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -318,7 +318,6 @@ int led_classdev_flash_register(struct device *parent,

 	/* Setting a torch brightness needs to have immediate effect */
 	led_cdev->flags &= ~SET_BRIGHTNESS_ASYNC;
-	led_cdev->flags |= SET_BRIGHTNESS_SYNC;

 	return 0;
 }
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 9886dac..356e851 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -129,10 +129,8 @@ void led_set_brightness(struct led_classdev *led_cdev,
 	if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
 		led_set_brightness_async(led_cdev, brightness);
 		return;
-	} else if (led_cdev->flags & SET_BRIGHTNESS_SYNC)
+	} else
 		ret = led_set_brightness_sync(led_cdev, brightness);
-	else
-		ret = -EINVAL;

 	if (ret < 0)
 		dev_dbg(led_cdev->dev, "Setting LED brightness failed (%d)\n",
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 9a2b000..c9e6e5d 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -45,7 +45,7 @@ struct led_classdev {
 #define LED_BLINK_INVERT	(1 << 19)
 #define LED_SYSFS_DISABLE	(1 << 20)
 #define SET_BRIGHTNESS_ASYNC	(1 << 21)
-#define SET_BRIGHTNESS_SYNC	(1 << 22)
+/* bit 22 unused, take it */
 #define LED_DEV_CAP_FLASH	(1 << 23)

 	/* Set LED brightness level */
-- 
1.7.9.5
