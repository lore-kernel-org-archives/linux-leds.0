From: <sean.wang@mediatek.com>
Subject: [PATCH 2/4] Documentation: devicetree: Add LED subnode binding for MT6323 PMIC
Date: Mon, 23 Jan 2017 11:54:43 +0800
Message-ID: <1485143685-11808-3-git-send-email-sean.wang@mediatek.com>
References: <1485143685-11808-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485143685-11808-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, keyhaede@gmail.com, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-leds@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

This patch adds documentation for devicetree bindings
for LED support as the subnode of MT6323 PMIC

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 949c85f..c568d52 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -34,6 +34,10 @@ Optional subnodes:
 - clk
 	Required properties:
 		- compatible: "mediatek,mt6397-clk"
+- led
+	Required properties:
+		- compatible: "mediatek,mt6323-led"
+	see Documentation/devicetree/bindings/leds/leds-mt6323.txt
 
 Example:
 	pwrap: pwrap@1000f000 {
-- 
1.9.1
