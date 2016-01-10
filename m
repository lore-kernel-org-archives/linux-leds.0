From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] led: core: fix misleading comment after workqueue removal
 from drivers
Date: Sun, 10 Jan 2016 18:16:52 +0100
Message-ID: <56929204.3080404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:35425 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757102AbcAJRQ7 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 10 Jan 2016 12:16:59 -0500
Received: by mail-wm0-f52.google.com with SMTP id f206so186693285wmf.0
        for <linux-leds@vger.kernel.org>; Sun, 10 Jan 2016 09:16:59 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

Now that workqueues have been removed from individual drivers and
were replaced with a core-internal workqueue we shouldn't
encourage people to add new workqueues to drivers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/linux/leds.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index bc1476f..4429887 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -50,7 +50,10 @@ struct led_classdev {
 #define LED_DEV_CAP_FLASH	(1 << 23)
 
 	/* Set LED brightness level */
-	/* Must not sleep, use a workqueue if needed */
+	/* Must not sleep. If no non-blocking version can be provided
+	 * set brightness_set_blocking only. The LED core will use an
+	 * internal work queue to create a non-blocking version.
+	 */
 	void		(*brightness_set)(struct led_classdev *led_cdev,
 					  enum led_brightness brightness);
 	/*
-- 
2.7.0
