From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: triggers: Check return value of kobject_uevent_env()
Date: Mon, 19 Sep 2016 10:22:51 +0200
Message-ID: <1474273371-6535-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38537 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938550AbcISIXG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Sep 2016 04:23:06 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, greg@kroah.com, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Log error message if kobject_uevent_env() fails in led_trigger_set().

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/led-triggers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index c7a38d4..f538e8c 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -141,7 +141,8 @@ void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 	if (event) {
 		envp[0] = event;
 		envp[1] = NULL;
-		kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp);
+		if (kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp))
+			pr_err("Error sending uevent after setting LED trigger\n");
 		kfree(event);
 	}
 }
-- 
1.9.1
