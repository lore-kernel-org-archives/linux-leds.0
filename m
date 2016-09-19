From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v2] leds: triggers: Check return value of kobject_uevent_env()
Date: Mon, 19 Sep 2016 12:05:34 +0200
Message-ID: <1474279534-30204-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39441 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755093AbcISKFo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Sep 2016 06:05:44 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, greg@kroah.com, Jacek Anaszewski <j.anaszewski@samsung.com>

Log error message if kobject_uevent_env() fails in led_trigger_set().

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
Changes from v1:
- switched to using dev_err() instead of pr_err()

 drivers/leds/led-triggers.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index c7a38d4..26b3db1 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -141,7 +141,9 @@ void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 	if (event) {
 		envp[0] = event;
 		envp[1] = NULL;
-		kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp);
+		if (kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp))
+			dev_err(led_cdev->dev,
+				"led_trigger_set: Error sending uevent\n");
 		kfree(event);
 	}
 }
-- 
1.9.1
