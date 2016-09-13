From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 2/6] leds: gpio: add helper cdev_to_gpio_led_data
Date: Tue, 13 Sep 2016 20:54:25 +0200
Message-ID: <d7613a2a-a76b-e433-1709-69e2ceaaf179@gmail.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35053 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759636AbcIMS6a (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 14:58:30 -0400
In-Reply-To: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Add a helper for the container_of as it's used more than once.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/leds-gpio.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 10c851e..da4aa8e 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -29,11 +29,16 @@ struct gpio_led_data {
 	gpio_blink_set_t platform_gpio_blink_set;
 };
 
+static inline struct gpio_led_data *
+			cdev_to_gpio_led_data(struct led_classdev *led_cdev)
+{
+	return container_of(led_cdev, struct gpio_led_data, cdev);
+}
+
 static void gpio_led_set(struct led_classdev *led_cdev,
 	enum led_brightness value)
 {
-	struct gpio_led_data *led_dat =
-		container_of(led_cdev, struct gpio_led_data, cdev);
+	struct gpio_led_data *led_dat = cdev_to_gpio_led_data(led_cdev);
 	int level;
 
 	if (value == LED_OFF)
@@ -63,8 +68,7 @@ static int gpio_led_set_blocking(struct led_classdev *led_cdev,
 static int gpio_blink_set(struct led_classdev *led_cdev,
 	unsigned long *delay_on, unsigned long *delay_off)
 {
-	struct gpio_led_data *led_dat =
-		container_of(led_cdev, struct gpio_led_data, cdev);
+	struct gpio_led_data *led_dat = cdev_to_gpio_led_data(led_cdev);
 
 	led_dat->blinking = 1;
 	return led_dat->platform_gpio_blink_set(led_dat->gpiod, GPIO_LED_BLINK,
-- 
2.9.2
