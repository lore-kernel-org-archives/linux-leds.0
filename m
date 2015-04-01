From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v5 2/3] leds: ktd2692: add device tree bindings for ktd2692
Date: Wed, 01 Apr 2015 12:58:27 +0900
Message-ID: <1427860708-32559-3-git-send-email-ingi2.kim@samsung.com>
References: <1427860708-32559-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1427860708-32559-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch adds the device tree bindings for ktd2692 flash LEDs.
Add optional properties 'flash-timeout-us' to control flash timeout
and 'vin-supply' for flash-led regulator

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
---
 .../devicetree/bindings/leds/leds-ktd2692.txt      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
new file mode 100644
index 0000000..3f121ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
@@ -0,0 +1,32 @@
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
+- vin-supply : "vin" LED supply (2.7V to 5.5V)
+  See Documentation/devicetree/bindings/regulator/regulator.txt
+
+Optional property:
+- flash-timeout-us : Maximum flash timeout in microseconds.
+  flash timeout ranges from 0 to 1835000us and default is 1049000us.
+
+Example:
+
+flash-led {
+	compatible = "kinetic,ktd2692";
+	ctrl-gpio = <&gpc0 1 0>;
+	aux-gpio = <&gpc0 2 0>;
+	flash-timeout-us = <1835000>;
+	vin-supply = <&vbat>;
+};
-- 
2.0.5
