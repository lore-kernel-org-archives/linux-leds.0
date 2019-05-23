From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 4/9] dt-bindings: leds: Add multicolor ID to the color ID  list
Date: Thu, 23 May 2019 14:08:15 -0500
Message-ID: <20190523190820.29375-5-dmurphy@ti.com>
References: <20190523190820.29375-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523190820.29375-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Add a new color ID that is declared as MULTICOLOR as with the
multicolor framework declaring a definitive color is not accurate
as the node can contain multiple colors.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 include/dt-bindings/leds/common.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index d8c8c38700bd..259cea653844 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -65,6 +65,7 @@
 #define LED_COLOR_ID_VIOLET	5
 #define LED_COLOR_ID_YELLOW	6
 #define LED_COLOR_ID_IR		7
-#define LED_COLOR_ID_COUNT	8
+#define LED_COLOR_ID_MULTI	8
+#define LED_COLOR_ID_COUNT	9
 
 #endif /* __DT_BINDINGS_LEDS_H */
-- 
2.21.0.5.gaeb582a983
