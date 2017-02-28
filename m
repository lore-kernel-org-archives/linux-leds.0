From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 3/4] dt-bindings: leds: document binding for LED timer trigger
Date: Tue, 28 Feb 2017 13:04:51 +0100
Message-ID: <20170228120452.10043-3-zajec5@gmail.com>
References: <20170228120452.10043-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34136 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752188AbdB1MR1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Feb 2017 07:17:27 -0500
In-Reply-To: <20170228120452.10043-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

Timer trigger is one of the simplest, hardware independent triggers. It
just blinks LED with a given intervals.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/leds/triggers-timer.txt        | 18 ++++++++++++++++++
 Documentation/devicetree/bindings/leds/triggers.txt    | 17 +++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/triggers-timer.txt

diff --git a/Documentation/devicetree/bindings/leds/triggers-timer.txt b/Documentation/devicetree/bindings/leds/triggers-timer.txt
new file mode 100644
index 000000000000..0e6c81d6f81b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/triggers-timer.txt
@@ -0,0 +1,18 @@
+Timer LED trigger properties.
+
+Timer trigger enables and disables LED with a given time intervals. It's example
+usage may be a simple indication that system is alive & working (to some point
+at least).
+
+Properties:
+- trigger-type : Must be "timer".
+- delay-on : Amount of time (in milliseconds) LED stays enabled.
+- delay-off : Amount of time (in milliseconds) LED stays disabled.
+
+Examples:
+
+timer-trigger {
+	trigger-type = "timer";
+	delay-on = <300>;
+	delay-off = <1000>;
+};
diff --git a/Documentation/devicetree/bindings/leds/triggers.txt b/Documentation/devicetree/bindings/leds/triggers.txt
index a1fbf3a75d67..8d8daa027bee 100644
--- a/Documentation/devicetree/bindings/leds/triggers.txt
+++ b/Documentation/devicetree/bindings/leds/triggers.txt
@@ -11,3 +11,20 @@ Common properties:
 		 documentation for more details.
 
 More properties can be available depending on the chosen trigger type.
+
+Examples:
+
+timer_trigger: timer-trigger {
+	trigger-type = "timer";
+	...
+};
+
+gpio-leds {
+	compatible = "gpio-leds";
+
+	system-status {
+		label = "Status";
+		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
+		triggers = <&timer_trigger>;
+	};
+};
-- 
2.11.0
