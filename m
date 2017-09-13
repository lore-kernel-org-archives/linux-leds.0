From: David Lin <dtwlin@google.com>
Subject: [PATCH v2 2/3] leds: Add the LED_BRIGHTNESS_FAST flag
Date: Wed, 13 Sep 2017 10:53:59 -0700
Message-ID: <20170913175400.42744-3-dtwlin@google.com>
References: <20170913175400.42744-1-dtwlin@google.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:46361 "EHLO
        mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751431AbdIMRyU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Sep 2017 13:54:20 -0400
Received: by mail-pf0-f182.google.com with SMTP id e199so1357182pfh.3
        for <linux-leds@vger.kernel.org>; Wed, 13 Sep 2017 10:54:20 -0700 (PDT)
In-Reply-To: <20170913175400.42744-1-dtwlin@google.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: corbet@lwn.net, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, hdegoede@redhat.com, gregkh@linuxfoundation.org
Cc: robh@kernel.org, romlem@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, David Lin <dtwlin@google.com>

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
index 5579c64c8fd6..ccfa0a1799fe 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -50,6 +50,7 @@ struct led_classdev {
 #define LED_PANIC_INDICATOR	BIT(20)
 #define LED_BRIGHT_HW_CHANGED	BIT(21)
 #define LED_RETAIN_AT_SHUTDOWN	BIT(22)
+#define LED_BRIGHTNESS_FAST	BIT(23)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
-- 
2.14.1.581.gf28d330327-goog
