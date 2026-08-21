Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11ED3C3F7D
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 08:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301436; cv=none; b=Tb/dHDxXpj+sEJivgUju5xmG/WxNILTZONTL0k/GBoGnb2gQCgNtKy00VWLzF0Ayfj3/7go6h0RyxpJeNw+6oczl7Ha04+QXQJiQazrTabNey8n1I8sZk3Ys2yd9wQGA/m41u+2cplhjLacb+rlzHekVl8GV+7TVtFPI+uAOyRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301436; c=relaxed/simple;
	bh=9bibZuUnFhpT6I48ELTQlm+vsx5ZODwi3YO0SRDPBnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGaK0jZ1JTdONeBlvp8sd6ohCPau4Fc5jNeYWuv2lEk5GMY0hcZRkaz2ZJbkATzto7gQEQUTdwPfoFVt1wnaCVIaUGGlfIi8r2eCwzvOcHbzmK6KuMIBpIrkXNHhG+iCpAeIyZ7OSsH+0a+DjVMv3A9vojxx607VFxttFLynTas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKGCxvke; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKGCxvke"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4998e0916faso4167555e9.2
        for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787301433; x=1787906233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PldkGwtxCC+r0/FLbTvlyq8GzDgKIMshQkWa8+q2omA=;
        b=HKGCxvkesPJzGWEJ/hRe4wXGbp5IN9j8i2DZrW+d4eKG2DDivO9nQKQ23BQ1DM+R0y
         eRZJ+HUNFy3T8OxJd+MtdF6AeAL7p1Exqj3hhpo6cytYNshSDhLmaRa58cEBP/3y0xxs
         hDsgQyo9Gzlv6zytofWA6gE8YuI/25F9nhlGyTC2LfmUg7AxabG9bzVjZkbShytkgoY4
         0ooA9iZZnJ/6FkEi0gam8cC0oN45UVkoJqIwfbhXIA+0GYHEva2gdZFfCg+oUBp1K/mK
         HpdvvhqCDlY6MZXJe9oyxasrI9cDa2oCXdtIObly+kn2zdjwH7LEfEx38CYYun8954MP
         8z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787301433; x=1787906233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PldkGwtxCC+r0/FLbTvlyq8GzDgKIMshQkWa8+q2omA=;
        b=ku45BPGkZrLEUbSm2Kzdkydo2hEpKF0jjif9JIdWXwqkP8FTYvn4gIRPA/c8nNTwf+
         34tWJnoOPNOgJu9uHE4OA3nNZTYOMdRPniGwaUwkKR/m+oTnjGWN0vznXFHjLhuERnYB
         aZ8KHId31h7W7RS6NRLSNZuTSoM1tK5UZPq6nX7APZrpI4BWvlU+3vx2nvnj09VL1zup
         80qznZd4ykVuCT85prD7uwcVZf+ZNpGyXfW6ibTY89G7KttVMA14r2P6nd/39q3pPKRM
         X8Y50nQBJ4WThv6StKl7STfwbhZzSfcuvQoeoPmkr/5GN5DfVG4pVVU8PMJ/0fxrU7so
         a+iA==
X-Forwarded-Encrypted: i=1; AHgh+RotqLDevuJJo/qG32iDHRciTIHmWfVBthhYftHwprdFd4JYRvSdqAF7mdS6c1K5/aot8nwJ72jau2N/@vger.kernel.org
X-Gm-Message-State: AOJu0YxvbNem6726Naz8q5pk7bGimf0S5xv7DxdFmBZFnkO2DMGxhVM6
	51PFAmcewoPJ9ZcCcirKyyJzZNX6uokbFHWIna2mu2Y+02JUwCEyNTR+
X-Gm-Gg: AR+sD13BFg/b8d8dJWC6OM6L/GLcAObqnTzKIBgpz0wLelsgDZZCzNjScws54ce8kCK
	AMYf+ZRfwLLPjlTayHH0UOW/fQIZWQuIwnnpKi9PKJabEGQnwOiCEutjGdCuyd36Ojda0iaqXLG
	n7OFGfmlg1rfbHznnKtKdECTLshhpZzY4zBJqdtmq+5D/lBGQOh+pRP72wlMZqGF+gKU2Fz/I/d
	cxl64mD44NHailcabb9bLMH6Q2eRnAc6knPCOSf/Avh57GqptlTmyeRKPsugVxGZmtj3NuQug4V
	ONCXtVrESPDebiCnH12iEzlico/nPxpp5MxGi4xkkOAlzfGIQ+l8f2rBzHo6ZE2k3Z7+cFDp3l7
	LgH8VDp72g88l873iaeNFeshUs3NbhWLqBhq7LoIwADW/vKFBbc4XT9NcDDH8qewQkJ74i4vwKd
	343LfVp936DiWQZPyGnNkZju8VFtkTuOVYuVzjiL/SzbsovkVCQ2eo6ElUXIK7jVAB+Zkyx8h8A
	EUyr+ZXNDAf2op9rOjQLWYclGW+UKjVNYXpN/mTK0Sn4Q==
X-Received: by 2002:a05:600c:8108:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-499b82f40b6mr72829115e9.2.1787301432800;
        Fri, 21 Aug 2026 01:37:12 -0700 (PDT)
Received: from rillian-arch.home ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b911724bsm18546705e9.15.2026.08.21.01.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:37:12 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	linux-leds@vger.kernel.org
Cc: Rillian Grant <rillian.grant@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] dt-bindings: leds: Document TI LM3643 dual LED flash driver
Date: Fri, 21 Aug 2026 09:36:05 +0100
Message-ID: <20260821083620.68324-2-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083620.68324-1-rillian.grant@gmail.com>
References: <20260821083620.68324-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Texas Instruments LM3643 dual LED flash driver devicetree
bindings.

Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3643.yaml   | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3643.yaml b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
new file mode 100644
index 000000000000..18b08a79512f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3643.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments LM3643 1500mA dual LED Flash Driver
+
+maintainers:
+  - Rillian Grant <rillian.grant@gmail.com>
+
+description: |
+  The LM3643 is a dual LED flash driver utilizing a synchronous boost converter
+  to provide power to two current sources.
+
+  The dual high-side current sources can be tied together to provide flash
+  currents up to 1.5A through a single LED.
+
+  Datasheet: https://www.ti.com/lit/ds/symlink/lm3643.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,lm3643
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Index of the LED.
+        minimum: 0
+        maximum: 1
+
+      led-sources:
+        minItems: 1
+        maxItems: 2
+        items:
+          minimum: 0
+          maximum: 1
+
+      flash-max-microamp:
+        description: |
+          Maximum flash current through this LED. Each high-side current source
+          can provide up to 1.5A. The maximum current the boost can deliver is
+          1.5A across both sources.
+
+          Valid values for an LED connected to one source:
+            10900 - 1500000, step by 11725 (rounded down)
+          Valid values for an LED connected to both sources:
+            21800 - 1500000, step by 23450 (rounded down)
+
+        minimum: 10900
+        maximum: 1500000
+
+      led-max-microamp:
+        description: |
+          Maximum torch current through this LED. In torch mode each high-side
+          current source can provide up to 179mA.
+
+          Valid values for an LED connected to one source:
+            977 - 179000, step by 1400 (rounded down)
+          Valid values for an LED connected to both sources:
+            1954 - 358000, step by 2800 (rounded down)
+
+        minimum: 977
+        maximum: 358000
+
+      flash-max-timeout-us:
+        description: |
+          The chip supports timeouts from 10ms to 100ms in increments of 10ms
+          and from 100ms to 400ms in increments of 50ms. The provided value
+          will be rounded down to a supported value.
+
+        minimum: 10000
+        maximum: 400000
+
+    required:
+      - reg
+      - led-sources
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash-led-controller@63 {
+            compatible = "ti,lm3643";
+            reg = <0x63>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+                led-sources = <0>, <1>;
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_IR>;
+                flash-max-microamp = <750000>;
+                led-max-microamp = <180000>;
+                flash-max-timeout-us = <150000>;
+            };
+        };
+    };
-- 
2.55.0

