From: ZHAO Gang <gamerh2o@gmail.com>
Subject: [PATCH] leds: replace list_for_each with list_for_each_entry
Date: Sat, 28 Dec 2013 23:00:26 +0800
Message-ID: <510322a941c9364485d9f5cd883a81fa74365a7a.1388238995.git.gamerh2o@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:45826 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755400Ab3L1PBE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 28 Dec 2013 10:01:04 -0500
Received: by mail-pb0-f43.google.com with SMTP id rq2so10143690pbb.30
        for <linux-leds@vger.kernel.org>; Sat, 28 Dec 2013 07:01:03 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: linux-leds <linux-leds@vger.kernel.org>

Use the more convenient macro.

Signed-off-by: ZHAO Gang <gamerh2o@gmail.com>
---
 drivers/leds/led-triggers.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 3c972b2..e387f41 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -242,18 +242,14 @@ EXPORT_SYMBOL_GPL(led_trigger_unregister);
 void led_trigger_event(struct led_trigger *trig,
 			enum led_brightness brightness)
 {
-	struct list_head *entry;
+	struct led_classdev *led_cdev;
 
 	if (!trig)
 		return;
 
 	read_lock(&trig->leddev_list_lock);
-	list_for_each(entry, &trig->led_cdevs) {
-		struct led_classdev *led_cdev;
-
-		led_cdev = list_entry(entry, struct led_classdev, trig_list);
+	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
 		led_set_brightness(led_cdev, brightness);
-	}
 	read_unlock(&trig->leddev_list_lock);
 }
 EXPORT_SYMBOL_GPL(led_trigger_event);
@@ -264,16 +260,13 @@ static void led_trigger_blink_setup(struct led_trigger *trig,
 			     int oneshot,
 			     int invert)
 {
-	struct list_head *entry;
+	struct led_classdev *led_cdev;
 
 	if (!trig)
 		return;
 
 	read_lock(&trig->leddev_list_lock);
-	list_for_each(entry, &trig->led_cdevs) {
-		struct led_classdev *led_cdev;
-
-		led_cdev = list_entry(entry, struct led_classdev, trig_list);
+	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
 		if (oneshot)
 			led_blink_set_oneshot(led_cdev, delay_on, delay_off,
 					      invert);
-- 
1.8.4.2
