From: <sean.wang@mediatek.com>
Subject: [PATCH v5 2/4] dt-bindings: mfd: Add LED subnode binding for MT6323 PMIC
Date: Fri, 3 Mar 2017 21:56:23 +0800
Message-ID: <1488549385-19899-3-git-send-email-sean.wang@mediatek.com>
References: <1488549385-19899-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:18983 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751897AbdCCN4s (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Mar 2017 08:56:48 -0500
In-Reply-To: <1488549385-19899-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, keyhaede@gmail.com, Sean Wang <sean.wang@mediatek.com>

From: Sean Wang <sean.wang@mediatek.com>

This patch adds documentation for devicetree bindings
for LED support as the subnode of MT6323 PMIC

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 949c85f..522a3bb 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -6,6 +6,7 @@ MT6397/MT6323 is a multifunction device with the following sub modules:
 - Audio codec
 - GPIO
 - Clock
+- LED
 
 It is interfaced to host controller using SPI interface by a proprietary hardware
 called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
@@ -34,6 +35,10 @@ Optional subnodes:
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
