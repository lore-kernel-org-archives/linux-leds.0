From: Olliver Schinagl <oliver@schinagl.nl>
Subject: [PATCH 3/6] leds: pca963x: Add defines and remove some magic values
Date: Tue, 19 Apr 2016 09:40:47 +0200
Message-ID: <1461051650-18824-4-git-send-email-oliver@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Olliver Schinagl <oliver@schinagl.nl>
List-Id: linux-leds@vger.kernel.org

This patch adds some more defines so that the driver can receive
a little more future work. These new defines are then used throughout the
existing code the remove some magic values.

This patch does not produce any binary changes.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 drivers/leds/leds-pca963x.c | 144 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 114 insertions(+), 30 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 1c30e92..e4e668d 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -25,6 +25,7 @@
  * or by adding the 'nxp,hw-blink' property to the DTS.
  */
 
+#include <linux/bitops.h>
 #include <linux/ctype.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -36,17 +37,96 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
-/* LED select registers determine the source that drives LED outputs */
-#define PCA963X_LED_OFF		0x0	/* LED driver off */
-#define PCA963X_LED_ON		0x1	/* LED driver on */
-#define PCA963X_LED_PWM		0x2	/* Controlled through PWM */
-#define PCA963X_LED_GRP_PWM	0x3	/* Controlled through PWM/GRPPWM */
-
-#define PCA963X_MODE2_DMBLNK	0x20	/* Enable blinking */
-
-#define PCA963X_MODE1		0x00
-#define PCA963X_MODE2		0x01
-#define PCA963X_PWM_BASE	0x02
+/* The number of led drivers per chip */
+#define PCA9633_NUM_LEDS	4
+#define PCA9634_NUM_LEDS	8
+#define PCA9635_NUM_LEDS	16
+
+#define PCA963X_MODE1		0x00 /* Mode 1 register addr */
+#define PCA963X_MODE2		0x01 /* Mode 2 register addr */
+#define PCA963X_PWM0_ADDR	0x02 /* PWM0 duty cycle */
+#define PCA963X_PWM1_ADDR	0x03 /* PWM1 duty cycle */
+#define PCA963X_PWM2_ADDR	0x04 /* PWM2 duty cycle */
+#define PCA963X_PWM3_ADDR	0x05 /* PWM3 duty cycle */
+#define PCA963X_PWM4_ADDR	0x06 /* PWM4 duty cycle */
+#define PCA963X_PWM5_ADDR	0x07 /* PWM5 duty cycle */
+#define PCA963X_PWM6_ADDR	0x08 /* PWM6 duty cycle */
+#define PCA963X_PWM7_ADDR	0x09 /* PWM7 duty cycle */
+#define PCA963X_PWM8_ADDR	0x0a /* PWM8 duty cycle */
+#define PCA963X_PWM9_ADDR	0x0b /* PWM9 duty cycle */
+#define PCA963X_PWM10_ADDR	0x0c /* PWM10 duty cycle */
+#define PCA963X_PWM11_ADDR	0x0d /* PWM11 duty cycle */
+#define PCA963X_PWM12_ADDR	0x0e /* PWM12 duty cycle */
+#define PCA963X_PWM13_ADDR	0x0f /* PWM13 duty cycle */
+#define PCA963X_PWM14_ADDR	0x10 /* PWM14 duty cycle */
+#define PCA963X_PWM15_ADDR	0x11 /* PWM15 duty cycle */
+#define PCA9633_GRPPWM		0x06 /* Group PWM duty cycle ctrl for PCA9633 */
+#define PCA9634_GRPPWM		0x0a /* Group PWM duty cycle ctrl for PCA9634 */
+#define PCA9635_GRPPWM		0x12 /* Group PWM duty cycle ctrl for PCA9635 */
+#define PCA9633_GRPFREQ		0x07 /* Group frequency control for PCA9633 */
+#define PCA9634_GRPFREQ		0x0b /* Group frequency control for PCA9634 */
+#define PCA9635_GRPFREQ		0x13 /* Group frequency control for PCA9635 */
+#define PCA9633_LEDOUT0		0x08 /* Led output state 0 reg for PCA9633 */
+#define PCA9634_LEDOUT0		0x0c /* Led output state 0 reg for PCA9635 */
+#define PCA9634_LEDOUT1		0x0d /* Led output state 1 reg for PCA9634 */
+#define PCA9635_LEDOUT0		0x14 /* Led output state 0 reg for PCA9634 */
+#define PCA9635_LEDOUT1		0x15 /* Led output state 1 reg for PCA9635 */
+#define PCA9635_LEDOUT2		0x16 /* Led output state 2 reg for PCA9635 */
+#define PCA9635_LEDOUT3		0x17 /* Led output state 3 reg for PCA9635 */
+#define PCA9633_SUBADDR1	0x09 /* I2C subaddr 1 for PCA9633 */
+#define PCA9633_SUBADDR2	0x0a /* I2C subaddr 2 for PCA9633 */
+#define PCA9633_SUBADDR3	0x0b /* I2C subaddr 3 for PCA9633 */
+#define PCA9634_SUBADDR1	0x0e /* I2C subaddr 1 for PCA9634 */
+#define PCA9634_SUBADDR2	0x0f /* I2C subaddr 2 for PCA9634 */
+#define PCA9634_SUBADDR3	0x10 /* I2C subaddr 3 for PCA9634 */
+#define PCA9635_SUBADDR1	0x18 /* I2C subaddr 1 for PCA9635 */
+#define PCA9635_SUBADDR2	0x19 /* I2C subaddr 2 for PCA9635 */
+#define PCA9635_SUBADDR3	0x1a /* I2C subaddr 3 for PCA9635 */
+#define PCA9633_ALLCALLADDR	0x0c /* I2C Led all call address for PCA9633 */
+#define PCA9634_ALLCALLADDR	0x11 /* I2C Led all call address for PCA9634 */
+#define PCA9635_ALLCALLADDR	0x1b /* I2C Led all call address for PCA9635 */
+
+/* Helper mappings */
+#define PCA963X_PWM_ADDR(led)	(PCA963X_PWM0_ADDR + (led))
+#define PCA9633_LEDOUT_BASE	PCA9633_LEDOUT0
+#define PCA9634_LEDOUT_BASE	PCA9634_LEDOUT0
+#define PCA9635_LEDOUT_BASE	PCA9635_LEDOUT0
+
+/* MODE1 register */
+#define PCA963X_MODE1_ALLCALL_ON	BIT(0) /* Respond to LED All Call */
+#define PCA963X_MODE1_RESPOND_SUB3	BIT(1) /* Respond to Sub address 3 */
+#define PCA963X_MODE1_RESPOND_SUB2	BIT(2) /* Respond to Sub address 2 */
+#define PCA963X_MODE1_RESPOND_SUB1	BIT(3) /* Respond to Sub address 1 */
+#define PCA963X_MODE1_SLEEP		BIT(4) /* Put in low power mode */
+#define PCA963X_MODE1_AI_EN		BIT(5) /* Enable Auto-increment */
+#define PCA963X_MODE1_AI_ROLL_PWM	BIT(6) /* Auto-increment only PWM's */
+#define PCA963X_MODE1_AI_ROLL_GRP	BIT(7) /* AI only group-controls */
+
+/* MODE2 register */
+#define PCA963X_MODE2_OUTNE_OUTDRV	BIT(0) /* Outdrv determines led state */
+#define PCA963X_MODE2_OUTNE_HIZ		BIT(1) /* Led-state in Hi-Z */
+#define PCA963X_MODE2_OUTDRV_TOTEM_POLE	BIT(2) /* Outputs are totem-pole'd */
+#define PCA963X_MODE2_OCH_ACK		BIT(3) /* Out change on ACK else STOP */
+#define PCA963X_MODE2_INVRT		BIT(4) /* Output logic state inverted */
+#define PCA963X_MODE2_DMBLNK		BIT(5) /* Grp-ctrl blink else dimming */
+
+/* LED driver output state */
+#define PCA963X_LEDOUT_LED_OFF		0x0 /* LED off */
+#define PCA963X_LEDOUT_LED_ON		0x1 /* LED fully-on */
+#define PCA963X_LEDOUT_LED_PWM		0x2 /* LED PWM mode */
+#define PCA963X_LEDOUT_LED_GRP_PWM	0x3 /* LED PWM + group PWM mode */
+
+#define PCA963X_LEDOUT_MASK		PCA963X_LEDOUT_LED_GRP_PWM
+#define PCA963X_LEDOUT_LDR(x, led_num)	\
+	(((x) & PCA963X_LEDOUT_MASK) << ((led_num % 4) << 1))
+
+/* Addressing register helpers */
+#define PCA963X_SUBADDR_SET(x)		(((x) << 1) & 0xfe)
+#define PCA963X_ALLCALLADDR_SET(x)	(((x) << 1) & 0xfe)
+
+/* Software reset password */
+#define PCA963X_PASSKEY1		0xa5
+#define PCA963X_PASSKEY2		0x5a
 
 enum pca963x_type {
 	pca9633,
@@ -63,22 +143,22 @@ struct pca963x_chipdef {
 
 static struct pca963x_chipdef pca963x_chipdefs[] = {
 	[pca9633] = {
-		.grppwm		= 0x6,
-		.grpfreq	= 0x7,
-		.ledout_base	= 0x8,
-		.n_leds		= 4,
+		.grppwm		= PCA9633_GRPPWM,
+		.grpfreq	= PCA9633_GRPFREQ,
+		.ledout_base	= PCA9633_LEDOUT_BASE,
+		.n_leds		= PCA9633_NUM_LEDS,
 	},
 	[pca9634] = {
-		.grppwm		= 0xa,
-		.grpfreq	= 0xb,
-		.ledout_base	= 0xc,
-		.n_leds		= 8,
+		.grppwm		= PCA9634_GRPPWM,
+		.grpfreq	= PCA9634_GRPFREQ,
+		.ledout_base	= PCA9634_LEDOUT_BASE,
+		.n_leds		= PCA9634_NUM_LEDS,
 	},
 	[pca9635] = {
-		.grppwm		= 0x12,
-		.grpfreq	= 0x13,
-		.ledout_base	= 0x14,
-		.n_leds		= 16,
+		.grppwm		= PCA9635_GRPPWM,
+		.grpfreq	= PCA9635_GRPFREQ,
+		.ledout_base	= PCA9635_LEDOUT_BASE,
+		.n_leds		= PCA9635_NUM_LEDS,
 	},
 };
 
@@ -129,7 +209,7 @@ static int pca963x_brightness(struct pca963x_led *pca963x,
 	case LED_FULL:
 		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
 			ledout_addr,
-			(ledout & ~mask) | (PCA963X_LED_ON << shift));
+			(ledout & ~mask) | (PCA963X_LEDOUT_LED_ON << shift));
 		break;
 	case LED_OFF:
 		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
@@ -143,7 +223,7 @@ static int pca963x_brightness(struct pca963x_led *pca963x,
 			goto unlock;
 		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
 			ledout_addr,
-			(ledout & ~mask) | (PCA963X_LED_PWM << shift));
+			(ledout & ~mask) | (PCA963X_LEDOUT_LED_PWM << shift));
 		break;
 	}
 unlock:
@@ -173,9 +253,9 @@ static void pca963x_blink(struct pca963x_led *pca963x)
 			mode2 | PCA963X_MODE2_DMBLNK);
 
 	ledout = i2c_smbus_read_byte_data(pca963x->chip->client, ledout_addr);
-	if ((ledout & mask) != (PCA963X_LED_GRP_PWM << shift))
+	if ((ledout & mask) != (PCA963X_LEDOUT_LED_GRP_PWM << shift))
 		i2c_smbus_write_byte_data(pca963x->chip->client, ledout_addr,
-			(ledout & ~mask) | (PCA963X_LED_GRP_PWM << shift));
+			(ledout & ~mask) | (PCA963X_LEDOUT_LED_GRP_PWM << shift));
 	mutex_unlock(&pca963x->chip->mutex);
 }
 
@@ -358,7 +438,8 @@ static int pca963x_probe(struct i2c_client *client,
 
 	/* Turn off LEDs by default*/
 	for (i = 0; i < chip->n_leds / 4; i++)
-		i2c_smbus_write_byte_data(client, chip->ledout_base + i, 0x00);
+		i2c_smbus_write_byte_data(client, chip->ledout_base + i,
+				PCA963X_LEDOUT_LDR(PCA963X_LEDOUT_LED_OFF, i));
 
 	for (i = 0; i < chip->n_leds; i++) {
 		pca963x[i].led_num = i;
@@ -397,9 +478,12 @@ static int pca963x_probe(struct i2c_client *client,
 	if (pdata) {
 		/* Configure output: open-drain or totem pole (push-pull) */
 		if (pdata->outdrv == PCA963X_OPEN_DRAIN)
-			i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x01);
+			i2c_smbus_write_byte_data(client, PCA963X_MODE2,
+					PCA963X_MODE2_OUTNE_OUTDRV);
 		else
-			i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x05);
+			i2c_smbus_write_byte_data(client, PCA963X_MODE2,
+					PCA963X_MODE2_OUTNE_OUTDRV |
+					PCA963X_MODE2_OUTDRV_TOTEM_POLE);
 	}
 
 	return 0;
-- 
2.8.0.rc3
