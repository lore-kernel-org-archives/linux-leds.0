From: Kun Yi <kunyi@google.com>
Subject: [PATCH 1/2] ledtrig-gpio: Request user input pin as GPIO
Date: Thu, 16 May 2019 14:42:08 -0700
Message-ID: <20190516214209.139726-2-kunyi@google.com>
References: <20190516214209.139726-1-kunyi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516214209.139726-1-kunyi@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Kun Yi <kunyi@google.com>, jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com, u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

The ledtrig-gpio logic assumes the input pin can be directly converted
to IRQ using gpio_to_irq. This is problematic since there is no
guarantee on the pinmux function nor the direction of the pin. Request
the pin as an input GPIO before requesting it as an IRQ.

Tested: a free pin can be correctly requested as GPIO
Signed-off-by: Kun Yi <kunyi@google.com>
Change-Id: I657e3e108552612506775cc348a8b4b35d40cac5
---
 drivers/leds/trigger/ledtrig-gpio.c | 31 +++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index ed0db8ed825f..f6d50e031492 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -117,6 +117,16 @@ static ssize_t gpio_trig_gpio_show(struct device *dev,
 	return sprintf(buf, "%u\n", gpio_data->gpio);
 }
 
+static inline void free_used_gpio_if_valid(unsigned int gpio,
+					   struct led_classdev *led)
+{
+	if (gpio == 0)
+		return;
+
+	free_irq(gpio_to_irq(gpio), led);
+	gpio_free(gpio);
+}
+
 static ssize_t gpio_trig_gpio_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t n)
 {
@@ -135,20 +145,30 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
 		return n;
 
 	if (!gpio) {
-		if (gpio_data->gpio != 0)
-			free_irq(gpio_to_irq(gpio_data->gpio), led);
+		free_used_gpio_if_valid(gpio_data->gpio, led);
 		gpio_data->gpio = 0;
 		return n;
 	}
 
+	ret = gpio_request(gpio, "ledtrig-gpio");
+	if (ret) {
+		dev_err(dev, "gpio_request failed with error %d\n", ret);
+		return ret;
+	}
+
+	ret = gpio_direction_input(gpio);
+	if (ret) {
+		dev_err(dev, "gpio_direction_input failed with err %d\n", ret);
+		return ret;
+	}
+
 	ret = request_threaded_irq(gpio_to_irq(gpio), NULL, gpio_trig_irq,
 			IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_RISING
 			| IRQF_TRIGGER_FALLING, "ledtrig-gpio", led);
 	if (ret) {
 		dev_err(dev, "request_irq failed with error %d\n", ret);
 	} else {
-		if (gpio_data->gpio != 0)
-			free_irq(gpio_to_irq(gpio_data->gpio), led);
+		free_used_gpio_if_valid(gpio_data->gpio, led);
 		gpio_data->gpio = gpio;
 		/* After changing the GPIO, we need to update the LED. */
 		gpio_trig_irq(0, led);
@@ -184,8 +204,7 @@ static void gpio_trig_deactivate(struct led_classdev *led)
 {
 	struct gpio_trig_data *gpio_data = led_get_trigger_data(led);
 
-	if (gpio_data->gpio != 0)
-		free_irq(gpio_to_irq(gpio_data->gpio), led);
+	free_used_gpio_if_valid(gpio_data->gpio, led);
 	kfree(gpio_data);
 }
 
-- 
2.21.0.1020.gf2820cf01a-goog
