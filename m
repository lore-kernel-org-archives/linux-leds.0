From: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: [PATCH] leds: fix redundant trigger API #ifdef
Date: Thu,  9 Apr 2015 17:25:10 +0200
Message-ID: <1428593110-9611-1-git-send-email-valentinrothberg@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:38205 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753554AbbDIPZW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 9 Apr 2015 11:25:22 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: j.anaszewski@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, pebolle@tiscali.nl, rupran@einserver.de, stefan.hengelein@fau.de
Cc: Valentin Rothberg <valentinrothberg@gmail.com>

Commit 5a15d172057c ("leds: unify the location of led-trigger API")
moved the leds trigger API to led.h.  Moving the function definitions
caused a logical problem regarding the visibility of #idef blocks.  As
listed in the code snippet below, the inner #else block will never see a
compiler since CONFIG_LEDS_TRIGGERS is always true for the second #ifdef.

This patch removes the second, redundant #ifdef and moves the code of
the #else branch to its proper place.

Signed-off-by: Valentin Rothberg <valentinrothberg@gmail.com>
---
I found this issue with undertaker-checkpatch from the Undertaker
toolsuite.  See undertaker.cs.fau.de for more information.
---
 include/linux/leds.h | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 057970818961..96a669f93f69 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -223,7 +223,6 @@ struct led_trigger {
 	struct list_head  next_trig;
 };
 
-#ifdef CONFIG_LEDS_TRIGGERS
 void led_trigger_set_default(struct led_classdev *led_cdev);
 void led_trigger_set(struct led_classdev *led_cdev,
 			struct led_trigger *trigger);
@@ -234,13 +233,6 @@ static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
 	return led_cdev->trigger_data;
 }
 
-#else
-#define led_trigger_set_default(x) do {} while (0)
-#define led_trigger_set(x, y) do {} while (0)
-#define led_trigger_remove(x) do {} while (0)
-#define led_get_trigger_data(x) (NULL)
-#endif
-
 ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 			const char *buf, size_t count);
 ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
@@ -282,6 +274,11 @@ extern void led_trigger_rename_static(const char *name,
 
 #else
 
+#define led_trigger_set_default(x) do {} while (0)
+#define led_trigger_set(x, y) do {} while (0)
+#define led_trigger_remove(x) do {} while (0)
+#define led_get_trigger_data(x) (NULL)
+
 /* Trigger has no members */
 struct led_trigger {};
 
-- 
2.1.0
