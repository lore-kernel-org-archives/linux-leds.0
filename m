From: <sean.wang@mediatek.com>
Subject: [PATCH v2 4/4] mfd: mt6397: Add MT6323 LED support into MT6397 driver
Date: Wed, 8 Feb 2017 10:19:17 +0800
Message-ID: <1486520357-13096-5-git-send-email-sean.wang@mediatek.com>
References: <1486520357-13096-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:31726 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751606AbdBHCVh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Feb 2017 21:21:37 -0500
In-Reply-To: <1486520357-13096-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, keyhaede@gmail.com, Sean Wang <sean.wang@mediatek.com>

From: Sean Wang <sean.wang@mediatek.com>

Add compatible string as "mt6323-led" that will make
the OF core spawn child devices for the LED subnode
of that MT6323 MFD device.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/mfd/mt6397-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index e14d8b0..8e601c8 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -48,6 +48,10 @@
 		.name = "mt6323-regulator",
 		.of_compatible = "mediatek,mt6323-regulator"
 	},
+	{
+		.name = "mt6323-led",
+		.of_compatible = "mediatek,mt6323-led"
+	},
 };
 
 static const struct mfd_cell mt6397_devs[] = {
-- 
1.9.1
