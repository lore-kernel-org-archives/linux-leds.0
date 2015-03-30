From: Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH 2/2] leds:lp8860: Fix typo in MODULE_DESCRIPTION in leds-lp8860.c
Date: Mon, 30 Mar 2015 18:50:11 +0900
Message-ID: <1427709011-5057-2-git-send-email-standby24x7@gmail.com>
References: <1427709011-5057-1-git-send-email-standby24x7@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:35983 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751792AbbC3JuG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 05:50:06 -0400
Received: by pdcp1 with SMTP id p1so79033309pdc.3
        for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2015 02:50:05 -0700 (PDT)
In-Reply-To: <1427709011-5057-1-git-send-email-standby24x7@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.krenel.org, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org
Cc: trivial@kernel.org, dmurphy@ti.com, milo.kim@ti.com, Masanari Iida <standby24x7@gmail.com>

This patch fix a spelling typo in MODULE_DESCRIPTION in
leds-lp8860.c

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 drivers/leds/leds-lp8860.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index f2a29c2..8c2b7fb 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -488,6 +488,6 @@ static struct i2c_driver lp8860_driver = {
 };
 module_i2c_driver(lp8860_driver);
 
-MODULE_DESCRIPTION("Texas Instruments LP8860 LED drvier");
+MODULE_DESCRIPTION("Texas Instruments LP8860 LED driver");
 MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
 MODULE_LICENSE("GPL");
-- 
2.3.4.274.g92e625d
