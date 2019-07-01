From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v5 1/2] leds: multicolor: Add sysfs interface definition
Date: Mon, 1 Jul 2019 15:46:33 -0500
Message-ID: <20190701204634.10517-2-dmurphy@ti.com>
References: <20190701204634.10517-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701204634.10517-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Add a documentation of LED Multicolor LED class specific
sysfs attributes.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../ABI/testing/sysfs-class-led-multicolor    | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
new file mode 100644
index 000000000000..59839f0eae76
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -0,0 +1,67 @@
+What:		/sys/class/leds/<led>/brightness
+Date:		Sept 2019
+KernelVersion:	TBD
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		The multicolor class will redirect the device drivers call back
+		function for brightness control to the multicolor class
+		brightness control function.
+
+		Writing to this file will update all LEDs within the group to a
+		calculated percentage of what each color LED in the group is set
+		to.  Please refer to the leds-class-multicolor.txt in the
+		Documentation directory for a complete description.
+
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/max_brightness.
+
+What:		/sys/class/leds/<led>/colors/color_mix
+Date:		Sept 2019
+KernelVersion:	TBD
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		The color_mix file allows writing all registered multicolor LEDs
+		virtually at the same time.  The value(s) written to this file
+		contain the intensity values for each multicolor LED within
+		the colors directory.  The color indexes are reported in the
+		color_id file as defined in this document.
+		Please refer to the leds-class-multicolor.txt in the
+		Documentation directory for a complete description.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/color_id
+Date:		Sept 2019
+KernelVersion:	TBD
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read only
+		This file when read will return the index of the color in the
+		color_mix.
+		Please refer to the leds-class-multicolor.txt in the
+		Documentation directory for a complete description.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/intensity
+Date:		Sept 2019
+KernelVersion:	TBD
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		The led_color directory is dynamically created based on the
+		colors defined by the registrar of the class.
+		The led_color can be but not limited to red, green, blue,
+		white, amber, yellow and violet.  Drivers can also declare a
+		LED color for presentation.  There is one directory per color
+		presented.  The brightness file is created under each
+		led_color directory and controls the individual LED color
+		setting.
+
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/colors/<led_color>/max_intensity.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/max_intensity
+Date:		Sept 2019
+KernelVersion:	TBD
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read only
+		Maximum intensity level for the LED color, default is
+		255 (LED_FULL).
+
+		If the LED does not support different intensity levels, this
+		should be 1.
-- 
2.22.0.214.g8dca754b1e
