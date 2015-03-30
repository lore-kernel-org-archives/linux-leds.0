From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 1/3] leds/class: Use strlcpy instead of strncpy
Date: Mon, 30 Mar 2015 10:55:10 +0200
Message-ID: <1427705712-18083-2-git-send-email-ricardo.ribalda@gmail.com>
References: <1427705712-18083-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427705712-18083-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-leds@vger.kernel.org

Strncpy does not guarantee a zero terminated string. Use strlcpy
instead.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index ebf6dad4f..294d6d6 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -224,7 +224,7 @@ static int led_classdev_next_name(const char *init_name, char *name,
 {
 	int i = 0;
 
-	strncpy(name, init_name, len);
+	strlcpy(name, init_name, len);
 
 	while (class_find_device(leds_class, NULL, name, match_name))
 		snprintf(name, len, "%s_%d", init_name, ++i);
-- 
2.1.4
