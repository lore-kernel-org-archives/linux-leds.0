From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] Add attributes neccessary for LED flashes to
 devicetree/bindings/leds/common.txt
Date: Thu, 20 Nov 2014 14:17:13 +0100
Message-ID: <20141120131713.GC27527@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: j.anaszewski@samsung.com, sakari.ailus@iki.fi, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net
List-Id: linux-leds@vger.kernel.org


Add attributes neccessary for LED flashes to
devicetree/bindings/leds/common.txt .

This will allow me to add device tree support for adp1653 i2c flash
LED driver, and allow Jacek Anaszewski to add support for more LED
drivers..

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 2d88816..e9acbbc 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -14,6 +14,15 @@ Optional properties for child nodes:
      "ide-disk" - LED indicates disk activity
      "timer" - LED flashes at a fixed, configurable rate
 
+- max-microamp : maximum intensity in microamperes of the LED
+  	         (torch LED for flash devices)
+- flash-max-microamp : maximum intensity in microamperes of the
+                       flash LED; it is mandatory if the LED should
+		       support the flash mode
+- flash-timeout-microsec : timeout in microseconds after which the flash
+                           LED is turned off
+
+
 Examples:
 
 system-status {
@@ -21,3 +30,10 @@ system-status {
 	linux,default-trigger = "heartbeat";
 	...
 };
+
+camera-flash {
+	label = "Flash";
+	max-microamp = <50000>;
+	flash-max-microamp = <320000>;
+	flash-timeout-microsec = <500000>;
+}

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
