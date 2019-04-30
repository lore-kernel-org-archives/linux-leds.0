From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 3/7] dt-bindings: mfd: LMU: Add ti,brightness-resolution
Date: Tue, 30 Apr 2019 14:17:26 -0500
Message-ID: <20190430191730.19450-4-dmurphy@ti.com>
References: <20190430191730.19450-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430191730.19450-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>
List-Id: linux-leds@vger.kernel.org

Add ti,brightness-resolution to the TI LMU binding to define
whether the device uses 8-bit brightness or 11-bit brightness.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058763/

v2 - New patch.  Add brightness resolution to ti-lmu.txt.  See patch comments
for context. - https://lore.kernel.org/patchwork/patch/1054501/

 Documentation/devicetree/bindings/mfd/ti-lmu.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
index adae96c79d39..5881929d5f7a 100644
--- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -31,6 +31,16 @@ Optional property:
   - ramp-down-ms: Current ramping from one brightness level to
 		  the a lower brightness level.
 		  Range from 2048 us - 117.44 s
+  - ti,brightness-resolution - This determines whether to use 8 bit brightness
+			       mode or 11 bit brightness mode.  If this value is
+			       not set the device is defaulted to the preferred
+			       8bit brightness mode per 7.3.4.1 of the data
+			       sheet.  This setting can either be in the parent
+			       node or as part of the LED child nodes.  This
+			       is determined by the part itself if the strings
+			       have a common brightness register or individual
+			       brightness registers.
+			       The values are 255 (8bit) or 2047 (11bit).
 
 Required node:
   - backlight: All LMU devices have backlight child nodes.
@@ -217,6 +227,7 @@ lm3697@36 {
 		compatible = "ti,lm3697-backlight";
 
 		lcd {
+			ti,brightness-resolution = <255>;
 			led-sources = <0 1 2>;
 			ramp-up-ms = <200>;
 			ramp-down-ms = <200>;
-- 
2.21.0.5.gaeb582a983
