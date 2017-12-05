From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 4/6] dt: bindings: lp8860: Add trigger binding to the lp8860
Date: Tue, 5 Dec 2017 14:43:25 -0600
Message-ID: <20171205204327.12111-5-dmurphy@ti.com>
References: <20171205204327.12111-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171205204327.12111-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Add a default trigger optional node to the child node.
This will allow the driver to set the trigger for a backlight.

Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
---

v2 - Moved binding changes to first patch in the series.

 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index 22b594d95162..3452c9c10499 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -21,6 +21,8 @@ Required child properties:
 
 Optional child properties:
 	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger : (optional)
+	   see Documentation/devicetree/bindings/leds/common.txt
 
 Example:
 
@@ -34,6 +36,7 @@ Example:
 		display_cluster: display_cluster@0 {
 			reg=<0>;
 			label = "display_cluster";
+			linux,default-trigger = "backlight";
 		};
 	}
 
-- 
2.15.0.124.g7668cbc60

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
