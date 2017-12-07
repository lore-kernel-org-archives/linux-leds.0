From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2] dt: bindings: as3645a: Fix the example node
Date: Thu, 7 Dec 2017 06:50:12 -0600
Message-ID: <20171207125012.5765-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sakari.ailus@iki.fi, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Fix the address-cells and size-cells example node
to reflect to the correct representation.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - Moved compatible to be first in the node - https://patchwork.kernel.org/patch/10092937/

 Documentation/devicetree/bindings/leds/ams,as3645a.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
index fdc40e354a64..fc7f5f9f234c 100644
--- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
+++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
@@ -59,10 +59,10 @@ Example
 =======
 
 	as3645a@30 {
-		#address-cells: 1
-		#size-cells: 0
-		reg = <0x30>;
 		compatible = "ams,as3645a";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x30>;
 		flash@0 {
 			reg = <0x0>;
 			flash-timeout-us = <150000>;
-- 
2.15.0.124.g7668cbc60
