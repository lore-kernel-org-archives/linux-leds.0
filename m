From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 2/7] dt: bindings: Add multicolor class dt bindings documention
Date: Thu, 11 Apr 2019 14:38:43 -0500
Message-ID: <20190411193848.23140-3-dmurphy@ti.com>
References: <20190411193848.23140-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411193848.23140-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, marek.behun@nic.cz, rdunlap@infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Add DT bindings for the LEDs multicolor class framework.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/leds/common.txt       |   2 +
 .../bindings/leds/leds-class-multicolor.txt   | 142 ++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 7497a3c221fe..bc424a9ba547 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -23,6 +23,8 @@ Optional properties for child nodes:
 - color : Color of the LED. Use one of the LED_COLOR_ID_* prefixed definitions
 	  from the header include/dt-bindings/leds/common.h.
 	  If there is no matching LED_COLOR_ID available, add a new one.
+	  For multi color LED support see leds-multicolor.txt within this
+	  directory.
 
 - led-enumerator: Integer to be used for LED differentiation when neither
 		  function nor color can be used for that purpose.
diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
new file mode 100644
index 000000000000..9cbc4aece53d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
@@ -0,0 +1,142 @@
+* Multicolor LED properties
+
+Multicolor LEDs can consist of a RGB, RGBW or a RGBA LED clusters.  These devices
+can be grouped together and also provide a modeling mechanism so that the
+cluster LEDs can vary in hue and intensity to produce a wide range of colors.
+
+The nodes and properties defined in this document are unique to the multicolor 
+LED class.  Common LED nodes and properties are inherited from the common.txt
+within this documentation directory.
+
+Required LED Child properties:
+	- color : For multicolor LED support this property should be defined as
+		  LED_COLOR_ID_MULTI and further definition can be found in
+		  include/linux/leds/common.h.
+
+Optional LED Child properties:
+	- available-brightness-models : This is the phandle to the brightness-model
+					node(s) that this LED cluster can support.
+
+Required Brightness model properties
+	- led-brightness-model : This flag alerts the device driver and class
+				 code that this node is a brightness model node
+				 and to process the properties differently.
+
+Required Brightness model child properties
+	- model_name : This is the name of the model presented to the user.  This
+		       should be a color that the LED cluster can produce for
+		       the device it is attached to.
+	- layout : This is the LED layout for the levels.  This layout will
+		   determine the color order of the levels.  The layout and
+		   level-x properties array should be the same size.
+	- level-x : These are the values for the LEDs to produce the color that
+		    is defined.  These values are placed in the array according
+		    to the layout property.
+
+led-controller@30 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "ti,lp5024";
+	reg = <0x29>;
+
+	lp5024_model_yellow: brightness-models {
+		led-brightness-model;
+		model@0 {
+			model_name = "yellow";
+			layout = <LED_COLOR_ID_RED
+				  LED_COLOR_ID_GREEN
+				  LED_COLOR_ID_BLUE>;
+			level-1 = <255 227 40>;
+			level-2 = <255 240 136>;
+			level-3 = <255 247 196>;
+		};
+	};
+
+	lp5024_model_orange: brightness-models {
+		led-brightness-model;
+		model@1 {
+			model_name = "orange";
+			layout = <LED_COLOR_ID_RED
+				  LED_COLOR_ID_GREEN
+				  LED_COLOR_ID_BLUE>;
+			level-1 = <236 140 16>;
+			level-2 = <236 157 55>;
+			level-3 = <236 183 115>;
+		};
+	}; 
+
+	multi-led@4 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <4>;
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_ACTIVITY;
+		available-brightness-models = <&lp5024_model_yellow>;
+		
+		led@12 {
+			reg = <12>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@13 {
+			reg = <13>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@14 {
+			reg = <14>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+
+	/* Only support RGB no model defined */
+	multi-led@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+		label = "rgb:led_mod1";
+		
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@4 {
+			reg = <4>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@5 {
+			reg = <5>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+
+	multi-led@2 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		label = "rgb:banks";
+		reg = <2>;
+		ti,led-bank = <2 3 5>;
+		available-brightness-models = <&lp5024_model_orange>;
+
+		led@6 {
+			reg = <0x6>;
+			color = <LED_COLOR_ID_RED>;
+			led-sources = <6 9 15>;
+		};
+
+		led@7 {
+			reg = <0x7>;
+			color = <LED_COLOR_ID_GREEN>;
+			led-sources = <7 10 16>;
+		};
+
+		led@8 {
+			reg = <0x8>;
+			color = <LED_COLOR_ID_BLUE>;
+			led-sources = <8 11 17>;
+		};
+	};
+
+};
-- 
2.21.0.5.gaeb582a983
