From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 2/5] v4l: flash: Make v4l2_flash_init() and v4l2_flash_release() functions always
Date: Wed, 20 May 2015 02:04:02 +0300
Message-ID: <1432076645-4799-3-git-send-email-sakari.ailus@iki.fi>
References: <1432076645-4799-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1432076645-4799-1-git-send-email-sakari.ailus@iki.fi>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, cooloney@gmail.com, g.liakhovetski@gmx.de, s.nawrocki@samsung.com, laurent.pinchart@ideasonboard.com, mchehab@osg.samsung.com
List-Id: linux-leds@vger.kernel.org

If CONFIG_V4L2_FLASH_LED_CLASS wasn't defined, v4l2_flash_init() and
v4l2_flash_release() were empty macros. This will lead to compiler warnings
in form of unused variables if the variables are not used for other
purposes.

Instead, implement v4l2_flash_init() and v4l2_flash_release() as static
inline functions.

Signed-off-by: Sakari Ailus <sakari.ailus@iki.fi>
---
 include/media/v4l2-flash.h |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-flash.h b/include/media/v4l2-flash.h
index 945fa08..67a2cbf 100644
--- a/include/media/v4l2-flash.h
+++ b/include/media/v4l2-flash.h
@@ -138,8 +138,16 @@ struct v4l2_flash *v4l2_flash_init(struct led_classdev_flash *fled_cdev,
 void v4l2_flash_release(struct v4l2_flash *v4l2_flash);
 
 #else
-#define v4l2_flash_init(fled_cdev, ops, config) (NULL)
-#define v4l2_flash_release(v4l2_flash)
+static inline struct v4l2_flash *v4l2_flash_init(
+	struct led_classdev_flash *fled_cdev, const struct v4l2_flash_ops *ops,
+	struct v4l2_flash_config *config)
+{
+	return NULL;
+}
+
+static inline void v4l2_flash_release(struct v4l2_flash *v4l2_flash)
+{
+}
 #endif /* CONFIG_V4L2_FLASH_LED_CLASS */
 
 #endif /* _V4L2_FLASH_H */
-- 
1.7.10.4
