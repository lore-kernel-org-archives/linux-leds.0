From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 3/4] mfd: ti-lmu: Remove LM3532 backlight driver references
Date: Thu, 7 Mar 2019 16:09:46 -0600
Message-ID: <20190307220947.20057-3-dmurphy@ti.com>
References: <20190307220947.20057-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307220947.20057-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, tony@atomide.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Remove the LM3532 backlight driver references from the ti-lmu
code as dedicated driver support is available.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/mfd/ti-lmu.c       | 11 -----------
 include/linux/mfd/ti-lmu.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/mfd/ti-lmu.c b/drivers/mfd/ti-lmu.c
index 37d0bdb291c3..b06cb908d1aa 100644
--- a/drivers/mfd/ti-lmu.c
+++ b/drivers/mfd/ti-lmu.c
@@ -54,14 +54,6 @@ static void ti_lmu_disable_hw(void *data)
 		gpiod_set_value(lmu->en_gpio, 0);
 }
 
-static const struct mfd_cell lm3532_devices[] = {
-	{
-		.name          = "ti-lmu-backlight",
-		.id            = LM3532,
-		.of_compatible = "ti,lm3532-backlight",
-	},
-};
-
 #define LM363X_REGULATOR(_id)			\
 {						\
 	.name          = "lm363x-regulator",	\
@@ -141,7 +133,6 @@ static const struct ti_lmu_data chip##_data =	\
 	.max_register = max_reg,		\
 }						\
 
-TI_LMU_DATA(lm3532, LM3532_MAX_REG);
 TI_LMU_DATA(lm3631, LM3631_MAX_REG);
 TI_LMU_DATA(lm3632, LM3632_MAX_REG);
 TI_LMU_DATA(lm3633, LM3633_MAX_REG);
@@ -211,7 +202,6 @@ static int ti_lmu_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 }
 
 static const struct of_device_id ti_lmu_of_match[] = {
-	{ .compatible = "ti,lm3532", .data = &lm3532_data },
 	{ .compatible = "ti,lm3631", .data = &lm3631_data },
 	{ .compatible = "ti,lm3632", .data = &lm3632_data },
 	{ .compatible = "ti,lm3633", .data = &lm3633_data },
@@ -222,7 +212,6 @@ static const struct of_device_id ti_lmu_of_match[] = {
 MODULE_DEVICE_TABLE(of, ti_lmu_of_match);
 
 static const struct i2c_device_id ti_lmu_ids[] = {
-	{ "lm3532", LM3532 },
 	{ "lm3631", LM3631 },
 	{ "lm3632", LM3632 },
 	{ "lm3633", LM3633 },
diff --git a/include/linux/mfd/ti-lmu.h b/include/linux/mfd/ti-lmu.h
index 1ef51ed36be5..7762c1bce55d 100644
--- a/include/linux/mfd/ti-lmu.h
+++ b/include/linux/mfd/ti-lmu.h
@@ -22,7 +22,6 @@
 #define LMU_EVENT_MONITOR_DONE		0x01
 
 enum ti_lmu_id {
-	LM3532,
 	LM3631,
 	LM3632,
 	LM3633,
-- 
2.20.1.390.gb5101f9297
