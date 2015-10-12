From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v2 1/3] leds: rt5033: Add DT binding for RT5033
Date: Mon, 12 Oct 2015 22:12:56 +0900
Message-ID: <1444655578-19806-2-git-send-email-ingi2.kim@samsung.com>
References: <1444655578-19806-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52191 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346AbbJLNND (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 12 Oct 2015 09:13:03 -0400
In-reply-to: <1444655578-19806-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, j.anaszewski@samsung.com
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>

This patch adds the device tree bindings for RT5033 flash LEDs.

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-rt5033.txt       | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5033.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-rt5033.txt b/Documentation/devicetree/bindings/leds/leds-rt5033.txt
new file mode 100644
index 0000000..2ef7bdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-rt5033.txt
@@ -0,0 +1,38 @@
+* Richtek Technology Corporation - RT5033 Flash LED Driver
+
+The RT5033 Flash LED Circuit is designed for one or two LEDs driving
+for torch and strobe applications, it provides an I2C software command
+to trigger the torch and strobe operation.
+
+Required properties:
+- compatible : Must be "richtek,rt5033-led".
+
+A discrete LED element connected to the device must be represented by a child
+node - see Documentation/devicetree/bindings/leds/common.txt.
+
+Required properties of the LED child node:
+  See Documentation/devicetree/bindings/leds/common.txt
+- led-max-microamp : Minimum Threshold for Timer protection
+  is defined internally (Maximum 200mA).
+- flash-max-microamp : Flash LED maximum current
+- flash-max-timeout-us : Flash LED maximum timeout
+
+Optional properties of the LED child node:
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
+			led-max-microamp = <200000>;
+			flash-max-microamp = <800000>;
+			flash-max-timeout-us = <1216000>;
+		};
+	};
+}
-- 
2.0.5
