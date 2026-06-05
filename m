Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B6D477981
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644481; cv=none; b=rjueWktzq2CK2HRHtEWDEn+QT5AAZA91sB1W3pG+aHIjGC0eolnRuCJ625RdhashIUk+jd0e3kv4ylcURsKvjSdqGH++S2qyOnYga8YKjkWI13AO0PTXxRx7FnJLbAVjf02Kkhsi6cG3fqqFPXutriVJFb5cdZpRooOKRRBggmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644481; c=relaxed/simple;
	bh=BROUQMEs5SYTB1khzHzfUbPjtunqMoKqykCd5QseKuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzt5XRtVRN+lQEIs6HVC/4fHzDR+WbA3FaGoeObqvgKwV8SA4tVsbkRmCvEPHmVy5eSmzYVwaVVKp6svOwbL3EQH5vvuIthjQIxl6BSE06NcGy8rrgyTbYz6puj5FnLVLYwuK1S3dtIP8f6vlqQNp9ieXMkEbLqq83NV9PUAokI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wVOy9-0007Tn-37; Fri, 05 Jun 2026 09:27:53 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Fri, 05 Jun 2026 09:27:47 +0200
Subject: [PATCH v2 1/2] dt-bindings: leds: Add default-intensity property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-multicolor-default-v2-1-ed07271df6b0@pengutronix.de>
References: <20260605-multicolor-default-v2-0-ed07271df6b0@pengutronix.de>
In-Reply-To: <20260605-multicolor-default-v2-0-ed07271df6b0@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2389; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=BROUQMEs5SYTB1khzHzfUbPjtunqMoKqykCd5QseKuw=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshSqioP7GjJepB2cALD6ZO8+d/ud+dnS5YXfjtv7Hhj7
 oYtp/laOkpZGMS4GGTFFFli1eQUhIz9r5tV2sXCzGFlAhnCwMUpABM5yM3wP9fj8bLPNrqy06tn
 dvtyvajX/WJk0hvHcIE/2WG71rENdxkZZnPeNZp8OU3CnslviUbtM4Gvp2Qex8908dK+9kz9jPx
 zdgA=
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

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 Documentation/devicetree/bindings/leds/common.yaml            | 11 +++++++++++
 .../devicetree/bindings/leds/leds-pwm-multicolor.yaml         |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index f4e44b33f56d..a34de0a34b42 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -73,6 +73,17 @@ properties:
       - keep
     default: off
 
+  default-intensity:
+    description:
+      The initial intensity of the LED color component. Used only during
+      initialization. Defaults to 0. As the intensity of each sub-LED is
+      multiplied with the overall brightness, without this property on a
+      sub-LED, the leds-pwm-multicolor-LED is effectively initialized at
+      minimum brightness regardless of its linux,default-trigger and
+      default-brightness properties.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
   linux,default-trigger:
     description:
       This parameter, if present, is a string defining the trigger assigned to
diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
index a31a202afe5c..7bf687c89411 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
@@ -45,6 +45,8 @@ properties:
 
           color: true
 
+          default-intensity: true
+
         required:
           - pwms
           - color
@@ -63,12 +65,14 @@ examples:
 
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

-- 
2.54.0.129.g3edf2eeba9

