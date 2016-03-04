From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v7 4/5] leds: core: document ABI change for RGB extension
Date: Fri, 4 Mar 2016 22:14:42 +0100
Message-ID: <56D9FAC2.8090703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Document the ABI change in Documentation/ABI/testing/sysfs-class-led.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v7:
- separated from patch 3
---
 Documentation/ABI/testing/sysfs-class-led | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 3646ec8..20357d5 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -7,6 +7,17 @@ Description:
 		have hardware brightness support so will just be turned on for
 		non-zero brightness settings. The value is between 0 and
 		/sys/class/leds/<led>/max_brightness.
+		If a driver uses the RGB LED feature then this attribute is
+		interpreted as a HSV color model value:
+		<0000000F><HHHHHHHH><SSSSSSSS><VVVVVVVV>
+		Usage of the least byte is identical to monochrome mode.
+		Saturation can be 0-255 and hue 0-251 (Colour circle is mapped
+		to 0-252). If hue and saturation both are 0 the current colour
+		is preserved and only the brightness is set. This ensures
+		backwards compatibility with monochrome mode, e.g. for
+		led_set_brightness() calls from triggers.
+		Flag F enables setting hue and saturation even if both are 0.
+		For details and examples see Documentation/leds/leds-class.txt
 
 What:		/sys/class/leds/<led>/max_brightness
 Date:		March 2006
-- 
2.7.1
