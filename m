From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] leds: triggers: return error if invalid trigger name is
 provided via sysfs
Date: Fri, 1 Jul 2016 23:08:54 +0200
Message-ID: <d7ef6332-73ae-b902-bdf2-d6dbcf8cc06c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35369 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752485AbcGAVJb (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 1 Jul 2016 17:09:31 -0400
Received: by mail-wm0-f65.google.com with SMTP id a66so7796728wme.2
        for <linux-leds@vger.kernel.org>; Fri, 01 Jul 2016 14:09:09 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

If an invalid trigger name is provided via sysfs currently no error
is returned. Therefore it's not possible to determine whether the
trigger was set successfully.
Fix this by returning -EINVAL if no trigger is matched.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-triggers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 55fa65e..c92702a 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -60,6 +60,8 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 			goto unlock;
 		}
 	}
+	/* we come here only if buf matches no trigger */
+	ret = -EINVAL;
 	up_read(&triggers_list_lock);
 
 unlock:
-- 
2.9.0
