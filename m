From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 1/4] dt-bindings: leds: document property for LED triggers
Date: Tue, 28 Feb 2017 13:04:49 +0100
Message-ID: <20170228120452.10043-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36688 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752395AbdB1NL6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Feb 2017 08:11:58 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

There was a long discussion on describing LED trigger sources in DT.
Few solutions were posted but neither was clear & flexible enough. It's
really hard to design DT bindings for a LED node that will allow
describing any kinds of triggers.

Finally Jacek suggested a different design. It involved using separated
DT node for each trigger.

This documentation follows that idea. It really simplifies DT bindings
and allows clear support for different trigger types. With this solution
every type can have its own specific properties.

Please note an example will be added later with the first supported
trigger bindings. The point is to have nodes like:
foo-trigger {
	trigger-type = "foo";
	...
};

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/leds/common.txt   |  3 +++
 Documentation/devicetree/bindings/leds/triggers.txt | 13 +++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/triggers.txt

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 696be5792625..0bc91556a47a 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -49,6 +49,9 @@ Optional properties for child nodes:
 - panic-indicator : This property specifies that the LED should be used,
 		    if at all possible, as a panic indicator.
 
+- triggers : List of nodes of triggers that should control this LED state. For
+	     more details see triggers.txt.
+
 Required properties for flash LED child nodes:
 - flash-max-microamp : Maximum flash LED supply current in microamperes.
 - flash-max-timeout-us : Maximum timeout in microseconds after which the flash
diff --git a/Documentation/devicetree/bindings/leds/triggers.txt b/Documentation/devicetree/bindings/leds/triggers.txt
new file mode 100644
index 000000000000..a1fbf3a75d67
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/triggers.txt
@@ -0,0 +1,13 @@
+Common trigger properties.
+
+Triggers describe the way LEDs should be controlled, e.g. under what conditions
+they should be turned on or off. Depending on a trigger type various events can
+be used to determine a LED state. Some triggers can be hardware independent
+(e.g. time based), some can react to a specific hardware events.
+
+Common properties:
+- trigger-type : Type of a trigger. Choosing a trigger determines what kind of
+		 events will be used to control LED. See specific trigger
+		 documentation for more details.
+
+More properties can be available depending on the chosen trigger type.
-- 
2.11.0
