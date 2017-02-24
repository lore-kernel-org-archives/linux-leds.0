From: <sean.wang@mediatek.com>
Subject: [PATCH v4 2/4] Documentation: devicetree: Add LED subnode binding for MT6323 PMIC
Date: Sat, 25 Feb 2017 02:47:19 +0800
Message-ID: <1487962041-6548-3-git-send-email-sean.wang@mediatek.com>
References: <1487962041-6548-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:14791 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751420AbdBXSrt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Feb 2017 13:47:49 -0500
In-Reply-To: <1487962041-6548-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, keyhaede@gmail.com, Sean Wang <sean.wang@mediatek.com>

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
