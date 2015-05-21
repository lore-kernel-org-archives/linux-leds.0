From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 18/20] leds: mark ss4200 driver with LED_BRIGHTNESS_FAST flag
Date: Thu, 21 May 2015 18:23:03 +0300
Message-ID: <555DF857.6000900@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp47.i.mail.ru ([94.100.177.107]:58859 "EHLO smtp47.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755714AbbEUPXJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 11:23:09 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Dave Hansen <dave@sr71.net>


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Dave Hansen <dave@sr71.net>

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
