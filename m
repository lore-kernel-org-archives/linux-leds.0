From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v5 03/26] dt-bindings: leds: Add LED_FUNCTION definitions
Date: Sun,  9 Jun 2019 21:07:40 +0200
Message-ID: <20190609190803.14815-4-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com, jacek.anaszewski@gmail.com, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Add initial set of common LED function definitions.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Simon Shields <simon@lineageos.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
---
 include/dt-bindings/leds/common.h | 44 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 217ee9e0dd6c..9e1256a7c1bf 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -3,8 +3,9 @@
  * This header provides macros for the common LEDs device tree bindings.
  *
  * Copyright (C) 2015, Samsung Electronics Co., Ltd.
- *
  * Author: Jacek Anaszewski <j.anaszewski@samsung.com>
+ *
+ * Copyright (C) 2019 Jacek Anaszewski <jacek.anaszewski@gmail.com>
  */
 
 #ifndef __DT_BINDINGS_LEDS_H
@@ -30,4 +31,45 @@
 #define LED_COLOR_ID_IR		7
 #define LED_COLOR_ID_MAX	8
 
+/* Standard LED functions */
+#define LED_FUNCTION_ACTIVITY "activity"
+#define LED_FUNCTION_ALARM "alarm"
+#define LED_FUNCTION_BACKLIGHT "backlight"
+#define LED_FUNCTION_BLUETOOTH "bluetooth"
+#define LED_FUNCTION_BOOT "boot"
+#define LED_FUNCTION_CPU "cpu"
+#define LED_FUNCTION_CAPSLOCK "capslock"
+#define LED_FUNCTION_CHARGING "charging"
+#define LED_FUNCTION_DEBUG "debug"
+#define LED_FUNCTION_DISK "disk"
+#define LED_FUNCTION_DISK_ACTIVITY "disk-activity"
+#define LED_FUNCTION_DISK_ERR "disk-err"
+#define LED_FUNCTION_DISK_READ "disk-read"
+#define LED_FUNCTION_DISK_WRITE "disk-write"
+#define LED_FUNCTION_FAULT "fault"
+#define LED_FUNCTION_FLASH "flash"
+#define LED_FUNCTION_HEARTBEAT "heartbeat"
+#define LED_FUNCTION_INDICATOR "indicator"
+#define LED_FUNCTION_KBD_BACKLIGHT "kbd_backlight"
+#define LED_FUNCTION_LAN "lan"
+#define LED_FUNCTION_MAIL "mail"
+#define LED_FUNCTION_MTD "mtd"
+#define LED_FUNCTION_MICMUTE "micmute"
+#define LED_FUNCTION_MUTE "mute"
+#define LED_FUNCTION_NUMLOCK "numlock"
+#define LED_FUNCTION_PANIC "panic"
+#define LED_FUNCTION_PROGRAMMING "programming"
+#define LED_FUNCTION_POWER "power"
+#define LED_FUNCTION_RX "rx"
+#define LED_FUNCTION_SD "sd"
+#define LED_FUNCTION_SCROLLLOCK "scrolllock"
+#define LED_FUNCTION_STANDBY "standby"
+#define LED_FUNCTION_STATUS "status"
+#define LED_FUNCTION_TORCH "torch"
+#define LED_FUNCTION_TX "tx"
+#define LED_FUNCTION_USB "usb"
+#define LED_FUNCTION_WAN "wan"
+#define LED_FUNCTION_WLAN "wlan"
+#define LED_FUNCTION_WPS "wps"
+
 #endif /* __DT_BINDINGS_LEDS_H */
-- 
2.11.0
