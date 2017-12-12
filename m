From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v4 4/6] dt: bindings: lp8860: Add trigger binding to the lp8860
Date: Tue, 12 Dec 2017 16:01:41 -0600
Message-ID: <20171212220143.31210-5-dmurphy@ti.com>
References: <20171212220143.31210-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212220143.31210-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Add a default trigger optional node to the child node.
This will allow the driver to set the trigger for a backlight.

Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
---

v4 - No changes

v3 - Removed optional and rebased - https://patchwork.kernel.org/patch/10093755/
v2 - Moved binding changes to first patch in the series.

 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index c3d64ade1e26..cdb9e12bd0aa 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -21,6 +21,8 @@ Required child properties:
 
 Optional child properties:
 	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger :
+	   see Documentation/devicetree/bindings/leds/common.txt
 
 Example:
 
@@ -35,6 +37,7 @@ led-controller@2d {
 	led@0 {
 		reg = <0>;
 		label = "white:display_cluster";
+		linux,default-trigger = "backlight";
 	};
 }
 
-- 
2.15.0.124.g7668cbc60

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
