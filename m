From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [RESEND PATCH v3 4/4] as3645a: Unregister indicator LED on device unbind
Date: Fri, 22 Sep 2017 12:34:53 +0300
Message-ID: <20170922093453.13250-5-sakari.ailus@linux.intel.com>
References: <20170922093453.13250-1-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170922093453.13250-1-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

The indicator LED was registered in probe but was not removed in driver
remove callback. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/leds/leds-as3645a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index 605e0c64e974..9a257f969300 100644
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
