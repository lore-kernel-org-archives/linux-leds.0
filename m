From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 17/20] leds: mark s3c24xx driver with LED_BRIGHTNESS_FAST
 flag
Date: Wed, 20 May 2015 18:35:04 +0300
Message-ID: <555CA9A8.3090609@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-s3c24xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 83641a7..ed61bf9 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -84,7 +84,7 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 	led->cdev.brightness_set = s3c24xx_led_set;
 	led->cdev.default_trigger = pdata->def_trigger;
 	led->cdev.name = pdata->name;
-	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	led->cdev.flags |= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST;

 	led->pdata = pdata;

-- 
1.7.9.5
