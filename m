From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 4/7] dt-bindings: leds: Add multicolor ID to the color ID list
Date: Thu, 11 Apr 2019 14:38:45 -0500
Message-ID: <20190411193848.23140-5-dmurphy@ti.com>
References: <20190411193848.23140-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411193848.23140-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, marek.behun@nic.cz, rdunlap@infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Add a new color ID that is declared as MULTICOLOR as with the
multicolor framework declaring a definitive color is not accurate
as the node can contain multiple colors.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/led-class.c          | 1 +
 include/dt-bindings/leds/common.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index bfd46a9bba63..11dd78b63403 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -35,6 +35,7 @@ const char *led_colors[LED_COLOR_ID_COUNT] = {
 	[LED_COLOR_ID_VIOLET] = "violet",
 	[LED_COLOR_ID_YELLOW] = "yellow",
 	[LED_COLOR_ID_IR] = "ir",
+	[LED_COLOR_ID_MULTI] = "multicolor",
 };
 EXPORT_SYMBOL_GPL(led_colors);
 
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index c95f39b3a254..f6df2c63398e 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -64,6 +64,7 @@
 #define LED_COLOR_ID_VIOLET	5
 #define LED_COLOR_ID_YELLOW	6
 #define LED_COLOR_ID_IR		7
-#define LED_COLOR_ID_COUNT	8
+#define LED_COLOR_ID_MULTI	8
+#define LED_COLOR_ID_COUNT	9
 
 #endif /* __DT_BINDINGS_LEDS_H */
-- 
2.21.0.5.gaeb582a983
