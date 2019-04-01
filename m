From: Dan Murphy <dmurphy@ti.com>
Subject: [RFC PATCH 4/5] dt-bindings: leds: Add LED_COLOR_ID and COLOR_NAME definitions
Date: Mon, 1 Apr 2019 12:33:59 -0500
Message-ID: <20190401173400.14238-5-dmurphy@ti.com>
References: <20190401173400.14238-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401173400.14238-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: marek.behun@nic.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

This patch is being added to demonstrate reuse of Jacek's patch
https://lore.kernel.org/patchwork/patch/1056726/

I have added color name definitions to the above patch.
I do not claim authorship and the intent of this patch to strictly
for demonstration.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 include/dt-bindings/leds/common.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index e171d0a6beb2..7e1279d761e4 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -19,4 +19,23 @@
 #define LEDS_BOOST_ADAPTIVE	1
 #define LEDS_BOOST_FIXED	2
 
+#define LED_COLOR_ID_WHITE	 0
+#define LED_COLOR_ID_RED	 1
+#define LED_COLOR_ID_GREEN	 2
+#define LED_COLOR_ID_BLUE	 3
+#define LED_COLOR_ID_AMBER	 4
+#define LED_COLOR_ID_VIOLET	 5
+#define LED_COLOR_ID_YELLOW	 6
+#define LED_COLOR_ID_MAX	 LED_COLOR_ID_YELLOW
+
+#define LED_COLOR_NAME_WHITE	"white"
+#define LED_COLOR_NAME_RED	"red"
+#define LED_COLOR_NAME_GREEN	"green"
+#define LED_COLOR_NAME_BLUE	"blue"
+#define LED_COLOR_NAME_AMBER	"amber"
+#define LED_COLOR_NAME_VIOLET	"violet"
+#define LED_COLOR_NAME_YELLOW	"yellow"
+
+#define LED_COLOR_NAME_MAX_SZ	6
+
 #endif /* __DT_BINDINGS_LEDS_H */
-- 
2.19.0
