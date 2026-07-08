Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E443E9CD
	for <linux-leds@vger.kernel.org>; Wed,  8 Jul 2026 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514005; cv=none; b=HAaiJsaVapX0ZuxEj8scHs5CrLGnymDrRxBQCJeEwchrAy1e+r4j5kTlMe2Y+Gd3drIB8GQVm1gNKSYtFfqKdDUu8syIAnQNCGP8UZNyFNOV/dXO2W8yVNCVhSZI+uQ3HSo75gFcyF6li6jBMm6D57Q64PSZgZR1bUIyFGddBp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514005; c=relaxed/simple;
	bh=vWeBFXRW7mS91AbGqlCDA0lKZx+qg8kD3L+F5kWPOAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4ph/RyPxRc8Y9c16KMQmX9dopR4FxUTjz0PqMLJbMEKwSi4sDxQO5weizsm9EYXvka6MUohEpMY0j3v7M6LVH9sMjgrqUSpYT/R2rHDGokcO6oQeMUcgQdqooHemH+r5eZbA4qbrSLZr7sKAHKqaH2LFkZSevBzLCk1WNTkfvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eM5b1opX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eM5b1opX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47d70879764so455026f8f.2
        for <linux-leds@vger.kernel.org>; Wed, 08 Jul 2026 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783514002; x=1784118802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nZ45JHYuzQLGUmd70CLEeCtwiQyXvCK/RVBBWky/xc=;
        b=eM5b1opXGaA4mTXL5yrHHoUBdo2S7SnJ0VvL22HqpkVNy8WuGXm4NYEjuDsfftH57L
         yVt/Awo3uar9cAG1HPlgkV65lQYLetA+bR8qG8ICai8FJX0xakDTJnkIycGgKJ2S4zDI
         KsUngtQDG9yFjOdXVV2Wubw3yUMACUTkzmBJlQcUP+hQ8aaQYBK6O50FPHyPp9Z9Yi7V
         KS2WeTRPJFVX67AOwoAnxjxgbuTjueGHuGmqWOZlCTNEeinOiZd5KtAUwfQputWFWnUl
         2YbRJujDGZJA9ffI7QwAYRg+csnbCwT/HmAndh077Hxw6RqJdcs4WQGyfEsRnXU+o+Rl
         04WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514002; x=1784118802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nZ45JHYuzQLGUmd70CLEeCtwiQyXvCK/RVBBWky/xc=;
        b=aEDSjVSIh132kPlFKX7MZpB6Mi7Covv8ABsZV9Sg06D6pnsY1gAS/7tIrzvt2leRAD
         TbV156i2c+0faacZ/q666oVkzvhsyBL3fjq4FwKw5oGXUD9qdSJvME5C5B7HpOWbLU69
         9RdMHF8LAuN1FfU1rz8OY48WRGBFNJzXnj+irRklo0OlbYOwqnM07b0tV2MVQspNRjoi
         V+R3LUiHTW2MEZgY4Wf6xatbEDmKtkhCBQ2bIEecKnXunBMT9tydGKIqNiyiiORD8egD
         ZV+O7Hmm0/oECxVUyeQkRSZT7livwtyXj6RbgCxlPPvyZL1+RE1dtz5z83z8l8+qj5kg
         WB1A==
X-Forwarded-Encrypted: i=1; AHgh+RoqcI3J9N3ytCE8H9xm1UKkg0gZeAqGlF+zvAe0iQ8uqLxVMECje2uR+hMGIUzZNANQvNwt0n1X2iQM@vger.kernel.org
X-Gm-Message-State: AOJu0YwDOZC2/utv8o1yCV0tYwPYrMHdXmkcPjgRoxmRggufLjqhbZZu
	4/Sg6xQTFKGDVhnoar5sd/VwZ9wQFG2AY7g1Z2MyIWcWtOFJlw/Dc76k
X-Gm-Gg: AfdE7cnQG2p0mEuRFl3Wl9lzaOluRESBzMoXEc7cED8DSYNw8TOaMJk0aD6q/4Fk6Rm
	oiKGrddrWzvqfUW5sGPAKlY86NKMQhX1mrtonhd2EROdUzvkYE/TR44mJuvS+3B9iyWbEWfLQWI
	mCo1nT4qV92cAVFhvl1SBNJ8poBBC5779SONxwboXQOcRzgUWjVP7JWjqWG0e1hyV6uCst3HUy9
	sSImQ0wXzCkTK/ywtZf21xg6VbtaCwUFxRGL2zUk7RRjK27OdvQc38O0exPdVUwXW6FQlsfZG8h
	57CJFGzGniN163j5kaB2k2smovWh0HBDkz+i7uzl2mAqaXqMjN4riBxObq/LswKNWCUppTRdNgt
	4JCKUSi7EGb+YzRG7b4+igC5NHYLMXTzpqIP0nxHgBYZ/EJkm8ZwXS5OTOE4MrVjzckYPIlgu8I
	6w5k2recj9gkEYwIilk4ikdDhKorzQh24GxiHAnvGURka4cNrot7ko//8=
X-Received: by 2002:a05:6000:41d0:b0:475:5454:49f2 with SMTP id ffacd0b85a97d-47df07c1f26mr2231695f8f.24.1783514002112;
        Wed, 08 Jul 2026 05:33:22 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.173])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm45760242f8f.37.2026.07.08.05.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:33:21 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Eduard Bostina <egbostina@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: leds: backlight: Convert TPS65217 to DT schema
Date: Wed,  8 Jul 2026 12:33:17 +0000
Message-ID: <20260708123317.1768641-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments TPS65217 PMIC bindings to DT schema.

During the conversion, the following updates were made:
- Make the 'backlight' node optional to resolve dtbs_check warnings.
  Some boards declare a bare TPS65217 node without implementing the
  backlight configuration.
- Document the 'isink-en' property in the backlight subnode to resolve
  dtbs_check warnings. This property is used (am335x-guardian.dts)
  to manage the backlight current sinks. It was missing from the old
  txt binding.
- 'additionalProperties: true' is at the top level because the
  TPS65217 node is documented across multiple independent schemas
  matching the same compatible string.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../bindings/leds/backlight/ti,tps65217.yaml  | 82 +++++++++++++++++++
 .../leds/backlight/tps65217-backlight.txt     | 27 ------
 2 files changed, 82 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
new file mode 100644
index 000000000000..07b15cab4b63
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TPS65217 family of regulators
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description: |
+  The TPS65217 chip contains a boost converter and current sinks which can be
+  used to drive LEDs for use as backlights.
+
+properties:
+  compatible:
+    const: ti,tps65217
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+  backlight:
+    type: object
+    additionalProperties: false
+    description:
+      Node for specifying WLED1 and WLED2 lines in TPS65217.
+
+    properties:
+      isel:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [1, 2]
+        description: |
+          Selection bit. Valid values:
+            1 - ISEL1 (low-level)
+            2 - ISEL2 (high-level)
+
+      fdim:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [100, 200, 500, 1000]
+        description:
+          PWM dimming frequency in Hz.
+
+      default-brightness:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 100
+
+      isink-en:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable backlight current sinks.
+
+    required:
+      - isel
+      - fdim
+      - default-brightness
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps@24 {
+            reg = <0x24>;
+            compatible = "ti,tps65217";
+
+            backlight {
+                isel = <1>;   /* 1 - ISET1, 2 ISET2 */
+                fdim = <100>; /* TPS65217_BL_FDIM_100HZ */
+                default-brightness = <50>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt
deleted file mode 100644
index 5fb9279ac287..000000000000
--- a/Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-TPS65217 family of regulators
-
-The TPS65217 chip contains a boost converter and current sinks which can be
-used to drive LEDs for use as backlights.
-
-Required properties:
-- compatible: "ti,tps65217"
-- reg: I2C slave address
-- backlight: node for specifying WLED1 and WLED2 lines in TPS65217
-- isel: selection bit, valid values: 1 for ISEL1 (low-level) and 2 for ISEL2 (high-level)
-- fdim: PWM dimming frequency, valid values: 100, 200, 500, 1000
-- default-brightness: valid values: 0-100
-
-Each regulator is defined using the standard binding for regulators.
-
-Example:
-
-	tps: tps@24 {
-		reg = <0x24>;
-		compatible = "ti,tps65217";
-		backlight {
-			isel = <1>;  /* 1 - ISET1, 2 ISET2 */
-			fdim = <100>; /* TPS65217_BL_FDIM_100HZ */
-			default-brightness = <50>;
-		};
-	};
-
-- 
2.43.0

