Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD123624BB
	for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 07:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015373; cv=none; b=LVQLORccKcxc7z64kB0S9iQybR7gzkqcdI4OUQPOW5f4jNME39UeI9OOkYlUu6oacp3007qA262uMmBs/GIqMo1GCBCKe85N5iI6j4vvabAqDechpbC9KxCFrozcLuS/8PDAUSVYGbYjarlbNrHLDr13jwDXUpBaqvpXf2ObUFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015373; c=relaxed/simple;
	bh=bWAZFqT4Tb+5f7uG8o8PjY4H1stxGUURcl/qaAWT79w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ugfc+oaf4FjA505Su3+SEeJH45ejTLs9semoBOaYITjKT0tg1MiuK1cC15nNjMZP6/sTnDU0ojSED8KGWo3LloNm50LyJOB5AU7THHV067dwqLaUbgbFNHh2im13nV+HVsPsp5s8HI8R/gXEM9KsZUoRHaxJeC51n6SFkWwFCNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCdC0Kru; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCdC0Kru"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38e91b06006so62290701fa.2
        for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 00:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777015370; x=1777620170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvT9+z0qrm3nOaQPxnVgMXtZ+9QDwe2OUg9PjPNYysQ=;
        b=RCdC0Kru4royx0BZdUrMH9ls8fgbpqKDQkfQM+SNEgJNanwSN7adI30eNeo0pi56aM
         d4jByxsFpZF0ewz/jJrawTZpXyT9edfXPFHXbx3qZXEtqziF0OD0bhkyyx0m952ayvip
         K8hLsJmRDyPObHH/4OYmmAVipK/AQTbSFS0gEmdL+9iBkoGwUSbYsFs9i7zxHEgrBjWe
         UyC557ivmy6SDLMTbTsfU6yE9HqWmkNefLaa2oY636yGW0rP+uX6zAOa+b92J2x3jBKT
         xZ9dUTxuLCUWuginnzwRWG+nHu+F/TtB0wU4kEpFw6maYphcDQW+xhbp5cPiDMf2EFdj
         KvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015370; x=1777620170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mvT9+z0qrm3nOaQPxnVgMXtZ+9QDwe2OUg9PjPNYysQ=;
        b=pskb+8Zt9eFZePK+OU5xM81NhgtEpBXwSNOqvn3PK0tCnP8wZ8CWvgNcNF1Su6iLHt
         OuH2jlSHToDCLUPXGTLwVfx4kZ6InwrJ50wuXBMKQCq+S8S9ThLXvVGGHLYvJUdkIscZ
         ISjxvEJxhi2GXoDKejUMhdszZLTw3YiIni6A+M6KDUB1dv+b75E6BEuYcJ/Kcfp+cjdC
         D/BiXamKn7yLk6aSWNNPqSFR/C8ubfruiP45C0jkkIDlmPVqny/map7pNb1ZlCK3veui
         xejQALwvA285XvGrdpt7kKB3NCCgUfZQHuDzxibxbStNWztGsHtjfGHV1YIlZu2+qyA/
         ociw==
X-Gm-Message-State: AOJu0YzwRbJCwe1FXeGGK4CrV2CLMt7w1+f3lzyO/pZm2+TTF70BNJAA
	AY4F/alKmbHZylZS98bJQWsRanlRuTHRFgehbsMLjAxNECHVUh4qZ6bh
X-Gm-Gg: AeBDieuGBOupiAEXu/BBZygZ4a9n4QwNFOZGefdczluVr3u/tmNu3fQgPdt+nmkW3pC
	6zoEW45O3Pk5QFDLl8D2n7nCfzEe6lp1Ckemr+rxFtpn3N+m0eMPU6q27a/yJwKYcPkdZNPMpde
	IGa17S7CYzCky7oWQ7zlFLwBxbiTCTgJUyKOJdmN3SUb9ZwDbtFXTRS9jguyvjX75Kq3zwDfGTD
	3bi3/oGTucYtTlsaQqBqLfCYOB7WM5xW592ZcpJxJvdhCFhVCiOS5a8cxUz0010mk1NFhUOBbgo
	Fwv11OzQ7coSDznrIvF2IwSS2jty6+ysXpVpQXkNP5z3PW65b3MD2k7z4mH1gexY6WtQNWjX/Ts
	BhtiDVr8HCbS5lRPmCN1cVGjwfMrt6LrkQVJEH4L+V6AjTcmPaptbRHa+bknihyhNROMtVoVmZ4
	ExSEABYz5KiwFf2GtYbHCeRPQ=
X-Received: by 2002:a05:6512:3b26:b0:5a3:ffd1:fbcf with SMTP id 2adb3069b0e04-5a4172cb91emr12006284e87.17.1777015369570;
        Fri, 24 Apr 2026 00:22:49 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41a238563sm5612550e87.55.2026.04.24.00.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:22:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
Date: Fri, 24 Apr 2026 10:22:26 +0300
Message-ID: <20260424072230.90354-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260424072230.90354-1-clamor95@gmail.com>
References: <20260424072230.90354-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
LEDs.

The TI LM3559 documented in this schema requires a separate compatible, as
it utilizes a different programming model — specifically regarding the
handling of voltage ranges.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
new file mode 100644
index 000000000000..c6c553ad23f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3560.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LM3560 Synchronous Boost Flash Driver
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The LM3560 is a 2-MHz fixed frequency synchronous boost converter with two
+  1000-mA constant current drivers for high-current white LEDs. The dual high-
+  side current sources allow for grounded cathode LED operation and can be
+  tied together for providing flash currents at up to 2 A through a single LED.
+  An adaptive regulation method ensures the current for each LED remains in
+  regulation and maximizes efficiency.
+
+allOf:
+  - $ref: /schemas/leds/common.yaml
+
+properties:
+  compatible:
+    enum:
+      - ti,lm3559
+      - ti,lm3560
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  enable-gpios:
+    description: GPIO connected to the HWEN pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Supply connected to the IN line.
+
+  flash-max-timeout-us:
+    minimum: 32000
+    maximum: 1024000
+    default: 32000
+
+  ti,peak-current-microamp:
+    description:
+      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, and 3.6A.
+      When the current limit is reached, the LM3560 stops switching for the
+      remainder of the switching cycle.
+    enum: [16000000, 23000000, 30000000, 36000000]
+    default: 16000000
+
+patternProperties:
+  '^led@[01]$':
+    description: LED control bank nodes.
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Control bank selection (0 = bank A, 1 = bank B).
+        maximum: 1
+
+      flash-max-microamp:
+        minimum: 62500
+        maximum: 1000000
+
+      led-max-microamp:
+        minimum: 31250
+        maximum: 250000
+
+    required:
+      - reg
+      - flash-max-microamp
+      - led-max-microamp
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@53 {
+            compatible = "ti,lm3560";
+            reg = <0x53>;
+
+            enable-gpios = <&gpio 28 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vdd_3v3_sys>;
+
+            flash-max-timeout-us = <1024000>;
+            ti,peak-current-microamp = <16000000>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+
+                label = "white::flash";
+                linux,default-trigger = "flash";
+
+                flash-max-microamp = <562500>;
+                led-max-microamp = <156250>;
+            };
+
+            led@1 {
+                reg = <1>;
+
+                label = "yellow::flash";
+                linux,default-trigger = "flash";
+
+                flash-max-microamp = <562500>;
+                led-max-microamp = <156250>;
+            };
+        };
+    };
-- 
2.51.0

