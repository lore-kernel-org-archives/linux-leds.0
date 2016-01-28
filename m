From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 2/3] DT: add binding for SN3218 LED driver
Date: Thu, 28 Jan 2016 20:41:06 +0000
Message-ID: <1454013667-25889-3-git-send-email-stefan.wahren@i2se.com>
References: <1454013667-25889-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:54474 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966530AbcA1Ul4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 28 Jan 2016 15:41:56 -0500
In-Reply-To: <1454013667-25889-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>

This patch adds the binding for Si-En Technology SN3218
18-Channel LED driver.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../devicetree/bindings/leds/leds-sn3218.txt       |   41 ++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-sn3218.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-sn3218.txt b/Documentation/devicetree/bindings/leds/leds-sn3218.txt
new file mode 100644
index 0000000..bf632df
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-sn3218.txt
@@ -0,0 +1,41 @@
+* Si-En Technology - SN3218 18-Channel LED Driver
+
+Required properties:
+- compatible :
+	"si-en,sn3218"
+- address-cells : must be 1
+- size-cells : must be 0
+- reg : I2C slave address, typically 0x54
+
+Each led is represented as a sub-node of the si-en,sn3218 device.
+
+LED sub-node properties:
+- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
+- reg : number of LED line (could be from 0 to 17)
+- linux,default-trigger : (optional)
+   see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+sn3218@54 {
+	compatible = "si-en,sn3218";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x54>;
+
+	led1@0 {
+		label = "led1";
+		reg = <0x0>;
+	};
+
+	led2@1 {
+		label = "led2";
+		reg = <0x1>;
+	};
+
+	led3@2 {
+		label = "led3";
+		reg = <0x2>;
+	};
+};
+
-- 
1.7.9.5
