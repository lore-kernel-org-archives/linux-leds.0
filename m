From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v9 03/19] mfd: max77693: Modify flash cell name identifiers
Date: Wed, 03 Dec 2014 17:06:38 +0100
Message-ID: <1417622814-10845-4-git-send-email-j.anaszewski@samsung.com>
References: <1417622814-10845-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1417622814-10845-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kyungmin.park@samsung.com, b.zolnierkie@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Jacek Anaszewski <j.anaszewski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org

Change flash cell identifiers from max77693-flash to max77693-led
to avoid confusion with NOR/NAND Flash.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/max77693.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index a159593..cb14afa 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -53,8 +53,8 @@ static const struct mfd_cell max77693_devs[] = {
 		.of_compatible = "maxim,max77693-haptic",
 	},
 	{
-		.name = "max77693-flash",
-		.of_compatible = "maxim,max77693-flash",
+		.name = "max77693-led",
+		.of_compatible = "maxim,max77693-led",
 	},
 };
 
-- 
1.7.9.5
