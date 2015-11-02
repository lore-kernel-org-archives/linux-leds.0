From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH 04/16] Documentation: dt-bindings: leds: add LM3633 LED binding information
Date: Mon, 2 Nov 2015 14:01:11 +0900
Message-ID: <1446440483-6948-5-git-send-email-milo.kim@ti.com>
References: <1446440483-6948-1-git-send-email-milo.kim@ti.com>
 <1446440483-6948-2-git-send-email-milo.kim@ti.com>
 <1446440483-6948-3-git-send-email-milo.kim@ti.com>
 <1446440483-6948-4-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446440483-6948-4-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org
Cc: Milo Kim <milo.kim@ti.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

LM3633 LED device is one of TI LMU device list.

Cc: devicetree@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-leds@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 .../devicetree/bindings/leds/leds-lm3633.txt       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3633.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3633.txt b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
new file mode 100644
index 0000000..bb7f213
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
@@ -0,0 +1,28 @@
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
+  - lvled1-used, lvled2-used, lvled3-used,
+    lvled4-used, lvled5-used, lvled6-used:
+    Low voltage LED string configuration. Type is <boolean>.
+    Please describe which output LED string is used.
+
+  Optional properties of a child node:
+  - channel-name: Name string for LED channel identification
+                  It is used for creating LED sysfs,
+                  /sys/class/leds/<channel-name>/.
+                  If this property is empty, then default name is set to
+                  "indicator:<id>" by the driver.
+  - led-max-microamp: Max current setting. Type is <u32>.
+                      Unit is microampere. Range is from 5000 to 30000.
+
+Examples: Please refer to ti-lmu dt-bindings [2].
+
+[1] http://www.ti.com/product/LM3633/datasheet
+[2] Documentation/devicetree/bindings/mfd/ti-lmu.txt
-- 
1.9.1
