From: David Lin <dtwlin@google.com>
Subject: [PATCH 2/3] leds: Add the LED_BRIGHTNESS_FAST flag
Date: Sun, 30 Apr 2017 14:37:00 -0700
Message-ID: <20170430213701.12297-3-dtwlin@google.com>
References: <20170430213701.12297-1-dtwlin@google.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pg0-f48.google.com ([74.125.83.48]:36216 "EHLO
        mail-pg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1950719AbdD3VhY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Apr 2017 17:37:24 -0400
Received: by mail-pg0-f48.google.com with SMTP id t7so37998875pgt.3
        for <linux-leds@vger.kernel.org>; Sun, 30 Apr 2017 14:37:24 -0700 (PDT)
In-Reply-To: <20170430213701.12297-1-dtwlin@google.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: corbet@lwn.net, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, hdegoede@redhat.com, mark.rutland@arm.com, tony.makkiel@daqri.com, linz@li-pro.net
Cc: robh@kernel.org, romlem@google.com, joelaf@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, David Lin <dtwlin@google.com>

This patch adds the LED_BRIGHTNESS_FAST flag to allow the driver to
indicate that the brightness_set() callback is implemented on a fastpath
so that the LED core may choose to for example use a hrtimer to
implement the duration of a trigger for better timing accuracy.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: David Lin <dtwlin@google.com>
---
 Documentation/leds/leds-class.txt | 5 +++++
 include/linux/leds.h              | 1 +
 2 files changed, 6 insertions(+)

diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index 836cb16d6f09..70d7a3dca621 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -80,6 +80,11 @@ flag must be set in flags before registering. Calling
 led_classdev_notify_brightness_hw_changed on a classdev not registered with
 the LED_BRIGHT_HW_CHANGED flag is a bug and will trigger a WARN_ON.
 
+Optionally, the driver may choose to register with the LED_BRIGHTNESS_FAST flag.
+This flag indicates that the driver implements the brightness_set() callback
+function using a fastpath so the LED core can use hrtimer if the driver requires
+high precision for the trigger timing.
+
 Hardware accelerated blink of LEDs
 ==================================
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index f9d10a9efcbe..78d2880ccd39 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -49,6 +49,7 @@ struct led_classdev {
 #define LED_HW_PLUGGABLE	BIT(19)
 #define LED_PANIC_INDICATOR	BIT(20)
 #define LED_BRIGHT_HW_CHANGED	BIT(21)
+#define LED_BRIGHTNESS_FAST	BIT(22)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
-- 
2.13.0.rc0.306.g87b477812d-goog
