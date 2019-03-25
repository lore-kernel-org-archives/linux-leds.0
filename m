From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 4/5] mfd: ti-lmu: Remove support for LM3697
Date: Mon, 25 Mar 2019 09:24:02 -0500
Message-ID: <20190325142403.30447-5-dmurphy@ti.com>
References: <20190325142403.30447-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325142403.30447-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Remove support for the LM3697 from the ti-lmu
driver in favor of a dedicated LED driver.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/Kconfig                |  2 +-
 drivers/mfd/Kconfig                 |  2 +-
 drivers/mfd/ti-lmu.c                | 17 -----------
 include/linux/mfd/ti-lmu-register.h | 44 -----------------------------
 include/linux/mfd/ti-lmu.h          |  1 -
 5 files changed, 2 insertions(+), 64 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 3ae24eaf4cde..735009e73414 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -782,7 +782,7 @@ config LEDS_TI_LMU_COMMON
 	help
           Say Y to enable the LED driver for TI LMU devices.
           This supports common features between the TI LM3532, LM3631, LM3632,
-	  LM3633, LM3695 and LM3697.
+	  LM3633, and LM3695.
 
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 0ce2d8dfc5f1..fa70ea209ec6 100644
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
2.19.0
