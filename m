From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH/RFC v13 01/13] leds: flash: Fix the size of sysfs_groups array
Date: Thu, 12 Mar 2015 16:45:02 +0100
Message-ID: <1426175114-14876-2-git-send-email-j.anaszewski@samsung.com>
References: <1426175114-14876-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1426175114-14876-1-git-send-email-j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

LED_FLASH_MAX_SYSFS_GROUPS macro had value that was relevant for
previous version of the patches introducing LED Flash class. Currently
it is required to reserve the room for maximum 4 sysfs groups.
Since the last element of the struct attribute_group array passed to
the function device_create_with_groups has to be NULL, the size of the
array has to be greater by one than maximum allowed number of groups.
Therefore, the name of the macro is being changed to
LED_FLASH_SYSFS_GROUPS_SIZE, to make it more accurrate.

Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
---
 include/linux/led-class-flash.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 21ec91e..e97966d 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -32,7 +32,7 @@ struct led_classdev_flash;
 #define LED_FAULT_LED_OVER_TEMPERATURE	(1 << 8)
 #define LED_NUM_FLASH_FAULTS		9
 
-#define LED_FLASH_MAX_SYSFS_GROUPS 7
+#define LED_FLASH_SYSFS_GROUPS_SIZE	5
 
 struct led_flash_ops {
 	/* set flash brightness */
@@ -80,7 +80,7 @@ struct led_classdev_flash {
 	struct led_flash_setting timeout;
 
 	/* LED Flash class sysfs groups */
-	const struct attribute_group *sysfs_groups[LED_FLASH_MAX_SYSFS_GROUPS];
+	const struct attribute_group *sysfs_groups[LED_FLASH_SYSFS_GROUPS_SIZE];
 };
 
 static inline struct led_classdev_flash *lcdev_to_flcdev(
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
