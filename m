From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 1/7] dt-bindings: mfd: LMU: Fix lm3632 dt binding example
Date: Mon, 6 May 2019 14:16:08 -0500
Message-ID: <20190506191614.25051-2-dmurphy@ti.com>
References: <20190506191614.25051-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190506191614.25051-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: lee.jones@linaro.org, rdunlap@infradead.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>
List-Id: linux-leds@vger.kernel.org

Fix the lm3632 dt binding examples as the LCM enable GPIOs
are defined as enable GPIOs per the regulator/lm363x-regulator.txt
bindings document.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v4 - No changes - https://lore.kernel.org/patchwork/patch/1068613/

v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058757/
v2 - There was no v2 I add this patch on top of this series

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
2.21.0.5.gaeb582a983
