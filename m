From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 04/25] dt-bindings: leds: Add LED_COLOR_NAME definitions
Date: Sun, 10 Mar 2019 19:28:15 +0100
Message-ID: <20190310182836.20841-5-jacek.anaszewski@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Add common LED color name definitions for use in Device Tree.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Simon Shields <simon@lineageos.org>
---
 include/dt-bindings/leds/common.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index ffcd46317307..0e986bb59391 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -57,4 +57,13 @@
 #define LED_FUNCTION_WLAN "wlan"
 #define LED_FUNCTION_WPS "wps"
 
+/* Standard LED colors */
+#define LED_COLOR_NAME_WHITE    "white"
+#define LED_COLOR_NAME_RED      "red"
+#define LED_COLOR_NAME_GREEN    "green"
+#define LED_COLOR_NAME_BLUE     "blue"
+#define LED_COLOR_NAME_AMBER    "amber"
+#define LED_COLOR_NAME_VIOLET   "violet"
+#define LED_COLOR_NAME_YELLOW   "yellow"
+
 #endif /* __DT_BINDINGS_LEDS_H */
-- 
2.11.0
