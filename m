From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v2 2/3] leds: ktd2692: add device tree bindings for ktd2692
Date: Tue, 17 Mar 2015 17:45:50 +0900
Message-ID: <1426581951-11869-3-git-send-email-ingi2.kim@samsung.com>
References: <1426581951-11869-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16934 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754462AbbCQIqI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 17 Mar 2015 04:46:08 -0400
In-reply-to: <1426581951-11869-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>

This patch adds the device tree bindings for ktd2692 flash LEDs.
Add optional properties 'flash-timeout-us' to control flash timeout
and 'vin-supply' for flash-led regulator

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
---
 .../devicetree/bindings/leds/leds-ktd2692.txt      | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
new file mode 100644
index 0000000..1b44225
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
@@ -0,0 +1,37 @@
+* Kinetic Technologies - KTD2692 Flash LED Driver
+
+KTD2692 is the ideal power solution for high-power flash LEDs.
+It uses ExpressWire single-wire programming for maximum flexibility.
+
+The ExpressWire interface through CTRL pin can control LED on/off and
+enable/disable the IC, Movie/Flash mode current, Flash timeout,
+LVP(low voltage protection).
+
+Required properties:
+	- compatible: "kinetic,ktd2692"
+	- ctrl-gpio : gpio pin in order control ktd2692 flash led.
+		There is an internal 300kOhm pull-down resistor at this pin
+	- supply : "vin" LED supply
+
+Optional property:
+	- flash-timeout-us : Maximum flash timeout in microseconds.
+			flash timeout ranges from 0 to 1835000us and
+			default is 1049000us.
+
+Example:
+
+vbat: fixedregulator@0 {
+	compatible = "regulator-fixed";
+	regulator-name = "vbat-supply";
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+	gpio = <>;
+	regulator-always-on;
+};
+
+flash-led {
+	compatible = "kinetic,ktd2692";
+	ctrl-gpio = <&gpc0 1 0>;
+	flash-timeout-us = <1835000>;
+	vin-supply = <&vbat>;
+};
-- 
2.0.5
