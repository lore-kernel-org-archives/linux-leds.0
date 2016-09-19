From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v3] leds: triggers: Check return value of kobject_uevent_env()
Date: Mon, 19 Sep 2016 12:52:24 +0200
Message-ID: <1474282344-11496-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53411 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752725AbcISKwj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Sep 2016 06:52:39 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, greg@kroah.com, joe@perches.com, Jacek Anaszewski <j.anaszewski@samsung.com>

Log error message if kobject_uevent_env() fails in led_trigger_set().

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
Changes from v1:
- switched to using dev_err() instead of pr_err()
Changes from v2:
- switched to using __func__ instead of explicit function name,
  to simplify code maintenance

 drivers/leds/led-triggers.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index c7a38d4..431123b 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -141,7 +141,9 @@ void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 	if (event) {
 		envp[0] = event;
 		envp[1] = NULL;
-		kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp);
+		if (kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp))
+			dev_err(led_cdev->dev,
+				"%s: Error sending uevent\n", __func__);
 		kfree(event);
 	}
 }
-- 
1.9.1
