From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 3/8] leds: gpio: fix an unhandled error case in
 create_gpio_led
Date: Tue, 13 Sep 2016 08:03:20 +0200
Message-ID: <ecd5989f-2177-f50e-58c5-57a24c5e650d@gmail.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34399 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753242AbcIMGEF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 02:04:05 -0400
Received: by mail-wm0-f66.google.com with SMTP id g141so5655819wmd.1
        for <linux-leds@vger.kernel.org>; Mon, 12 Sep 2016 23:04:05 -0700 (PDT)
In-Reply-To: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

gpiod_get_value_cansleep returns 0, 1, or an error code.
So far errors are not handled and treated the same as 1.
Change this to bail out if an error code is returned and
remove the double negation.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/leds-gpio.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 3f64544..b8855c0 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -113,10 +113,13 @@ static int create_gpio_led(const struct gpio_led *template,
 		led_dat->platform_gpio_blink_set = blink_set;
 		led_dat->cdev.blink_set = gpio_blink_set;
 	}
-	if (template->default_state == LEDS_GPIO_DEFSTATE_KEEP)
-		state = !!gpiod_get_value_cansleep(led_dat->gpiod);
-	else
+	if (template->default_state == LEDS_GPIO_DEFSTATE_KEEP) {
+		state = gpiod_get_value_cansleep(led_dat->gpiod);
+		if (state < 0)
+			return state;
+	} else {
 		state = (template->default_state == LEDS_GPIO_DEFSTATE_ON);
+	}
 	led_dat->cdev.brightness = state ? LED_FULL : LED_OFF;
 	if (!template->retain_state_suspended)
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
-- 
2.9.2
