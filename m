From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0298/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:57:55 +0800
Message-ID: <20160802105755.1279-1-baolex.ni@intel.com>
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
 drivers/leds/leds-max8997.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-max8997.c b/drivers/leds/leds-max8997.c
index 4edf74f..7962018 100644
--- a/drivers/leds/leds-max8997.c
+++ b/drivers/leds/leds-max8997.c
@@ -226,7 +226,7 @@ static ssize_t max8997_led_store_mode(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(mode, 0644, max8997_led_show_mode, max8997_led_store_mode);
+static DEVICE_ATTR(mode, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, max8997_led_show_mode, max8997_led_store_mode);
 
 static struct attribute *max8997_attrs[] = {
 	&dev_attr_mode.attr,
-- 
2.9.2
