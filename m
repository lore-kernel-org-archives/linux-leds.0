From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v6 1/2] leds: rt5033: Add DT binding for RT5033
Date: Wed, 25 Nov 2015 19:22:27 +0900
Message-ID: <1448446948-13729-2-git-send-email-ingi2.kim@samsung.com>
References: <1448446948-13729-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50160 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751730AbbKYKWh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2015 05:22:37 -0500
In-reply-to: <1448446948-13729-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, j.anaszewski@samsung.com
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, andi.shyti@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>

This patch adds the device tree bindings for RT5033 flash LEDs.

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-rt5033.txt       | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5033.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-rt5033.txt b/Documentation/devicetree/bindings/leds/leds-rt5033.txt
new file mode 100644
index 0000000..17159d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-rt5033.txt
@@ -0,0 +1,46 @@
+* Richtek Technology Corporation - RT5033 Flash LED Driver
+
+The RT5033 Flash LED Circuit is designed for one or two LEDs driving
+for torch and strobe applications, it provides an I2C software command
+to trigger the torch and strobe operation.
+
+There are two LED outputs available - FLED1 and FLED2. Each of them can
+control a separate LED or they can be connected together to double
+the maximum current for a single connected LED. One LED is represented
+by one child node.
+
+Required properties:
+- compatible : Must be "richtek,rt5033-led".
+
+A discrete LED element connected to the device must be represented by a child
+node - see Documentation/devicetree/bindings/leds/common.txt.
+
+Required properties for the LED child node:
+  See Documentation/devicetree/bindings/leds/common.txt
+- led-sources : device current output identifiers:  0 - FLED1, 1 - FLED2
+- led-max-microamp : 12.5mA to 200mA, step by 12.5mA.
+- flash-max-microamp :
+	Turn on one LED channel : 50mA to 800mA, step by 25mA.
+	Turn on two LED channels : 50mA to 600mA, step by 25mA.
+- flash-max-timeout-us : 64ms to 1216ms, step by 32ms.
+
+Optional properties for the LED child node:
+- label : see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+rt5033 {
+	compatible = "richtek,rt5033";
+
+	led {
+		compatible = "richtek,rt5033-led";
+
+		flash-led {
+			label = "rt5033-flash";
+			led-sources = <0>, <1>;
+			led-max-microamp = <200000>;
+			flash-max-microamp = <800000>;
+			flash-max-timeout-us = <1216000>;
+		};
+	};
+}
-- 
2.0.5
