From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0307/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:58:42 +0800
Message-ID: <20160802105842.1935-1-baolex.ni@intel.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:49977 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755894AbcHBLgZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 2 Aug 2016 07:36:25 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, hal.rosenstock@gmail.com, dledford@redhat.com, sean.hefty@intel.com, bp@alien8.de
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/leds/trigger/ledtrig-timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index 8d09327..907982c 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -68,8 +68,8 @@ static ssize_t led_delay_off_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(delay_on, 0644, led_delay_on_show, led_delay_on_store);
-static DEVICE_ATTR(delay_off, 0644, led_delay_off_show, led_delay_off_store);
+static DEVICE_ATTR(delay_on, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, led_delay_on_show, led_delay_on_store);
+static DEVICE_ATTR(delay_off, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, led_delay_off_show, led_delay_off_store);
 
 static void timer_trig_activate(struct led_classdev *led_cdev)
 {
-- 
2.9.2
