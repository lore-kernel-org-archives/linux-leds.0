From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/2] leds: lp8860: Fix linuxdoc format for structure
Date: Wed, 15 Nov 2017 13:52:12 -0600
Message-ID: <20171115195213.8404-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:20165 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754905AbdKOTwq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Nov 2017 14:52:46 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

Fix the linuxdoc format defining the lp8860 structure.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp8860.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 3e70775a2d54..91b6c5fbd361 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -98,7 +98,7 @@
  * @enable_gpio - VDDIO/EN gpio to enable communication interface
  * @regulator - LED supply regulator pointer
  * @label - LED label
-**/
+ */
 struct lp8860_led {
 	struct mutex lock;
 	struct i2c_client *client;
-- 
2.15.0.124.g7668cbc60
