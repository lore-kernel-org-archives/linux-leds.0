From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v6 3/4] leds: core: add documentation for color extension
Date: Wed, 2 Mar 2016 20:31:40 +0100
Message-ID: <56D73F9C.6050006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36092 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076AbcCBTb6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 2 Mar 2016 14:31:58 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Document the color extension in Documentation/leds/leds-class.txt

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- introduced to patch series
v3:
- document extension in more detail
v4:
- Better explain why flag LED_SET_HUE_SAT is needed
v5:
- no changes
v6:
- add docu for this feature to Documentation/ABI/testing/sysfs-class-led
---
 Documentation/ABI/testing/sysfs-class-led | 11 +++++++++++
 Documentation/leds/leds-class.txt         | 27 ++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 5 deletions(-)

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
diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index d406d98..b1e4cba 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -8,6 +8,22 @@ LED is defined in max_brightness file. The brightness file will set the brightne
 of the LED (taking a value 0-max_brightness). Most LEDs don't have hardware
 brightness support so will just be turned on for non-zero brightness settings.
 
+If a driver uses the colour extension of the LED core then the brightness
+file can be used to set hue / saturation / value. The brightness value is
+interpreted as: <0000000F><HHHHHHHH><SSSSSSSS><VVVVVVVV>
+Usage of the least byte is identical to monochrome mode. Saturation can be
+0-255 and hue 0-251 (Colour circle is mapped to 0-252).
+If hue and saturation both are 0 the current colour is preserved and only
+the brightness is set. This ensures backwards compatibility with monochrome
+mode, e.g. for led_set_brightness() calls from triggers.
+However we might want to have the option to set all HSV components, even
+if hue and saturation both are 0 (e.g. via brightness sysfs attribute).
+Use case: Set color to white (hue = 0 and saturation = 0).
+Therefore the default behaviour can be overridden with flag F (LED_SET_HUE_SAT).
+If this flag is set then hue and saturation are not checked for being 0 and
+the color components are set unconditionally. Example:
+0x010000ff sets the LED to white color with full brightness.
+
 The class also introduces the optional concept of an LED trigger. A trigger
 is a kernel based source of led events. Triggers can either be simple or
 complex. A simple trigger isn't configurable and is designed to slot into
@@ -45,11 +61,12 @@ Is currently of the form:
 
 "devicename:colour:function"
 
-There have been calls for LED properties such as colour to be exported as
-individual led class attributes. As a solution which doesn't incur as much
-overhead, I suggest these become part of the device name. The naming scheme
-above leaves scope for further attributes should they be needed. If sections
-of the name don't apply, just leave that section blank.
+If the colour extension is used hsv / rgb can be used instead of a specific
+colour.  There have been calls for LED properties such as colour to be
+exported as individual led class attributes. As a solution which doesn't
+incur as much overhead, I suggest these become part of the device name.
+The naming scheme above leaves scope for further attributes should they be
+needed. If sections of the name don't apply, just leave that section blank.
 
 
 Brightness setting API
-- 
2.7.1
