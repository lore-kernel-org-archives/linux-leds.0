From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0303/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:58:19 +0800
Message-ID: <20160802105819.1659-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, hal.rosenstock@gmail.com, dledford@redhat.com, sean.hefty@intel.com, bp@alien8.de
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, chuansheng.liu@intel.com, baolex.ni@intel.com
List-Id: linux-leds@vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/leds/trigger/ledtrig-backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index 1ca1f16..1270a36 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -95,7 +95,7 @@ static ssize_t bl_trig_invert_store(struct device *dev,
 
 	return num;
 }
-static DEVICE_ATTR(inverted, 0644, bl_trig_invert_show, bl_trig_invert_store);
+static DEVICE_ATTR(inverted, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, bl_trig_invert_show, bl_trig_invert_store);
 
 static void bl_trig_activate(struct led_classdev *led)
 {
-- 
2.9.2
