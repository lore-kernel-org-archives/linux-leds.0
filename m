From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 4/6] regulator: lm363x: Add support for LM36274
Date: Tue, 7 May 2019 15:11:57 -0500
Message-ID: <20190507201159.13940-5-dmurphy@ti.com>
References: <20190507201159.13940-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507201159.13940-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: lee.jones@linaro.org, rdunlap@infradead.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Adding regulator support for the LM36274 backlight driver.
This device can leverage this existing code as the functionality
and registers are common enough between the LM36274 and the LM363x
series of devices.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/regulator/Kconfig            |  2 +-
 drivers/regulator/lm363x-regulator.c | 52 ++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index b7f249ee5e68..23252ae81fdf 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -362,7 +362,7 @@ config REGULATOR_LM363X
 	tristate "TI LM363X voltage regulators"
 	depends on MFD_TI_LMU
 	help
-	  This driver supports LM3631 and LM3632 voltage regulators for
+	  This driver supports LM3631, LM3632 and LM36274 voltage regulators for
 	  the LCD bias.
 	  One boost output voltage is configurable and always on.
 	  Other LDOs are used for the display module.
diff --git a/drivers/regulator/lm363x-regulator.c b/drivers/regulator/lm363x-regulator.c
index 382b1cecdd93..1944677b1448 100644
--- a/drivers/regulator/lm363x-regulator.c
+++ b/drivers/regulator/lm363x-regulator.c
@@ -37,6 +37,11 @@
 #define LM3632_VBOOST_MIN		4500000
 #define LM3632_VLDO_MIN			4000000
 
+/* LM36274 */
+#define LM36274_BOOST_VSEL_MAX		0x3f
+#define LM36274_LDO_VSEL_MAX		0x34
+#define LM36274_VOLTAGE_MIN		4000000
+
 /* Common */
 #define LM363X_STEP_50mV		50000
 #define LM363X_STEP_500mV		500000
@@ -217,6 +222,51 @@ static const struct regulator_desc lm363x_regulator_desc[] = {
 		.enable_reg     = LM3632_REG_BIAS_CONFIG,
 		.enable_mask    = LM3632_EN_VNEG_MASK,
 	},
+
+	/* LM36274 */
+	{
+		.name           = "vboost",
+		.of_match	= "vboost",
+		.id             = LM36274_BOOST,
+		.ops            = &lm363x_boost_voltage_table_ops,
+		.n_voltages     = LM36274_BOOST_VSEL_MAX,
+		.min_uV         = LM36274_VOLTAGE_MIN,
+		.uV_step        = LM363X_STEP_50mV,
+		.type           = REGULATOR_VOLTAGE,
+		.owner          = THIS_MODULE,
+		.vsel_reg       = LM36274_REG_VOUT_BOOST,
+		.vsel_mask      = LM36274_VOUT_MASK,
+	},
+	{
+		.name           = "ldo_vpos",
+		.of_match	= "vpos",
+		.id             = LM36274_LDO_POS,
+		.ops            = &lm363x_regulator_voltage_table_ops,
+		.n_voltages     = LM36274_LDO_VSEL_MAX,
+		.min_uV         = LM36274_VOLTAGE_MIN,
+		.uV_step        = LM363X_STEP_50mV,
+		.type           = REGULATOR_VOLTAGE,
+		.owner          = THIS_MODULE,
+		.vsel_reg       = LM36274_REG_VOUT_POS,
+		.vsel_mask      = LM36274_VOUT_MASK,
+		.enable_reg     = LM36274_REG_BIAS_CONFIG_1,
+		.enable_mask    = LM36274_EN_VPOS_MASK,
+	},
+	{
+		.name           = "ldo_vneg",
+		.of_match	= "vneg",
+		.id             = LM36274_LDO_NEG,
+		.ops            = &lm363x_regulator_voltage_table_ops,
+		.n_voltages     = LM36274_LDO_VSEL_MAX,
+		.min_uV         = LM36274_VOLTAGE_MIN,
+		.uV_step        = LM363X_STEP_50mV,
+		.type           = REGULATOR_VOLTAGE,
+		.owner          = THIS_MODULE,
+		.vsel_reg       = LM36274_REG_VOUT_NEG,
+		.vsel_mask      = LM36274_VOUT_MASK,
+		.enable_reg     = LM36274_REG_BIAS_CONFIG_1,
+		.enable_mask    = LM36274_EN_VNEG_MASK,
+	},
 };
 
 static struct gpio_desc *lm363x_regulator_of_get_enable_gpio(struct device *dev, int id)
@@ -229,9 +279,11 @@ static struct gpio_desc *lm363x_regulator_of_get_enable_gpio(struct device *dev,
 	 */
 	switch (id) {
 	case LM3632_LDO_POS:
+	case LM36274_LDO_POS:
 		return gpiod_get_index_optional(dev, "enable", 0,
 				GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	case LM3632_LDO_NEG:
+	case LM36274_LDO_NEG:
 		return gpiod_get_index_optional(dev, "enable", 1,
 				GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	default:
-- 
2.21.0.5.gaeb582a983
