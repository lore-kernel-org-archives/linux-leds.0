From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 1/5] dt-bindings: leds: Add pattern initialization from Device Tree
Date: Wed, 12 Dec 2018 12:16:42 +0100
Message-ID: <1544613406-27026-2-git-send-email-krzk@kernel.org>
References: <1544613406-27026-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544613406-27026-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Document new linux,trigger-pattern property for initialization of LED
pattern trigger.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/leds/common.txt | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index aa1399814a2a..3daccd4ea8a3 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -37,6 +37,42 @@ Optional properties for child nodes:
      "ide-disk" - LED indicates IDE disk activity (deprecated),
                   in new implementations use "disk-activity"
      "timer" - LED flashes at a fixed, configurable rate
+     "pattern" - LED alters the brightness for the specified duration with one
+                 software timer (requires "led-pattern" property)
+
+- led-pattern : String with default pattern for certain triggers. Each trigger
+                may parse this string differently:
+                - one-shot : two numbers specifying delay on and delay off,
+                - timer : two numbers specifying delay on and delay off,
+                - pattern : The pattern is given by a series of tuples, of
+                  brightness and duration (ms).  The LED is expected to traverse
+                  the series and each brightness value for the specified
+                  duration.  Duration of 0 means brightness should immediately
+                  change to new value.
+
+                  1. For gradual dimming, the dimming interval now is set as 50
+                  milliseconds. So the tuple with duration less than dimming
+                  interval (50ms) is treated as a step change of brightness,
+                  i.e. the subsequent brightness will be applied without adding
+                  intervening dimming intervals.
+
+                  The gradual dimming format of the software pattern values should be:
+                  "brightness_1 duration_1 brightness_2 duration_2 brightness_3
+                  duration_3 ...".
+                  For example "0 1000 255 2000" will make the LED go gradually
+                  from zero-intensity to max (255) intensity in 1000
+                  milliseconds, then back to zero intensity in 2000
+                  milliseconds.
+
+                  2. To make the LED go instantly from one brightness value to
+                  another, pattern should use zero-time lengths (the brightness
+                  must be same as the previous tuple's). So the format should be:
+                  "brightness_1 duration_1 brightness_1 0 brightness_2
+                  duration_2 brightness_2 0 ...".
+                  For example "0 1000 0 0 255 2000 255 0" will make the LED
+                  stay off for one second, then stay at max brightness for two
+                  seconds.
+
 
 - led-max-microamp : Maximum LED supply current in microamperes. This property
                      can be made mandatory for the board configurations
-- 
2.7.4
