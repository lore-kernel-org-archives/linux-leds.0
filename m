From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 2/5] Documentation: leds: Add description of brightness setting
 API
Date: Mon, 21 Sep 2015 16:29:27 +0200
Message-ID: <1442845770-17800-3-git-send-email-j.anaszewski@samsung.com>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch adds description of the LED subsystem API for
setting an LED brightness.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 Documentation/leds/leds-class.txt |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index 62261c0..2cc38fa 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -52,6 +52,27 @@ above leaves scope for further attributes should they be needed. If sections
 of the name don't apply, just leave that section blank.
 
 
+Brightness setting API
+======================
+
+LED subsystem core exposes following API for setting brightness:
+
+    - led_set_brightness : if necessary, cancels the software blink timer that
+		implements blinking when the hardware doesn't; it is guaranteed
+		not to sleep, which implies the possibility of delegating the
+		job to a work queue task (uses led_set_brightness_nosleep
+		underneath - see below),
+    - led_set_brightness_sync : for use cases when immediate effect is desired;
+		it can block the caller for the time required for accessing
+		device registers and can sleep,
+    - led_set_brightness_nosleep : sets an LEDs brightness using either
+		brightness_set op, which is guaranteed not to sleep, or, if only
+		brightness_set_blocking op is available, delegates it to a work
+		queue task; this API is inteded for use by LED core and
+		led-triggers, as they can be called from atomic context, and thus
+		cannot sleep.
+
+
 Hardware accelerated blink of LEDs
 ==================================
 
-- 
1.7.9.5
