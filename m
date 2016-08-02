From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0302/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:58:13 +0800
Message-ID: <20160802105813.1561-1-baolex.ni@intel.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:4547 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755875AbcHBLgY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 2 Aug 2016 07:36:24 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, hal.rosenstock@gmail.com, dledford@redhat.com, sean.hefty@intel.com, bp@alien8.de
Cc: patches@opensource.wolfsonmicro.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/leds/leds-wm831x-status.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index be93b20..2547b0d 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -211,7 +211,7 @@ static ssize_t wm831x_status_src_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(src, 0644, wm831x_status_src_show, wm831x_status_src_store);
+static DEVICE_ATTR(src, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, wm831x_status_src_show, wm831x_status_src_store);
 
 static struct attribute *wm831x_status_attrs[] = {
 	&dev_attr_src.attr,
-- 
2.9.2
