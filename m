From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCHv3] DT: leds: Add flash LED devices related properties (fwd)
 (fwd)
Date: Mon, 22 Dec 2014 23:27:29 +0100
Message-ID: <20141222222729.GA19981@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: j.anaszewski@samsung.com, sakari.ailus@iki.fi, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net
List-Id: linux-leds@vger.kernel.org

Addition of a LED Flash class extension entails the need for flash LED
specific device tree properties. The properties being added are:
max-microamp, flash-max-microamp, flash-timeout-microsec.

Signed-off-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>

---

This will allow me to add device tree support for adp1653 i2c flash
LED driver, and allow Jacek Anaszewski to add support for more LED
drivers..

Rob Herring requested to change microsec to us.

Yes, microamp vs. us does look inconsistent, but that's what other
subsystems do, and what Rob asked.


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
+- flash-timeout-us : timeout in microseconds after which the flash
+                     LED is turned off
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
+	flash-timeout-us = <500000>;
+}


-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
