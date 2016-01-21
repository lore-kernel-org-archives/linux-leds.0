From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] led: core: fix misleading comment after workqueue removal
 from drivers
Date: Thu, 21 Jan 2016 23:11:25 +0100
Message-ID: <56A1578D.1050101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36592 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbcAUWLh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jan 2016 17:11:37 -0500
Received: by mail-wm0-f67.google.com with SMTP id l65so13744685wmf.3
        for <linux-leds@vger.kernel.org>; Thu, 21 Jan 2016 14:11:37 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Now that workqueues have been removed from individual drivers and
were replaced with a core-internal workqueue we shouldn't
encourage people to add new workqueues to drivers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- make comment simpler and clearer
---
 include/linux/leds.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index bc1476f..e3470e7 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -49,8 +49,10 @@ struct led_classdev {
 #define LED_SYSFS_DISABLE	(1 << 22)
 #define LED_DEV_CAP_FLASH	(1 << 23)
 
-	/* Set LED brightness level */
-	/* Must not sleep, use a workqueue if needed */
+	/* Set LED brightness level
+	 * Must not sleep. Use brightness_set_blocking for drivers
+	 * that can sleep while setting brightness.
+	 */
 	void		(*brightness_set)(struct led_classdev *led_cdev,
 					  enum led_brightness brightness);
 	/*
-- 
2.7.0
