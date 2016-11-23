From: Geliang Tang <geliangtang@gmail.com>
Subject: [PATCH] leds: leds-cobalt-raq: use builtin_platform_driver
Date: Wed, 23 Nov 2016 22:50:05 +0800
Message-ID: <f3870e62588f79405ee12777a1daf570bc96f476.1479912572.git.geliangtang@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>
Cc: Geliang Tang <geliangtang@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Use builtin_platform_driver() helper to simplify the code.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 drivers/leds/leds-cobalt-raq.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
index b316df4..8d066fa 100644
--- a/drivers/leds/leds-cobalt-raq.c
+++ b/drivers/leds/leds-cobalt-raq.c
@@ -115,8 +115,4 @@ static struct platform_driver cobalt_raq_led_driver = {
 	},
 };
 
-static int __init cobalt_raq_led_init(void)
-{
-	return platform_driver_register(&cobalt_raq_led_driver);
-}
-device_initcall(cobalt_raq_led_init);
+builtin_platform_driver(cobalt_raq_led_driver);
-- 
2.9.3
