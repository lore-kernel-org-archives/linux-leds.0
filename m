From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0301/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:58:09 +0800
Message-ID: <20160802105809.1495-1-baolex.ni@intel.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:25432 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755936AbcHBLgj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 2 Aug 2016 07:36:39 -0400
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
 drivers/leds/leds-ss4200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 732eb86..0fe9350 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -480,7 +480,7 @@ static ssize_t nas_led_blink_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(blink, 0644, nas_led_blink_show, nas_led_blink_store);
+static DEVICE_ATTR(blink, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, nas_led_blink_show, nas_led_blink_store);
 
 static struct attribute *nasgpio_led_attrs[] = {
 	&dev_attr_blink.attr,
-- 
2.9.2
