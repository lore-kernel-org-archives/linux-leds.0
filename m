From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 3/4] leds: core: add documentation for color extension
Date: Tue, 16 Feb 2016 20:29:13 +0100
Message-ID: <56C37889.9040208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37008 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755891AbcBPTaq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 16 Feb 2016 14:30:46 -0500
Received: by mail-wm0-f46.google.com with SMTP id g62so167856633wme.0
        for <linux-leds@vger.kernel.org>; Tue, 16 Feb 2016 11:30:45 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

Document the color extension in Documentation/leds/led-class.txt

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- introduced to patch series
---
 Documentation/leds/leds-class.txt | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index d406d98..fbd9062 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -8,6 +8,14 @@ LED is defined in max_brightness file. The brightness file will set the brightne
 of the LED (taking a value 0-max_brightness). Most LEDs don't have hardware
 brightness support so will just be turned on for non-zero brightness settings.
 
+If a driver uses the colour extension of the LED core then the brightness
+file can be used to set hue / saturation / value. The brightness value is
+interpreted as: <0000000F><HHHHHHHH><SSSSSSSS><VVVVVVVV>
+Usage of the least byte is identical to monochrome mode. Saturation can be
+0-255 and hue 0-251 (Colour circle is mapped to 0-252).
+If hue and saturation both are 0 the current colour is not changed and only
+the brightness is set. This can be overridden with flag F (LED_SET_HSV).
+
 The class also introduces the optional concept of an LED trigger. A trigger
 is a kernel based source of led events. Triggers can either be simple or
 complex. A simple trigger isn't configurable and is designed to slot into
@@ -45,11 +53,12 @@ Is currently of the form:
 
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
