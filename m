From: Olliver Schinagl <oliver@schinagl.nl>
Subject: [PATCH 1/6] leds: pca963x: Alphabetize headers
Date: Tue, 19 Apr 2016 09:40:45 +0200
Message-ID: <1461051650-18824-2-git-send-email-oliver@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Olliver Schinagl <oliver@schinagl.nl>
List-Id: linux-leds@vger.kernel.org

Re-order headers so they are in alphabetical order.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 drivers/leds/leds-pca963x.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 407eba1..8dabf7a 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -25,16 +25,16 @@
  * or by adding the 'nxp,hw-blink' property to the DTS.
  */
 
-#include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/string.h>
 #include <linux/ctype.h>
-#include <linux/leds.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/slab.h>
+#include <linux/leds.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_data/leds-pca963x.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 
 /* LED select registers determine the source that drives LED outputs */
 #define PCA963X_LED_OFF		0x0	/* LED driver off */
-- 
2.8.0.rc3
