From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 3/3] leds/class: Set naming index as unsigned
Date: Mon, 30 Mar 2015 10:55:12 +0200
Message-ID: <1427705712-18083-4-git-send-email-ricardo.ribalda@gmail.com>
References: <1427705712-18083-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427705712-18083-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-leds@vger.kernel.org

Avoid weird names (led_-65537) on overflows.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 2ffe8b1..2be1ba3 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -222,7 +222,7 @@ static int match_name(struct device *dev, const void *data)
 static int led_classdev_next_name(const char *init_name, char *name,
 				  size_t len)
 {
-	int i = 0;
+	unsigned int i = 0;
 	int ret = 0;
 
 	strlcpy(name, init_name, len);
-- 
2.1.4
