From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] dt-bindings: mfd: LMU: Fix lm3632 dt binding example
Date: Fri, 5 Apr 2019 09:19:07 -0500
Message-ID: <20190405141907.3348-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Fix the lm3632 dt binding examples as the LCM enable GPIOs
are defined as enable GPIOs per the regulator/lm363x-regulator.txt
bindings document.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 Documentation/devicetree/bindings/mfd/ti-lmu.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
index 980394d701a7..86ca786d54fc 100644
--- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -104,8 +104,8 @@ lm3632@11 {
 	regulators {
 		compatible = "ti,lm363x-regulator";
 
-		ti,lcm-en1-gpio = <&pioC 0 GPIO_ACTIVE_HIGH>; /* PC0 */
-		ti,lcm-en2-gpio = <&pioC 1 GPIO_ACTIVE_HIGH>; /* PC1 */
+		enable-gpios = <&pioC 0 GPIO_ACTIVE_HIGH>,
+			       <&pioC 1 GPIO_ACTIVE_HIGH>;
 
 		vboost {
 			regulator-name = "lcd_boost";
-- 
2.19.0
