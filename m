From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH] leds: leds-gpio: Pass on error codes unmodified
Date: Sat, 31 Jan 2015 19:15:00 -0800
Message-ID: <1422760500-21793-1-git-send-email-soren.brinkmann@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: linux-leds@vger.kernel.org

Instead of overriding error codes, pass them on unmodified. This
way a EPROBE_DEFER is correctly passed to the driver core. This results
in the LED driver correctly requesting probe deferral in cases the GPIO
controller is not yet available.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
Adding pinctrl on Zynq shuffled with probing order quite a bit and a lot
of deferred probing is going on. With those changes I saw the LEDs
failing to probe due to the GPIO controller deferring probe until the
pincontroller is available. With this patch things work again:

dmesg | grep -i led:
  of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/ds23[0]' - status (-517)
  platform leds: Driver leds-gpio requests probe deferral
  of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/ds23[0]' - status (0)

  	Soren
---
 drivers/leds/leds-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 7ea1ea42c2d2..d26af0a79a90 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -187,6 +187,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		led.gpiod = devm_get_gpiod_from_child(dev, child);
 		if (IS_ERR(led.gpiod)) {
 			fwnode_handle_put(child);
+			ret = PTR_ERR(led.gpiod);
 			goto err;
 		}
 
@@ -229,7 +230,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 err:
 	for (count = priv->num_leds - 2; count >= 0; count--)
 		delete_gpio_led(&priv->leds[count]);
-	return ERR_PTR(-ENODEV);
+	return ERR_PTR(ret);
 }
 
 static const struct of_device_id of_gpio_leds_match[] = {
-- 
2.2.2.1.g63c5777
