From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v7 2/3] leds: ktd2692: add device tree bindings for ktd2692
Date: Thu, 23 Apr 2015 22:18:04 +0900
Message-ID: <1429795085-22171-3-git-send-email-ingi2.kim@samsung.com>
References: <1429795085-22171-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1429795085-22171-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch adds the device tree bindings for ktd2692 flash LEDs.
Add Optional properties of child node for Flash LED

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 .../devicetree/bindings/leds/leds-ktd2692.txt      | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
new file mode 100644
index 0000000..708f2d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
@@ -0,0 +1,47 @@
+* Kinetic Technologies - KTD2692 Flash LED Driver
+
+KTD2692 is the ideal power solution for high-power flash LEDs.
+It uses ExpressWire single-wire programming for maximum flexibility.
+
+The ExpressWire interface through CTRL pin can control LED on/off and
+enable/disable the IC, Movie(max 1/3 of Flash current) / Flash mode current,
+Flash timeout, LVP(low voltage protection).
+
+Also, When the AUX pin is pulled high while CTRL pin is high,
+LED current will be ramped up to the flash-mode current level.
+
+Required properties:
+- compatible: "kinetic,ktd2692"
+- ctrl-gpio : gpio pin in order control CTRL pin
+- aux-gpio : gpio pin in order control AUX pin
+
+Optional properties:
+- vin-supply : "vin" LED supply (2.7V to 5.5V)
+  See Documentation/devicetree/bindings/regulator/regulator.txt
+
+A discrete LED element connected to the device must be represented by a child
+node - see Documentation/devicetree/bindings/leds/common.txt.
+
+Required properties for flash LED child nodes:
+  See Documentation/devicetree/bindings/leds/common.txt
+- flash-max-microamp : Flash LED maximum current
+  Formula : I(mA) = 15000 / Rset
+- flash-max-timeout-us : Flash LED maximum timeout
+
+Optional properties for flash LED child nodes:
+- label : see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+ktd2692 {
+	compatible = "kinetic,ktd2692";
+	ctrl-gpio = <&gpc0 1 0>;
+	aux-gpio = <&gpc0 2 0>;
+	vin-supply = <&vbat>;
+
+	flash-led {
+		label = "ktd2692-flash";
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1835000>;
+	};
+};
-- 
2.0.5
