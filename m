From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 5/9] leds: Add multicolor ID to the color ID list
Date: Thu, 23 May 2019 14:08:16 -0500
Message-ID: <20190523190820.29375-6-dmurphy@ti.com>
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
 drivers/leds/led-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 0ce1f4aeca92..e1e1749b119d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -38,6 +38,7 @@ const char *led_colors[LED_COLOR_ID_COUNT] = {
 	[LED_COLOR_ID_VIOLET] = "violet",
 	[LED_COLOR_ID_YELLOW] = "yellow",
 	[LED_COLOR_ID_IR] = "ir",
+	[LED_COLOR_ID_MULTI] = "multicolor",
 };
 EXPORT_SYMBOL_GPL(led_colors);
 
-- 
2.21.0.5.gaeb582a983
