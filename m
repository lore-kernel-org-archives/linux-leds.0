From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH] leds: bcm6328: Handle default-state of LEDs correctly
Date: Sat, 24 Oct 2015 17:53:45 +0100
Message-ID: <562BB799.7000708@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, j.anaszewski@samsung.com
Cc: linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

The default-state handler assumes that the LED is active low and omits
use of the shift macro causing "keep" to misdetect the state.

Determine the brightness and then use the led set function to apply it.

Update the documentation to indicate that this driver works for the
BCM63168 (which has many active high LEDs) too.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
 .../devicetree/bindings/leds/leds-bcm6328.txt      |  2 +-
 drivers/leds/leds-bcm6328.c                        | 23 ++++++++++++----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
index f9e36ad..d00260d 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
@@ -1,6 +1,6 @@
 LEDs connected to Broadcom BCM6328 controller
 
-This controller is present on BCM6318, BCM6328, BCM6362 and BCM63268.
+This controller is present on BCM6318, BCM6328, BCM6362, BCM63168 and BCM63268.
 In these SoCs it's possible to control LEDs both as GPIOs or by hardware.
 However, on some devices there are Serial LEDs (LEDs connected to a 74x164
 controller), which can either be controlled by software (exporting the 74x164
diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 1793727..771c171 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -259,7 +259,6 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 		       unsigned long *blink_leds, unsigned long *blink_delay)
 {
 	struct bcm6328_led *led;
-	unsigned long flags;
 	const char *state;
 	int rc;
 
@@ -282,13 +281,12 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 						    NULL);
 
 	if (!of_property_read_string(nc, "default-state", &state)) {
-		spin_lock_irqsave(lock, flags);
 		if (!strcmp(state, "on")) {
 			led->cdev.brightness = LED_FULL;
-			bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
 		} else if (!strcmp(state, "keep")) {
 			void __iomem *mode;
 			unsigned long val, shift;
+			unsigned long flags;
 
 			shift = bcm6328_pin2shift(led->pin);
 			if (shift / 16)
@@ -296,19 +294,24 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 			else
 				mode = mem + BCM6328_REG_MODE_LO;
 
-			val = bcm6328_led_read(mode) >> (shift % 16);
+			spin_lock_irqsave(lock, flags);
+			val = bcm6328_led_read(mode);
+			spin_unlock_irqrestore(lock, flags);
+
+			val >>= BCM6328_LED_SHIFT(shift % 16);
 			val &= BCM6328_LED_MODE_MASK;
-			if (val == BCM6328_LED_MODE_ON)
+
+			dev_info(dev, "pin %lu = %08lx\n", led->pin, val);
+			if ((led->active_low && val == BCM6328_LED_MODE_ON) ||
+			    (!led->active_low && val == BCM6328_LED_MODE_OFF))
 				led->cdev.brightness = LED_FULL;
-			else {
+			else
 				led->cdev.brightness = LED_OFF;
-				bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
-			}
 		} else {
 			led->cdev.brightness = LED_OFF;
-			bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
 		}
-		spin_unlock_irqrestore(lock, flags);
+
+		bcm6328_led_set(&led->cdev, led->cdev.brightness);
 	}
 
 	led->cdev.brightness_set = bcm6328_led_set;
-- 
2.1.4

-- 
Simon Arlott
