From: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH RESEND v6 1/2] leds: tlc591xx: Document binding for the TI 8/16 Channel i2c LED driver
Date: Tue, 17 Mar 2015 23:08:26 +0100
Message-ID: <1426630107-25057-2-git-send-email-andrew@lunn.ch>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:49816 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753933AbbCQWMH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 17 Mar 2015 18:12:07 -0400
In-Reply-To: <1426630107-25057-1-git-send-email-andrew@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Matthew.Fatheree@belkin.com

Document the binding for the TLC591xx LED driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Imre Kaloz <kaloz@openwrt.org>
Cc: Matthew.Fatheree@belkin.com
---
 .../devicetree/bindings/leds/leds-tlc591xx.txt     | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-tlc591xx.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt b/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
new file mode 100644
index 000000000000..3bbbf7024411
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
@@ -0,0 +1,40 @@
+LEDs connected to tlc59116 or tlc59108
+
+Required properties
+- compatible: should be "ti,tlc59116" or "ti,tlc59108"
+- #address-cells: must be 1
+- #size-cells: must be 0
+- reg: typically 0x68
+
+Each led is represented as a sub-node of the ti,tlc59116.
+See Documentation/devicetree/bindings/leds/common.txt
+
+LED sub-node properties:
+- reg: number of LED line, 0 to 15 or 0 to 7
+- label: (optional) name of LED
+- linux,default-trigger : (optional)
+
+Examples:
+
+tlc59116@68 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "ti,tlc59116";
+	reg = <0x68>;
+
+	wan@0 {
+		label = "wrt1900ac:amber:wan";
+		reg = <0x0>;
+	};
+
+	2g@2 {
+		label = "wrt1900ac:white:2g";
+		reg = <0x2>;
+	};
+
+	alive@9 {
+		label = "wrt1900ac:green:alive";
+		reg = <0x9>;
+		linux,default_trigger = "heartbeat";
+	};
+};
-- 
2.1.4
