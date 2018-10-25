From: Dan Sneddon <dan.sneddon@gmail.com>
Subject: [PATCH] leds: gpio: Fix gpiod for DT based devices
Date: Thu, 25 Oct 2018 08:06:01 -0700
Message-ID: <CACceFXdF9XQS6WeSWvO=EKUEGnKwG_VkqUOECA3kJY-Hy72fjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org
List-Id: linux-leds@vger.kernel.org

commit 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
failes to set the gpio descriptor for DT based machines.  Since the
value being passed in is always 0 the descriptor fails the validation
check but does so silently.  This means the driver probes successfully
even though it can't actually control the gpio line.  This patch sets
the gpio descriptor in the path taken by DT based devices.

Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
Signed-off-by: Dan Sneddon <dan.sneddon@gmail.com>
---
 drivers/leds/leds-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 32fa752..e0e57c2 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -162,6 +162,7 @@ static struct gpio_leds_priv
*gpio_leds_create(struct platform_device *pdev)
            fwnode_handle_put(child);
            return ERR_CAST(led.gpiod);
        }
+       led_dat->gpiod = led.gpiod;

        fwnode_property_read_string(child, "linux,default-trigger",
                        &led.default_trigger);
-- 
2.7.4
