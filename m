From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH 5/5] leds: leds-pwm: add DT support for LEDs wired to supply
Date: Sun, 06 Apr 2014 23:20:24 +0100
Message-ID: <E1WWvQO-00049j-36@rmk-PC.arm.linux.org.uk>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140406221854.GS7528@n2100.arm.linux.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

The non-DT driver allowed an active low property to be specified, but DT
is missing this in its description.  Add the property to the DT binding
document, making it optional.  It defaults to active high, which retains
compatibility with existing descriptions.

This should only be used for causes where the LED is wired to supply,
and the PWM does not sensibly support its own inversion.

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 Documentation/devicetree/bindings/leds/leds-pwm.txt | 2 ++
 drivers/leds/leds-pwm.c                             | 1 +
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Documentation/devicetree/bindings/leds/leds-pwm.txt
index 7297107cf832..6c6583c35f2f 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
@@ -13,6 +13,8 @@ node's name represents the name of the corresponding LED.
   For the pwms and pwm-names property please refer to:
   Documentation/devicetree/bindings/pwm/pwm.txt
 - max-brightness : Maximum brightness possible for the LED
+- active-low : (optional) For PWMs where the LED is wired to supply
+  rather than ground.
 - label :  (optional)
   see Documentation/devicetree/bindings/leds/common.txt
 - linux,default-trigger :  (optional)
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 1d47742c551f..fb1eafe09324 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -155,6 +155,7 @@ static int led_pwm_create_of(struct device *dev, struct led_pwm_priv *priv)
 
 		led.default_trigger = of_get_property(child,
 						"linux,default-trigger", NULL);
+		led.active_low = of_property_read_bool(child, "active-low");
 		of_property_read_u32(child, "max-brightness",
 				     &led.max_brightness);
 
-- 
1.8.3.1

