From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 11/57] Documentation: leds: Add description of
 brightness_set* ops
Date: Tue, 11 Aug 2015 11:37:24 +0200
Message-ID: <1439285890-27329-12-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

This patch adds description of brightness_set and a recently introduced
brightness_set_nonblocking op.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 Documentation/leds/leds-class.txt |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index 62261c0..fde8fef 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -52,6 +52,26 @@ above leaves scope for further attributes should they be needed. If sections
 of the name don't apply, just leave that section blank.
 
 
+Brightness setting callbacks
+============================
+
+LED subsystem core exposes two function pointers for setting brightness:
+
+    - brightness_set : Intended for drivers that may set brightness in
+                       a blocking way. For a long time this was the only
+                       op for setting brightness and it was drivers'
+                       responsibility to assure that it will not block the
+                       caller. With the new approach drivers are required to set
+                       LED_BRIGHTNESS_BLOCKING flag, when using this op, to make
+                       LED core aware that it should call it from a work queue
+                       task, when brightness is set with led_set_brightness API.
+                       In case synchronous operation is needed it should be
+                       explicitly requested with led_set_brightness_sync API.
+
+    - brightness_set_nonblocking : Intended for drivers that set brightness in
+                                   a non-blocking way.
+
+
 Hardware accelerated blink of LEDs
 ==================================
 
-- 
1.7.9.5
