From: Daniel Romell <danielromell@gmail.com>
Subject: [PATCH] leds: Only remove trigger if one is actually configured.
Date: Wed, 14 Sep 2016 11:23:07 +0200
Message-ID: <1473844987-21112-1-git-send-email-daro@hms.se>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34478 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753254AbcINJXe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Sep 2016 05:23:34 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Romell <daro@hms.se>

In led_trigger_remove(), check if there is a trigger
configured before calling led_trigger_set(). This will
prevent some unnecessary work, and more importantly stop
sending uevent change events when no change has in fact
occurred.

Signed-off-by: Daniel Romell <daro@hms.se>
---
 drivers/leds/led-triggers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 59d6a3e..28c7a66 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -147,7 +147,8 @@ EXPORT_SYMBOL_GPL(led_trigger_set);
 void led_trigger_remove(struct led_classdev *led_cdev)
 {
 	down_write(&led_cdev->trigger_lock);
-	led_trigger_set(led_cdev, NULL);
+	if (led_cdev->trigger)
+		led_trigger_set(led_cdev, NULL);
 	up_write(&led_cdev->trigger_lock);
 }
 EXPORT_SYMBOL_GPL(led_trigger_remove);
-- 
2.7.4
