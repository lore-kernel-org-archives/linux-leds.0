From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v6 4/6] dt: bindings: lp8860: Update the bindings to the standard
Date: Fri, 1 Dec 2017 10:56:11 -0600
Message-ID: <20171201165613.10358-4-dmurphy@ti.com>
References: <20171201165613.10358-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171201165613.10358-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Update the lp8860 dt binding to the LED standard where
the LED should have a child node and also adding a
LED trigger entry.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v6 - New patch to fix binding documentation

 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index aad38dd94d4b..4cf396de6eba 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -12,17 +12,24 @@ Required properties:
 	- label - Used for naming LEDs
 
 Optional properties:
-	- enable-gpio - gpio pin to enable/disable the device.
-	- supply - "vled" - LED supply
+	- enable-gpios : gpio pin to enable/disable the device.
+	- vled-supply : LED supply
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger : (optional)
+	   see Documentation/devicetree/bindings/leds/common.txt
 
 Example:
 
-leds: leds@6 {
+lp8860@2d {
 	compatible = "ti,lp8860";
 	reg = <0x2d>;
-	label = "display_cluster";
 	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	vled-supply = <&vbatt>;
+
+	backlight: backlight@0 {
+		label = "backlight_cluster";
+		linux,default-trigger = "backlight";
+	};
 }
 
 For more product information please see the link below:
-- 
2.15.0.124.g7668cbc60
