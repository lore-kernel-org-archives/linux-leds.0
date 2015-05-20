From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 11/20] leds: mark locomo driver with LED_BRIGHTNESS_FAST flag
Date: Wed, 20 May 2015 18:29:16 +0300
Message-ID: <555CA84C.7040702@list.ru>
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
 drivers/leds/leds-locomo.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-locomo.c b/drivers/leds/leds-locomo.c
index 80ba048..0eb69c3 100644
--- a/drivers/leds/leds-locomo.c
+++ b/drivers/leds/leds-locomo.c
@@ -47,12 +47,14 @@ static struct led_classdev locomo_led0 = {
 	.name			= "locomo:amber:charge",
 	.default_trigger	= "main-battery-charging",
 	.brightness_set		= locomoled_brightness_set0,
+	.flags			= LED_BRIGHTNESS_FAST,
 };

 static struct led_classdev locomo_led1 = {
 	.name			= "locomo:green:mail",
 	.default_trigger	= "nand-disk",
 	.brightness_set		= locomoled_brightness_set1,
+	.flags			= LED_BRIGHTNESS_FAST,
 };

 static int locomoled_probe(struct locomo_dev *ldev)
-- 
1.7.9.5
