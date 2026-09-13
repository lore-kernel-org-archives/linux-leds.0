Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E57357D0E;
	Sun, 13 Sep 2026 02:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789267089; cv=none; b=oChGd2SzRmG1fTDZD3Gzgr45BpNB9ogoZv+JGYuZim67gzv/FcfE5osjxhaAck2gu6h4YYrkfYhciX5/HwB8IydBgiOBf5djwpzi3Kxxql1cwmouWf3CFYo86cj8xGo21HN0dZejprctBWTmsrOELTkC31EQAb8NodRVY4sn/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789267089; c=relaxed/simple;
	bh=XjGowetihGiqAjoV226+UhXwTatGj1IDV2kE0b2OzQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gk6wZWytZTOHSAx1rsgX0vqLiGyOzHy1svbZCiJefyIdD6hOX5NP096R32LNApkl0sKuepgB9EPJpXNztShLri2Qlcq8Uw7KNDmpyt8/siO3dyHBVjzejidP/pvCS21Gd7u3qwkNWHo4nX+5O54rzT2Tc4fTVBKytfLlIk9CeRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uX65YL0e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uX65YL0e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 801FDC2BCFA;
	Sun, 13 Sep 2026 02:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789267088;
	bh=XjGowetihGiqAjoV226+UhXwTatGj1IDV2kE0b2OzQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uX65YL0ekyHEB42ogPVfoT0kV6G4XFruct3+FGK+IPtfw4K6MNfu2c6NPEWXaP2U/
	 K+KS64wsFulD7qbCmIitOOl/hViuy5VmNQ8zzHkUQuwYPU2hNjhgabKa7gktGT+dbz
	 KZkHGLfAWgXh6nClwjhsJYOP3M6vKDK/hlYCIE98/7S/IZ2SuZRvFFgNjajmabxVmf
	 UNPhpStDYe1/DEabRQ/OD+TF5yZhwj1DOxgT2HPrp8Su2jUldfElNaNZd5WSNhlzAz
	 7M1oWULTLOm/Iz6vlqXWYg/ZkDBBJmnpwbBd+wRSoMG6pzEqo1otmAfIeLDVJjbhe0
	 JBfPf+N+pXgGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6160CC88E53;
	Sun, 13 Sep 2026 02:38:08 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sat, 12 Sep 2026 19:38:08 -0700
Subject: [PATCH v7 1/3] dt-bindings: leds: rt8515: Support single-GPIO
 flash ICs with vin supply
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-expressatt_camera_flash-v7-1-e1fd2edc8d84@gmail.com>
References: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
In-Reply-To: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789267087; l=2722;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=YAXE9xJLJFi0pOiJKXkn7F8HuxDAWR231QXLgxEZYyU=;
 b=dYyo6/J38Uy0zHy9FRHkac1Hsd1UY9oWKNAkCOmwTQ+DPtCmzlMYsF7yftKJBmvkculopxrUY
 bA/Jr3uBwszC3b8BuQPbMsY7QMWF+DlhG4yqrZs4WvJNi8xXSGMDeB/
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Some flash ICs use the same one-wire pulse-count protocol as the RT8515
but have only a single enable line for both flash and torch modes, plus
an optional input voltage supply (e.g. a GPIO-controlled fixed
regulator) that gates power to the chip.

Make ent-gpios optional and add a vin-supply property to support these
variants. Add a oneOf constraint requiring exactly one of ent-gpios or
vin-supply. Add a binding example showing the single-GPIO configuration
with an input supply.

Assisted-by: Claude:claude-opus-4.6
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../devicetree/bindings/leds/richtek,rt8515.yaml   | 34 +++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
index 0356371a6b01..ab3c5139132c 100644
--- a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
+++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
@@ -15,6 +15,10 @@ description: |
   current for each mode is defined in hardware using two resistors
   RFS and RTS.
 
+  Some flash ICs use the same one-wire pulse-count protocol but have
+  only a single enable line for both flash and torch modes. For these
+  single-channel variants, only enf-gpios is needed.
+
 properties:
   compatible:
     const: richtek,rt8515
@@ -26,6 +30,11 @@ properties:
   ent-gpios:
     maxItems: 1
     description: A connection to the 'ENT' (enable torch) pin.
+      Not present on single-channel flash ICs that use only one enable
+      line for both flash and torch modes.
+
+  vin-supply:
+    description: Optional input supply for the flash IC.
 
   richtek,rfs-ohms:
     minimum: 7680
@@ -81,10 +90,15 @@ properties:
 
 required:
   - compatible
-  - ent-gpios
   - enf-gpios
   - led
 
+oneOf:
+  - required:
+      - ent-gpios
+  - required:
+      - vin-supply
+
 additionalProperties: false
 
 examples:
@@ -108,4 +122,22 @@ examples:
         };
     };
 
+  - |
+    /* Single-channel flash IC with input supply */
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    led-controller {
+        compatible = "richtek,rt8515";
+        enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+        vin-supply = <&flash_reg>;
+        richtek,rfs-ohms = <16000>;
+
+        led {
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            flash-max-timeout-us = <250000>;
+        };
+    };
+
 ...

-- 
2.55.0


