From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 7/9] mfd: ti-lmu: Remove support for LM3633
Date: Thu, 11 Oct 2018 11:51:21 -0500
Message-ID: <20181011165123.32198-8-dmurphy@ti.com>
References: <20181011165123.32198-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011165123.32198-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: lee.jones@linaro.org, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Remove support for the LM3633 from the ti-lmu
driver in favor of a dedicated LED driver.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/mfd/Kconfig  |  2 +-
 drivers/mfd/ti-lmu.c | 21 ---------------------
 2 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 9b04dd527c68..225cb3be350c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1293,7 +1293,7 @@ config MFD_TI_LMU
 	help
 	  Say yes here to enable support for TI LMU chips.
 
-	  TI LMU MFD supports LM3532, LM3631, LM3632, LM3633, and LM3695.
+	  TI LMU MFD supports LM3532, LM3631, LM3632, and LM3695.
 	  It consists of backlight, LED and regulator driver.
 	  It provides consistent device controls for lighting functions.
 
diff --git a/drivers/mfd/ti-lmu.c b/drivers/mfd/ti-lmu.c
index b6bfa99a29dd..2cf8a23cba52 100644
--- a/drivers/mfd/ti-lmu.c
+++ b/drivers/mfd/ti-lmu.c
@@ -102,24 +102,6 @@ static struct mfd_cell lm3632_devices[] = {
 	},
 };
 
-static struct mfd_cell lm3633_devices[] = {
-	{
-		.name          = "ti-lmu-backlight",
-		.id            = LM3633,
-		.of_compatible = "ti,lm3633-backlight",
-	},
-	{
-		.name          = "lm3633-leds",
-		.of_compatible = "ti,lm3633-leds",
-	},
-	/* Monitoring driver for open/short circuit detection */
-	{
-		.name          = "ti-lmu-fault-monitor",
-		.id            = LM3633,
-		.of_compatible = "ti,lm3633-fault-monitor",
-	},
-};
-
 static struct mfd_cell lm3695_devices[] = {
 	{
 		.name          = "ti-lmu-backlight",
@@ -139,14 +121,12 @@ static const struct ti_lmu_data chip##_data =	\
 TI_LMU_DATA(lm3532, LM3532_MAX_REG);
 TI_LMU_DATA(lm3631, LM3631_MAX_REG);
 TI_LMU_DATA(lm3632, LM3632_MAX_REG);
-TI_LMU_DATA(lm3633, LM3633_MAX_REG);
 TI_LMU_DATA(lm3695, LM3695_MAX_REG);
 
 static const struct of_device_id ti_lmu_of_match[] = {
 	{ .compatible = "ti,lm3532", .data = &lm3532_data },
 	{ .compatible = "ti,lm3631", .data = &lm3631_data },
 	{ .compatible = "ti,lm3632", .data = &lm3632_data },
-	{ .compatible = "ti,lm3633", .data = &lm3633_data },
 	{ .compatible = "ti,lm3695", .data = &lm3695_data },
 	{ }
 };
@@ -219,7 +199,6 @@ static const struct i2c_device_id ti_lmu_ids[] = {
 	{ "lm3532", LM3532 },
 	{ "lm3631", LM3631 },
 	{ "lm3632", LM3632 },
-	{ "lm3633", LM3633 },
 	{ "lm3695", LM3695 },
 	{ }
 };
-- 
2.19.0
