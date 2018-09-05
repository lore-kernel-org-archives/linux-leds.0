From: Song Qiang <songqiang1304521@gmail.com>
Subject: [PATCH] leds: leds-gpio: Add a condition check for active low leds.
Date: Wed,  5 Sep 2018 10:34:36 +0800
Message-ID: <20180905023436.11826-1-songqiang.1304521@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com
Cc: pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Song Qiang <songqiang.1304521@gmail.com>
List-Id: linux-leds@vger.kernel.org

Some leds on our board are active low leds, which means these leds
are lighted when the corresponding gpio line is low, while the
original leds-gpio driver default all leds are active high leds.
This patch adds a devicetree node "light-state", whose value should
be "high" for active high leds and "low" for active low leds.
The default value is "high" for compatible for the original driver.

Signed-off-by: Song Qiang <songqiang.1304521@gmail.com>
---
 .../devicetree/bindings/leds/leds-gpio.txt    | 15 +++++++++++
 drivers/leds/leds-gpio.c                      | 25 +++++++++++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.txt b/Documentation/devicetree/bindings/leds/leds-gpio.txt
index a48dda268f81..0a8fad75c704 100644
--- a/Documentation/devicetree/bindings/leds/leds-gpio.txt
+++ b/Documentation/devicetree/bindings/leds/leds-gpio.txt
@@ -23,6 +23,9 @@ LED sub-node properties:
   remains up.
 - panic-indicator : (optional)
   see Documentation/devicetree/bindings/leds/common.txt
+- light-state: (optional) Values should be "high" or "low", which indicates
+	the state of the GPIO pin when the led is on.
+  see Documentation/devicetree/bindings/leds/common.txt
 
 Examples:
 
@@ -64,3 +67,15 @@ leds {
 		retain-state-suspended;
 	};
 };
+
+leds {
+	compatible = "gpio-leds";
+
+	led0 {
+		label = "led0";
+		gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+		linux,default-trigger = "heartbeat";
+		default-state = "off";
+		light-state = "low";
+	};
+}
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 764c31301f90..463ded0c71ac 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -26,9 +26,13 @@ struct gpio_led_data {
 	struct gpio_desc *gpiod;
 	u8 can_sleep;
 	u8 blinking;
+	u8 light_state;
 	gpio_blink_set_t platform_gpio_blink_set;
 };
 
+#define LEDS_GPIO_LIGHTSTATE_HIGH	0
+#define LEDS_GPIO_LIGHTSTATE_LOW	1
+
 static inline struct gpio_led_data *
 			cdev_to_gpio_led_data(struct led_classdev *led_cdev)
 {
@@ -42,9 +46,15 @@ static void gpio_led_set(struct led_classdev *led_cdev,
 	int level;
 
 	if (value == LED_OFF)
-		level = 0;
+		if (led_dat->light_state == LEDS_GPIO_LIGHTSTATE_HIGH)
+			level = 0;
+		else
+			level = 1;
 	else
-		level = 1;
+		if (led_dat->light_state == LEDS_GPIO_LIGHTSTATE_HIGH)
+			level = 1;
+		else
+			level = 0;
 
 	if (led_dat->blinking) {
 		led_dat->platform_gpio_blink_set(led_dat->gpiod, level,
@@ -205,6 +215,17 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 				led.default_state = LEDS_GPIO_DEFSTATE_OFF;
 		}
 
+		if (!fwnode_property_read_string(child, "light-state",
+						 &state)) {
+			if (!strcmp(state, "low"))
+				led_dat->light_state =
+					LEDS_GPIO_LIGHTSTATE_LOW;
+			else{
+				led_dat->light_state =
+					LEDS_GPIO_LIGHTSTATE_HIGH;
+			}
+		}
+
 		if (fwnode_property_present(child, "retain-state-suspended"))
 			led.retain_state_suspended = 1;
 		if (fwnode_property_present(child, "retain-state-shutdown"))
-- 
2.17.1
