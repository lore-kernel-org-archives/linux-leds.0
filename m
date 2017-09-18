From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 6/6] as3645a: Unregister indicator LED on device unbind
Date: Mon, 18 Sep 2017 13:17:56 +0300
Message-ID: <20170918101756.8562-7-sakari.ailus@linux.intel.com>
References: <20170918101756.8562-1-sakari.ailus@linux.intel.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:45408 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753137AbdIRKSB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 18 Sep 2017 06:18:01 -0400
In-Reply-To: <20170918101756.8562-1-sakari.ailus@linux.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-media@vger.kernel.rg, devicetree@vger.kernel.org, pavel@ucw.cz

The indicator LED was registered in probe but was not removed in driver
remove callback. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/leds/leds-as3645a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index edeb0a499f6c..9494ba26c64b 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -743,6 +743,7 @@ static int as3645a_remove(struct i2c_client *client)
 	as3645a_set_control(flash, AS_MODE_EXT_TORCH, false);
 
 	v4l2_flash_release(flash->vf);
+	v4l2_flash_release(flash->vfind);
 
 	led_classdev_flash_unregister(&flash->fled);
 	led_classdev_unregister(&flash->iled_cdev);
-- 
2.11.0
