From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH 5/8] v4l2-flash: Flash ops aren't mandatory
Date: Wed, 14 Jun 2017 12:47:16 +0300
Message-ID: <1497433639-13101-6-git-send-email-sakari.ailus@linux.intel.com>
References: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497433639-13101-1-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
List-Id: linux-leds@vger.kernel.org

None of the flash operations are not mandatory and therefore there should
be no need for the flash ops structure either. Accept NULL.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/media/v4l2-core/v4l2-flash-led-class.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
index 6d69119..fdb79da 100644
--- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
+++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
@@ -18,7 +18,7 @@
 #include <media/v4l2-flash-led-class.h>
 
 #define has_flash_op(v4l2_flash, op)				\
-	(v4l2_flash && v4l2_flash->ops->op)
+	(v4l2_flash && v4l2_flash->ops && v4l2_flash->ops->op)
 
 #define call_flash_op(v4l2_flash, op, arg)			\
 		(has_flash_op(v4l2_flash, op) ?			\
@@ -618,7 +618,7 @@ struct v4l2_flash *v4l2_flash_init(
 	struct v4l2_subdev *sd;
 	int ret;
 
-	if (!fled_cdev || !ops || !config)
+	if (!fled_cdev || !config)
 		return ERR_PTR(-EINVAL);
 
 	led_cdev = &fled_cdev->led_cdev;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
