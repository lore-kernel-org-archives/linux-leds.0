From: Toshi Kikuchi <toshik@chromium.org>
Subject: [PATCH] leds: lp55xx: avoid dereferencing a stale platform_data pointer
Date: Mon,  3 Aug 2015 17:47:04 -0700
Message-ID: <1438649224-21989-1-git-send-email-toshik@chromium.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:33208 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932229AbbHDArJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2015 20:47:09 -0400
Received: by pdbnt7 with SMTP id nt7so80136634pdb.0
        for <linux-leds@vger.kernel.org>; Mon, 03 Aug 2015 17:47:09 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: milo.kim@ti.com

lp55xx_of_populate_pdata() allocates platform_data dynamically if DT
is used. The memory area is allocated with devm_kzalloc() so it is
automatically freed if the driver is unloaded. The driver should clear
the pointer to platform_data before it is unloaded, otherwise it will
use the stale pointer accidentally if the driver is reloaded.

Change-Id: Ia097ed83b92cec5a52534a71dcb5322869c2a7b1
Signed-off-by: Toshi Kikuchi <toshik@chromium.org>
---
 drivers/leds/leds-lp5521.c | 3 +++
 drivers/leds/leds-lp5523.c | 3 +++
 drivers/leds/leds-lp5562.c | 3 +++
 drivers/leds/leds-lp8501.c | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 8ca197a..1f39922 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -582,6 +582,9 @@ static int lp5521_remove(struct i2c_client *client)
 	lp55xx_unregister_leds(led, chip);
 	lp55xx_deinit_device(chip);
 
+	if (client->dev.of_node)
+		client->dev.platform_data = NULL;
+
 	return 0;
 }
 
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 584dbbc..15e10da 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -948,6 +948,9 @@ static int lp5523_remove(struct i2c_client *client)
 	lp55xx_unregister_leds(led, chip);
 	lp55xx_deinit_device(chip);
 
+	if (client->dev.of_node)
+		client->dev.platform_data = NULL;
+
 	return 0;
 }
 
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index ca85724..32c8392 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -582,6 +582,9 @@ static int lp5562_remove(struct i2c_client *client)
 	lp55xx_unregister_leds(led, chip);
 	lp55xx_deinit_device(chip);
 
+	if (client->dev.of_node)
+		client->dev.platform_data = NULL;
+
 	return 0;
 }
 
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index d3098e3..e8542be 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -376,6 +376,9 @@ static int lp8501_remove(struct i2c_client *client)
 	lp55xx_unregister_leds(led, chip);
 	lp55xx_deinit_device(chip);
 
+	if (client->dev.of_node)
+		client->dev.platform_data = NULL;
+
 	return 0;
 }
 
-- 
2.2.1.62.g3f15098
