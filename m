From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v3 06/10] Documentation: leds: Add description of brightness
 setting API
Date: Wed, 07 Oct 2015 11:10:44 +0200
Message-ID: <1444209048-29415-7-git-send-email-j.anaszewski@samsung.com>
References: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, pavel@ucw.cz, sakari.ailus@linux.intel.com, andrew@lunn.ch, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch adds description of the LED subsystem API for
setting an LED brightness.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 Documentation/leds/leds-class.txt |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index 62261c0..d406d98 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -52,6 +52,19 @@ above leaves scope for further attributes should they be needed. If sections
 of the name don't apply, just leave that section blank.
 
 
+Brightness setting API
+======================
+
+LED subsystem core exposes following API for setting brightness:
+
+    - led_set_brightness : it is guaranteed not to sleep, passing LED_OFF stops
+		blinking,
+    - led_set_brightness_sync : for use cases when immediate effect is desired -
+		it can block the caller for the time required for accessing
+		device registers and can sleep, passing LED_OFF stops hardware
+		blinking, returns -EBUSY if software blink fallback is enabled.
+
+
 Hardware accelerated blink of LEDs
 ==================================
 
-- 
1.7.9.5
