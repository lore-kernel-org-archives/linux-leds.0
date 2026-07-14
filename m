Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056243EEAE9
	for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 07:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014560; cv=none; b=BIJqb/KkdU55GBQvub+wnWXUH4kK+k9Vc/SBuZuLZCXTYRBtwsmxNm2/NtcRVkqcZh9EcoO7wanaFYtCHt3P8pVZl09hNHRRlI+99R0JP/yn33BlOMSSax0ZzKTlNlwQW1Ssr+5tQ3oFfpdcSBNRIuL4bZwcUgdpNy1KLez9yAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014560; c=relaxed/simple;
	bh=BvI5f/SGs3rOnIaf937RzhNNvfMs8aUchvXoAXE8+Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sVHT7bnJinjlGlDrCdTD+awDcATMBN7HkeOS8uM3qnKgEIkOGHTkRK0cunZfoWB3I5RPiGvCjw5TsefTIk3/xDKvxDtA65DnPLi/OZByP71HdcRBI5Y8ZrBFEuiHJi7moyrS65XeC501XEfph/4iryxdH74+m3jXAziMmnf269s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wjXg5-0001R0-Hm; Tue, 14 Jul 2026 09:35:41 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Tue, 14 Jul 2026 09:35:03 +0200
Subject: [PATCH v4] dt-bindings: leds: Add default-intensity property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-multicolor-default-v4-1-c2335b32bc39@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAKbmVWoC/33NQQ6DIBCF4as0rEszgErSVe/RdCEwKI0VA2psj
 Hcv2o1JTZd/MvO9mUQMDiO5nmYScHTR+TZFdj4RXZdthdSZ1IQDL6CAjL6GpnfaNz5Qg7ZMRRl
 DoVAbhLwk6bELaN20offHt+Ognqj7VVovahd7H97b6sjWu78DI6NAFUhlbSZYLuStw7Ya+uBbN
 10MknVl5HsnP3R4ctCA5JIZWyg4dMTOEXDoCMooz3TOJOhSaPPjLMvyASQDbW5bAQAA
X-Change-ID: 20260604-multicolor-default-11e3becde05a
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Stefan Wahren <wahrenst@gmx.net>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3441; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=BvI5f/SGs3rOnIaf937RzhNNvfMs8aUchvXoAXE8+Rg=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsgKfXbGNpVL5iz793N/NPxfZc8RD66JvevHkXT5yvyMI
 O02G3/mjlIWBjEuBlkxRZZYNTkFIWP/62aVdrEwc1iZQIYwcHEKwEQOLWL4K5tz9771zUue6S1a
 qzMfCrz96PH7+PU3qz5wvL1dLxJzNpSRYdI51seijm9LZ27v6LD8b30/kWdFxDeey7v1FJ2m7Lh
 gxwEA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

Document the default-intensity property to set a default color on
multicolor LEDs.

Update pwm-multicolor to support it and update the example to turn the
LED red on boot.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Changes in v4:
- Move default to leds-pwm-multicolor.yaml as other drivers have other
  defaults (Thanks, Conor)
- Move definition of default-intensity property next to default-brightness
- Slighly improve description
- Link to v3: https://patch.msgid.link/20260630-multicolor-default-v3-1-24c5170ca3cd@pengutronix.de

Changes in v3:
- make default-intensity property description more generic and less
  redundant (Thanks, Conor)
- Drop applied patch that introduces the property (Thanks, Lee)
- Link to v2: https://patch.msgid.link/20260605-multicolor-default-v2-0-ed07271df6b0@pengutronix.de

Changes in v2:
- dt-bindings: Use correct property name in example
- dt-bindings: Add missing word in property description
- Link to v1: https://patch.msgid.link/20260604-multicolor-default-v1-0-b07bff431537@pengutronix.de
---
 Documentation/devicetree/bindings/leds/common.yaml              | 9 +++++++++
 Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index f4e44b33f56d..3e6f913070b0 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -179,6 +179,15 @@ properties:
       initialization. If the option is not set then max brightness is used.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  default-intensity:
+    description:
+      The initial intensity of the LED color component. As the intensity of
+      each sub-LED is multiplied by the overall brightness, without this
+      property on a sub-LED, it may effectively be initialized at a brightness
+      of 0 regardless of its linux,default-trigger and default-brightness
+      properties.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   panic-indicator:
     description:
       This property specifies that the LED should be used, if at all possible,
diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
index a31a202afe5c..08e28c5f08a8 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
@@ -45,6 +45,9 @@ properties:
 
           color: true
 
+          default-intensity:
+            default: 0
+
         required:
           - pwms
           - color
@@ -63,12 +66,14 @@ examples:
 
         multi-led {
             color = <LED_COLOR_ID_RGB>;
+            linux,default-trigger = "default-on";
             function = LED_FUNCTION_INDICATOR;
             max-brightness = <65535>;
 
             led-red {
                 pwms = <&pwm1 0 1000000>;
                 color = <LED_COLOR_ID_RED>;
+                default-intensity = <65535>;
             };
 
             led-green {

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260604-multicolor-default-11e3becde05a

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>

