From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0299/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:57:59 +0800
Message-ID: <20160802105759.1348-1-baolex.ni@intel.com>
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
 drivers/leds/leds-netxbig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 4b88b93..6b3f4ca 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -271,7 +271,7 @@ static ssize_t netxbig_led_sata_show(struct device *dev,
 	return sprintf(buf, "%d\n", led_dat->sata);
 }
 
-static DEVICE_ATTR(sata, 0644, netxbig_led_sata_show, netxbig_led_sata_store);
+static DEVICE_ATTR(sata, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, netxbig_led_sata_show, netxbig_led_sata_store);
 
 static struct attribute *netxbig_led_attrs[] = {
 	&dev_attr_sata.attr,
-- 
2.9.2
