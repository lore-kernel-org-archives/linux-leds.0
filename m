From: Kangjie Lu <kjlu@umn.edu>
Subject: [PATCH] leds: fix a potential NULL pointer dereference
Date: Sat,  9 Mar 2019 00:04:11 -0600
Message-ID: <20190309060411.29074-1-kjlu@umn.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kjlu@umn.edu
Cc: pakki001@umn.edu, Riku Voipio <riku.voipio@iki.fi>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

In case of_match_device cannot find a match, the fixes returns
-EINVAL to avoid NULL pointer dereference.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/leds/leds-pca9532.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 7fea18b0c15d..4b0335591728 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -513,6 +513,7 @@ static int pca9532_probe(struct i2c_client *client,
 	const struct i2c_device_id *id)
 {
 	int devid;
+	const struct of_device_id *of_id;
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	struct pca9532_platform_data *pca9532_pdata =
 			dev_get_platdata(&client->dev);
@@ -528,8 +529,11 @@ static int pca9532_probe(struct i2c_client *client,
 			dev_err(&client->dev, "no platform data\n");
 			return -EINVAL;
 		}
-		devid = (int)(uintptr_t)of_match_device(
-			of_pca9532_leds_match, &client->dev)->data;
+		of_id = of_match_device(of_pca9532_leds_match,
+				&client->dev);
+		if (unlikely(!of_id))
+			return -EINVAL;
+		devid = (int)of_id->data;
 	} else {
 		devid = id->driver_data;
 	}
-- 
2.17.1
