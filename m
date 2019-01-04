From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 1/5] dt-bindings: leds: Add pattern initialization from Device Tree
Date: Fri,  4 Jan 2019 11:08:40 +0100
Message-ID: <1546596524-19863-2-git-send-email-krzk@kernel.org>
References: <1546596524-19863-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546596524-19863-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Document new led-pattern property for initialization of LED triggers.
The property format is trigger-specific (except being array of
integers).  For pattern trigger, the explanation of pattern format was
moved to a common file shared with sysfs ABI.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../ABI/testing/sysfs-class-led-trigger-pattern    | 51 ++--------------------
 Documentation/devicetree/bindings/leds/common.txt  | 12 +++++
 .../bindings/leds/leds-trigger-pattern.txt         | 49 +++++++++++++++++++++
 3 files changed, 64 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt

diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-pattern b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
index 1e5d172e0646..bd92ef9d6faa 100644
--- a/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
@@ -7,55 +7,10 @@ Description:
 		timer. It can do gradual dimming and step change of brightness.
 
 		The pattern is given by a series of tuples, of brightness and
-		duration (ms). The LED is expected to traverse the series and
-		each brightness value for the specified duration. Duration of
-		0 means brightness should immediately change to new value, and
-		writing malformed pattern deactivates any active one.
+		duration (ms).
 
-		1. For gradual dimming, the dimming interval now is set as 50
-		milliseconds. So the tuple with duration less than dimming
-		interval (50ms) is treated as a step change of brightness,
-		i.e. the subsequent brightness will be applied without adding
-		intervening dimming intervals.
-
-		The gradual dimming format of the software pattern values should be:
-		"brightness_1 duration_1 brightness_2 duration_2 brightness_3
-		duration_3 ...". For example:
-
-		echo 0 1000 255 2000 > pattern
-
-		It will make the LED go gradually from zero-intensity to max (255)
-		intensity in 1000 milliseconds, then back to zero intensity in 2000
-		milliseconds:
-
-		LED brightness
-		    ^
-		255-|       / \            / \            /
-		    |      /    \         /    \         /
-		    |     /       \      /       \      /
-		    |    /          \   /          \   /
-		  0-|   /             \/             \/
-		    +---0----1----2----3----4----5----6------------> time (s)
-
-		2. To make the LED go instantly from one brightness value to another,
-		we should use zero-time lengths (the brightness must be same as
-		the previous tuple's). So the format should be:
-		"brightness_1 duration_1 brightness_1 0 brightness_2 duration_2
-		brightness_2 0 ...". For example:
-
-		echo 0 1000 0 0 255 2000 255 0 > pattern
-
-		It will make the LED stay off for one second, then stay at max brightness
-		for two seconds:
-
-		LED brightness
-		    ^
-		255-|        +---------+    +---------+
-		    |        |         |    |         |
-		    |        |         |    |         |
-		    |        |         |    |         |
-		  0-|   -----+         +----+         +----
-		    +---0----1----2----3----4----5----6------------> time (s)
+		The exact format is described in:
+		Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
 
 What:		/sys/class/leds/<led>/hw_pattern
 Date:		September 2018
diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index aa1399814a2a..70876ac11367 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -37,6 +37,18 @@ Optional properties for child nodes:
      "ide-disk" - LED indicates IDE disk activity (deprecated),
                   in new implementations use "disk-activity"
      "timer" - LED flashes at a fixed, configurable rate
+     "pattern" - LED alters the brightness for the specified duration with one
+                 software timer (requires "led-pattern" property)
+
+- led-pattern : Array of integers with default pattern for certain triggers.
+                Each trigger may parse this property differently:
+                - one-shot : two numbers specifying delay on and delay off (in ms),
+                - timer : two numbers specifying delay on and delay off (in ms),
+                - pattern : the pattern is given by a series of tuples, of
+                  brightness and duration (in ms).  The exact format is
+                  described in:
+                  Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
+
 
 - led-max-microamp : Maximum LED supply current in microamperes. This property
                      can be made mandatory for the board configurations
diff --git a/Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt b/Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
new file mode 100644
index 000000000000..d3696680bfc8
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
@@ -0,0 +1,49 @@
+* Pattern format for LED pattern trigger
+
+The pattern is given by a series of tuples, of brightness and duration (ms).
+The LED is expected to traverse the series and each brightness value for the
+specified duration. Duration of 0 means brightness should immediately change to
+new value, and writing malformed pattern deactivates any active one.
+
+1. For gradual dimming, the dimming interval now is set as 50 milliseconds. So
+the tuple with duration less than dimming interval (50ms) is treated as a step
+change of brightness, i.e. the subsequent brightness will be applied without
+adding intervening dimming intervals.
+
+The gradual dimming format of the software pattern values should be:
+"brightness_1 duration_1 brightness_2 duration_2 brightness_3 duration_3 ...".
+For example (using sysfs interface):
+
+echo 0 1000 255 2000 > pattern
+
+It will make the LED go gradually from zero-intensity to max (255) intensity in
+1000 milliseconds, then back to zero intensity in 2000 milliseconds:
+
+LED brightness
+    ^
+255-|       / \            / \            /
+    |      /    \         /    \         /
+    |     /       \      /       \      /
+    |    /          \   /          \   /
+  0-|   /             \/             \/
+    +---0----1----2----3----4----5----6------------> time (s)
+
+2. To make the LED go instantly from one brightness value to another, we should
+use zero-time lengths (the brightness must be same as the previous tuple's). So
+the format should be: "brightness_1 duration_1 brightness_1 0 brightness_2
+duration_2 brightness_2 0 ...".
+For example (using sysfs interface):
+
+echo 0 1000 0 0 255 2000 255 0 > pattern
+
+It will make the LED stay off for one second, then stay at max brightness for
+two seconds:
+
+LED brightness
+    ^
+255-|        +---------+    +---------+
+    |        |         |    |         |
+    |        |         |    |         |
+    |        |         |    |         |
+  0-|   -----+         +----+         +----
+    +---0----1----2----3----4----5----6------------> time (s)
-- 
2.7.4
