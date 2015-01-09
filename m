From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v10 05/19] mfd: max77693: Modify flash cell name identifiers
Date: Fri, 09 Jan 2015 16:22:55 +0100
Message-ID: <1420816989-1808-6-git-send-email-j.anaszewski@samsung.com>
References: <1420816989-1808-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1420816989-1808-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>
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
