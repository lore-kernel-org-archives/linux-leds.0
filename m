From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: [PATCH 2/4] DT: leds: Add binding for the ISSI IS31FL32xx family of LED controllers
Date: Wed,  2 Mar 2016 22:01:33 -0500
Message-ID: <1456974095-1867-3-git-send-email-drivshin.allworx@gmail.com>
References: <1456974095-1867-1-git-send-email-drivshin.allworx@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:34193 "EHLO
	mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754481AbcCCDDB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 2 Mar 2016 22:03:01 -0500
In-Reply-To: <1456974095-1867-1-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org

From: David Rivshin <drivshin@allworx.com>

This adds a binding description for the is31fl3236/35/18/16 I2C LED
controllers.

Signed-off-by: David Rivshin <drivshin@allworx.com>
---

Rob,
 I went with the 1-based 'reg' property here. I inferred that that
would be your preference based on the previous thread [1]. Let me
know if that's not the case.

Changes from RFC:
 - Removed max-brightness property.
 - Added #address-cells and #size-cells properties to the example.

[1] http://www.spinics.net/lists/linux-leds/msg05589.html

 .../devicetree/bindings/leds/leds-is31fl32xx.txt   | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
new file mode 100644
index 0000000..539df2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
@@ -0,0 +1,49 @@
+Binding for ISSI IS31FL32xx LED Drivers
+
+The IS31FL32xx family of LED drivers are I2C devices with multiple
+constant-current channels, each with independent 256-level PWM control.
+Each LED is represented as a sub-node of the device.
+
+Required properties:
+- compatible: one of
+	issi,is31fl3236
+	issi,is31fl3235
+	issi,is31fl3218
+	issi,is31fl3216
+- reg: I2C slave address
+- address-cells : must be 1
+- size-cells : must be 0
+
+LED sub-node properties:
+- reg : LED channel number (1..N)
+- label :  (optional)
+  see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger :  (optional)
+  see Documentation/devicetree/bindings/leds/common.txt
+
+
+Example:
+
+leds: is31fl3236@3c {
+	compatible = "issi,is31fl3236";
+	reg = <0x3c>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	led@1 {
+		reg = <1>;
+		label = "EB:blue:usr0";
+	};
+	led@2 {
+		reg = <2>;
+		label = "EB:blue:usr1";
+	};
+	...
+	led@36 {
+		reg = <36>;
+		label = "EB:blue:usr35";
+	};
+};
+
+For more product information please see the link below:
+http://www.issi.com/US/product-analog-fxled-driver.shtml
-- 
2.5.0
