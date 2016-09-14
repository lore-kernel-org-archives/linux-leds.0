From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 1/7] leds: gpio: introduce gpio_blink_set_t
Date: Wed, 14 Sep 2016 20:54:12 +0200
Message-ID: <8f9abb6b-d885-a0a9-dfe5-ad14ff322f77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36345 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763232AbcINSz4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Sep 2016 14:55:56 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Introduce a typedef gpio_blink_set_t to improve readability of the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- no change
---
 drivers/leds/leds-gpio.c | 6 ++----
 include/linux/leds.h     | 9 ++++++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 9b991d4..3599b2e 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -26,8 +26,7 @@ struct gpio_led_data {
 	struct gpio_desc *gpiod;
 	u8 can_sleep;
 	u8 blinking;
-	int (*platform_gpio_blink_set)(struct gpio_desc *desc, int state,
-			unsigned long *delay_on, unsigned long *delay_off);
+	gpio_blink_set_t platform_gpio_blink_set;
 };
 
 static void gpio_led_set(struct led_classdev *led_cdev,
@@ -74,8 +73,7 @@ static int gpio_blink_set(struct led_classdev *led_cdev,
 
 static int create_gpio_led(const struct gpio_led *template,
 	struct gpio_led_data *led_dat, struct device *parent,
-	int (*blink_set)(struct gpio_desc *, int, unsigned long *,
-			 unsigned long *))
+	gpio_blink_set_t blink_set)
 {
 	int ret, state;
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 8a3b5d2..ddfcb2d 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -359,6 +359,11 @@ struct led_platform_data {
 	struct led_info	*leds;
 };
 
+struct gpio_desc;
+typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
+				unsigned long *delay_on,
+				unsigned long *delay_off);
+
 /* For the leds-gpio driver */
 struct gpio_led {
 	const char *name;
@@ -382,9 +387,7 @@ struct gpio_led_platform_data {
 #define GPIO_LED_NO_BLINK_LOW	0	/* No blink GPIO state low */
 #define GPIO_LED_NO_BLINK_HIGH	1	/* No blink GPIO state high */
 #define GPIO_LED_BLINK		2	/* Please, blink */
-	int		(*gpio_blink_set)(struct gpio_desc *desc, int state,
-					unsigned long *delay_on,
-					unsigned long *delay_off);
+	gpio_blink_set_t	gpio_blink_set;
 };
 
 #ifdef CONFIG_NEW_LEDS
-- 
2.9.2
