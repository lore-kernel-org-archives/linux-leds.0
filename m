From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v7 3/5] leds: core: add documentation for RGB extension
Date: Fri, 4 Mar 2016 22:12:28 +0100
Message-ID: <56D9FA3C.4080701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Document the RGB extension in Documentation/leds/leds-class.txt

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
- no changes
v7:
- move Documentation/ABI change into separate patch
- change "colour" to "RGB" in more places
---
 Documentation/leds/leds-class.txt | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index d406d98..003c098 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -8,6 +8,22 @@ LED is defined in max_brightness file. The brightness file will set the brightne
 of the LED (taking a value 0-max_brightness). Most LEDs don't have hardware
 brightness support so will just be turned on for non-zero brightness settings.
 
+If a driver uses the RGB extension of the LED core then the brightness
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
+If the RGB extension is used hsv / rgb can be used instead of a specific
+colour.  There have been calls for LED properties such as colour to be
+exported as individual led class attributes. As a solution which doesn't
+incur as much overhead, I suggest these become part of the device name.
+The naming scheme above leaves scope for further attributes should they be
+needed. If sections of the name don't apply, just leave that section blank.
 
 
 Brightness setting API
-- 
2.7.1
