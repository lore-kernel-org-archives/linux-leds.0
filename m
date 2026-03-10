Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542D21B86C7
	for <linux-leds@vger.kernel.org>; Tue, 10 Mar 2026 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152108; cv=none; b=P9Aqup8pAH1AXe3hQ6hyrDd3mgMqwQstn3VXecjjeUdePXE9VhgTHDHd5LEPvNs2UFj+tMsjCXtoj5Y+xNAZC9028eiXg9uJxtCE1AneplFrqGvzNKAycOiQkI2n6qx8B7llwQ7lr6wsG5hYkNhxCfm+L/vM9h/k0bmD6ySt/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152108; c=relaxed/simple;
	bh=xlmWMhkDCJC+z45N4jV77nTwJpv5nOtmFEnX5712T5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYiulvKBROo5JD8TlhatY0sOd2mRNyY0syDHJuISLg+JHIpWOJvfEasYFRkv5rbcSIxvHCJ30WPoWA5y/p0HRoYP6lvU9QNhJEVGXw92iilah0sN5RftcVQxCuFQmYSsGS62ZNANKh2CmJK7R+Ry0BcnVKJ/wpXkKt+p3pLjuP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vzxrU-0006Tq-RF; Tue, 10 Mar 2026 15:15:04 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 10 Mar 2026 15:14:39 +0100
Subject: [PATCH v2 1/2] dt-bindings: leds: lp5860: add enable-gpio
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-v6-19-topic-ti-lp5860-enable-gpio-v2-1-3fcc617fe03a@pengutronix.de>
References: <20260310-v6-19-topic-ti-lp5860-enable-gpio-v2-0-3fcc617fe03a@pengutronix.de>
In-Reply-To: <20260310-v6-19-topic-ti-lp5860-enable-gpio-v2-0-3fcc617fe03a@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

The VIO_EN pin on the lp5860 can either be connected to VIO power supply
or GPIO.

Add the enable-gpios pin to the binding documentation.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/leds/leds-lp5860.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp5860.yaml b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
index 1ccba48541595..0e88c71c2d398 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
@@ -33,6 +33,11 @@ properties:
   '#size-cells':
     const: 0
 
+  enable-gpios:
+    maxItems: 1
+    description: |
+      GPIO attached to the chip's enable pin (VIO_EN).
+
 patternProperties:
   '^multi-led@[0-9a-f]+$':
     type: object
@@ -74,6 +79,7 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     spi {
@@ -83,6 +89,7 @@ examples:
         led-controller@0 {
             compatible = "ti,lp5860";
             reg = <0x0>;
+            enable-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
             #address-cells = <1>;
             #size-cells = <0>;
 

-- 
2.51.0

