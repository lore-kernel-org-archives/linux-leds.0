From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH 2/2] mfd: Add leds MFD cell for intel_soc_pmic_chtwc
Date: Sun, 10 Feb 2019 01:12:14 +0300
Message-ID: <20190209221213.24052-3-jekhor@gmail.com>
References: <20190209221213.24052-1-jekhor@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190209221213.24052-1-jekhor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Yauhen Kharuzhy <jekhor@gmail.com>
List-Id: linux-leds@vger.kernel.org

Add MFD cell for LEDs driver to the Intel Cherry Trail Whiskey Cove PMIC
mfd device driver.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 drivers/mfd/intel_soc_pmic_chtwc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
index 64a3aece9c5e..68b54173edd8 100644
--- a/drivers/mfd/intel_soc_pmic_chtwc.c
+++ b/drivers/mfd/intel_soc_pmic_chtwc.c
@@ -60,6 +60,8 @@ static struct mfd_cell cht_wc_dev[] = {
 		.resources = cht_wc_ext_charger_resources,
 	},
 	{	.name = "cht_wcove_region", },
+
+	{	.name = "cht_wcove_leds", },
 };
 
 /*
-- 
2.20.1
