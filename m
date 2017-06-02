From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH] leds: bcm6328: fix signal source assignment for leds 4 to 7
Date: Fri,  2 Jun 2017 14:17:05 +0200
Message-ID: <20170602121705.9645-1-jonas.gorski@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35374 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751125AbdFBMRH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 2 Jun 2017 08:17:07 -0400
Received: by mail-wm0-f68.google.com with SMTP id g15so18610774wmc.2
        for <linux-leds@vger.kernel.org>; Fri, 02 Jun 2017 05:17:06 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

Each nibble represents 4 LEDs, and in case of the higher register, bit 0
represents LED 4, so we need to use modulus for the LED number as well.

Fixes: fd7b025a238d0a5440bfa26c585eb78097bf48dc ("leds: add BCM6328 LED driver")
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/leds/leds-bcm6328.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 1548259297c1..2cfd9389ee96 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -242,7 +242,7 @@ static int bcm6328_hwled(struct device *dev, struct device_node *nc, u32 reg,
 
 		spin_lock_irqsave(lock, flags);
 		val = bcm6328_led_read(addr);
-		val |= (BIT(reg) << (((sel % 4) * 4) + 16));
+		val |= (BIT(reg % 4) << (((sel % 4) * 4) + 16));
 		bcm6328_led_write(addr, val);
 		spin_unlock_irqrestore(lock, flags);
 	}
@@ -269,7 +269,7 @@ static int bcm6328_hwled(struct device *dev, struct device_node *nc, u32 reg,
 
 		spin_lock_irqsave(lock, flags);
 		val = bcm6328_led_read(addr);
-		val |= (BIT(reg) << ((sel % 4) * 4));
+		val |= (BIT(reg % 4) << ((sel % 4) * 4));
 		bcm6328_led_write(addr, val);
 		spin_unlock_irqrestore(lock, flags);
 	}
-- 
2.11.0
