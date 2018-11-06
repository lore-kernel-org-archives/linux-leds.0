From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 05/24] dt-bindings: sc27xx-blt: Add function and color properties
Date: Tue,  6 Nov 2018 23:07:13 +0100
Message-ID: <1541542052-10081-6-git-send-email-jacek.anaszewski@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Xiaotong Lu <xiaotong.lu@spreadtrum.com>, Baolin Wang <baolin.wang@linaro.org>
List-Id: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
---
 Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
index dddf84f..5177479 100644
--- a/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
+++ b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
@@ -14,7 +14,9 @@ Required child properties:
 - reg: Port this LED is connected to.
 
 Optional child properties:
-- label: See Documentation/devicetree/bindings/leds/common.txt.
+- function: See Documentation/devicetree/bindings/leds/common.txt.
+- color: See Documentation/devicetree/bindings/leds/common.txt.
+- label: See Documentation/devicetree/bindings/leds/common.txt (deprecated).
 
 Examples:
 
@@ -25,17 +27,17 @@ led-controller@200 {
 	reg = <0x200>;
 
 	led@0 {
-		label = "red";
+		color = "red";
 		reg = <0x0>;
 	};
 
 	led@1 {
-		label = "green";
+		color = "green";
 		reg = <0x1>;
 	};
 
 	led@2 {
-		label = "blue";
+		color = "blue";
 		reg = <0x2>;
 	};
 };
-- 
2.1.4
