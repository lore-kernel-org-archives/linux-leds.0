From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 2/8] leds: gpio: set max_brightness to 1
Date: Tue, 13 Sep 2016 08:03:14 +0200
Message-ID: <34a66492-d95f-0616-9eb1-84e283cf3f1d@gmail.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34913 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750747AbcIMGEE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 02:04:04 -0400
Received: by mail-wm0-f67.google.com with SMTP id c131so1324663wmh.2
        for <linux-leds@vger.kernel.org>; Mon, 12 Sep 2016 23:04:03 -0700 (PDT)
In-Reply-To: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

GPIO-controlled LED's just have the status on or off.
Set max_brightness to 1 to reflect this.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/leds-gpio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 3599b2e..3f64544 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -34,22 +34,16 @@ static void gpio_led_set(struct led_classdev *led_cdev,
 {
 	struct gpio_led_data *led_dat =
 		container_of(led_cdev, struct gpio_led_data, cdev);
-	int level;
-
-	if (value == LED_OFF)
-		level = 0;
-	else
-		level = 1;
 
 	if (led_dat->blinking) {
-		led_dat->platform_gpio_blink_set(led_dat->gpiod, level,
+		led_dat->platform_gpio_blink_set(led_dat->gpiod, value,
 						 NULL, NULL);
 		led_dat->blinking = 0;
 	} else {
 		if (led_dat->can_sleep)
-			gpiod_set_value_cansleep(led_dat->gpiod, level);
+			gpiod_set_value_cansleep(led_dat->gpiod, value);
 		else
-			gpiod_set_value(led_dat->gpiod, level);
+			gpiod_set_value(led_dat->gpiod, value);
 	}
 }
 
@@ -106,6 +100,7 @@ static int create_gpio_led(const struct gpio_led *template,
 			return -EINVAL;
 	}
 
+	led_dat->cdev.max_brightness = 1;
 	led_dat->cdev.name = template->name;
 	led_dat->cdev.default_trigger = template->default_trigger;
 	led_dat->can_sleep = gpiod_cansleep(led_dat->gpiod);
-- 
2.9.2
