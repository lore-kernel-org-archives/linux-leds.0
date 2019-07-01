From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 4/4] devicetree: Add led-backlight binding
Date: Mon, 1 Jul 2019 17:14:23 +0200
Message-ID: <20190701151423.30768-5-jjhiblot@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

Add DT binding for led-backlight.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: devicetree@vger.kernel.org
---
 .../video/backlight/led-backlight.txt         | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/led-backlight.txt

diff --git a/Documentation/devicetree/bindings/video/backlight/led-backlight.txt b/Documentation/devicetree/bindings/video/backlight/led-backlight.txt
new file mode 100644
index 000000000000..216cd52d624a
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/backlight/led-backlight.txt
@@ -0,0 +1,39 @@
+led-backlight bindings
+
+The node of the backlight driver IS the node of the LED.
+
+Required properties:
+  - compatible: "led-backlight"
+  - brightness-levels: Array of distinct LED brightness levels. These
+      are in the range from 0 to 255, passed to the LED class driver.
+  - default-brightness-level: the default brightness level (index into the
+      array defined by the "brightness-levels" property)
+
+Optional properties:
+  - power-supply: regulator for supply voltage
+  - enable-gpios: contains a single GPIO specifier for the GPIO which enables
+                  and disables the backlight (see GPIO binding[0])
+
+[0]: Documentation/devicetree/bindings/gpio/gpio.txt
+
+Example:
+
+led_ctrl {
+	red_led@1 {
+	        label = "red";
+		reg = <1>;
+	}
+
+	backlight_led@2 {
+		function = LED_FUNCTION_BACKLIGHT;
+		reg = <2>;
+
+		compatible = "led-backlight";
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+
+		power-supply = <&vdd_bl_reg>;
+		enable-gpios = <&gpio 58 0>;
+	};
+};
-- 
2.17.1
