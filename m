From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 2/3] DT: add binding for SN3218 LED driver
Date: Thu,  4 Feb 2016 18:56:05 +0000
Message-ID: <1454612167-8680-3-git-send-email-stefan.wahren@i2se.com>
References: <1454612167-8680-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454612167-8680-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: linux-leds@vger.kernel.org

This patch adds the binding for Si-En Technology SN3218
18-Channel LED driver.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-sn3218.txt       |   41 ++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-sn3218.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-sn3218.txt b/Documentation/devicetree/bindings/leds/leds-sn3218.txt
new file mode 100644
index 0000000..19cbf57
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
+There must be at least 1 LED which is represented as a sub-node
+of the sn3218 device.
+
+LED sub-node properties:
+- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
+- reg : number of LED line (could be from 0 to 17)
+- linux,default-trigger : (optional)
+   see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+sn3218: led-controller@54 {
+	compatible = "si-en,sn3218";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x54>;
+
+	led@0 {
+		label = "led1";
+		reg = <0x0>;
+	};
+
+	led@1 {
+		label = "led2";
+		reg = <0x1>;
+	};
+
+	led@2 {
+		label = "led3";
+		reg = <0x2>;
+	};
+};
-- 
1.7.9.5
