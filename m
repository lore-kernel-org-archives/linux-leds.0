From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] leds: lp55xx: fix spelling mistake: 'cound' -> 'could'
Date: Sun, 29 Oct 2017 11:25:47 +0530
Message-ID: <429d064a947efc6e55b057ead58ac0b0a598e391.1509256447.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:56599 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751487AbdJ2F4C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Oct 2017 01:56:02 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Trivial fix to spelling mistakes in 'lp5523_init_program_engine'.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/leds/leds-lp5523.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 924e50a..52b6f529 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -323,7 +323,7 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
 
 	if (status != LP5523_ENG_STATUS_MASK) {
 		dev_err(&chip->cl->dev,
-			"cound not configure LED engine, status = 0x%.2x\n",
+			"could not configure LED engine, status = 0x%.2x\n",
 			status);
 		ret = -1;
 	}
-- 
2.7.4
