From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 1/2] ACPI: Document how to refer to LEDs from remote nodes
Date: Fri, 15 Sep 2017 17:40:51 +0300
Message-ID: <20170915144052.25903-2-sakari.ailus@linux.intel.com>
References: <20170915144052.25903-1-sakari.ailus@linux.intel.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20170915144052.25903-1-sakari.ailus@linux.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, jacek.anaszewski@gmail.com, mika.westerberg@intel.com, rafael@kernel.org
List-Id: linux-leds@vger.kernel.org

Document referring to LEDs from remote device nodes, such as from camera
sensors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/acpi/dsd/leds.txt | 94 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/acpi/dsd/leds.txt

diff --git a/Documentation/acpi/dsd/leds.txt b/Documentation/acpi/dsd/leds.txt
new file mode 100644
index 000000000000..894c82274f53
--- /dev/null
+++ b/Documentation/acpi/dsd/leds.txt
@@ -0,0 +1,94 @@
+Describing and referring to LEDs in ACPI
+
+Individual LEDs are described by hierarchical data extension [6] nodes
+under the device node, the LED driver chip. The "led" property in the
+LED specific nodes tells the numerical ID of each individual LED. The
+"led" property is used here in a similar fashion as the "reg" property
+in DT. [3]
+
+Referring to LEDs in Device tree is documented in [4], in "flash-leds"
+property documentation. In short, LEDs are directly referred to by
+using phandles.
+
+While Device tree allows referring to any node in the tree[1], in ACPI
+references are limited to device nodes only [2]. For this reason using
+the same mechanism on ACPI is not possible.
+
+ACPI allows (as does DT) using integer arguments after the reference.
+A combination of the LED driver device reference and an integer
+argument, referring to the "led" property of the relevant LED, are
+use to individual LEDs. The value of the LED property is a contract
+between the firmware and software, it uniquely identifies the LED
+driver outputs.
+
+An ASL example of a camera sensor device and a LED driver device for two
+LEDs. Objects not relevant for LEDs or the references to them have been
+omitted.
+
+	Device (LED)
+	{
+		Name (_DSD, Package () {
+			ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
+			Package () {
+				Package () { "led0", LED0 },
+				Package () { "led1", LED1 },
+			}
+		})
+		Name (LED0, Package () {
+			ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+			Package () {
+				Package () { "led", 0 },
+				Package () { "flash-max-microamp", 1000000 },
+				Package () { "flash-timeout-us", 200000 },
+				Package () { "led-max-microamp", 100000 },
+				Package () { "label", "led:salama" },
+			}
+		})
+		Name (LED1, Package () {
+			ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+			Package () {
+				Package () { "led", 1 },
+				Package () { "led-max-microamp", 10000 },
+				Package () { "label", "led:huomiovalo" },
+			}
+		})
+	}
+
+	Device (SEN)
+	{
+		Name (_DSD, Package () {
+			ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+			Package () {
+				Package () {
+					"flash-leds",
+					Package () { ^LED, 0, ^LED, 1 },
+				}
+			}
+		})
+	}
+
+where
+
+	LED	LED driver device
+	LED0	First LED
+	LED1	Second LED
+	SEN	Camera sensor device (or another device the LED is
+		related to)
+
+[1] Device tree. <URL:http://www.devicetree.org>, referenced 2016-10-03.
+
+[2] Advanced Configuration and Power Interface Specification.
+    <URL:http://www.uefi.org/sites/default/files/resources/ACPI_6_1.pdf>,
+    referenced 2016-10-04.
+
+[3] Documentation/devicetree/bindings/leds/common.txt
+
+[4] Documentation/devicetree/bindings/media/video-interfaces.txt
+
+[5] Device Properties UUID For _DSD.
+    <URL:http://www.uefi.org/sites/default/files/resources/_DSD-device-properties-UUID.pdf>,
+    referenced 2016-10-04.
+
+[6] Hierarchical Data Extension UUID For _DSD.
+    <URL:http://www.uefi.org/sites/default/files/resources/_DSD-hierarchical-data-extension-UUID-v1.pdf>,
+    referenced 2016-10-04.
-- 
2.11.0

