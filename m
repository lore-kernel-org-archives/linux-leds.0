From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH] leds/led-class: Add missing put_device()
Date: Fri, 24 Jul 2015 16:09:32 +0200
Message-ID: <1437746972-23967-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:35705 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753765AbbGXOJh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 24 Jul 2015 10:09:37 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alan Tull <delicious.quinoa@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Devices found by class_find_device must be freed with put_device().
Otherwise the reference count will not work properly.

Fixes: a96aa64cb572 ("leds/led-class: Handle LEDs with the same name")
Reported-by: Alan Tull <delicious.quinoa@gmail.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---

Thanks Alan!

 drivers/leds/led-class.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index beabfbc6f7cd..380cda0bff72 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -228,12 +228,15 @@ static int led_classdev_next_name(const char *init_name, char *name,
 {
 	unsigned int i = 0;
 	int ret = 0;
+	struct device *dev;
 
 	strlcpy(name, init_name, len);
 
-	while (class_find_device(leds_class, NULL, name, match_name) &&
-	       (ret < len))
+	while ((dev = class_find_device(leds_class, NULL, name, match_name)) &&
+	       (ret < len)) {
+		put_device(dev);
 		ret = snprintf(name, len, "%s_%u", init_name, ++i);
+	}
 
 	if (ret >= len)
 		return -ENOMEM;
-- 
2.1.4
