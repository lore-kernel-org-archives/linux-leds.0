Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100775;
	b=SIihB+RZuQY4F7e2FPa67MewvbR0k06eFHIEEZmaeOD884UfmxlNW3TKxtyNOlLWLRuB
	 qoOeG8upoBtVguW7JV8vo94B+Uy1Vokx5cTS+reYwuDiO0qhUFiMyDtTaEuAA/2RYUafI
	 +SBqdPPCSQecPpYis5xkk5bYpXWuK+UG2vO5QxAI7jKE2kFU0J8wiwY/3BONjj0chYwcB
	 y96N4ZKl4sISRm3ccYxM1VUsfcwreCaOXMDjGgedQ6vv0OJ9Cm+qS/mgsOZyijDgDNaEK
	 onb+6g4QOW+2/dLbRhgwHdlLbsfSn9hl+kEFgKg3oZkLF4xFafU4Bn+zMh1gvC+IIdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
	b=rA5wFL15GPsqokJJjco7k3BjYH0Abx3TrvTjjJhFLXoIVCLFZM1KLbgkrzromn5vHffb
	 uKYfydEiHiyDM2laizaD2hT3j9jjFeLuAi6xDZDevruLzIoHURHCwD83GBmlStgcVwham
	 RRLgdwnzI46ObAdLDoNlqUnBh0DRdPlK0SHHrzcNM2HgP7Eeokxb0zYWxQC6/McbQOflb
	 Eg07Wfyg3WOQ4CW/HnFfvNk5CvrqIAEd0WQ4nqdAlfpLwV7xZshQOIwGhNe379odg6JdO
	 EKG97Q9B2eXhxF2iFXUEcFOccQXzROcVybVOcXVSk4TiqxVJMdrPcAiGT+0jbrnvbWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Oy/3KG5W";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32697606A31F
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 11:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32697606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Oy/3KG5W
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c315869241fso524659866b.0
        for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100773; x=1793705573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
        b=Oy/3KG5WqtvrHjqq1wuaW48vC3gsYJBtBXLHxWy7q1M/Haq/6EVU7ytgS6OBQjO5Eg
         XN5CqyDgsGYRw95TTKHft/iIcKiLv0VrIINjBHOyAGLbjAIMMYkeqRj9xOQV4rXcO8av
         lVGiZ6tA/pcY3MYlU4WJuBR6IcfK5EOweDwNsCX3XFQKerkj0E2DW1eUQKlWMxmCixPj
         yzAYQqJV+sq7fHRvtnzQMwZqI5qlOZZmpG0ERzkab5d2VG4pkSilpBqTk80qh5Ee6iIi
         8hX6NNQm8aC8ShpfLPVblX6PHGe4Zk+jEu9XIWHHQu/FBKNMXa6+AFYNPrjKDZzOcsH2
         Jf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100773; x=1793705573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
        b=ZHG9mBlN9R2A1UI16E+83+qVw5055IUuBN50EtKCpLWxGVGmEFTPY142BvC+Rf0QbM
         kUccj4RG49uNsXiMz61hSbPNX3CctOtDf47USj8P5YHX/D4nqCKQBn4v+LfhzWJmxbM/
         B/WV2B5OYidFlFJAFhSXyXo848MtLCV2dLjMJh7DgQ0aGwoQlfQKN9rsbJICrH2PB5B3
         1fUUUoCoNvy5c+A4IvgoemAlhzy3USZhPN20o5jjCmgm0K8f9FKjMAG/Yh5PHanJArlo
         PLYta0QKb6tTw7eCx8UPIK5ybsgP9fuLvtD43x8YWp1tGKNmsouNNOU4ZVx/XicCatbe
         r5Lw==
X-Gm-Message-State: AFq9FYLPb0cL9ETm4XPzACTRIlAMBBFfMAMsvfIwjikyACw8IBzV+tLj
	PodOSiq1WFNbBRLmOD2gZmWvSUODNo99noJskeEF25nZxrrlsYvcgrhW
X-Gm-Gg: AYBFou0V8ZNs6xaha4B/O7eTlhpkNNbWMv8jtLmfX1YUe/tvEXyF7qjmQeMEPxXH/IN
	DtKikegXlE92M30U+cK2QpysChVxLrHgGuK02yTA+KkUiOaqKnz9mvayBPe9CkdFfo0hQ/Q8HqS
	2b+irmxjex1IZjbsICtTzThq69LYnrc3WAYTgZ7VvZq3CXj5nJow7dXxB3lF3kdsaeaq2h5Ivwt
	HXOd2v+5QONYQbZfNHtL6et6f+C6rF3as+usmQ7KooBJAzmECzeRuFUP9HhXyHtNYfyZmEwDQtQ
	EexqLw2hRVlYwGkjYS2pYhtmY/x+IZVnodgbTk6u9zAfywkP6B93rNG879GF51XWLDsickwgy2t
	vQSN+uh3kRcFV31XLkLO+4NM21Pja7Wg/7Bdjy6MVPrhsb+hccNqPmsGg3C0g7hNaydoQrNU3Df
	DjUYvEg5tKqSAqkV5HfxB28l/WRDKUvV+y2EfgVYUdzMogQcYWwOvdEgy3avY1JQa4wOdCBlY4T
	/vbmv6VtkuTH2EXwC1CxRSeOs+7KxigvcEwQ03RB5FeU8JddXlMgggScZPgkKkHQACXGs4tA3GN
X-Received: by 2002:a17:907:6092:b0:c31:82aa:dd4c with SMTP id a640c23a62f3a-c46bde48accmr960707066b.24.1793100773381;
        Tue, 27 Oct 2026 04:32:53 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Tue, 27 Oct 2026 13:32:27 +0200
Message-ID: <20261027113230.47538-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
new file mode 100644
index 0000000000000..0b4b8be9015bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/skyworks,aat2870.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAT2870 LED Backlight Driver and Multiple LDO Lighting Management Unit
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: skyworks,aat2870
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to EN pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Regulator providing power to the "IN" pin.
+
+  backlight:
+    $ref: /schemas/leds/backlight/common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-backlight
+
+      led-max-microamp:
+        minimum: 450
+        maximum: 27900
+        default: 450
+
+      skyworks,channels:
+        description: layout of active channels, where each bit represents
+          one of 8 channels.
+        $ref: /schemas/types.yaml#/definitions/uint8
+        default: 0xff
+
+    required:
+      - compatible
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-regulator
+
+      in-ldo-supply:
+        description: Phandle to parent supply of regulators populated under
+          regulators node. They all share same parent.
+
+    patternProperties:
+      "^ldo-(a|b|c|d)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
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
+        led-controller@60 {
+            compatible = "skyworks,aat2870";
+            reg = <0x60>;
+
+            enable-gpios = <&gpio 139 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vdd_3v3_vbat>;
+
+            backlight {
+                compatible = "skyworks,aat2870-backlight";
+
+                skyworks,channels = /bits/ 8 <0xff>;
+                led-max-microamp = <27900>;
+            };
+
+            regulators {
+                compatible = "skyworks,aat2870-regulator";
+
+                in-ldo-supply = <&vdd_3v3_vbat>;
+
+                ldo-a {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+
+                ldo-b {
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+
+                ldo-c {
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                ldo-d {
+                    regulator-min-microvolt = <2700000>;
+                    regulator-max-microvolt = <2800000>;
+                };
+            };
+        };
+    };
-- 
2.53.0

