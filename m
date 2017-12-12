From: Dan Murphy <dmurphy@ti.com>
Subject: [RFC PATCH 1/2] dt: bindings: as3645a: Update dt node example with standard
Date: Tue, 12 Dec 2017 15:50:23 -0600
Message-ID: <20171212215024.30116-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:65317 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752564AbdLLVu4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Dec 2017 16:50:56 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, sakari.ailus@iki.fi, laurent.pinchart@ideasonboard.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

Update the DT binding to remove the device name from
the DT parent node as well as removing the device
name from the label.  The LED label will be generated
based off the id name stored in the local driver so
the LED function can be indicated in the label DT
entry.

Also removed the indentation on the example.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/leds/ams,as3645a.txt       | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
index fc7f5f9f234c..122aa7165cf3 100644
--- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
+++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
@@ -58,22 +58,22 @@ label		: The label of the indicator LED.
 Example
 =======
 
-	as3645a@30 {
-		compatible = "ams,as3645a";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x30>;
-		flash@0 {
-			reg = <0x0>;
-			flash-timeout-us = <150000>;
-			flash-max-microamp = <320000>;
-			led-max-microamp = <60000>;
-			ams,input-max-microamp = <1750000>;
-			label = "as3645a:flash";
-		};
-		indicator@1 {
-			reg = <0x1>;
-			led-max-microamp = <10000>;
-			label = "as3645a:indicator";
-		};
+led-controller@30 {
+	compatible = "ams,as3645a";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x30>;
+	led@0 {
+		reg = <0x0>;
+		flash-timeout-us = <150000>;
+		flash-max-microamp = <320000>;
+		led-max-microamp = <60000>;
+		ams,input-max-microamp = <1750000>;
+		label = "flash";
 	};
+	led@1 {
+		reg = <0x1>;
+		led-max-microamp = <10000>;
+		label = "indicator";
+	};
+};
-- 
2.15.0.124.g7668cbc60
