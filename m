From: Peter Meerwald <pmeerw@pmeerw.net>
Subject: [PATCH v2 2/3] leds:pca963x: Always initialize MODE2 register
Date: Thu,  3 Jul 2014 07:50:35 +0200
Message-ID: <1404366636-25469-2-git-send-email-pmeerw@pmeerw.net>
References: <1404366636-25469-1-git-send-email-pmeerw@pmeerw.net>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ns.pmeerw.net ([87.118.82.44]:38740 "EHLO pmeerw.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750707AbaGCFv1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 3 Jul 2014 01:51:27 -0400
In-Reply-To: <1404366636-25469-1-git-send-email-pmeerw@pmeerw.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, rpurdie@rpsys.net, Peter Meerwald <pmeerw@pmeerw.net>

PCA9632 defaults to open-drain
PCA9633/4/5 defaults to totem-pole

the driver assumed that totem-pole default and didn't actively set
the value; the MODE2 register is now written if platform
data indicating the mode is given

Signed-off-by: Peter Meerwald <pmeerw@pmeerw.net>
---
 drivers/leds/leds-pca963x.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 4438be9..f110b4c 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -423,9 +423,13 @@ static int pca963x_probe(struct i2c_client *client,
 	/* Disable LED all-call address and set normal mode */
 	i2c_smbus_write_byte_data(client, PCA963X_MODE1, 0x00);
 
-	/* Configure output: open-drain or totem pole (push-pull) */
-	if (pdata && pdata->outdrv == PCA963X_OPEN_DRAIN)
-		i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x01);
+	if (pdata) {
+		/* Configure output: open-drain or totem pole (push-pull) */
+		if (pdata->outdrv == PCA963X_OPEN_DRAIN)
+			i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x01);
+		else
+			i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x05);
+	}
 
 	return 0;
 
-- 
1.7.9.5
