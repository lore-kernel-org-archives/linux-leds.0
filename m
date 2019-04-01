From: Dan Murphy <dmurphy@ti.com>
Subject: [RFC PATCH 1/5] leds: multicolor: Add sysfs interface definition
Date: Mon, 1 Apr 2019 12:33:56 -0500
Message-ID: <20190401173400.14238-2-dmurphy@ti.com>
References: <20190401173400.14238-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401173400.14238-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: marek.behun@nic.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Add a documentation of LED Multicolor LED class specific
sysfs attributes.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../ABI/testing/sysfs-class-led-multicolor    | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
new file mode 100644
index 000000000000..5583ecaa3170
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -0,0 +1,91 @@
+What:		/sys/class/leds/<led>/colors/sync_enable
+Date:		April 2019
+KernelVersion:	5.2
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		Writing a 1 to this file will enable the synchronization of all
+		the defined color LEDs within the LED node.  Brightness values
+		for each LED will be stored and written when sync is set to 1.
+		Writing a 0 to this file will disable syncing and allow
+		individual control of the LEDs brightness settings.
+
+What:		/sys/class/leds/<led>/colors/sync
+Date:		April 2019
+KernelVersion:	5.2
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	write only
+		Writing a 1 to this file while sync_enable is set to 1 will
+		write the current brightness values to all defined LEDs within
+		the LED node.  All LEDs defined will be configured based
+		on the brightness that has been requested.
+
+		If sync_enable is set to 0 then writing a 1 to sync has no
+		affect on the LEDs.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/brightness
+Date:		April 2019
+KernelVersion:	5.2
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
+		If sync is enabled then	writing the brightness value of the LED
+		is deferred until a 1 is written to
+		/sys/class/leds/<led>/color/sync.  If syncing is
+		disabled then the LED brightness value will be written
+		immediately to the LED driver.
+
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/colors/<led_color>/max_brightness.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/max_brightness
+Date:		April 2019
+KernelVersion:	5.2
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read only
+		Maximum brightness level for the LED color, default is
+		255 (LED_FULL).
+
+		If the LED does not support different brightness levels, this
+		should be 1.
+
+What:		/sys/class/leds/<led>/brightness_model/<model_color>
+Date:		April 2019
+KernelVersion:	5.2
+Contact:	Jacek Anaszewski <j.anaszewski@samsung.com>
+Description:	read/write
+		This directory contains the defined color models that are read
+		from the firmware node.  The model color will be the read from
+		the firmware node.  The model names should be a color that the
+		LED cluster can produce.
+
+What:		/sys/class/leds/<led>/brightness_model/<model_color>/brightness
+Date:		April 2019
+KernelVersion:	5.2
+Contact:	Jacek Anaszewski <j.anaszewski@samsung.com>
+Description:	read/write
+		Writing this file will initiate a synchronized write to the LED
+		cluster to produce the color output defined in the firmware node.
+
+		This value cannot exceed <model_color>/max_brightness.
+		Writing a 0 to this file will cause the LED cluster to turn off.
+
+		The sync and sync_enable files do not have an affect on this as
+		this is a real time update of the LED cluster.
+
+What:		/sys/class/leds/<led>/brightness_model/<model_color>/max_brightness
+Date:		April 2019
+KernelVersion:	5.2
+Contact:	Jacek Anaszewski <j.anaszewski@samsung.com>
+Description:	read
+		Reading this file will return the maximum number of brightness
+		levels that are defined in the firmware node for the model color.
+		It should be assumed that the levels are from 1 -> max_brightness
+		and the LED cluster brightness is increasing.
-- 
2.19.0
