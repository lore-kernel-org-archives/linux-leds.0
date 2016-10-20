From: Matt Ranostay <mranostay@gmail.com>
Subject: [PATCH v2] leds: pca963x: enable low-power state
Date: Wed, 19 Oct 2016 17:03:48 -0700
Message-ID: <1476921828-4184-1-git-send-email-matt@ranostay.consulting>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33584 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756100AbcJTADx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Oct 2016 20:03:53 -0400
Received: by mail-pf0-f194.google.com with SMTP id i85so3723335pfa.0
        for <linux-leds@vger.kernel.org>; Wed, 19 Oct 2016 17:03:52 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Matt Ranostay <matt@ranostay.consulting>, Tony Lindgren <tony@atomide.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

Allow chip to enter low power state when no LEDs are being lit or in
blink mode.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
---
Changes from v1:
* remove runtime pm
* count leds that are off, if all then enter low-power state

 drivers/leds/leds-pca963x.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 407eba11e187..797dffc42c59 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -179,14 +179,32 @@ static void pca963x_blink(struct pca963x_led *pca963x)
 	mutex_unlock(&pca963x->chip->mutex);
 }
 
+static int pca963x_power_state(struct pca963x_led *pca963x)
+{
+	int i, leds_on = 0;
+
+	for (i = 0; i < pca963x->chip->chipdef->n_leds; i++) {
+		if (pca963x->chip->leds[i].led_cdev.brightness > 0)
+			leds_on++;
+	}
+
+	return i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE1,
+					 leds_on ? 0 : BIT(4));
+}
+
 static int pca963x_led_set(struct led_classdev *led_cdev,
 	enum led_brightness value)
 {
 	struct pca963x_led *pca963x;
+	int ret;
 
 	pca963x = container_of(led_cdev, struct pca963x_led, led_cdev);
 
-	return pca963x_brightness(pca963x, value);
+	ret = pca963x_brightness(pca963x, value);
+	if (ret < 0)
+		return ret;
+
+	return pca963x_power_state(pca963x);
 }
 
 static int pca963x_blink_set(struct led_classdev *led_cdev,
@@ -391,8 +409,8 @@ static int pca963x_probe(struct i2c_client *client,
 			goto exit;
 	}
 
-	/* Disable LED all-call address and set normal mode */
-	i2c_smbus_write_byte_data(client, PCA963X_MODE1, 0x00);
+	/* Disable LED all-call address, and power down initially */
+	i2c_smbus_write_byte_data(client, PCA963X_MODE1, BIT(4));
 
 	if (pdata) {
 		/* Configure output: open-drain or totem pole (push-pull) */
-- 
2.7.4
