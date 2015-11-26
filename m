From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH v2 3/9] Documentation: dt-bindings: leds: add LM3633 LED binding information
Date: Thu, 26 Nov 2015 15:56:59 +0900
Message-ID: <1448521025-2796-4-git-send-email-milo.kim@ti.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, lee.jones@linaro.org, j.anaszewski@samsung.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <milo.kim@ti.com>
List-Id: linux-leds@vger.kernel.org

LM3633 LED device is one of TI LMU device list.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org> 
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org 
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 .../devicetree/bindings/leds/leds-lm3633.txt       | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3633.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3633.txt b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
new file mode 100644
index 0000000..a553894
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
@@ -0,0 +1,24 @@
+TI LMU LM3633 LED device tree bindings
+
+Required properties:
+  - compatible: "ti,lm3633-leds"
+
+Child nodes:
+  Each node matches with LED control bank.
+  Please refer to the datasheet [1].
+
+  Required properties of a child node:
+  - led-sources: List of enabled channels from 0 to 5.
+                 Please refer to LED binding [2].
+
+  Optional properties of a child node:
+  - label: LED channel identification. Please refer to LED binding [2].
+  - led-max-microamp: Max current setting. Type is <u32>.
+                      Unit is microampere. Range is from 5000 to 30000.
+                      Step is 1000. Please refer to LED binding [2].
+
+Example: Please refer to ti-lmu dt-bindings [3].
+
+[1] http://www.ti.com/product/LM3633/datasheet
+[2] ../leds/common.txt
+[2] ../mfd/ti-lmu.txt
-- 
1.9.1
