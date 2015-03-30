From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 3/3] leds: Don't treat the LED name as a format string
Date: Mon, 30 Mar 2015 19:46:01 +0200
Message-ID: <1427737561-2424-4-git-send-email-ricardo.ribalda@gmail.com>
References: <1427737561-2424-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:34527 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753404AbbC3RqL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 13:46:11 -0400
In-Reply-To: <1427737561-2424-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, sakari.ailus@linux.intel.com, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

From: Sakari Ailus <sakari.ailus@iki.fi>

The LED name was wrongly interpreted as format string. Stop doing that.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Bryan Wu <cooloney@gmail.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 82e3844..728681d 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -252,7 +252,7 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 		return ret;
 
 	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
-					led_cdev, led_cdev->groups, name);
+				led_cdev, led_cdev->groups, "%s", name);
 	if (IS_ERR(led_cdev->dev))
 		return PTR_ERR(led_cdev->dev);
 
-- 
2.1.4
