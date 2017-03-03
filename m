From: <sean.wang@mediatek.com>
Subject: [PATCH v5 1/4] dt-bindings: leds: Add document bindings for leds-mt6323
Date: Fri, 3 Mar 2017 21:56:22 +0800
Message-ID: <1488549385-19899-2-git-send-email-sean.wang@mediatek.com>
References: <1488549385-19899-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:28915 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752108AbdCCN4q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Mar 2017 08:56:46 -0500
In-Reply-To: <1488549385-19899-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, keyhaede@gmail.com, Sean Wang <sean.wang@mediatek.com>

From: Sean Wang <sean.wang@mediatek.com>

This patch adds documentation for devicetree bindings
for LED support on MT6323 PMIC

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../devicetree/bindings/leds/leds-mt6323.txt       | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6323.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
new file mode 100644
index 0000000..135c441
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
@@ -0,0 +1,63 @@
+Device Tree Bindings for LED support on MT6323 PMIC
+
+MT6323 LED controller is subfunction provided by
+MT6323 PMIC, so the LED controllers are defined as
+the subnode of the function node provided by MT6323
+PMIC controller that is being defined as one kind of
+Muti-Function Device (MFD) using shared bus called
+PMIC wrapper for each subfunction to access remote
+MT6323 PMIC hardware.
+
+For MT6323 MFD bindings see:
+Documentation/devicetree/bindings/mfd/mt6397.txt
+For MediaTek PMIC wrapper bindings see:
+Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+
+There's sub-node for the LED controller that describes
+the initial behavior for each LED physically and currently
+only four LED sub-nodes can be supported.
+
+Required properties:
+- compatible : Must be "mediatek,mt6323-led"
+- address-cells : Must be 1
+- size-cells : Must be 0
+
+LED sub-node properties:
+- reg : LED channel number (0..3)
+- label : (optional)
+  see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger : (optional)
+  see Documentation/devicetree/bindings/leds/common.txt
+- default-state: (optional) The initial state of the LED
+  see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+	pmic: mt6323 {
+		compatible = "mediatek,mt6323";
+
+		...
+
+		mt6323led: leds {
+			compatible = "mediatek,mt6323-led";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				label = "LED0";
+				linux,default-trigger = "timer";
+				default-state = "on";
+			};
+			led@1 {
+				reg = <1>;
+				label = "LED1";
+				default-state = "off";
+			};
+			led@2 {
+				reg = <2>;
+				label = "LED2";
+				default-state = "on";
+			};
+		};
+	};
-- 
1.9.1
