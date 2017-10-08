From: Christos Gkekas <chris.gekas@gmail.com>
Subject: [PATCH] leds: tca6507: Remove unnecessary reg check
Date: Sun,  8 Oct 2017 19:55:05 +0100
Message-ID: <1507488905-23169-1-git-send-email-chris.gekas@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36622 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753381AbdJHSzK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Oct 2017 14:55:10 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Christos Gkekas <chris.gekas@gmail.com>

Variable reg is unsigned so checking whether it is less than zero is not
necessary.

Signed-off-by: Christos Gkekas <chris.gekas@gmail.com>
---
 drivers/leds/leds-tca6507.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 45222a7..c12c16f 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -715,7 +715,7 @@ tca6507_led_dt_init(struct i2c_client *client)
 		if (of_property_match_string(child, "compatible", "gpio") >= 0)
 			led.flags |= TCA6507_MAKE_GPIO;
 		ret = of_property_read_u32(child, "reg", &reg);
-		if (ret != 0 || reg < 0 || reg >= NUM_LEDS)
+		if (ret != 0 || reg >= NUM_LEDS)
 			continue;
 
 		tca_leds[reg] = led;
-- 
2.7.4
