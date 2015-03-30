From: Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH 1/2] leds: lp8501: Fix typo in MODULE_DESCRIPTION in leds-lp8501.c
Date: Mon, 30 Mar 2015 18:50:10 +0900
Message-ID: <1427709011-5057-1-git-send-email-standby24x7@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:34269 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751792AbbC3JuB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 05:50:01 -0400
Received: by pdbni2 with SMTP id ni2so170669393pdb.1
        for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2015 02:50:00 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.krenel.org, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org
Cc: trivial@kernel.org, dmurphy@ti.com, milo.kim@ti.com, Masanari Iida <standby24x7@gmail.com>

This patch fix a spelling typo in MODULE_DESCRIPTION in
leds-lp8501.c

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 drivers/leds/leds-lp8501.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 00f068b..d3098e3 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -406,6 +406,6 @@ static struct i2c_driver lp8501_driver = {
 
 module_i2c_driver(lp8501_driver);
 
-MODULE_DESCRIPTION("Texas Instruments LP8501 LED drvier");
+MODULE_DESCRIPTION("Texas Instruments LP8501 LED driver");
 MODULE_AUTHOR("Milo Kim");
 MODULE_LICENSE("GPL");
-- 
2.3.4.274.g92e625d
