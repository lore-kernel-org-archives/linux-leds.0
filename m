From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v4 04/26] dt-bindings: leds: Add LED_COLOR_ID definitions
Date: Wed, 17 Apr 2019 22:54:17 +0200
Message-ID: <20190417205439.17685-5-jacek.anaszewski@gmail.com>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, jacek.anaszewski@gmail.com, Baolin Wang <baolin.wang@linaro.org>, Dan Murphy <dmurphy@ti.com>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Add common LED color identifiers.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Simon Shields <simon@lineageos.org>
---
 include/dt-bindings/leds/common.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index da0539490cea..d8c8c38700bd 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -56,4 +56,15 @@
 #define LED_FUNCTION_WLAN "wlan"
 #define LED_FUNCTION_WPS "wps"
 
+/* Standard LED colors */
+#define LED_COLOR_ID_WHITE	0
+#define LED_COLOR_ID_RED	1
+#define LED_COLOR_ID_GREEN	2
+#define LED_COLOR_ID_BLUE	3
+#define LED_COLOR_ID_AMBER	4
+#define LED_COLOR_ID_VIOLET	5
+#define LED_COLOR_ID_YELLOW	6
+#define LED_COLOR_ID_IR		7
+#define LED_COLOR_ID_COUNT	8
+
 #endif /* __DT_BINDINGS_LEDS_H */
-- 
2.11.0
