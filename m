From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0308/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:58:48 +0800
Message-ID: <20160802105848.2003-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, hal.rosenstock@gmail.com, dledford@redhat.com, sean.hefty@intel.com, bp@alien8.de
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com, chuansheng.liu@intel.com, baolex.ni@intel.com
List-Id: linux-leds@vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/leds/trigger/ledtrig-transient.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
index 7e6011b..cdc128e 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -151,11 +151,11 @@ static ssize_t transient_state_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(activate, 0644, transient_activate_show,
+static DEVICE_ATTR(activate, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, transient_activate_show,
 		   transient_activate_store);
-static DEVICE_ATTR(duration, 0644, transient_duration_show,
+static DEVICE_ATTR(duration, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, transient_duration_show,
 		   transient_duration_store);
-static DEVICE_ATTR(state, 0644, transient_state_show, transient_state_store);
+static DEVICE_ATTR(state, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, transient_state_show, transient_state_store);
 
 static void transient_trig_activate(struct led_classdev *led_cdev)
 {
-- 
2.9.2
