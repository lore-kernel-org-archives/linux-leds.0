From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] leds: centralize definition of "default-state" property
Date: Thu, 23 Jun 2016 13:38:00 +0200
Message-ID: <1466681880-12317-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33288 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752277AbcFWLiG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jun 2016 07:38:06 -0400
Received: by mail-lf0-f41.google.com with SMTP id f6so93391619lfg.0
        for <linux-leds@vger.kernel.org>; Thu, 23 Jun 2016 04:38:05 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Four different drivers define the "default-state" property.
Move this into the common.txt common LEDs properties.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/leds/common.txt           | 7 +++++++
 Documentation/devicetree/bindings/leds/leds-bcm6328.txt     | 2 +-
 Documentation/devicetree/bindings/leds/leds-bcm6358.txt     | 2 +-
 Documentation/devicetree/bindings/leds/leds-gpio.txt        | 9 ++-------
 Documentation/devicetree/bindings/leds/register-bit-led.txt | 9 ++-------
 5 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index af10678ea2f6..7ad54c6bcb10 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -19,6 +19,13 @@ Optional properties for child nodes:
 	  a device, i.e. no other LED class device can be assigned the same
 	  label.
 
+- default-state : The initial state of the LED. Valid values are "on", "off",
+  and "keep". If the LED is already on or off and the default-state property is
+  set the to same value, then no glitch should be produced where the LED
+  momentarily turns off (or on). The "keep" setting will keep the LED at
+  whatever its current state is, without producing a glitch.  The default is
+  off if this property is not present.
+
 - linux,default-trigger :  This parameter, if present, is a
     string defining the trigger assigned to the LED.  Current triggers are:
      "backlight" - LED will act as a back-light, controlled by the framebuffer
diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
index 3f48c1eaf085..ccebce597f37 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
@@ -49,7 +49,7 @@ LED sub-node optional properties:
     - active-low : Boolean, makes LED active low.
       Default : false
     - default-state : see
-      Documentation/devicetree/bindings/leds/leds-gpio.txt
+      Documentation/devicetree/bindings/leds/common.txt
     - linux,default-trigger : see
       Documentation/devicetree/bindings/leds/common.txt
 
diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt b/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
index b22a55bcc65d..da5708e7b43b 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
@@ -28,7 +28,7 @@ LED sub-node optional properties:
   - active-low : Boolean, makes LED active low.
     Default : false
   - default-state : see
-    Documentation/devicetree/bindings/leds/leds-gpio.txt
+    Documentation/devicetree/bindings/leds/common.txt
   - linux,default-trigger : see
     Documentation/devicetree/bindings/leds/common.txt
 
diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.txt b/Documentation/devicetree/bindings/leds/leds-gpio.txt
index cbbeb1850910..aad6bcbcab9d 100644
--- a/Documentation/devicetree/bindings/leds/leds-gpio.txt
+++ b/Documentation/devicetree/bindings/leds/leds-gpio.txt
@@ -14,13 +14,8 @@ LED sub-node properties:
   see Documentation/devicetree/bindings/leds/common.txt
 - linux,default-trigger :  (optional)
   see Documentation/devicetree/bindings/leds/common.txt
-- default-state:  (optional) The initial state of the LED.  Valid
-  values are "on", "off", and "keep".  If the LED is already on or off
-  and the default-state property is set the to same value, then no
-  glitch should be produced where the LED momentarily turns off (or
-  on).  The "keep" setting will keep the LED at whatever its current
-  state is, without producing a glitch.  The default is off if this
-  property is not present.
+- default-state:  (optional) The initial state of the LED.
+  see Documentation/devicetree/bindings/leds/common.txt
 - retain-state-suspended: (optional) The suspend state can be retained.Such
   as charge-led gpio.
 - panic-indicator : (optional)
diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.txt b/Documentation/devicetree/bindings/leds/register-bit-led.txt
index 379cefdc0bda..59b56365f648 100644
--- a/Documentation/devicetree/bindings/leds/register-bit-led.txt
+++ b/Documentation/devicetree/bindings/leds/register-bit-led.txt
@@ -23,13 +23,8 @@ Optional properties:
   see Documentation/devicetree/bindings/leds/common.txt
 - linux,default-trigger : (optional)
   see Documentation/devicetree/bindings/leds/common.txt
-- default-state: (optional) The initial state of the LED. Valid
-  values are "on", "off", and "keep". If the LED is already on or off
-  and the default-state property is set the to same value, then no
-  glitch should be produced where the LED momentarily turns off (or
-  on). The "keep" setting will keep the LED at whatever its current
-  state is, without producing a glitch.  The default is off if this
-  property is not present.
+- default-state: (optional) The initial state of the LED
+  see Documentation/devicetree/bindings/leds/common.txt
 
 Example:
 
-- 
2.4.11
