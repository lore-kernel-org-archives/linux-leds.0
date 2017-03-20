From: <sean.wang@mediatek.com>
Subject: [PATCH v6 4/4] mfd: mt6397: Align the placement at which the mfd_cell of LED is defined
Date: Mon, 20 Mar 2017 14:47:27 +0800
Message-ID: <1489992447-13007-5-git-send-email-sean.wang@mediatek.com>
References: <1489992447-13007-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489992447-13007-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, keyhaede@gmail.com, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-leds@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Align the placement as which the mfd_cell of LED is defined as the other
members done on the structure.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6397-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 8e601c8..04a601f 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -47,8 +47,7 @@
 	{
 		.name = "mt6323-regulator",
 		.of_compatible = "mediatek,mt6323-regulator"
-	},
-	{
+	}, {
 		.name = "mt6323-led",
 		.of_compatible = "mediatek,mt6323-led"
 	},
-- 
1.9.1
