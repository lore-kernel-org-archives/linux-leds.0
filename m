From: Liviu Dudau <liviu@dudau.co.uk>
Subject: [PATCH] leds: gpio: set led_dat->gpiod pointer for OF defined GPIO leds
Date: Thu, 18 Oct 2018 01:14:32 +0100
Message-ID: <20181018001432.710-1-liviu@dudau.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liviu Dudau <liviu@dudau.co.uk>
List-Id: linux-leds@vger.kernel.org

Commit 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
removed the common code path that set the led_dat->gpiod pointer in
create_gpio_led(), but only added it back for the devices that have
a valid gpio_led_platform_data structure. Calling gpio_leds_create()
in gpio_led_probe() is not enough to get a valid gpiod pointer.

Fortunately enough, gpio_leds_create() already gets the needed pointer,
we just need to assign it to the relevant gpio_led_data structure.

Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>
---

Hi,

I found this issue while testing linux-next-20181017, I don't know how
stable the leds for-next tree is in terms of commit IDs, if that gets
rebased then the Fixes commit ID needs updating.

Best regards,
Liviu

 drivers/leds/leds-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 32fa752565bc..45e012093865 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -163,6 +163,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 			return ERR_CAST(led.gpiod);
 		}
 
+		led_dat->gpiod = led.gpiod;
+
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led.default_trigger);
 
-- 
2.19.0
