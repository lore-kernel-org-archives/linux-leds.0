From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: [PATCH] leds: Don't allow brightness values greater than max_brightness
Date: Tue, 23 Dec 2014 19:59:23 +0100
Message-ID: <1419361163-4762-1-git-send-email-gabriele.mzt@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:49656 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403AbaLWS7r (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Dec 2014 13:59:47 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, j.anaszewski@samsung.com, kyungmin.park@samsung.com, Gabriele Mazzotta <gabriele.mzt@gmail.com>

Since commit 4d71a4a12b13 ("leds: Add support for setting brightness in
a synchronous way") the value passed to brightness_set() is no longer
limited to max_brightness and can be different from the internally saved
brightness value.

Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
---
 drivers/leds/leds.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 2348dbd..79efe57 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -20,7 +20,8 @@
 static inline void led_set_brightness_async(struct led_classdev *led_cdev,
 					enum led_brightness value)
 {
-	led_cdev->brightness = min(value, led_cdev->max_brightness);
+	value = min(value, led_cdev->max_brightness);
+	led_cdev->brightness = value;
 
 	if (!(led_cdev->flags & LED_SUSPENDED))
 		led_cdev->brightness_set(led_cdev, value);
-- 
2.1.4
