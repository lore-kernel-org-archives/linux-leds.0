From: Olliver Schinagl <oliver@schinagl.nl>
Subject: [PATCH 4/6] leds: pca963x: Reduce magic values
Date: Tue, 19 Apr 2016 09:40:48 +0200
Message-ID: <1461051650-18824-5-git-send-email-oliver@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Olliver Schinagl <oliver@schinagl.nl>
List-Id: linux-leds@vger.kernel.org

This patch uses the newly introduced defines to further reduce magic
values and magic shifts. These changes have a slightly bigger impact as
they do introduce binary changes. There should be no logical changes
however.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 drivers/leds/leds-pca963x.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index e4e668d..14690f2 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -199,33 +199,32 @@ static int pca963x_brightness(struct pca963x_led *pca963x,
 	u8 ledout_addr = pca963x->chip->chipdef->ledout_base
 		+ (pca963x->led_num / 4);
 	u8 ledout;
-	int shift = 2 * (pca963x->led_num % 4);
-	u8 mask = 0x3 << shift;
 	int ret;
 
 	mutex_lock(&pca963x->chip->mutex);
 	ledout = i2c_smbus_read_byte_data(pca963x->chip->client, ledout_addr);
+	ledout &= ~PCA963X_LEDOUT_LDR(PCA963X_LEDOUT_MASK, pca963x->led_num);
 	switch (brightness) {
 	case LED_FULL:
-		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
-			ledout_addr,
-			(ledout & ~mask) | (PCA963X_LEDOUT_LED_ON << shift));
+		ledout |= PCA963X_LEDOUT_LDR(PCA963X_LEDOUT_LED_ON,
+					     pca963x->led_num);
 		break;
 	case LED_OFF:
-		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
-			ledout_addr, ledout & ~mask);
+		ledout |= PCA963X_LEDOUT_LDR(PCA963X_LEDOUT_LED_OFF,
+					     pca963x->led_num);
 		break;
 	default:
 		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
-			PCA963X_PWM_BASE + pca963x->led_num,
+			PCA963X_PWM_ADDR(pca963x->led_num),
 			brightness);
 		if (ret < 0)
 			goto unlock;
-		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
-			ledout_addr,
-			(ledout & ~mask) | (PCA963X_LEDOUT_LED_PWM << shift));
+		ledout |= PCA963X_LEDOUT_LDR(PCA963X_LEDOUT_LED_PWM,
+					     pca963x->led_num);
 		break;
 	}
+	ret = i2c_smbus_write_byte_data(pca963x->chip->client, ledout_addr,
+					ledout);
 unlock:
 	mutex_unlock(&pca963x->chip->mutex);
 	return ret;
@@ -237,8 +236,6 @@ static void pca963x_blink(struct pca963x_led *pca963x)
 		(pca963x->led_num / 4);
 	u8 ledout;
 	u8 mode2;
-	int shift = 2 * (pca963x->led_num % 4);
-	u8 mask = 0x3 << shift;
 
 	mutex_lock(&pca963x->chip->mutex);
 	i2c_smbus_write_byte_data(pca963x->chip->client,
@@ -253,9 +250,14 @@ static void pca963x_blink(struct pca963x_led *pca963x)
 			mode2 | PCA963X_MODE2_DMBLNK);
 
 	ledout = i2c_smbus_read_byte_data(pca963x->chip->client, ledout_addr);
-	if ((ledout & mask) != (PCA963X_LEDOUT_LED_GRP_PWM << shift))
+	if ((ledout &
+	     PCA963X_LEDOUT_LDR(PCA963X_LEDOUT_MASK, pca963x->led_num)) !=
+	     PCA963X_LEDOUT_LDR(PCA963X_LEDOUT_LED_GRP_PWM, pca963x->led_num)) {
+		ledout |= PCA963X_LEDOUT_LDR(PCA963X_LEDOUT_LED_GRP_PWM,
+					     pca963x->led_num);
 		i2c_smbus_write_byte_data(pca963x->chip->client, ledout_addr,
-			(ledout & ~mask) | (PCA963X_LEDOUT_LED_GRP_PWM << shift));
+					  ledout);
+	}
 	mutex_unlock(&pca963x->chip->mutex);
 }
 
-- 
2.8.0.rc3
