From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 1/6] dt: bindings: lp8860: Update bindings for lp8860
Date: Tue, 12 Dec 2017 16:01:38 -0600
Message-ID: <20171212220143.31210-2-dmurphy@ti.com>
References: <20171212220143.31210-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:38457 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752679AbdLLWCD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Dec 2017 17:02:03 -0500
In-Reply-To: <20171212220143.31210-1-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

Update the lp8860 bindings to fix various issues
found.  Add address-cells and size-cells, rename
enable-gpio to enable-gpios, update the node name
to the device name and indent the node example.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v4 - No changes

v3 - Indicatd enable-gpios is active high, moved address and size cells to child
node patch and updated parent DT node name - https://patchwork.kernel.org/patch/10093745/
v2 - New patch

 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index aad38dd94d4b..b9d09acbaa73 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -6,22 +6,22 @@ current sinks that can be controlled by a PWM input
 signal, a SPI/I2C master, or both.
 
 Required properties:
-	- compatible:
+	- compatible :
 		"ti,lp8860"
-	- reg -  I2C slave address
-	- label - Used for naming LEDs
+	- reg : I2C slave address
+	- label : Used for naming LEDs
 
 Optional properties:
-	- enable-gpio - gpio pin to enable/disable the device.
-	- supply - "vled" - LED supply
+	- enable-gpios : gpio pin to enable (active high)/disable the device.
+	- vled-supply : LED supply
 
 Example:
 
-leds: leds@6 {
+led-controller@2d {
 	compatible = "ti,lp8860";
 	reg = <0x2d>;
 	label = "display_cluster";
-	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	vled-supply = <&vbatt>;
 }
 
-- 
2.15.0.124.g7668cbc60
