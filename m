From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0305/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:58:30 +0800
Message-ID: <20160802105830.1799-1-baolex.ni@intel.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:54498 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755883AbcHBLgZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 2 Aug 2016 07:36:25 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, hal.rosenstock@gmail.com, dledford@redhat.com, sean.hefty@intel.com, bp@alien8.de
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, jiri.prchal@aksignal.cz, ulf.hansson@linaro.org, linus.walleij@linaro.org, chuansheng.liu@intel.com, baolex.ni@intel.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/leds/trigger/ledtrig-heartbeat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
index c9f3862..38b4fe0 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -112,7 +112,7 @@ static ssize_t led_invert_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(invert, 0644, led_invert_show, led_invert_store);
+static DEVICE_ATTR(invert, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, led_invert_show, led_invert_store);
 
 static void heartbeat_trig_activate(struct led_classdev *led_cdev)
 {
-- 
2.9.2
