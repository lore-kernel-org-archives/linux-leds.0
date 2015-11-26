From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH v2 2/9] Documentation: dt-bindings: leds: backlight: add TI LMU backlight binding information
Date: Thu, 26 Nov 2015 15:56:58 +0900
Message-ID: <1448521025-2796-3-git-send-email-milo.kim@ti.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, lee.jones@linaro.org, j.anaszewski@samsung.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <milo.kim@ti.com>
List-Id: linux-leds@vger.kernel.org

LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697 use common dt-bindings
for describing backlight device.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org> 
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org 
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 .../bindings/leds/backlight/ti-lmu-backlight.txt   | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti-lmu-backlight.txt

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti-lmu-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/ti-lmu-backlight.txt
new file mode 100644
index 0000000..c2c35b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/ti-lmu-backlight.txt
@@ -0,0 +1,65 @@
+TI LMU backlight device tree bindings
+
+Required property:
+  - compatible: Should be one of:
+                "ti,lm3532-backlight"
+                "ti,lm3631-backlight"
+                "ti,lm3632-backlight"
+                "ti,lm3633-backlight"
+                "ti,lm3695-backlight"
+                "ti,lm3697-backlight"
+
+Optional properties:
+  There are two backlight control mode. One is I2C, the other is PWM mode.
+  Following properties are only specified in PWM mode.
+  Please note that LMU backlight device can have only one PWM channel.
+
+  - pwms: OF device-tree PWM specification.
+  - pwm-names: a list of names for the PWM devices specified in the "pwms"
+               property.
+
+  For the PWM user nodes, please refer to [1].
+
+Child nodes:
+  LMU backlight is represented as sub-nodes of the TI LMU device [2].
+  So, LMU backlight should have more than one backlight child node.
+  Each node exactly matches with backlight control bank configuration.
+  Maximum numbers of child nodes depend on the device.
+  1 = LM3631, LM3632, LM3695
+  2 = LM3633, LM3697
+  3 = LM3532
+
+  Required property of a child node:
+  - led-sources: List of enabled channels from 0 to 2.
+                 Please refer to LED binding [3].
+                 For output channels, please refer to the datasheets [4].
+
+  Optional properties of a child node:
+  - label: Backlight channel identification.
+           Please refer to LED binding [3].
+  - default-brightness-level: Backlight initial brightness value.
+                              Type is <u32>. It is set as soon as backlight
+                              device is created.
+                              0 ~ 2047 = LM3631, LM3632, LM3633, LM3695 and
+                                         LM3697
+                              0 ~ 255  = LM3532
+  - ramp-up-msec, ramp-down-msec: Light dimming effect properties.
+                                  Type is <u32>. Unit is millisecond.
+                                  0 ~ 65 msec    = LM3532
+                                  0 ~ 4000 msec  = LM3631
+                                  0 ~ 16000 msec = LM3633 and LM3697
+  - pwm-period: PWM period. Only valid in PWM brightness mode.
+                Type is <u32>. If this property is missing, then control
+                mode is set to I2C by default.
+
+Examples: Please refer to ti-lmu dt-bindings. [2].
+
+[1] ../pwm/pwm.txt
+[2] ../mfd/ti-lmu.txt
+[3] ../leds/common.txt
+[4] LM3532: http://www.ti.com/product/LM3532/datasheet
+    LM3631: http://www.ti.com/product/LM3631/datasheet
+    LM3632: http://www.ti.com/product/LM3632A/datasheet
+    LM3633: http://www.ti.com/product/LM3633/datasheet
+    LM3695: Datasheet is not opened yet, but only two strings are used.
+    LM3697: http://www.ti.com/product/LM3697/datasheet
-- 
1.9.1
