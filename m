From: David Lechner <david@lechnology.com>
Subject: [PATCH v4 2/3] leds: Use macro for max device node name size
Date: Fri, 16 Sep 2016 14:16:49 -0500
Message-ID: <1474053410-24387-3-git-send-email-david@lechnology.com>
References: <1474053410-24387-1-git-send-email-david@lechnology.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vern.gendns.com ([206.190.152.46]:54061 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756504AbcIPTRL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Sep 2016 15:17:11 -0400
In-Reply-To: <1474053410-24387-1-git-send-email-david@lechnology.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: David Lechner <david@lechnology.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, Pavel Machek <pavel@ucw.cz>

Use a macro instead of hard-coding the max device node name size. The
uleds driver introduced a macro for this value, so using it.

Signed-off-by: David Lechner <david@lechnology.com>
---
 drivers/leds/led-class.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index aa84e5b..731e4eb 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
+#include <uapi/linux/uleds.h>
 #include "leds.h"
 
 static struct class *leds_class;
@@ -187,7 +188,7 @@ static int led_classdev_next_name(const char *init_name, char *name,
  */
 int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 {
-	char name[64];
+	char name[LEDS_MAX_NAME_SIZE];
 	int ret;
 
 	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
-- 
2.7.4
