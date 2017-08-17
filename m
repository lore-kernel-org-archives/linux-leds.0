From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH] leds: pca955x: Prevent crippled LED device name
Date: Thu, 17 Aug 2017 22:56:04 +0200
Message-ID: <1503003364-14952-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33856 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753297AbdHQU5I (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2017 16:57:08 -0400
Received: by mail-wr0-f194.google.com with SMTP id p14so1717440wrg.1
        for <linux-leds@vger.kernel.org>; Thu, 17 Aug 2017 13:57:07 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: colin.king@canonical.com, dan.carpenter@oracle.com, ncase@xes-inc.com, Jacek Anaszewski <jacek.anaszewski@gmail.com>

In case platform data provided empty LED name string the resulting
LED class device name would be crippled. Use corresponding LED chip
bit in place of "function" segment of LED class device name then to
make the LEDs at least distinguishable.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Reported-by: Colin King <colin.king@canonical.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Nate Case <ncase@xes-inc.com>
---
 drivers/leds/leds-pca955x.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index f062d1e..09303fd 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -473,10 +473,14 @@ static int pca955x_probe(struct i2c_client *client,
 			 * Platform data can specify LED names and
 			 * default triggers
 			 */
-			if (pdata->leds[i].name)
-				snprintf(pca955x_led->name,
-					sizeof(pca955x_led->name), "pca955x:%s",
-					pdata->leds[i].name);
+			if (pdata->leds[i].name[0] == '\0')
+				snprintf(pdata->leds[i].name,
+					sizeof(pdata->leds[i].name), "%d", i);
+
+			snprintf(pca955x_led->name,
+				sizeof(pca955x_led->name), "pca955x:%s",
+				pdata->leds[i].name);
+
 			if (pdata->leds[i].default_trigger)
 				pca955x_led->led_cdev.default_trigger =
 					pdata->leds[i].default_trigger;
-- 
2.1.4
