From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0297/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:57:51 +0800
Message-ID: <20160802105751.1194-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, hal.rosenstock@gmail.com, dledford@redhat.com, sean.hefty@intel.com, bp@alien8.de
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com, jkosina@suse.com
List-Id: linux-leds@vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/leds/leds-lm3530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
index b38430c..28b134e 100644
--- a/drivers/leds/leds-lm3530.c
+++ b/drivers/leds/leds-lm3530.c
@@ -398,7 +398,7 @@ static ssize_t lm3530_mode_set(struct device *dev, struct device_attribute
 
 	return sizeof(drvdata->mode);
 }
-static DEVICE_ATTR(mode, 0644, lm3530_mode_get, lm3530_mode_set);
+static DEVICE_ATTR(mode, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, lm3530_mode_get, lm3530_mode_set);
 
 static struct attribute *lm3530_attrs[] = {
 	&dev_attr_mode.attr,
-- 
2.9.2
