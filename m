From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v5 02/26] dt-bindings: leds: Add LED_COLOR_ID definitions
Date: Sun,  9 Jun 2019 21:07:39 +0200
Message-ID: <20190609190803.14815-3-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com, jacek.anaszewski@gmail.com, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Add common LED color identifiers.

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
 include/dt-bindings/leds/common.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index e171d0a6beb2..217ee9e0dd6c 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -19,4 +19,15 @@
 #define LEDS_BOOST_ADAPTIVE	1
 #define LEDS_BOOST_FIXED	2
 
+/* Standard LED colors */
+#define LED_COLOR_ID_WHITE	0
+#define LED_COLOR_ID_RED	1
+#define LED_COLOR_ID_GREEN	2
+#define LED_COLOR_ID_BLUE	3
+#define LED_COLOR_ID_AMBER	4
+#define LED_COLOR_ID_VIOLET	5
+#define LED_COLOR_ID_YELLOW	6
+#define LED_COLOR_ID_IR		7
+#define LED_COLOR_ID_MAX	8
+
 #endif /* __DT_BINDINGS_LEDS_H */
-- 
2.11.0
