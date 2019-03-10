From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 22/25] dt-bindings: leds-gpio: Add function and color properties
Date: Sun, 10 Mar 2019 19:28:33 +0100
Message-ID: <20190310182836.20841-23-jacek.anaszewski@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/leds/leds-gpio.txt         | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.txt b/Documentation/devicetree/bindings/leds/leds-gpio.txt
index a48dda268f81..90fb24cb2864 100644
--- a/Documentation/devicetree/bindings/leds/leds-gpio.txt
+++ b/Documentation/devicetree/bindings/leds/leds-gpio.txt
@@ -10,8 +10,12 @@ LED sub-node properties:
 - gpios :  Should specify the LED's GPIO, see "gpios property" in
   Documentation/devicetree/bindings/gpio/gpio.txt.  Active low LEDs should be
   indicated using flags in the GPIO specifier.
-- label :  (optional)
+- function :  (optional)
+  see Documentation/devicetree/bindings/leds/common.txt
+- color :  (optional)
   see Documentation/devicetree/bindings/leds/common.txt
+- label :  (optional)
+  see Documentation/devicetree/bindings/leds/common.txt (deprecated)
 - linux,default-trigger :  (optional)
   see Documentation/devicetree/bindings/leds/common.txt
 - default-state:  (optional) The initial state of the LED.
@@ -27,30 +31,34 @@ LED sub-node properties:
 Examples:
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 leds {
 	compatible = "gpio-leds";
-	hdd {
-		label = "Disk Activity";
+	led0 {
 		gpios = <&mcu_pio 0 GPIO_ACTIVE_LOW>;
 		linux,default-trigger = "disk-activity";
+		function = LED_FUNCTION_HDD;
 	};
 
-	fault {
+	led1 {
 		gpios = <&mcu_pio 1 GPIO_ACTIVE_HIGH>;
 		/* Keep LED on if BIOS detected hardware fault */
 		default-state = "keep";
+		function = LED_FUNCTION_FAULT;
 	};
 };
 
 run-control {
 	compatible = "gpio-leds";
-	red {
+	led0 {
 		gpios = <&mpc8572 6 GPIO_ACTIVE_HIGH>;
+		color = LED_COLOR_NAME_RED;
 		default-state = "off";
 	};
-	green {
+	led1 {
 		gpios = <&mpc8572 7 GPIO_ACTIVE_HIGH>;
+		color = LED_COLOR_NAME_GREEN;
 		default-state = "on";
 	};
 };
@@ -58,9 +66,10 @@ run-control {
 leds {
 	compatible = "gpio-leds";
 
-	charger-led {
+	led0 {
 		gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		linux,default-trigger = "max8903-charger-charging";
 		retain-state-suspended;
+		function = LED_FUNCTION_CHRG;
 	};
 };
-- 
2.11.0
