From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 07/36] Documentation: leds: Add description of
 brightness_set* ops
Date: Thu, 20 Aug 2015 16:43:37 +0200
Message-ID: <1440081846-11697-8-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

This patch adds description of brightness_set and a recently introduced
brightness_set_nonblocking op.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 Documentation/leds/leds-class.txt |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index 62261c0..c36a6b8 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -52,6 +52,17 @@ above leaves scope for further attributes should they be needed. If sections
 of the name don't apply, just leave that section blank.
 
 
+Brightness setting callbacks
+============================
+
+LED subsystem core exposes two function pointers for setting brightness:
+
+    - brightness_set : Intended for drivers that set brightness in
+		a non-blocking way,
+    - brightness_set_blocking : Intended for drivers that either sleep or
+		use delays while setting brightness.
+
+
 Hardware accelerated blink of LEDs
 ==================================
 
-- 
1.7.9.5
