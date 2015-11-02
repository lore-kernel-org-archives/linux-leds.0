From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: [PATCH RESEND 04/16] Documentation: dt-bindings: leds: add LM3633 LED binding information
Date: Mon, 2 Nov 2015 14:24:23 +0900
Message-ID: <1446441875-1256-5-git-send-email-milo.kim@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446441875-1256-1-git-send-email-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

LM3633 LED device is one of TI LMU device list.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/leds/leds-lm3633.txt       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3633.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3633.txt b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
new file mode 100644
index 0000000..bb7f213
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
@@ -0,0 +1,28 @@
+TI LMU LM3633 LED device tree bindings
+
+Required properties:
+  - compatible: "ti,lm3633-leds"
+
+Child nodes:
+  Each node matches with LED control bank.
+  Please refer to the datasheet [1].
+
+  Required properties of a child node:
+  - lvled1-used, lvled2-used, lvled3-used,
+    lvled4-used, lvled5-used, lvled6-used:
+    Low voltage LED string configuration. Type is <boolean>.
+    Please describe which output LED string is used.
+
+  Optional properties of a child node:
+  - channel-name: Name string for LED channel identification
+                  It is used for creating LED sysfs,
+                  /sys/class/leds/<channel-name>/.
+                  If this property is empty, then default name is set to
+                  "indicator:<id>" by the driver.
+  - led-max-microamp: Max current setting. Type is <u32>.
+                      Unit is microampere. Range is from 5000 to 30000.
+
+Examples: Please refer to ti-lmu dt-bindings [2].
+
+[1] http://www.ti.com/product/LM3633/datasheet
+[2] Documentation/devicetree/bindings/mfd/ti-lmu.txt
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
