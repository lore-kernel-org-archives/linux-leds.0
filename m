From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] leds: max77650: add MODULE_ALIAS()
Date: Wed,  3 Jul 2019 10:47:38 +0200
Message-ID: <20190703084738.9501-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-leds@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Define a MODULE_ALIAS() in the LED sub-driver for max77650 so that
the appropriate module gets loaded together with the core mfd driver.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/leds/leds-max77650.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 6b74ce9cac12..70166cd3816c 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -145,3 +145,4 @@ module_platform_driver(max77650_led_driver);
 MODULE_DESCRIPTION("MAXIM 77650/77651 LED driver");
 MODULE_AUTHOR("Bartosz Golaszewski <bgolaszewski@baylibre.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:max77650-led");
-- 
2.21.0
