From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: [PATCH v2 4/4] dt-bindings leds: add pca955x
Date: Tue,  1 Aug 2017 14:09:09 +0200
Message-ID: <1501589349-5681-5-git-send-email-clg@kaod.org>
References: <1501589349-5681-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501589349-5681-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This adds the devicetree bindings for the PCA955x I2C LED blinkers.

Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
---
 .../devicetree/bindings/leds/leds-pca955x.txt      | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-pca955x.txt b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
new file mode 100644
index 000000000000..7984efb767b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
@@ -0,0 +1,88 @@
+* NXP - pca955x LED driver
+
+The PCA955x family of chips are I2C LED blinkers whose pins not used
+to control LEDs can be used as general purpose I/Os. The GPIO pins can
+be input or output, and output pins can also be pulse-width controlled.
+
+Required properties:
+- compatible : should be one of :
+	"nxp,pca9550"
+	"nxp,pca9551"
+	"nxp,pca9552"
+	"nxp,pca9553"
+- #address-cells: must be 1
+- #size-cells: must be 0
+- reg: I2C slave address. depends on the model.
+
+Optional properties:
+- gpio-controller: allows pins to be used as GPIOs.
+- #gpio-cells: must be 2.
+- gpio-line-names: define the names of the GPIO lines
+
+LED sub-node properties:
+- reg : number of LED line.
+		from 0 to  1 for the pca9550
+		from 0 to  7 for the pca9551
+		from 0 to 15 for the pca9552
+		from 0 to  3 for the pca9553
+- type: (optional) either
+	PCA9532_TYPE_NONE
+	PCA9532_TYPE_LED
+	PCA9532_TYPE_GPIO
+	see dt-bindings/leds/leds-pca955x.h (default to LED)
+- label : (optional)
+	see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger : (optional)
+	see Documentation/devicetree/bindings/leds/common.txt
+
+Examples:
+
+pca9552: pca9552@60 {
+	compatible = "nxp,pca9552";
+	#address-cells = <1>;
+        #size-cells = <0>;
+	reg = <0x60>;
+
+	gpio-controller;
+	#gpio-cells = <2>;
+	gpio-line-names = "GPIO12", "GPIO13", "GPIO14", "GPIO15";
+
+	gpio@12 {
+		reg = <12>;
+		type = <PCA955X_TYPE_GPIO>;
+	};
+	gpio@13 {
+		reg = <13>;
+		type = <PCA955X_TYPE_GPIO>;
+	};
+	gpio@14 {
+		reg = <14>;
+		type = <PCA955X_TYPE_GPIO>;
+	};
+	gpio@15 {
+		reg = <15>;
+		type = <PCA955X_TYPE_GPIO>;
+	};
+
+	led@0 {
+		label = "red:power";
+		linux,default-trigger = "default-on";
+		reg = <0>;
+		type = <PCA955X_TYPE_LED>;
+	};
+	led@1 {
+		label = "green:power";
+		reg = <1>;
+		type = <PCA955X_TYPE_LED>;
+	};
+	led@2 {
+		label = "pca9552:yellow";
+		reg = <2>;
+		type = <PCA955X_TYPE_LED>;
+	};
+	led@3 {
+		label = "pca9552:white";
+		reg = <3>;
+		type = <PCA955X_TYPE_LED>;
+	};
+};
-- 
2.7.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
