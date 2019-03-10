From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 18/25] dt-bindings: aat1290: Add function and color properties
Date: Sun, 10 Mar 2019 19:28:29 +0100
Message-ID: <20190310182836.20841-19-jacek.anaszewski@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 Documentation/devicetree/bindings/leds/leds-aat1290.txt | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aat1290.txt b/Documentation/devicetree/bindings/leds/leds-aat1290.txt
index 85c0c58617f6..9192ff42c886 100644
--- a/Documentation/devicetree/bindings/leds/leds-aat1290.txt
+++ b/Documentation/devicetree/bindings/leds/leds-aat1290.txt
@@ -32,15 +32,18 @@ Required properties of the LED child node:
                          formula: T = 8.82 * 10^9 * Ct.
 
 Optional properties of the LED child node:
-- label : see Documentation/devicetree/bindings/leds/common.txt
+- function : see Documentation/devicetree/bindings/leds/common.txt
+- color : see Documentation/devicetree/bindings/leds/common.txt
+- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
 
 Example (by Ct = 220nF, Rset = 160kohm and exynos4412-trats2 board with
 a switch that allows for routing strobe signal either from the host or from
 the camera sensor):
 
 #include "exynos4412.dtsi"
+#include <dt-bindings/leds/common.h>
 
-aat1290 {
+led-controller {
 	compatible = "skyworks,aat1290";
 	flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
 	enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
@@ -50,8 +53,9 @@ aat1290 {
 	pinctrl-1 = <&camera_flash_host>;
 	pinctrl-2 = <&camera_flash_isp>;
 
-	camera_flash: flash-led {
-		label = "aat1290-flash";
+	camera_flash: led {
+		function = LED_FUNCTION_FLASH;
+		color = LED_COLOR_NAME_WHITE;
 		led-max-microamp = <520833>;
 		flash-max-microamp = <1012500>;
 		flash-max-timeout-us = <1940000>;
-- 
2.11.0
