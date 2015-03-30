From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 2/3] leds/class: Check snprintf return value
Date: Mon, 30 Mar 2015 11:08:50 +0200
Message-ID: <1427706531-22569-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:36440 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752985AbbC3JI4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 05:08:56 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

If the final name does not fit the string there is a potential
endless-loop.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/leds/led-class.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 294d6d6..2ffe8b1 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -223,12 +223,17 @@ static int led_classdev_next_name(const char *init_name, char *name,
 				  size_t len)
 {
 	int i = 0;
+	int ret = 0;
 
 	strlcpy(name, init_name, len);
 
-	while (class_find_device(leds_class, NULL, name, match_name))
+	while (class_find_device(leds_class, NULL, name, match_name) &&
+	       (ret < len))
 		snprintf(name, len, "%s_%d", init_name, ++i);
 
+	if (ret >= len)
+		return -ENOMEM;
+
 	return i;
 }
 
@@ -243,6 +248,9 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 	int ret;
 
 	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
+	if (ret < 0)
+		return ret;
+
 	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
 				led_cdev, led_cdev->groups, "%s", name);
 	if (IS_ERR(led_cdev->dev))
-- 
2.1.4
