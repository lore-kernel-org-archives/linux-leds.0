From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v5] DT: leds: Improve description of flash LEDs related
 properties
Date: Wed, 08 Apr 2015 16:31:27 +0200
Message-ID: <1428503487-4912-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38294 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753171AbbDHObr (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 8 Apr 2015 10:31:47 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, devicetree@vger.kernel.org

Properties defining maximum values for LED currents and timeout should
be mandatory to avoid the risk of hardware damage. This patch fixes
the issue.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/leds/common.txt |   19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 747c538..e478ac6 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -10,6 +10,17 @@ can influence the way of the LED device initialization, the LED components
 have to be tightly coupled with the LED device binding. They are represented
 by child nodes of the parent LED device binding.
 
+Required properties for child nodes:
+- led-max-microamp : Maximum LED supply current in microamperes
+                     (torch LED for flash devices). Controllers that have no
+                     configurable current can omit this property.
+- flash-max-microamp : Maximum flash LED supply current in microamperes.
+- flash-timeout-us : Timeout in microseconds after which the flash
+                     LED is turned off.
+
+Above properties determine a LED driver IC settings required for safe
+operation. They should be also used as the initial settings for the IC.
+
 Optional properties for child nodes:
 - led-sources : List of device current outputs the LED is connected to. The
 		outputs are identified by the numbers that must be defined
@@ -29,14 +40,6 @@ Optional properties for child nodes:
      "ide-disk" - LED indicates disk activity
      "timer" - LED flashes at a fixed, configurable rate
 
-- max-microamp : maximum intensity in microamperes of the LED
-		 (torch LED for flash devices)
-- flash-max-microamp : maximum intensity in microamperes of the
-                       flash LED; it is mandatory if the LED should
-		       support the flash mode
-- flash-timeout-us : timeout in microseconds after which the flash
-                     LED is turned off
-
 
 Examples:
 
-- 
1.7.9.5
