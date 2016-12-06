From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] DT: leds: Improve examples by adding some context
Date: Tue,  6 Dec 2016 09:32:03 +0100
Message-ID: <20161206083203.1726-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

During my work on some new LED trigger I tried adding example similar to
the existing ones which received following comment from Rob:
> It's not really clear in the example this is an LED node as it is
> incomplete.

Keeping that in mind I suggest adding context for the existing example
entries in hope to make documentation more clear.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
Should this patch go through linux-leds tree?

Richard, Jacek: would you take it?
---
 Documentation/devicetree/bindings/leds/common.txt | 28 +++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 696be57..24b6560 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -61,16 +61,24 @@ property can be omitted.
 
 Examples:
 
-system-status {
-	label = "Status";
-	linux,default-trigger = "heartbeat";
-	...
+gpio-leds {
+	compatible = "gpio-leds";
+
+	system-status {
+		label = "Status";
+		linux,default-trigger = "heartbeat";
+		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
+	};
 };
 
-camera-flash {
-	label = "Flash";
-	led-sources = <0>, <1>;
-	led-max-microamp = <50000>;
-	flash-max-microamp = <320000>;
-	flash-max-timeout-us = <500000>;
+max77693-led {
+	compatible = "maxim,max77693-led";
+
+	camera-flash {
+		label = "Flash";
+		led-sources = <0>, <1>;
+		led-max-microamp = <50000>;
+		flash-max-microamp = <320000>;
+		flash-max-timeout-us = <500000>;
+	};
 };
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
