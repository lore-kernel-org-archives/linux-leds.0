From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 19/20] leds: mark versatile driver with LED_BRIGHTNESS_FAST
 flag
Date: Wed, 20 May 2015 18:36:54 +0300
Message-ID: <555CAA16.70606@list.ru>
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
 drivers/leds/leds-versatile.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-versatile.c b/drivers/leds/leds-versatile.c
index 8055302..4061257 100644
--- a/drivers/leds/leds-versatile.c
+++ b/drivers/leds/leds-versatile.c
@@ -84,6 +84,7 @@ static int versatile_leds_probe(struct platform_device *dev)
 		led->cdev.name = versatile_leds[i].name;
 		led->cdev.brightness_set = versatile_led_set;
 		led->cdev.brightness_get = versatile_led_get;
+		led->cdev.flags |= LED_BRIGHTNESS_FAST;
 		led->cdev.default_trigger = versatile_leds[i].trigger;
 		led->mask = BIT(i);

-- 
1.7.9.5
