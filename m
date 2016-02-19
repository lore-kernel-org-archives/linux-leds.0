From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] leds: gpio: Use GPIOF_OUT_INIT_LOW instead of hardcoded zero
Date: Fri, 19 Feb 2016 10:52:34 +0100
Message-ID: <1455875554-4268-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-leds@vger.kernel.org

Use the GPIO flag definition instead of a numeric literal, so the casual
reader grepping for GPIOF_ will find the GPIO flags used.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/leds/leds-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 7bc53280dbfdd91d..89955574430cec75 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -86,7 +86,7 @@ static int create_gpio_led(const struct gpio_led *template,
 		 * still uses GPIO numbers. Ultimately we would like to get
 		 * rid of this block completely.
 		 */
-		unsigned long flags = 0;
+		unsigned long flags = GPIOF_OUT_INIT_LOW;
 
 		/* skip leds that aren't available */
 		if (!gpio_is_valid(template->gpio)) {
-- 
1.9.1

