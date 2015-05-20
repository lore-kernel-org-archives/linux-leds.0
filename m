From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 18/20] leds: mark ss4200 driver with LED_BRIGHTNESS_FAST flag
Date: Wed, 20 May 2015 18:35:53 +0300
Message-ID: <555CA9D9.50703@list.ru>
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
 drivers/leds/leds-ss4200.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 046cb70..99e8348 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -487,6 +487,7 @@ static int register_nasgpio_led(int led_nr)
 		led->brightness = LED_FULL;
 	led->brightness_set = nasgpio_led_set_brightness;
 	led->blink_set = nasgpio_led_set_blink;
+	led->flags |= LED_BRIGHTNESS_FAST;
 	led->groups = nasgpio_led_groups;
 	ret = led_classdev_register(&nas_gpio_pci_dev->dev, led);
 	if (ret)
-- 
1.7.9.5
