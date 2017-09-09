From: <sean.wang@mediatek.com>
Subject: [PATCH] MAINTAINERS: add entry for MediaTek PMIC LED driver
Date: Sat, 9 Sep 2017 20:37:03 +0800
Message-ID: <6ca394e75ef29089eef773b5856366be10745bb4.1504960075.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:1514 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753519AbdIIMhO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 9 Sep 2017 08:37:14 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>

From: Sean Wang <sean.wang@mediatek.com>

Add me as maintainers to support existing SoCs and push forward
following MediaTek PMICs with LEDs to reuse the driver.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2021738..65185bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8648,6 +8648,12 @@ M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
 F:	drivers/media/rc/mtk-cir.c
 
+MEDIATEK PMIC LED DRIVER
+M:	Sean Wang <sean.wang@mediatek.com>
+S:	Maintained
+F:	drivers/leds/leds-mt6323.c
+F:	Documentation/devicetree/bindings/leds/leds-mt6323.txt
+
 MEDIATEK RANDOM NUMBER GENERATOR SUPPORT
 M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
-- 
2.7.4
