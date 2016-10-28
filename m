From: Matt Ranostay <mranostay@gmail.com>
Subject: [PATCH v4] leds: pca963x: enable low-power state
Date: Thu, 27 Oct 2016 19:53:15 -0700
Message-ID: <1477623195-32091-1-git-send-email-matt@ranostay.consulting>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36300 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751584AbcJ1C7u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Oct 2016 22:59:50 -0400
Received: by mail-pf0-f193.google.com with SMTP id n85so4234333pfi.3
        for <linux-leds@vger.kernel.org>; Thu, 27 Oct 2016 19:59:50 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Matt Ranostay <matt@ranostay.consulting>, Peter Meerwald <p.meerwald@bct-electronic.com>, Ricardo Ribalda <ricardo.ribalda@gmail.com>, Tony Lindgren <tony@atomide.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

Allow chip to enter low power state when no LEDs are being lit or in
blink mode.

Cc: Peter Meerwald <p.meerwald@bct-electronic.com>,
Cc: Ricardo Ribalda <ricardo.ribalda@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
---
Changes from v1:
* remove runtime pm
* count leds that are off, if all then enter low-power state

Changes from v2:
* add reference count of leds to reduce i2c transactions

Changes from v3:
* switch to checking bitmask to reduce i2c transactions

 drivers/leds/leds-pca963x.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index b6ce1f2ec33e..f541c47cd58d 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -103,6 +103,7 @@ struct pca963x {
 	struct mutex mutex;
 	struct i2c_client *client;
 	struct pca963x_led *leds;
+	unsigned long leds_on;
 };
 
 struct pca963x_led {
@@ -180,14 +181,42 @@ static void pca963x_blink(struct pca963x_led *pca963x)
 	mutex_unlock(&pca963x->chip->mutex);
 }
 
+static int pca963x_power_state(struct pca963x_led *pca963x)
+{
+	unsigned long *leds_on = &pca963x->chip->leds_on;
+	unsigned long cached_leds = pca963x->chip->leds_on;
+
+	if (pca963x->led_cdev.brightness > 0) {
+		if (test_bit(pca963x->led_num, leds_on))
+			return 0;
+
+		set_bit(pca963x->led_num, leds_on);
+	} else
+		clear_bit(pca963x->led_num, leds_on);
+
+	if (!cached_leds && *leds_on)
+		return i2c_smbus_write_byte_data(pca963x->chip->client,
+					PCA963X_MODE1, 0x00);
+	else if (!(*leds_on) && cached_leds)
+		return i2c_smbus_write_byte_data(pca963x->chip->client,
+					PCA963X_MODE1, BIT(4));
+
+	return 0;
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
 
 static unsigned int pca963x_period_scale(struct pca963x_led *pca963x,
@@ -403,8 +432,8 @@ static int pca963x_probe(struct i2c_client *client,
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
