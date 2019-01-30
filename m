From: Dan Murphy <dmurphy@ti.com>
Subject: [RFC PATCH] leds: multicolor: Add sysfs interface definition
Date: Wed, 30 Jan 2019 12:30:05 -0600
Message-ID: <20190130183005.833-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Add a documentation of LED Multicolor LED class specific
sysfs attributes.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../ABI/testing/sysfs-class-led-multicolor    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
new file mode 100644
index 000000000000..19f8da9b150e
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -0,0 +1,38 @@
+What:		/sys/class/leds/<led>/color/sync_enable
+Date:		January 2019
+KernelVersion:	5.0
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		Writing a 1 to this file will enable the sychronization of all
+		the defined color LEDs within the LED node.  Writing a 0 to
+		this file will disable syncing.
+
+What:		/sys/class/leds/<led>/color/sync
+Date:		January 2019
+KernelVersion:	5.0
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	write only
+		Writing a 1 to this file while sync_enable is set to 1 will
+		synchronize all defined LEDs within the LED node.  All LEDs
+		defined will be configured based on the brightness that has
+		been requested.
+
+		If sync_enable is set to 0 then writing a 1 to sync has no
+		affect on the LEDs.
+
+What:		/sys/class/leds/<led>/color/<led color>
+Date:		January 2019
+KernelVersion:	5.0
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		These files are dynamically created based on the colors defined
+		by the registrar of the class.
+		The led color(s) can be but not limited to red, green, blue,
+		white, amber and violet.  If sync is enabled then writing the
+		brightness value of the LED is deferred until a 1 is
+		written to /sys/class/leds/<led>/color/sync.  If syncing is
+		disabled then the LED brightness value will be written
+		immediately to the LED driver.
+
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/max_brightness.
-- 
2.20.1.98.gecbdaf0899
