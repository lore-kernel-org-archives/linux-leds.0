From: Olliver Schinagl <oliver@schinagl.nl>
Subject: [PATCH 6/6] leds: pca963x: Remove whitespace and checkpatch problems
Date: Tue, 19 Apr 2016 09:40:50 +0200
Message-ID: <1461051650-18824-7-git-send-email-oliver@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Olliver Schinagl <oliver@schinagl.nl>
List-Id: linux-leds@vger.kernel.org

This patch does some whitespace fixing to make the entire driver more
consistent, especially with regards to alignment. Because of this it
also reduces quite some of the checkpatch warnings.

Two slightly 80 char warnings remain however to satisfy the alignment
check.

This patch does not introduce any binary changes.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 drivers/leds/leds-pca963x.c | 53 ++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 85dd506..5c4bf77 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -128,6 +128,10 @@
 #define PCA963X_PASSKEY1		0xa5
 #define PCA963X_PASSKEY2		0x5a
 
+/* Total blink period in milliseconds */
+#define PCA963X_BLINK_PERIOD_MIN	42
+#define PCA963X_BLINK_PERIOD_MAX	10667
+
 enum pca963x_type {
 	pca9633,
 	pca9634,
@@ -162,16 +166,12 @@ static struct pca963x_chipdef pca963x_chipdefs[] = {
 	},
 };
 
-/* Total blink period in milliseconds */
-#define PCA963X_BLINK_PERIOD_MIN	42
-#define PCA963X_BLINK_PERIOD_MAX	10667
-
 static const struct i2c_device_id pca963x_id[] = {
 	{ "pca9632", pca9633 },
 	{ "pca9633", pca9633 },
 	{ "pca9634", pca9634 },
 	{ "pca9635", pca9635 },
-	{ }
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, pca963x_id);
 
@@ -194,10 +194,10 @@ struct pca963x_led {
 };
 
 static int pca963x_brightness(struct pca963x_led *pca963x,
-			       enum led_brightness brightness)
+			      enum led_brightness brightness)
 {
-	u8 ledout_addr = pca963x->chip->chipdef->ledout_base
-		+ (pca963x->led_num / 4);
+	u8 ledout_addr = pca963x->chip->chipdef->ledout_base +
+			 (pca963x->led_num / 4);
 	u8 ledout;
 	int ret;
 
@@ -215,8 +215,8 @@ static int pca963x_brightness(struct pca963x_led *pca963x,
 		break;
 	default:
 		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
-			PCA963X_PWM_ADDR(pca963x->led_num),
-			brightness);
+						PCA963X_PWM_ADDR(pca963x->led_num),
+						brightness);
 		if (ret < 0)
 			goto unlock;
 		ledout |= PCA963X_LEDOUT_LDR(PCA963X_LEDOUT_LED_PWM,
@@ -233,21 +233,23 @@ unlock:
 static void pca963x_blink(struct pca963x_led *pca963x)
 {
 	u8 ledout_addr = pca963x->chip->chipdef->ledout_base +
-		(pca963x->led_num / 4);
+			 (pca963x->led_num / 4);
 	u8 ledout;
 	u8 mode2;
 
 	mutex_lock(&pca963x->chip->mutex);
 	i2c_smbus_write_byte_data(pca963x->chip->client,
-			pca963x->chip->chipdef->grppwm,	pca963x->gdc);
+				  pca963x->chip->chipdef->grppwm,
+				  pca963x->gdc);
 
 	i2c_smbus_write_byte_data(pca963x->chip->client,
-			pca963x->chip->chipdef->grpfreq, pca963x->gfrq);
+				  pca963x->chip->chipdef->grpfreq,
+				  pca963x->gfrq);
 
 	mode2 = i2c_smbus_read_byte_data(pca963x->chip->client, PCA963X_MODE2);
 	if (!(mode2 & PCA963X_MODE2_DMBLNK))
 		i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE2,
-			mode2 | PCA963X_MODE2_DMBLNK);
+					  mode2 | PCA963X_MODE2_DMBLNK);
 
 	ledout = i2c_smbus_read_byte_data(pca963x->chip->client, ledout_addr);
 	if ((ledout &
@@ -262,7 +264,7 @@ static void pca963x_blink(struct pca963x_led *pca963x)
 }
 
 static int pca963x_led_set(struct led_classdev *led_cdev,
-	enum led_brightness value)
+			   enum led_brightness value)
 {
 	struct pca963x_led *pca963x;
 
@@ -272,7 +274,7 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
 }
 
 static int pca963x_blink_set(struct led_classdev *led_cdev,
-		unsigned long *delay_on, unsigned long *delay_off)
+			     unsigned long *delay_on, unsigned long *delay_off)
 {
 	struct pca963x_led *pca963x;
 	unsigned long time_on, time_off, period;
@@ -291,7 +293,7 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 
 	period = time_on + time_off;
 
-	/* If period not supported by hardware, default to someting sane. */
+	/* If period not supported by hardware, default to something sane. */
 	if ((period < PCA963X_BLINK_PERIOD_MIN) ||
 	    (period > PCA963X_BLINK_PERIOD_MAX)) {
 		time_on = 500;
@@ -338,7 +340,8 @@ pca963x_dt_init(struct i2c_client *client, struct pca963x_chipdef *chip)
 		return ERR_PTR(-ENODEV);
 
 	pca963x_leds = devm_kzalloc(&client->dev,
-			sizeof(struct led_info) * chip->n_leds, GFP_KERNEL);
+				    sizeof(struct led_info) * chip->n_leds,
+				    GFP_KERNEL);
 	if (!pca963x_leds)
 		return ERR_PTR(-ENOMEM);
 
@@ -399,7 +402,7 @@ pca963x_dt_init(struct i2c_client *client, struct pca963x_chipdef *chip)
 #endif
 
 static int pca963x_probe(struct i2c_client *client,
-					const struct i2c_device_id *id)
+			 const struct i2c_device_id *id)
 {
 	struct pca963x *pca963x_chip;
 	struct pca963x_led *pca963x;
@@ -419,18 +422,18 @@ static int pca963x_probe(struct i2c_client *client,
 	}
 
 	if (pdata && (pdata->leds.num_leds < 1 ||
-				 pdata->leds.num_leds > chip->n_leds)) {
+		      pdata->leds.num_leds > chip->n_leds)) {
 		dev_err(&client->dev, "board info must claim 1-%d LEDs",
-								chip->n_leds);
+			chip->n_leds);
 		return -EINVAL;
 	}
 
 	pca963x_chip = devm_kzalloc(&client->dev, sizeof(*pca963x_chip),
-								GFP_KERNEL);
+				    GFP_KERNEL);
 	if (!pca963x_chip)
 		return -ENOMEM;
 	pca963x = devm_kzalloc(&client->dev, chip->n_leds * sizeof(*pca963x),
-								GFP_KERNEL);
+			       GFP_KERNEL);
 	if (!pca963x)
 		return -ENOMEM;
 
@@ -444,7 +447,7 @@ static int pca963x_probe(struct i2c_client *client,
 	/* Turn off LEDs by default*/
 	for (i = 0; i < chip->n_leds / 4; i++)
 		i2c_smbus_write_byte_data(client, chip->ledout_base + i,
-				PCA963X_LEDOUT_LDR(PCA963X_LEDOUT_LED_OFF, i));
+					  PCA963X_LEDOUT_LDR(PCA963X_LEDOUT_LED_OFF, i));
 
 	for (i = 0; i < chip->n_leds; i++) {
 		pca963x[i].led_num = i;
@@ -461,7 +464,7 @@ static int pca963x_probe(struct i2c_client *client,
 					pdata->leds.leds[i].default_trigger;
 		}
 		if (!pdata || i >= pdata->leds.num_leds ||
-						!pdata->leds.leds[i].name)
+		    !pdata->leds.leds[i].name)
 			snprintf(pca963x[i].name, sizeof(pca963x[i].name),
 				 "pca963x:%d:%.2x:%d", client->adapter->nr,
 				 client->addr, i);
-- 
2.8.0.rc3
