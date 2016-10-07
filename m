From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 08/10] leds: Add binding for Juniper's I2CS FPGA
Date: Fri,  7 Oct 2016 18:21:07 +0300
Message-ID: <1475853669-22480-9-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475853669-22480-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Avirup Banerjee <abanerjee-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, JawaharBalaji Thirumalaisamy <jawaharb-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

From: Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>

Document bindings for the I2CS FPGA leds.

Signed-off-by: Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/leds/leds-i2cs.txt         | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-i2cs.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-i2cs.txt b/Documentation/devicetree/bindings/leds/leds-i2cs.txt
new file mode 100644
index 0000000..100e584
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-i2cs.txt
@@ -0,0 +1,34 @@
+Juniper I2CS LED driver.
+
+This is present in Juniper platforms that use a I2CS Slave FPGA.
+
+Required properties:
+  - compatible: must be "jnx,leds-i2cs"
+  - #address-cells : must be 1.
+  - #size-cells : must be 0.
+
+Each led is represented as a sub-node of the jnx,leds-i2cs device.
+
+LED sub-node properties:
+- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
+- reg : number of LED
+- linux,default-trigger : (optional)
+   see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+leds_fpc0: leds-jnx-i2cs {
+	compatible = "jnx,leds-i2cs";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	fpc0-fail {
+		reg = <1>;
+		linux,default-trigger = "fpc0-fail";
+	};
+
+	fpc0-ok {
+		reg = <2>;
+		linux,default-trigger = "fpc0-ok";
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
