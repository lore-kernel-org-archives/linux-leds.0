From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 6/7] mfd: ti-lmu: Remove support for LM3697
Date: Tue, 30 Apr 2019 14:17:29 -0500
Message-ID: <20190430191730.19450-7-dmurphy@ti.com>
References: <20190430191730.19450-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430191730.19450-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org

Remove support for the LM3697 from the ti-lmu driver in favor of a
dedicated LED driver.

Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - No changes - https://lore.kernel.org/patchwork/patch/1058760/

v2 - Fixed commit message LF, removed leds/Kconfig from patch. -
https://lore.kernel.org/patchwork/patch/1054502/

 drivers/mfd/Kconfig                 |  2 +-
 drivers/mfd/ti-lmu.c                | 17 -----------
 include/linux/mfd/ti-lmu-register.h | 44 -----------------------------
 include/linux/mfd/ti-lmu.h          |  1 -
 4 files changed, 1 insertion(+), 63 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 26ad6468d13a..fcae244229b3 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1312,7 +1312,7 @@ config MFD_TI_LMU
 	help
 	  Say yes here to enable support for TI LMU chips.
 
-	  TI LMU MFD supports LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697.
+	  TI LMU MFD supports LM3532, LM3631, LM3632, LM3633, and LM3695.
 	  It consists of backlight, LED and regulator driver.
 	  It provides consistent device controls for lighting functions.
 
diff --git a/drivers/mfd/ti-lmu.c b/drivers/mfd/ti-lmu.c
index b06cb908d1aa..89b1c5b584af 100644
--- a/drivers/mfd/ti-lmu.c
+++ b/drivers/mfd/ti-lmu.c
@@ -111,20 +111,6 @@ static const struct mfd_cell lm3695_devices[] = {
 	},
 };
 
-static const struct mfd_cell lm3697_devices[] = {
-	{
-		.name          = "ti-lmu-backlight",
-		.id            = LM3697,
-		.of_compatible = "ti,lm3697-backlight",
-	},
-	/* Monitoring driver for open/short circuit detection */
-	{
-		.name          = "ti-lmu-fault-monitor",
-		.id            = LM3697,
-		.of_compatible = "ti,lm3697-fault-monitor",
-	},
-};
-
 #define TI_LMU_DATA(chip, max_reg)		\
 static const struct ti_lmu_data chip##_data =	\
 {						\
@@ -137,7 +123,6 @@ TI_LMU_DATA(lm3631, LM3631_MAX_REG);
 TI_LMU_DATA(lm3632, LM3632_MAX_REG);
 TI_LMU_DATA(lm3633, LM3633_MAX_REG);
 TI_LMU_DATA(lm3695, LM3695_MAX_REG);
-TI_LMU_DATA(lm3697, LM3697_MAX_REG);
 
 static int ti_lmu_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 {
@@ -206,7 +191,6 @@ static const struct of_device_id ti_lmu_of_match[] = {
 	{ .compatible = "ti,lm3632", .data = &lm3632_data },
 	{ .compatible = "ti,lm3633", .data = &lm3633_data },
 	{ .compatible = "ti,lm3695", .data = &lm3695_data },
-	{ .compatible = "ti,lm3697", .data = &lm3697_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ti_lmu_of_match);
@@ -216,7 +200,6 @@ static const struct i2c_device_id ti_lmu_ids[] = {
 	{ "lm3632", LM3632 },
 	{ "lm3633", LM3633 },
 	{ "lm3695", LM3695 },
-	{ "lm3697", LM3697 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ti_lmu_ids);
diff --git a/include/linux/mfd/ti-lmu-register.h b/include/linux/mfd/ti-lmu-register.h
index f09510561a55..76998b01764b 100644
--- a/include/linux/mfd/ti-lmu-register.h
+++ b/include/linux/mfd/ti-lmu-register.h
@@ -189,48 +189,4 @@
 #define LM3695_REG_BRT_MSB			0x14
 
 #define LM3695_MAX_REG				0x14
-
-/* LM3697 */
-#define LM3697_REG_HVLED_OUTPUT_CFG		0x10
-#define LM3697_HVLED1_CFG_MASK			BIT(0)
-#define LM3697_HVLED2_CFG_MASK			BIT(1)
-#define LM3697_HVLED3_CFG_MASK			BIT(2)
-#define LM3697_HVLED1_CFG_SHIFT			0
-#define LM3697_HVLED2_CFG_SHIFT			1
-#define LM3697_HVLED3_CFG_SHIFT			2
-
-#define LM3697_REG_BL0_RAMP			0x11
-#define LM3697_REG_BL1_RAMP			0x12
-#define LM3697_RAMPUP_MASK			0xF0
-#define LM3697_RAMPUP_SHIFT			4
-#define LM3697_RAMPDN_MASK			0x0F
-#define LM3697_RAMPDN_SHIFT			0
-
-#define LM3697_REG_RAMP_CONF			0x14
-#define LM3697_RAMP_MASK			0x0F
-#define LM3697_RAMP_EACH			0x05
-
-#define LM3697_REG_PWM_CFG			0x1C
-#define LM3697_PWM_A_MASK			BIT(0)
-#define LM3697_PWM_B_MASK			BIT(1)
-
-#define LM3697_REG_IMAX_A			0x17
-#define LM3697_REG_IMAX_B			0x18
-
-#define LM3697_REG_FEEDBACK_ENABLE		0x19
-
-#define LM3697_REG_BRT_A_LSB			0x20
-#define LM3697_REG_BRT_A_MSB			0x21
-#define LM3697_REG_BRT_B_LSB			0x22
-#define LM3697_REG_BRT_B_MSB			0x23
-
-#define LM3697_REG_ENABLE			0x24
-
-#define LM3697_REG_OPEN_FAULT_STATUS		0xB0
-
-#define LM3697_REG_SHORT_FAULT_STATUS		0xB2
-
-#define LM3697_REG_MONITOR_ENABLE		0xB4
-
-#define LM3697_MAX_REG				0xB4
 #endif
diff --git a/include/linux/mfd/ti-lmu.h b/include/linux/mfd/ti-lmu.h
index 7762c1bce55d..54e9d272e81c 100644
--- a/include/linux/mfd/ti-lmu.h
+++ b/include/linux/mfd/ti-lmu.h
@@ -26,7 +26,6 @@ enum ti_lmu_id {
 	LM3632,
 	LM3633,
 	LM3695,
-	LM3697,
 	LMU_MAX_ID,
 };
 
-- 
2.21.0.5.gaeb582a983
