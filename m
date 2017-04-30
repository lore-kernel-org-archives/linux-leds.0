From: David Lin <dtwlin@google.com>
Subject: [PATCH 1/3] leds: Replace flags bit shift with BIT() macros
Date: Sun, 30 Apr 2017 14:36:59 -0700
Message-ID: <20170430213701.12297-2-dtwlin@google.com>
References: <20170430213701.12297-1-dtwlin@google.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:33361 "EHLO
        mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1950608AbdD3VhW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Apr 2017 17:37:22 -0400
Received: by mail-pf0-f178.google.com with SMTP id q20so14701445pfg.0
        for <linux-leds@vger.kernel.org>; Sun, 30 Apr 2017 14:37:21 -0700 (PDT)
In-Reply-To: <20170430213701.12297-1-dtwlin@google.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: corbet@lwn.net, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, hdegoede@redhat.com, mark.rutland@arm.com, tony.makkiel@daqri.com, linz@li-pro.net
Cc: robh@kernel.org, romlem@google.com, joelaf@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, David Lin <dtwlin@google.com>

This is for readability as well as to avoid checkpatch warnings when
adding new bit flag information in the future.

Signed-off-by: David Lin <dtwlin@google.com>
---
 include/linux/leds.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 64c56d454f7d..f9d10a9efcbe 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -43,12 +43,12 @@ struct led_classdev {
 #define LED_SUSPENDED		(1 << 0)
 #define LED_UNREGISTERING	(1 << 1)
 	/* Upper 16 bits reflect control information */
-#define LED_CORE_SUSPENDRESUME	(1 << 16)
-#define LED_SYSFS_DISABLE	(1 << 17)
-#define LED_DEV_CAP_FLASH	(1 << 18)
-#define LED_HW_PLUGGABLE	(1 << 19)
-#define LED_PANIC_INDICATOR	(1 << 20)
-#define LED_BRIGHT_HW_CHANGED	(1 << 21)
+#define LED_CORE_SUSPENDRESUME	BIT(16)
+#define LED_SYSFS_DISABLE	BIT(17)
+#define LED_DEV_CAP_FLASH	BIT(18)
+#define LED_HW_PLUGGABLE	BIT(19)
+#define LED_PANIC_INDICATOR	BIT(20)
+#define LED_BRIGHT_HW_CHANGED	BIT(21)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
-- 
2.13.0.rc0.306.g87b477812d-goog
