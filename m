From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] leds: blinkm: avoid uninitialized data use
Date: Mon,  4 Dec 2017 15:45:29 +0100
Message-ID: <20171204144538.304782-1-arnd@arndb.de>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:60057 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752529AbdLDOpy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Dec 2017 09:45:54 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jan-Simon Moeller <jansimon.moeller@gmx.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

gcc-8 reports missing error handling in blinkm_detect, when blinkm()
fails, tmpargs[] is uninitialized:

drivers/leds/leds-blinkm.c: In function 'blinkm_detect':
drivers/leds/leds-blinkm.c:555:6: error: 'tmpargs' may be used uninitialized in this function [-Werror=maybe-uninitialized]

This adds a missing error checks.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/leds-blinkm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index d03ed6b4176b..851c1920b63c 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -549,8 +549,12 @@ static int blinkm_detect(struct i2c_client *client, struct i2c_board_info *info)
 	/* make sure the blinkM is balanced (read/writes) */
 	while (count > 0) {
 		ret = blinkm_write(client, BLM_GET_ADDR, NULL);
+		if (ret)
+			return ret;
 		usleep_range(5000, 10000);
 		ret = blinkm_read(client, BLM_GET_ADDR, tmpargs);
+		if (ret)
+			return ret;
 		usleep_range(5000, 10000);
 		if (tmpargs[0] == 0x09)
 			count = 0;
-- 
2.9.0
