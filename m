From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/3] leds: Add driver for Qualcomm LPG
Date: Fri, 14 Jul 2017 15:45:19 -0700
Message-ID: <20170714224520.467-3-bjorn.andersson@linaro.org>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170714224520.467-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
PMICs from Qualcomm. It can operate on fixed parameters or based on a
lookup-table, altering the duty cycle over time - which provides the
means for e.g. hardware assisted transitions of LED brightness.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Remove custom DT properties for patterns
- Extract pattern interface into the LED core

 drivers/leds/Kconfig             |   7 +
 drivers/leds/Makefile            |   3 +
 drivers/leds/leds-qcom-lpg-lut.c | 296 +++++++++++++++
 drivers/leds/leds-qcom-lpg.c     | 782 +++++++++++++++++++++++++++++++++++++++
 drivers/leds/leds-qcom-lpg.h     |  30 ++
 drivers/leds/leds-qcom-triled.c  | 193 ++++++++++
 6 files changed, 1311 insertions(+)
 create mode 100644 drivers/leds/leds-qcom-lpg-lut.c
 create mode 100644 drivers/leds/leds-qcom-lpg.c
 create mode 100644 drivers/leds/leds-qcom-lpg.h
 create mode 100644 drivers/leds/leds-qcom-triled.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6c2999872090..1b858f7af01c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -641,6 +641,13 @@ config LEDS_POWERNV
 	  To compile this driver as a module, choose 'm' here: the module
 	  will be called leds-powernv.
 
+config LEDS_QCOM_LPG
+	tristate "LED support for Qualcomm LPG"
+	depends on LEDS_CLASS
+	help
+	  This option enables support for the Light Pulse Generator found in a
+	  wide variety of Qualcomm PMICs.
+
 config LEDS_SYSCON
 	bool "LED support for LEDs on system controllers"
 	depends on LEDS_CLASS=y
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 45f133962ed8..b42998418b22 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -61,6 +61,9 @@ obj-$(CONFIG_LEDS_MAX77693)		+= leds-max77693.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_LM355x)		+= leds-lm355x.o
 obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
+obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
+obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg-lut.o
+obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-triled.o
 obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
 obj-$(CONFIG_LEDS_VERSATILE)		+= leds-versatile.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
diff --git a/drivers/leds/leds-qcom-lpg-lut.c b/drivers/leds/leds-qcom-lpg-lut.c
new file mode 100644
index 000000000000..27a46377587b
--- /dev/null
+++ b/drivers/leds/leds-qcom-lpg-lut.c
@@ -0,0 +1,296 @@
+/* Copyright (c) 2017 Linaro Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include "leds-qcom-lpg.h"
+
+#define LPG_LUT_REG(x)		(0x40 + (x) * 2)
+#define RAMP_CONTROL_REG	0xc8
+
+static struct platform_driver lpg_lut_driver;
+
+/*
+ * lpg_lut_dev - LUT device context
+ * @dev:	struct device for the LUT device
+ * @map:	regmap for register access
+ * @reg:	base address for the LUT block
+ * @size:	number of LUT entries in LUT block
+ * @bitmap:	bitmap tracking occupied LUT entries
+ */
+struct lpg_lut_dev {
+	struct device *dev;
+	struct regmap *map;
+
+	u32 reg;
+	u32 size;
+
+	unsigned long bitmap[];
+};
+
+/*
+ * qcom_lpg_lut - context for a client and LUT device pair
+ * @ldev:	reference to a LUT device
+ * @start_mask:	mask of bits to use for synchronizing ramp generators
+ */
+struct qcom_lpg_lut {
+	struct lpg_lut_dev *ldev;
+	int start_mask;
+};
+
+static void lpg_lut_release(struct device *dev, void *res)
+{
+	struct qcom_lpg_lut *lut = res;
+
+	put_device(lut->ldev->dev);
+}
+
+/**
+ * qcom_lpg_lut_get() - acquire a handle to the LUT implementation
+ * @dev:	struct device reference of the client
+ *
+ * Returns a LUT context, or ERR_PTR on failure.
+ */
+struct qcom_lpg_lut *qcom_lpg_lut_get(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *lut_node;
+	struct qcom_lpg_lut *lut;
+	u32 cell;
+	int ret;
+
+	lut_node = of_parse_phandle(dev->of_node, "qcom,lut", 0);
+	if (!lut_node)
+		return NULL;
+
+	ret = of_property_read_u32(dev->of_node, "qcom,lpg-channel", &cell);
+	if (ret) {
+		dev_err(dev, "lpg without qcom,lpg-channel\n");
+		return ERR_PTR(ret);
+	}
+
+	pdev = of_find_device_by_node(lut_node);
+	of_node_put(lut_node);
+	if (!pdev || !pdev->dev.driver)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (pdev->dev.driver != &lpg_lut_driver.driver) {
+		dev_err(dev, "referenced node is not a lpg lut\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	lut = devres_alloc(lpg_lut_release, sizeof(*lut), GFP_KERNEL);
+	if (!lut)
+		return ERR_PTR(-ENOMEM);
+
+	lut->ldev = platform_get_drvdata(pdev);
+	lut->start_mask = BIT(cell - 1);
+
+	devres_add(dev, lut);
+
+	return lut;
+}
+EXPORT_SYMBOL_GPL(qcom_lpg_lut_get);
+
+/**
+ * qcom_lpg_lut_store() - store a sequence of levels in the LUT
+ * @lut:	LUT context acquired from qcom_lpg_lut_get()
+ * @values:	an array of values, in the range 0 <= x < 512
+ * @len:	length of the @values array
+ *
+ * Returns a qcom_lpg_pattern object, or ERR_PTR on failure.
+ *
+ * Patterns must be freed by calling qcom_lpg_lut_free()
+ */
+struct qcom_lpg_pattern *qcom_lpg_lut_store(struct qcom_lpg_lut *lut,
+					    const u16 *values, size_t len)
+{
+	struct qcom_lpg_pattern *pattern;
+	struct lpg_lut_dev *ldev = lut->ldev;
+	unsigned long lo_idx;
+	u8 val[2];
+	int i;
+
+	/* Hardware does not behave when LO_IDX == HI_IDX */
+	if (len == 1)
+		return ERR_PTR(-EINVAL);
+
+	lo_idx = bitmap_find_next_zero_area(ldev->bitmap, ldev->size, 0, len, 0);
+	if (lo_idx >= ldev->size)
+		return ERR_PTR(-ENOMEM);
+
+	pattern = kzalloc(sizeof(*pattern), GFP_KERNEL);
+	if (!pattern)
+		return ERR_PTR(-ENOMEM);
+
+	pattern->lut = lut;
+	pattern->lo_idx = lo_idx;
+	pattern->hi_idx = lo_idx + len - 1;
+
+	for (i = 0; i < len; i++) {
+		val[0] = values[i] & 0xff;
+		val[1] = values[i] >> 8;
+
+		regmap_bulk_write(ldev->map,
+				  ldev->reg + LPG_LUT_REG(lo_idx + i), val, 2);
+	}
+
+	bitmap_set(ldev->bitmap, lo_idx, len);
+
+	return pattern;
+}
+EXPORT_SYMBOL_GPL(qcom_lpg_lut_store);
+
+/**
+ * qcom_lpg_lut_read() - read the data points from a pattern
+ * @pattern:	pattern to be read
+ * @len:	to be filled in with length of the pattern
+ *
+ * Returns an allocated u16 array of brightness values, NULL if no pattern
+ * specified or ERR_PTR() on failure. Caller must free the returned array.
+ */
+u16 *qcom_lpg_lut_read(struct qcom_lpg_pattern *pattern, size_t *len)
+{
+	struct qcom_lpg_lut *lut;
+	struct lpg_lut_dev *ldev;
+	unsigned long lo_idx;
+	u16 *values;
+	u8 val[2];
+	int ret;
+	int i;
+
+	if (!pattern)
+		return NULL;
+
+	lut = pattern->lut;
+	ldev = lut->ldev;
+	lo_idx = pattern->lo_idx;
+
+	*len = pattern->hi_idx - pattern->lo_idx + 1;
+
+	values = kcalloc(*len, sizeof(u16), GFP_KERNEL);
+	if (!values)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < *len; i++) {
+		ret = regmap_bulk_read(ldev->map,
+				       ldev->reg + LPG_LUT_REG(lo_idx + i),
+				       &val, 2);
+		if (ret < 0) {
+			kfree(values);
+			return ERR_PTR(ret);
+		}
+
+		values[i] = val[0] | val[1] << 8;
+	}
+
+	return values;
+}
+EXPORT_SYMBOL_GPL(qcom_lpg_lut_read);
+
+/**
+ * qcom_lpg_lut_free() - release LUT pattern and free entries
+ * @pattern:	reference to pattern to release
+ */
+void qcom_lpg_lut_free(struct qcom_lpg_pattern *pattern)
+{
+	struct qcom_lpg_lut *lut;
+	struct lpg_lut_dev *ldev;
+	int len;
+
+	if (!pattern)
+		return;
+
+	lut = pattern->lut;
+	ldev = lut->ldev;
+
+	len = pattern->hi_idx - pattern->lo_idx + 1;
+	bitmap_clear(ldev->bitmap, pattern->lo_idx, len);
+}
+EXPORT_SYMBOL_GPL(qcom_lpg_lut_free);
+
+/**
+ * qcom_lpg_lut_sync() - (re)start the ramp generator, to sync pattern
+ * @lut:	LUT device reference, to sync
+ */
+int qcom_lpg_lut_sync(struct qcom_lpg_lut *lut)
+{
+	struct lpg_lut_dev *ldev = lut->ldev;
+
+	return regmap_update_bits(ldev->map, ldev->reg + RAMP_CONTROL_REG,
+				  lut->start_mask, 0xff);
+}
+EXPORT_SYMBOL_GPL(qcom_lpg_lut_sync);
+
+static int lpg_lut_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct lpg_lut_dev *ldev;
+	size_t bitmap_size;
+	u32 size;
+	int ret;
+
+	ret = of_property_read_u32(np, "qcom,lut-size", &size);
+	if (ret) {
+		dev_err(&pdev->dev, "invalid LUT size\n");
+		return -EINVAL;
+	}
+
+	bitmap_size = BITS_TO_LONGS(size) / sizeof(unsigned long);
+	ldev = devm_kzalloc(&pdev->dev, sizeof(*ldev) + bitmap_size, GFP_KERNEL);
+	if (!ldev)
+		return -ENOMEM;
+
+	ldev->dev = &pdev->dev;
+	ldev->size = size;
+
+	ldev->map = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!ldev->map) {
+		dev_err(&pdev->dev, "parent regmap unavailable\n");
+		return -ENXIO;
+	}
+
+	ret = of_property_read_u32(np, "reg", &ldev->reg);
+	if (ret) {
+		dev_err(&pdev->dev, "no register offset specified\n");
+		return -EINVAL;
+	}
+
+	platform_set_drvdata(pdev, ldev);
+
+	return 0;
+}
+
+static const struct of_device_id lpg_lut_of_table[] = {
+	{ .compatible = "qcom,spmi-lpg-lut" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, lpg_lut_of_table);
+
+static struct platform_driver lpg_lut_driver = {
+	.probe = lpg_lut_probe,
+	.driver = {
+		.name = "qcom_lpg_lut",
+		.of_match_table = lpg_lut_of_table,
+	},
+};
+module_platform_driver(lpg_lut_driver);
+
+MODULE_DESCRIPTION("Qualcomm TRI LED driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/leds/leds-qcom-lpg.c b/drivers/leds/leds-qcom-lpg.c
new file mode 100644
index 000000000000..f4755bdb2e3f
--- /dev/null
+++ b/drivers/leds/leds-qcom-lpg.c
@@ -0,0 +1,782 @@
+/*
+ * Copyright (c) 2017 Linaro Ltd
+ * Copyright (c) 2010-2012, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include "leds-qcom-lpg.h"
+
+#define LPG_PATTERN_CONFIG_REG	0x40
+#define LPG_SIZE_CLK_REG	0x41
+#define LPG_PREDIV_CLK_REG	0x42
+#define PWM_TYPE_CONFIG_REG	0x43
+#define PWM_VALUE_REG		0x44
+#define PWM_ENABLE_CONTROL_REG	0x46
+#define PWM_SYNC_REG		0x47
+#define LPG_RAMP_DURATION_REG	0x50
+#define LPG_HI_PAUSE_REG	0x52
+#define LPG_LO_PAUSE_REG	0x54
+#define LPG_HI_IDX_REG		0x56
+#define LPG_LO_IDX_REG		0x57
+#define PWM_SEC_ACCESS_REG	0xd0
+#define PWM_DTEST_REG(x)	(0xe2 + (x) - 1)
+
+/*
+ * lpg - LPG device context
+ * @dev:	struct device for LPG device
+ * @map:	regmap for register access
+ * @reg:	base address of the LPG device
+ * @dtest_line:	DTEST line for output, or 0 if disabled
+ * @dtest_value: DTEST line configuration
+ * @is_lpg:	operating as LPG, in contrast to simple PWM
+ * @cdev:	LED class object
+ * @tri_led:	reference to TRILED color object, optional
+ * @chip:	PWM-chip object, if operating in PWM mode
+ * @period_us:	period (in microseconds) of the generated pulses
+ * @pwm_value:	duty (in microseconds) of the generated pulses, overriden by LUT
+ * @enabled:	output enabled?
+ * @pwm_size:	resolution of the @pwm_value, 6 or 9 bits
+ * @clk:	base frequency of the clock generator
+ * @pre_div:	divider of @clk
+ * @pre_div_exp: exponential divider of @clk
+ * @ramp_enabled: duty cycle is driven by iterating over lookup table
+ * @ramp_ping_pong: reverse through pattern, rather than wrapping to start
+ * @ramp_oneshot: perform only a single pass over the pattern
+ * @ramp_reverse: iterate over pattern backwards
+ * @ramp_duration_ms: length (in milliseconds) of one pattern run
+ * @ramp_lo_pause_ms: pause (in milliseconds) before iterating over pattern
+ * @ramp_hi_pause_ms: pause (in milliseconds) after iterating over pattern
+ * @lut:	LUT context reference
+ * @pattern:	reference to allocated pattern with LUT
+ */
+
+struct lpg {
+	struct device *dev;
+	struct regmap *map;
+
+	u32 reg;
+	int dtest_line;
+	int dtest_value;
+
+	bool is_lpg;
+
+	struct led_classdev cdev;
+
+	struct qcom_tri_led *tri_led;
+
+	struct pwm_chip chip;
+
+	unsigned int period_us;
+
+	u16 pwm_value;
+	bool enabled;
+
+	unsigned int pwm_size;
+	unsigned int clk;
+	unsigned int pre_div;
+	unsigned int pre_div_exp;
+
+	bool ramp_enabled;
+	bool ramp_ping_pong;
+	bool ramp_oneshot;
+	bool ramp_reverse;
+	unsigned long ramp_duration_ms;
+	unsigned long ramp_lo_pause_ms;
+	unsigned long ramp_hi_pause_ms;
+
+	struct qcom_lpg_lut *lut;
+	struct qcom_lpg_pattern *pattern;
+};
+
+#define NUM_PWM_PREDIV	4
+#define NUM_PWM_CLK	3
+#define NUM_EXP		7
+
+static const unsigned int lpg_clk_table[NUM_PWM_PREDIV][NUM_PWM_CLK] = {
+	{
+		1 * (NSEC_PER_SEC / 1024),
+		1 * (NSEC_PER_SEC / 32768),
+		1 * (NSEC_PER_SEC / 19200000),
+	},
+	{
+		3 * (NSEC_PER_SEC / 1024),
+		3 * (NSEC_PER_SEC / 32768),
+		3 * (NSEC_PER_SEC / 19200000),
+	},
+	{
+		5 * (NSEC_PER_SEC / 1024),
+		5 * (NSEC_PER_SEC / 32768),
+		5 * (NSEC_PER_SEC / 19200000),
+	},
+	{
+		6 * (NSEC_PER_SEC / 1024),
+		6 * (NSEC_PER_SEC / 32768),
+		6 * (NSEC_PER_SEC / 19200000),
+	},
+};
+
+/*
+ * PWM Frequency = Clock Frequency / (N * T)
+ *      or
+ * PWM Period = Clock Period * (N * T)
+ *      where
+ * N = 2^9 or 2^6 for 9-bit or 6-bit PWM size
+ * T = Pre-divide * 2^m, where m = 0..7 (exponent)
+ *
+ * This is the formula to figure out m for the best pre-divide and clock:
+ * (PWM Period / N) = (Pre-divide * Clock Period) * 2^m
+ */
+static void lpg_calc_freq(struct lpg *lpg, unsigned int period_us)
+{
+	int             n, m, clk, div;
+	int             best_m, best_div, best_clk;
+	unsigned int    last_err, cur_err, min_err;
+	unsigned int    tmp_p, period_n;
+
+	if (period_us == lpg->period_us)
+		return;
+
+	/* PWM Period / N */
+	if (period_us < ((unsigned int)(-1) / NSEC_PER_USEC)) {
+		period_n = (period_us * NSEC_PER_USEC) >> 6;
+		n = 6;
+	} else {
+		period_n = (period_us >> 9) * NSEC_PER_USEC;
+		n = 9;
+	}
+
+	min_err = last_err = (unsigned int)(-1);
+	best_m = 0;
+	best_clk = 0;
+	best_div = 0;
+	for (clk = 0; clk < NUM_PWM_CLK; clk++) {
+		for (div = 0; div < NUM_PWM_PREDIV; div++) {
+			/* period_n = (PWM Period / N) */
+			/* tmp_p = (Pre-divide * Clock Period) * 2^m */
+			tmp_p = lpg_clk_table[div][clk];
+			for (m = 0; m <= NUM_EXP; m++) {
+				if (period_n > tmp_p)
+					cur_err = period_n - tmp_p;
+				else
+					cur_err = tmp_p - period_n;
+
+				if (cur_err < min_err) {
+					min_err = cur_err;
+					best_m = m;
+					best_clk = clk;
+					best_div = div;
+				}
+
+				if (m && cur_err > last_err)
+					/* Break for bigger cur_err */
+					break;
+
+				last_err = cur_err;
+				tmp_p <<= 1;
+			}
+		}
+	}
+
+	/* Use higher resolution */
+	if (best_m >= 3 && n == 6) {
+		n += 3;
+		best_m -= 3;
+	}
+
+	lpg->clk = best_clk;
+	lpg->pre_div = best_div;
+	lpg->pre_div_exp = best_m;
+	lpg->pwm_size = n;
+
+	lpg->period_us = period_us;
+}
+
+static void lpg_calc_duty(struct lpg *lpg, unsigned long duty_us)
+{
+	unsigned long max = (1 << lpg->pwm_size) - 1;
+	unsigned long val;
+
+	/* Figure out pwm_value with overflow handling */
+	if (duty_us < 1 << (sizeof(val) * 8 - lpg->pwm_size))
+		val = (duty_us << lpg->pwm_size) / lpg->period_us;
+	else
+		val = duty_us / (lpg->period_us >> lpg->pwm_size);
+
+	if (val > max)
+		val = max;
+
+	lpg->pwm_value = val;
+}
+
+#define LPG_RESOLUTION_9BIT	BIT(4)
+
+static void lpg_apply_freq(struct lpg *lpg)
+{
+	unsigned long val;
+
+	if (!lpg->enabled)
+		return;
+
+	/* Clock register values are off-by-one from lpg_clk_table */
+	val = lpg->clk + 1;
+
+	if (lpg->pwm_size == 9)
+		val |= LPG_RESOLUTION_9BIT;
+	regmap_write(lpg->map, lpg->reg + LPG_SIZE_CLK_REG, val);
+
+	val = lpg->pre_div << 5 | lpg->pre_div_exp;
+	regmap_write(lpg->map, lpg->reg + LPG_PREDIV_CLK_REG, val);
+}
+
+#define LPG_ENABLE_GLITCH_REMOVAL	BIT(5)
+
+static void lpg_enable_glitch(struct lpg *lpg)
+{
+	regmap_update_bits(lpg->map, lpg->reg + PWM_TYPE_CONFIG_REG,
+			   LPG_ENABLE_GLITCH_REMOVAL, 0);
+}
+
+static void lpg_disable_glitch(struct lpg *lpg)
+{
+	regmap_update_bits(lpg->map, lpg->reg + PWM_TYPE_CONFIG_REG,
+			   LPG_ENABLE_GLITCH_REMOVAL,
+			   LPG_ENABLE_GLITCH_REMOVAL);
+}
+
+static void lpg_apply_pwm_value(struct lpg *lpg)
+{
+	u8 val[] = { lpg->pwm_value & 0xff, lpg->pwm_value >> 8 };
+
+	if (!lpg->enabled)
+		return;
+
+	regmap_bulk_write(lpg->map, lpg->reg + PWM_VALUE_REG, val, 2);
+}
+
+#define LPG_PATTERN_CONFIG_LO_TO_HI	BIT(4)
+#define LPG_PATTERN_CONFIG_REPEAT	BIT(3)
+#define LPG_PATTERN_CONFIG_TOGGLE	BIT(2)
+#define LPG_PATTERN_CONFIG_PAUSE_HI	BIT(1)
+#define LPG_PATTERN_CONFIG_PAUSE_LO	BIT(0)
+
+static void lpg_apply_lut_control(struct lpg *lpg)
+{
+	struct qcom_lpg_pattern *pattern = lpg->pattern;
+	unsigned int hi_pause;
+	unsigned int lo_pause;
+	unsigned int step;
+	unsigned int conf = 0;
+	int pattern_len;
+
+	if (!lpg->ramp_enabled || !pattern)
+		return;
+
+	pattern_len = pattern->hi_idx - pattern->lo_idx + 1;
+
+	step = DIV_ROUND_UP(lpg->ramp_duration_ms, pattern_len);
+	hi_pause = DIV_ROUND_UP(lpg->ramp_hi_pause_ms, step);
+	lo_pause = DIV_ROUND_UP(lpg->ramp_lo_pause_ms, step);
+
+	if (!lpg->ramp_reverse)
+		conf |= LPG_PATTERN_CONFIG_LO_TO_HI;
+	if (!lpg->ramp_oneshot)
+		conf |= LPG_PATTERN_CONFIG_REPEAT;
+	if (lpg->ramp_ping_pong)
+		conf |= LPG_PATTERN_CONFIG_TOGGLE;
+	if (lpg->ramp_hi_pause_ms)
+		conf |= LPG_PATTERN_CONFIG_PAUSE_HI;
+	if (lpg->ramp_lo_pause_ms)
+		conf |= LPG_PATTERN_CONFIG_PAUSE_LO;
+
+	regmap_write(lpg->map, lpg->reg + LPG_PATTERN_CONFIG_REG, conf);
+	regmap_write(lpg->map, lpg->reg + LPG_HI_IDX_REG, pattern->hi_idx);
+	regmap_write(lpg->map, lpg->reg + LPG_LO_IDX_REG, pattern->lo_idx);
+
+	regmap_write(lpg->map, lpg->reg + LPG_RAMP_DURATION_REG, step);
+	regmap_write(lpg->map, lpg->reg + LPG_HI_PAUSE_REG, hi_pause);
+	regmap_write(lpg->map, lpg->reg + LPG_LO_PAUSE_REG, lo_pause);
+
+	/* Trigger start of ramp generator(s) */
+	qcom_lpg_lut_sync(lpg->lut);
+}
+
+#define LPG_ENABLE_CONTROL_OUTPUT		BIT(7)
+#define LPG_ENABLE_CONTROL_BUFFER_TRISTATE	BIT(5)
+#define LPG_ENABLE_CONTROL_SRC_PWM		BIT(2)
+#define LPG_ENABLE_CONTROL_RAMP_GEN		BIT(1)
+
+static void lpg_apply_control(struct lpg *lpg)
+{
+	unsigned int ctrl;
+
+	ctrl = LPG_ENABLE_CONTROL_BUFFER_TRISTATE;
+
+	if (lpg->enabled)
+		ctrl |= LPG_ENABLE_CONTROL_OUTPUT;
+
+	if (lpg->pattern)
+		ctrl |= LPG_ENABLE_CONTROL_RAMP_GEN;
+	else
+		ctrl |= LPG_ENABLE_CONTROL_SRC_PWM;
+
+	regmap_write(lpg->map, lpg->reg + PWM_ENABLE_CONTROL_REG, ctrl);
+
+	/*
+	 * Due to LPG hardware bug, in the PWM mode, having enabled PWM,
+	 * We have to write PWM values one more time.
+	 */
+	if (lpg->enabled)
+		lpg_apply_pwm_value(lpg);
+}
+
+#define LPG_SYNC_PWM	BIT(0)
+
+static void lpg_apply_sync(struct lpg *lpg)
+{
+	regmap_write(lpg->map, lpg->reg + PWM_SYNC_REG, LPG_SYNC_PWM);
+}
+
+static void lpg_apply_dtest(struct lpg *lpg)
+{
+	if (!lpg->dtest_line)
+		return;
+
+	regmap_write(lpg->map, lpg->reg + PWM_SEC_ACCESS_REG, 0xa5);
+	regmap_write(lpg->map, lpg->reg + PWM_DTEST_REG(lpg->dtest_line),
+		     lpg->dtest_value);
+}
+
+static void lpg_apply(struct lpg *lpg)
+{
+	lpg_disable_glitch(lpg);
+	lpg_apply_freq(lpg);
+	lpg_apply_pwm_value(lpg);
+	lpg_apply_control(lpg);
+	lpg_apply_sync(lpg);
+	lpg_apply_lut_control(lpg);
+	lpg_enable_glitch(lpg);
+
+	if (lpg->tri_led)
+		qcom_tri_led_set(lpg->tri_led, lpg->enabled);
+}
+
+static void lpg_brightness_set(struct led_classdev *cdev,
+			      enum led_brightness value)
+{
+	struct lpg *lpg = container_of(cdev, struct lpg, cdev);
+	unsigned int duty_us;
+
+	if (value == LED_OFF) {
+		lpg->enabled = false;
+		lpg->ramp_enabled = false;
+	} else if (lpg->pattern) {
+		lpg_calc_freq(lpg, NSEC_PER_USEC);
+
+		lpg->enabled = true;
+		lpg->ramp_enabled = true;
+	} else {
+		lpg_calc_freq(lpg, NSEC_PER_USEC);
+
+		duty_us = value * lpg->period_us / cdev->max_brightness;
+		lpg_calc_duty(lpg, duty_us);
+		lpg->enabled = true;
+		lpg->ramp_enabled = false;
+	}
+
+	lpg_apply(lpg);
+}
+
+static enum led_brightness lpg_brightness_get(struct led_classdev *cdev)
+{
+	struct lpg *lpg = container_of(cdev, struct lpg, cdev);
+	unsigned long max = (1 << lpg->pwm_size) - 1;
+
+	if (!lpg->enabled)
+		return LED_OFF;
+	else if (lpg->pattern)
+		return LED_FULL;
+	else
+		return lpg->pwm_value * cdev->max_brightness / max;
+}
+
+static int lpg_blink_set(struct led_classdev *cdev,
+			 unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct lpg *lpg = container_of(cdev, struct lpg, cdev);
+	unsigned int period_us;
+	unsigned int duty_us;
+
+	if (!*delay_on && !*delay_off) {
+		*delay_on = 500;
+		*delay_off = 500;
+	}
+
+	duty_us = *delay_on * USEC_PER_MSEC;
+	period_us = (*delay_on + *delay_off) * USEC_PER_MSEC;
+
+	lpg_calc_freq(lpg, period_us);
+	lpg_calc_duty(lpg, duty_us);
+
+	lpg->enabled = true;
+	lpg->ramp_enabled = false;
+
+	lpg_apply(lpg);
+
+	return 0;
+}
+
+#define interpolate(x1, y1, x2, y2, x) \
+	((y1) + ((y2) - (y1)) * ((x) - (x1)) / ((x2) - (x1)))
+
+static int lpg_pattern_set(struct led_classdev *led_cdev,
+			   struct led_pattern *led_pattern, int len,
+			   bool repeat)
+{
+	struct lpg *lpg = container_of(led_cdev, struct lpg, cdev);
+	struct qcom_lpg_pattern *new_pattern;
+	unsigned int duration = 0;
+	unsigned int min_delta = (unsigned int)-1;
+	unsigned int hi_pause;
+	unsigned int lo_pause = 0;
+	unsigned int max = (1 << lpg->pwm_size) - 1;
+	bool ping_pong = true;
+	int brightness_a;
+	int brightness_b;
+	u16 *pattern;
+	int src_idx;
+	int dst_idx;
+	int step_t;
+	int time_a;
+	int time_b;
+	int value;
+	int steps;
+	int ret = 0;
+
+	/*
+	 * The led_pattern specifies brightness values, potentially distributed
+	 * unevenly over the duration of the pattern. The LPG only support
+	 * evenly distributed values, so we interpolate new values from the
+	 * led_pattern.
+	 */
+
+	/* Sum the duration over the inner delta_ts and the tail is hi_pause */
+	for (src_idx = 0; src_idx < len - 1; src_idx++)
+		duration += led_pattern[src_idx].delta_t;
+	hi_pause = led_pattern[src_idx].delta_t;
+
+	for (src_idx = 0; src_idx < len; src_idx++) {
+		min_delta = min_t(unsigned int, min_delta,
+				  led_pattern[src_idx].delta_t);
+	}
+
+	steps = duration / min_delta + 1;
+	pattern = kcalloc(steps, sizeof(*pattern), GFP_KERNEL);
+	if (!pattern)
+		return -ENOMEM;
+
+	time_a = 0;
+	for (src_idx = 0, dst_idx = 0; dst_idx < steps; dst_idx++) {
+		/* The timestamp of this evenly distributed data point */
+		step_t = dst_idx * min_delta;
+
+		/*
+		 * Find time_a - time_b interval from source pattern that spans
+		 * step_t
+		 */
+		while (time_a + led_pattern[src_idx].delta_t < step_t) {
+			if (src_idx >= len - 1)
+				break;
+			time_a += led_pattern[++src_idx].delta_t;
+		}
+
+		if (src_idx < len - 1) {
+			time_b = time_a + led_pattern[src_idx].delta_t;
+
+			brightness_a = led_pattern[src_idx].brightness;
+			brightness_b = led_pattern[src_idx + 1].brightness;
+
+			/* Interpolate over the source pattern segment */
+			value = interpolate(time_a, brightness_a, time_b,
+					    brightness_b, step_t);
+		} else {
+			value = led_pattern[src_idx].brightness;
+		}
+
+		/* Scale calculated value to the hardware brightness value */
+		pattern[dst_idx] = value * max / led_cdev->max_brightness;
+	}
+
+	/* Detect palindromes and use "ping pong" to reduce LUT usage */
+	for (dst_idx = 0; dst_idx < steps / 2; dst_idx++) {
+		if (pattern[dst_idx] != pattern[len - dst_idx - 1]) {
+			ping_pong = false;
+			break;
+		}
+	}
+	if (ping_pong) {
+		steps = (steps + 1) / 2;
+
+		/*
+		 * When ping_pong is set the hi_pause will happen in the middle
+		 * of the pattern, so we need to use lo_pause to delay between
+		 * the loops.
+		 */
+		if (repeat)
+			lo_pause = hi_pause;
+
+		hi_pause = 0;
+	}
+
+	new_pattern = qcom_lpg_lut_store(lpg->lut, pattern, steps);
+	if (IS_ERR(new_pattern)) {
+		ret = PTR_ERR(new_pattern);
+		goto out;
+	}
+
+	qcom_lpg_lut_free(lpg->pattern);
+
+	lpg->pattern = new_pattern;
+	lpg->ramp_duration_ms = duration;
+	lpg->ramp_ping_pong = ping_pong;
+	lpg->ramp_oneshot = !repeat;
+
+	lpg->ramp_lo_pause_ms = lo_pause;
+	lpg->ramp_hi_pause_ms = hi_pause;
+
+out:
+	kfree(pattern);
+
+	return ret;
+}
+
+static int lpg_pattern_clear(struct led_classdev *cdev)
+{
+	struct lpg *lpg = container_of(cdev, struct lpg, cdev);
+
+	qcom_lpg_lut_free(lpg->pattern);
+	lpg->pattern = NULL;
+
+	return 0;
+}
+
+static struct led_pattern *lpg_pattern_get(struct led_classdev *cdev,
+					   size_t *len, bool *repeat)
+{
+	struct led_pattern *led_pattern;
+	struct lpg *lpg = container_of(cdev, struct lpg, cdev);
+	unsigned int delta_t;
+	unsigned int max = (1 << lpg->pwm_size) - 1;
+	size_t all_steps;
+	size_t steps;
+	u16 *pattern;
+	size_t i;
+	u16 val;
+
+	pattern = qcom_lpg_lut_read(lpg->pattern, &steps);
+	if (IS_ERR_OR_NULL(pattern))
+		return ERR_CAST(pattern);
+
+	all_steps = lpg->ramp_ping_pong ? steps * 2 - 1 : steps;
+
+	delta_t = (lpg->ramp_duration_ms + lpg->ramp_hi_pause_ms) / all_steps;
+
+	led_pattern = kcalloc(all_steps, sizeof(*pattern), GFP_KERNEL);
+	if (!led_pattern) {
+		led_pattern = ERR_PTR(-ENOMEM);
+		goto out;
+	}
+
+	for (i = 0; i < all_steps; i++) {
+		if (i < steps)
+			val = pattern[i];
+		else
+			val = pattern[steps - i];
+
+		led_pattern[i].delta_t = delta_t;
+		led_pattern[i].brightness = val * cdev->max_brightness / max;
+	}
+
+	*len = all_steps;
+	*repeat = !lpg->ramp_oneshot;
+
+out:
+	kfree(pattern);
+	return led_pattern;
+}
+
+static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			 struct pwm_state *state)
+{
+	struct lpg *lpg = container_of(chip, struct lpg, chip);
+
+	lpg_calc_freq(lpg, state->period / NSEC_PER_USEC);
+	lpg_calc_duty(lpg, state->duty_cycle / NSEC_PER_USEC);
+	lpg->enabled = state->enabled;
+
+	lpg_apply(lpg);
+
+	state->polarity = PWM_POLARITY_NORMAL;
+	state->period = lpg->period_us * NSEC_PER_USEC;
+
+	return 0;
+}
+
+static const struct pwm_ops lpg_pwm_ops = {
+	.apply = lpg_pwm_apply,
+	.owner = THIS_MODULE,
+};
+
+static int lpg_register_pwm(struct lpg *lpg)
+{
+	int ret;
+
+	lpg->chip.base = -1;
+	lpg->chip.dev = lpg->dev;
+	lpg->chip.npwm = 1;
+	lpg->chip.ops = &lpg_pwm_ops;
+
+	ret = pwmchip_add(&lpg->chip);
+	if (ret)
+		dev_err(lpg->dev, "failed to add PWM chip: ret %d\n", ret);
+
+	return ret;
+}
+
+static int lpg_register_led(struct lpg *lpg)
+{
+	struct device_node *np = lpg->dev->of_node;
+	const char *state;
+	int ret;
+
+	lpg->lut = qcom_lpg_lut_get(lpg->dev);
+	if (IS_ERR(lpg->lut))
+		return PTR_ERR(lpg->lut);
+
+	/* Use label else node name */
+	lpg->cdev.name = of_get_property(np, "label", NULL) ? : np->name;
+	lpg->cdev.default_trigger = of_get_property(np, "linux,default-trigger", NULL);
+	lpg->cdev.brightness_set = lpg_brightness_set;
+	lpg->cdev.brightness_get = lpg_brightness_get;
+	lpg->cdev.blink_set = lpg_blink_set;
+	lpg->cdev.pattern_set = lpg_pattern_set;
+	lpg->cdev.pattern_clear = lpg_pattern_clear;
+	lpg->cdev.pattern_get = lpg_pattern_get;
+	lpg->cdev.max_brightness = 255;
+
+	if (!of_property_read_string(np, "default-state", &state) &&
+	    !strcmp(state, "on"))
+		lpg->cdev.brightness = LED_FULL;
+	else
+		lpg->cdev.brightness = LED_OFF;
+
+	lpg_brightness_set(&lpg->cdev, lpg->cdev.brightness);
+
+	ret = devm_led_classdev_register(lpg->dev, &lpg->cdev);
+	if (ret)
+		dev_err(lpg->dev, "unable to register \"%s\"\n", lpg->cdev.name);
+
+	return ret;
+}
+
+static int lpg_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct lpg *lpg;
+	u32 dtest[2];
+	int ret;
+
+	lpg = devm_kzalloc(&pdev->dev, sizeof(*lpg), GFP_KERNEL);
+	if (!lpg)
+		return -ENOMEM;
+
+	lpg->dev = &pdev->dev;
+
+	lpg->map = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!lpg->map) {
+		dev_err(&pdev->dev, "parent regmap unavailable\n");
+		return -ENXIO;
+	}
+
+	ret = of_property_read_u32(np, "reg", &lpg->reg);
+	if (ret) {
+		dev_err(&pdev->dev, "no register offset specified\n");
+		return -EINVAL;
+	}
+
+	if (!of_find_property(np, "#pwm-cells", NULL))
+		lpg->is_lpg = true;
+
+	lpg->tri_led = qcom_tri_led_get(&pdev->dev);
+	if (IS_ERR(lpg->tri_led))
+		return PTR_ERR(lpg->tri_led);
+
+	ret = of_property_read_u32_array(np, "qcom,dtest", dtest, 2);
+	if (!ret) {
+		lpg->dtest_line = dtest[0];
+		lpg->dtest_value = dtest[1];
+	}
+
+	if (lpg->is_lpg) {
+		ret = lpg_register_led(lpg);
+		if (ret)
+			return ret;
+	} else {
+		ret = lpg_register_pwm(lpg);
+		if (ret)
+			return ret;
+	}
+
+	lpg_apply_dtest(lpg);
+
+	platform_set_drvdata(pdev, lpg);
+
+	return 0;
+}
+
+static int lpg_remove(struct platform_device *pdev)
+{
+	struct lpg *lpg = platform_get_drvdata(pdev);
+
+	if (!lpg->is_lpg)
+		pwmchip_remove(&lpg->chip);
+
+	qcom_lpg_lut_free(lpg->pattern);
+
+	return 0;
+}
+
+static const struct of_device_id lpg_of_table[] = {
+	{ .compatible = "qcom,spmi-lpg" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, lpg_of_table);
+
+static struct platform_driver lpg_driver = {
+	.probe = lpg_probe,
+	.remove = lpg_remove,
+	.driver = {
+		.name = "qcom-spmi-lpg",
+		.of_match_table = lpg_of_table,
+	},
+};
+module_platform_driver(lpg_driver);
+
+MODULE_DESCRIPTION("Qualcomm TRI LED driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/leds/leds-qcom-lpg.h b/drivers/leds/leds-qcom-lpg.h
new file mode 100644
index 000000000000..164a049fda3c
--- /dev/null
+++ b/drivers/leds/leds-qcom-lpg.h
@@ -0,0 +1,30 @@
+#ifndef __LEDS_QCOM_LPG_H__
+#define __LEDS_QCOM_LPG_H__
+
+struct qcom_tri_led;
+struct qcom_lpg_lut;
+
+/*
+ * qcom_lpg_pattern - object tracking allocated LUT entries
+ * @lut:	reference to the client & LUT device context
+ * @lo_idx:	index of first entry in the LUT used by pattern
+ * @hi_idx:	index of the last entry in the LUT used by pattern
+ */
+struct qcom_lpg_pattern {
+	struct qcom_lpg_lut *lut;
+
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+};
+
+struct qcom_tri_led *qcom_tri_led_get(struct device *dev);
+int qcom_tri_led_set(struct qcom_tri_led *tri, bool enabled);
+
+struct qcom_lpg_lut *qcom_lpg_lut_get(struct device *dev);
+struct qcom_lpg_pattern *qcom_lpg_lut_store(struct qcom_lpg_lut *lut,
+					    const u16 *values, size_t len);
+u16 *qcom_lpg_lut_read(struct qcom_lpg_pattern *pattern, size_t *len);
+void qcom_lpg_lut_free(struct qcom_lpg_pattern *pattern);
+int qcom_lpg_lut_sync(struct qcom_lpg_lut *lut);
+
+#endif
diff --git a/drivers/leds/leds-qcom-triled.c b/drivers/leds/leds-qcom-triled.c
new file mode 100644
index 000000000000..ce3de613be5b
--- /dev/null
+++ b/drivers/leds/leds-qcom-triled.c
@@ -0,0 +1,193 @@
+/* Copyright (c) 2017 Linaro Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include "leds-qcom-lpg.h"
+
+#define TRI_LED_SRC_SEL	0x45
+#define TRI_LED_EN_CTL	0x46
+#define TRI_LED_ATC_CTL	0x47
+
+#define TRI_LED_COUNT	3
+
+static struct platform_driver tri_led_driver;
+
+/*
+ * tri_led_dev - TRILED device context
+ * @dev:	struct device reference
+ * @map:	regmap for register access
+ * @reg:	base address of TRILED block
+ */
+struct tri_led_dev {
+	struct device *dev;
+	struct regmap *map;
+
+	u32 reg;
+};
+
+/*
+ * qcom_tri_led - representation of a single color
+ * @tdev:	TRILED device reference
+ * @color:	color of this object 0 <= color < 3
+ */
+struct qcom_tri_led {
+	struct tri_led_dev *tdev;
+	u8 color;
+};
+
+static void tri_led_release(struct device *dev, void *res)
+{
+	struct qcom_tri_led *tri = res;
+	struct tri_led_dev *tdev = tri->tdev;
+
+	put_device(tdev->dev);
+}
+
+/**
+ * qcom_tri_led_get() - acquire a reference to a single color of the TRILED
+ * @dev:	struct device of the client
+ *
+ * Returned devres allocated TRILED color object, NULL if client lacks TRILED
+ * reference or ERR_PTR on failure.
+ */
+struct qcom_tri_led *qcom_tri_led_get(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct of_phandle_args args;
+	struct qcom_tri_led *tri;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(dev->of_node,
+					       "qcom,tri-led", 1, 0, &args);
+	if (ret)
+		return NULL;
+
+	pdev = of_find_device_by_node(args.np);
+	of_node_put(args.np);
+	if (!pdev || !pdev->dev.driver)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (pdev->dev.driver != &tri_led_driver.driver) {
+		dev_err(dev, "referenced node is not a tri-led\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (args.args[0] >= TRI_LED_COUNT) {
+		dev_err(dev, "invalid color\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	tri = devres_alloc(tri_led_release, sizeof(*tri), GFP_KERNEL);
+	if (!tri)
+		return ERR_PTR(-ENOMEM);
+
+	tri->tdev = platform_get_drvdata(pdev);
+	tri->color = args.args[0];
+
+	devres_add(dev, tri);
+
+	return tri;
+}
+EXPORT_SYMBOL_GPL(qcom_tri_led_get);
+
+/**
+ * qcom_tri_led_set() - enable/disable a TRILED output
+ * @tri:	TRILED color object reference
+ * @enable:	new state of the output
+ *
+ * Returns 0 on success, negative errno on failure.
+ */
+int qcom_tri_led_set(struct qcom_tri_led *tri, bool enable)
+{
+	struct tri_led_dev *tdev = tri->tdev;
+	unsigned int mask;
+	unsigned int val;
+
+	/* red, green, blue are mapped to bits 7, 6 and 5 respectively */
+	mask = BIT(7 - tri->color);
+	val = enable ? mask : 0;
+
+	return regmap_update_bits(tdev->map, tdev->reg + TRI_LED_EN_CTL,
+				  mask, val);
+}
+EXPORT_SYMBOL_GPL(qcom_tri_led_set);
+
+static int tri_led_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct tri_led_dev *tri;
+	u32 src_sel;
+	int ret;
+
+	tri = devm_kzalloc(&pdev->dev, sizeof(*tri), GFP_KERNEL);
+	if (!tri)
+		return -ENOMEM;
+
+	tri->dev = &pdev->dev;
+
+	tri->map = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!tri->map) {
+		dev_err(&pdev->dev, "parent regmap unavailable\n");
+		return -ENXIO;
+	}
+
+	ret = of_property_read_u32(np, "reg", &tri->reg);
+	if (ret) {
+		dev_err(&pdev->dev, "no register offset specified\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(np, "qcom,power-source", &src_sel);
+	if (ret || src_sel == 2 || src_sel > 3) {
+		dev_err(&pdev->dev, "invalid power source\n");
+		return -EINVAL;
+	}
+
+	/* Disable automatic trickle charge LED */
+	regmap_write(tri->map, tri->reg + TRI_LED_ATC_CTL, 0);
+
+	/* Configure power source */
+	regmap_write(tri->map, tri->reg + TRI_LED_SRC_SEL, src_sel);
+
+	/* Default all outputs to off */
+	regmap_write(tri->map, tri->reg + TRI_LED_EN_CTL, 0);
+
+	platform_set_drvdata(pdev, tri);
+
+	return 0;
+}
+
+static const struct of_device_id tri_led_of_table[] = {
+	{ .compatible = "qcom,spmi-tri-led" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tri_led_of_table);
+
+static struct platform_driver tri_led_driver = {
+	.probe = tri_led_probe,
+	.driver = {
+		.name = "qcom_tri_led",
+		.of_match_table = tri_led_of_table,
+	},
+};
+module_platform_driver(tri_led_driver);
+
+MODULE_DESCRIPTION("Qualcomm TRI LED driver");
+MODULE_LICENSE("GPL v2");
-- 
2.12.0
