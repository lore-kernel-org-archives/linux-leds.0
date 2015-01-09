From: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCHv2 1/2] leds: tlc59116: Document binding for the TI 16 Channel i2c LED driver
Date: Fri,  9 Jan 2015 23:45:44 +0100
Message-ID: <1420843545-30892-2-git-send-email-andrew@lunn.ch>
References: <1420843545-30892-1-git-send-email-andrew@lunn.ch>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:49444 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753455AbbAIWrt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 9 Jan 2015 17:47:49 -0500
In-Reply-To: <1420843545-30892-1-git-send-email-andrew@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>, kaloz@openwrt.org, Andrew Lunn <andrew@lunn.ch>, Matthew.Fatheree@belkin.com

Document the binding for the TLC59116 LED driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Matthew.Fatheree@belkin.com
---
 .../devicetree/bindings/leds/leds-tlc59116.txt     | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-tlc59116.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-tlc59116.txt b/Documentation/devicetree/bindings/leds/leds-tlc59116.txt
new file mode 100644
index 000000000000..45c2123774d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-tlc59116.txt
@@ -0,0 +1,40 @@
+LEDs connected to tcl59116
+
+Required properties
+- compatible: should be "ti,tlc59116"
+- #address-cells: must be 1
+- #size-cells: must be 0
+- reg: typically 0x68
+
+Each led is represented as a sub-node of the ti,,tlc59116.
+See Documentation/devicetree/bindings/leds/common.txt
+
+LED sub-node properties:
+- reg: number of LED line, 0 to 15
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
2.1.3
