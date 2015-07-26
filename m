From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] leds: tlc591xx: Remove redundant I2C_FUNC_SMBUS_BYTE_DATA
 functionality check
Date: Sun, 26 Jul 2015 12:05:16 +0800
Message-ID: <1437883516.7007.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:33386 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750713AbbGZEFV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 26 Jul 2015 00:05:21 -0400
Received: by pdbnt7 with SMTP id nt7so33237461pdb.0
        for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2015 21:05:21 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

This checking is done by regmap_get_i2c_bus() which is called in
devm_regmap_init_i2c().

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/leds/leds-tlc591xx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index de16c29..b806eca 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -231,10 +231,6 @@ tlc591xx_probe(struct i2c_client *client,
 	if (!count || count > tlc591xx->max_leds)
 		return -EINVAL;
 
-	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_BYTE_DATA))
-		return -EIO;
-
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.1.0
