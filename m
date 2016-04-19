From: Olliver Schinagl <oliver@schinagl.nl>
Subject: [PATCH 2/6] leds: pca963x: Lock i2c r/w access
Date: Tue, 19 Apr 2016 09:40:46 +0200
Message-ID: <1461051650-18824-3-git-send-email-oliver@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Olliver Schinagl <oliver@schinagl.nl>
List-Id: linux-leds@vger.kernel.org

A pca963x device can have multiple leds with a single i2c channel to
access them. Some of the registers are shared between each other. To
ensure all i2c operations are atomic within an instance, we move some
mutex locks slightly around to guard these access.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 drivers/leds/leds-pca963x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 8dabf7a..1c30e92 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -99,7 +99,7 @@ struct pca963x_led;
 
 struct pca963x {
 	struct pca963x_chipdef *chipdef;
-	struct mutex mutex;
+	struct mutex mutex; /* protect i2c access to/from the pca963x chip */
 	struct i2c_client *client;
 	struct pca963x_led *leds;
 };
@@ -156,22 +156,22 @@ static void pca963x_blink(struct pca963x_led *pca963x)
 	u8 ledout_addr = pca963x->chip->chipdef->ledout_base +
 		(pca963x->led_num / 4);
 	u8 ledout;
-	u8 mode2 = i2c_smbus_read_byte_data(pca963x->chip->client,
-							PCA963X_MODE2);
+	u8 mode2;
 	int shift = 2 * (pca963x->led_num % 4);
 	u8 mask = 0x3 << shift;
 
+	mutex_lock(&pca963x->chip->mutex);
 	i2c_smbus_write_byte_data(pca963x->chip->client,
 			pca963x->chip->chipdef->grppwm,	pca963x->gdc);
 
 	i2c_smbus_write_byte_data(pca963x->chip->client,
 			pca963x->chip->chipdef->grpfreq, pca963x->gfrq);
 
+	mode2 = i2c_smbus_read_byte_data(pca963x->chip->client, PCA963X_MODE2);
 	if (!(mode2 & PCA963X_MODE2_DMBLNK))
 		i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE2,
 			mode2 | PCA963X_MODE2_DMBLNK);
 
-	mutex_lock(&pca963x->chip->mutex);
 	ledout = i2c_smbus_read_byte_data(pca963x->chip->client, ledout_addr);
 	if ((ledout & mask) != (PCA963X_LED_GRP_PWM << shift))
 		i2c_smbus_write_byte_data(pca963x->chip->client, ledout_addr,
-- 
2.8.0.rc3
