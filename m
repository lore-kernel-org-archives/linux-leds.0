From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH 2/3] leds: ktd2692: add device tree bindings for ktd2692
Date: Fri, 27 Feb 2015 10:01:30 +0900
Message-ID: <1424998891-25591-3-git-send-email-ingi2.kim@samsung.com>
References: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kerner.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, cooloney@gmail.com, rpurdie@rpsys.net, treding@nvidia.com, p.zabel@pengutronix.de, andrew@lunn.ch, gregkh@linuxfoundation.org, florian.vaussard@epfl.ch, arno@natisbad.org, kuninori.morimoto.gx@renesas.com, hytszk@gmail.com, antonynpavlov@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch adds the device tree bindings for ktd2692 flash LEDs

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
---
 .../devicetree/bindings/leds/leds-ktd2692.txt      |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
new file mode 100644
index 0000000..b68faa6
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
@@ -0,0 +1,19 @@
+* Kinetic Technologies - KTD2692 Flash LED Driver
+
+KTD2692 is the ideal power solution for high-power flash LEDs.
+It uses ExpressWire single-wire programming for maximum flexibility.
+
+Required properties:
+	- compatible: "kinetic,ktd2692"
+	- strobe-gpio: gpio pin to control movie mode current level.
+	- torch-gpio: gpio pin to control ON/OFF flash mode
+			 as a higher priority over strobe-gpio.
+
+Example:
+
+flash-led {
+	compatible = "kinetic,ktd2692";
+	strobe-gpio = <&gpc0 1 0>;
+	torch-gpio = <&gpc0 2 0>;
+	status = "okay";
+};
-- 
1.7.9.5
