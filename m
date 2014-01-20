From: Robin Gong <b38343@freescale.com>
Subject: [PATCH v1 2/2] update binding doc of leds-gpio.txt
Date: Mon, 20 Jan 2014 19:41:27 +0800
Message-ID: <1390218087-14597-2-git-send-email-b38343@freescale.com>
References: <1390218087-14597-1-git-send-email-b38343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1390218087-14597-1-git-send-email-b38343@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, cooloney@gmail.com, rpurdie@rpsys.net, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Update the binding doc for new property: "retain-state-suspended"

Signed-off-by: Robin Gong <b38343@freescale.com>
---
 .../devicetree/bindings/leds/leds-gpio.txt         |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.txt b/Documentation/devicetree/bindings/leds/leds-gpio.txt
index df1b308..f77148f 100644
--- a/Documentation/devicetree/bindings/leds/leds-gpio.txt
+++ b/Documentation/devicetree/bindings/leds/leds-gpio.txt
@@ -21,6 +21,8 @@ LED sub-node properties:
   on).  The "keep" setting will keep the LED at whatever its current
   state is, without producing a glitch.  The default is off if this
   property is not present.
+- retain-state-suspended: (optional) The suspend state can be retained.Such
+  as charge-led gpio.
 
 Examples:
 
@@ -50,3 +52,13 @@ run-control {
 		default-state = "on";
 	};
 };
+
+leds {
+	compatible = "gpio-leds";
+
+	charger-led {
+		gpios = <&gpio1 2 0>;
+		linux,default-trigger = "max8903-charger-charging";
+		retain-state-suspended;
+	};
+};
-- 
1.7.5.4
