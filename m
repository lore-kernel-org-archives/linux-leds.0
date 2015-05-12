From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v9 2/3] leds: ktd2692: add device tree bindings for ktd2692
Date: Tue, 12 May 2015 17:37:56 +0900
Message-ID: <1431419877-28339-3-git-send-email-ingi2.kim@samsung.com>
References: <1431419877-28339-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27093 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932446AbbELIiY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 04:38:24 -0400
In-reply-to: <1431419877-28339-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>

This patch adds the device tree bindings for ktd2692 flash LEDs.
Add Optional properties of child node for Flash LED

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
Reviewed-by: Varka Bhadram <varkabhadram@gmail.com>
---
 .../devicetree/bindings/leds/leds-ktd2692.txt      | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
new file mode 100644
index 0000000..8537374
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
@@ -0,0 +1,50 @@
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
+- compatible : Should be "kinetic,ktd2692".
+- ctrl-gpios : Specifier of the GPIO connected to CTRL pin.
+- aux-gpios : Specifier of the GPIO connected to AUX pin.
+
+Optional properties:
+- vin-supply : "vin" LED supply (2.7V to 5.5V).
+  See Documentation/devicetree/bindings/regulator/regulator.txt
+
+A discrete LED element connected to the device must be represented by a child
+node - See Documentation/devicetree/bindings/leds/common.txt
+
+Required properties for flash LED child nodes:
+  See Documentation/devicetree/bindings/leds/common.txt
+- led-max-microamp : Minimum Threshold for Timer protection
+  is defined internally (Maximum 300mA).
+- flash-max-microamp : Flash LED maximum current
+  Formula : I(mA) = 15000 / Rset.
+- flash-max-timeout-us : Flash LED maximum timeout.
+
+Optional properties for flash LED child nodes:
+- label : See Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+ktd2692 {
+	compatible = "kinetic,ktd2692";
+	ctrl-gpios = <&gpc0 1 0>;
+	aux-gpios = <&gpc0 2 0>;
+	vin-supply = <&vbat>;
+
+	flash-led {
+		label = "ktd2692-flash";
+		led-max-microamp = <300000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1835000>;
+	};
+};
-- 
2.0.5
