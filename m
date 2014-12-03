From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH w/ acks] DT: leds: Add flash LED devices related properties
Date: Wed, 3 Dec 2014 19:57:46 +0100
Message-ID: <20141203185746.GA25267@amd>
References: <20141120131713.GC27527@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:43482 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751030AbaLCS5t (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 13:57:49 -0500
Content-Disposition: inline
In-Reply-To: <20141120131713.GC27527@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: j.anaszewski@samsung.com, sakari.ailus@iki.fi, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net


Addition of a LED Flash class extension entails the need for flash LED
specific device tree properties. The properties being added are:
max-microamp, flash-max-microamp, flash-timeout-microsec.

Signed-off-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

---

This will allow me to add device tree support for adp1653 i2c flash
LED driver, and allow Jacek Anaszewski to add support for more LED
drivers..


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
