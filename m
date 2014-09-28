From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 3/3] leds: gpio: cleanup the leds-gpio driver
Date: Sun, 28 Sep 2014 16:57:16 +0800
Message-ID: <1411894636-12360-4-git-send-email-Li.Xiubo@freescale.com>
References: <1411894636-12360-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-by2on0127.outbound.protection.outlook.com ([207.46.100.127]:19488
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751985AbaI1JMV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 28 Sep 2014 05:12:21 -0400
In-Reply-To: <1411894636-12360-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>

Remove stray blank line and space.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 drivers/leds/leds-gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 1b1e617..b4518c8 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -36,7 +36,7 @@ struct gpio_led_data {
 
 static void gpio_led_work(struct work_struct *work)
 {
-	struct gpio_led_data	*led_dat =
+	struct gpio_led_data *led_dat =
 		container_of(work, struct gpio_led_data, work);
 
 	if (led_dat->blinking) {
@@ -235,14 +235,12 @@ static struct gpio_leds_priv *gpio_leds_create_of(struct platform_device *pdev)
 }
 #endif /* CONFIG_OF_GPIO */
 
-
 static int gpio_led_probe(struct platform_device *pdev)
 {
 	struct gpio_led_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct gpio_leds_priv *priv;
 	int i, ret = 0;
 
-
 	if (pdata && pdata->num_leds) {
 		priv = devm_kzalloc(&pdev->dev,
 				sizeof_gpio_leds_priv(pdata->num_leds),
-- 
2.1.0.27.g96db324
