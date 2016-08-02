From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0296/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:57:47 +0800
Message-ID: <20160802105747.1124-1-baolex.ni@intel.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:28976 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755918AbcHBLgc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 2 Aug 2016 07:36:32 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, hal.rosenstock@gmail.com, dledford@redhat.com, sean.hefty@intel.com, bp@alien8.de
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com, jkosina@suse.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index aa84e5b..d011e156 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -74,7 +74,7 @@ static ssize_t max_brightness_show(struct device *dev,
 static DEVICE_ATTR_RO(max_brightness);
 
 #ifdef CONFIG_LEDS_TRIGGERS
-static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_store);
+static DEVICE_ATTR(trigger, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, led_trigger_show, led_trigger_store);
 static struct attribute *led_trigger_attrs[] = {
 	&dev_attr_trigger.attr,
 	NULL,
-- 
2.9.2
