From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v10 12/19] DT: Add documentation for the Skyworks AAT1290
Date: Fri, 09 Jan 2015 16:23:02 +0100
Message-ID: <1420816989-1808-13-git-send-email-j.anaszewski@samsung.com>
References: <1420816989-1808-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1420816989-1808-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

This patch adds device tree binding documentation for
1.5A Step-Up Current Regulator for Flash LEDs.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
 .../devicetree/bindings/leds/leds-aat1290.txt      |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-aat1290.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-aat1290.txt b/Documentation/devicetree/bindings/leds/leds-aat1290.txt
new file mode 100644
index 0000000..880a21d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-aat1290.txt
@@ -0,0 +1,17 @@
+* Skyworks Solutions, Inc. AAT1290 Current Regulator for Flash LEDs
+
+Required properties:
+
+- compatible : Must be "skyworks,aat1290".
+- gpios : Two gpio pins in order FLEN, EN/SET.
+- flash-timeout-us : Maximum flash timeout in microseconds -
+		     it can be calculated using following formula:
+		     T = 8.82 * 10^9 * Ct.
+
+Example:
+
+flash_led: led {
+	compatible = "skyworks,aat1290";
+	gpios = <&gpj1 1 0>, <&gpj1 2 0>;
+	flash-timeout-us = <1940000>;
+}
-- 
1.7.9.5
