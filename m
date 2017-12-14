From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 2/2] leds: as3645a: Fix line over 80 characters
Date: Thu, 14 Dec 2017 11:37:27 -0600
Message-ID: <20171214173727.10070-2-dmurphy@ti.com>
References: <20171214173727.10070-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171214173727.10070-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Fix the warning for line over 80 characters.

WARNING: line over 80 characters
363: FILE: drivers/leds/leds-as3645a.c:363:
	flash->flash_current = as3645a_current_to_reg(flash, true, brightness_ua);

Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
---

v2 - Split the warning fixes into 2 patches and fixed commit message - 
https://patchwork.kernel.org/patch/10108325/

 drivers/leds/leds-as3645a.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index 49fdd7c0a6f6..f883616d9e60 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -360,7 +360,8 @@ static int as3645a_set_flash_brightness(struct led_classdev_flash *fled,
 {
 	struct as3645a *flash = fled_to_as3645a(fled);
 
-	flash->flash_current = as3645a_current_to_reg(flash, true, brightness_ua);
+	flash->flash_current = as3645a_current_to_reg(flash, true,
+						      brightness_ua);
 
 	return as3645a_set_current(flash);
 }
-- 
2.15.0.124.g7668cbc60

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
