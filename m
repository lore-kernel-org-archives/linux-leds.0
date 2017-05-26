From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 1/2] leds: trigger: gpio: Refresh LED state after GPIO change
Date: Fri, 26 May 2017 15:17:46 +0200
Message-ID: <ce0b55daaadc57b452b3b002560b4cee93c52e59.1495804666.git.jan.kiszka@siemens.com>
References: <cover.1495804666.git.jan.kiszka@siemens.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1495804666.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1495804666.git.jan.kiszka@siemens.com>
References: <cover.1495804666.git.jan.kiszka@siemens.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

The new GPIO may have a different state than the old one.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 drivers/leds/trigger/ledtrig-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index 51288a45fbcb..93d6b82e6437 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -170,6 +170,8 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
 		if (gpio_data->gpio != 0)
 			free_irq(gpio_to_irq(gpio_data->gpio), led);
 		gpio_data->gpio = gpio;
+		/* After changing the GPIO, we need to update the LED. */
+		schedule_work(&gpio_data->work);
 	}
 
 	return ret ? ret : n;
-- 
2.12.0
