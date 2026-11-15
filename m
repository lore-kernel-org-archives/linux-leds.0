Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733120;
	b=q75q0NwAktXn5f1m59h5WUO9d+RsiqQxpuZFMFY5iufxsZd+hmqUhArBXnl1i8LXJ9fU
	 G7/aUk1ZgtBHo6XS6dGNYI/9spGGX0o2eX7L0p4sQ2h6ckEVKGshdYPaXTyazVqhAzZhU
	 fYOKmLyJnGO6Kme/XDVF86EoZ6wz7XHNLDJeH2IBbrzq+TKLo+lSUlzD87d6AhCdzL8rq
	 QS/SFQve3znVrbyGbiQOkaRuxbeq9UFKMjNFxKhIMY18GparTnPFSc/YUAGPVfuzPu0fx
	 ARN5nnECnTWJfcLN6msQqZSLIkozhYbz1ZprTbCVtkIlpO9DiZzogmCfjiykFPyMCDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
	b=lhnayD7nDiJDIbYCO5nbKoQT8oXlbsgghKx6OH0/dppgbia+QCxygF5/1zYQ6i0Q5Y4J
	 9KzCzUTaZOKL/fnf/g0qYJaB3uo48EuwW6lv1X3q06iuyWxLaCh7tpTNmxu6h5Hu7nyCv
	 nApdIXxx1vYcLtWiVDty+btFDki0FX6o95AfUCIn6jocgk6qoxtMyRPda+S9u/8TAd2t5
	 iLTyXjoWTFJzfyiFJ21H2UJuxdzr/Hx4iiSiM6dQxsMuE7xL54/mVWLlBtlTLjpqFQI4a
	 jp5eC1l4Iu+kV0QHfmcws/1Z+soO87ZBRos9iA8RoyE/G93JKgs5oAGhuD7G56Qz1Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPsUUrm6;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481C1606A31A
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 08:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPsUUrm6
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c45551fa84eso507006666b.3
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 00:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733119; x=1795337919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=sPsUUrm635yddSdvTL7IG5cX2QAsw0XXrkPv6Pn/50HxLhpopLxnB9woE8SMJdkzPQ
         ZyVD8w+AHewcn3a1c93CucFI0Mq7zRsKJF3bldMV6CmQ7PmZYthmcnDhoE7sLD1fnnvs
         dIIsDTtaffiPVjVGvOEBHgEPuR21kH9N+mID9RNJnNk8Da0GEbDNj7iJDNF0bqtwyFAv
         BUVyH0xeSCizRcmsccXEMu4YUe057/v/rwPf3CF5G4ETita+V5S8Tubdlkd76sQwxDpD
         cQkaQ24toV68rPjAkXeG0zSt84eDQUSER3+3fu8KgxhsR7aNQpY8L/sJE1ymtU8my4g7
         7MYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733119; x=1795337919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=HGBeu2LW1ZdJ5KS2sS/FUi96VDRn7mm7S9/QyyFJqlk/Y9Dt8CgSjGkSzKT+lSncYs
         DpEwueSF7+dtgm6MGMkcUU/2RoYYpNOpysyqxV9brX5qe/6tNdcG3ptQBhmSkWVrPjGx
         DqBt6ULOqyNM1Rs/V2Ky5CnsoIXzRdNfNw5mI8b+/XbmLwt052b3LCkBYUzcFmWeBohl
         m/QYlbvXHtyWHOoK+PHudqE8OVV9u0ARXcmGfaQU1sZw2KlLgbB/0/imwdy6nY45IE6g
         Y653nvldGFhfQ++SkZVU9DS0x22ez3V+oZRw0zOr25GLggSeMmvmIJ4Av+sz2s0Q3mM+
         kh0w==
X-Gm-Message-State: APuU4Z8ZsXY19QrPHFRHcjqQm3AOLKZqxhDNvhl5bEigtUbOf5grxHBY
	hkPaGSUN52j4wtLY7RKVsf4X9XTSdecH8BL4CORMcQH55USYk4yPmbop
X-Gm-Gg: AYBFou3e7yp69wk5NrErjqc7xcvs9LTP9M4YKeexcoywRcfiicG1vmGLKfnV2ABtNyy
	DeTvp1hjTg58v1jQHRArI46WtpOITsovkMbKODbOFa4LL6APietTaA2s12TP744I2I5UYj/nqZB
	slSGNyCVjrHK9CYSs3b3y56AgYvH0gPtWzszmUPlUeh1WEUgxWADrOECPPHPj97lPJZfcED8qfM
	3xqDZvZX6HRcAxLadR1TxmMKKjSlS8Z2yO81DHlzpjliqRZV/Nmlt3jnHcpZBHBUR8aLvn2uNDC
	NSy6kZixldjDymkFUy1tFpin6zkK3seTNklVswvoPCdu4Sexy25PyV0yhph/a6qsQqUTtnLxN/C
	O7untFQ26uOhndRbrf/kXAAwHmJZa28LtGuCjQyTN5xvxH8zSObQLRjXn04ieZrNpLyyrfCuO4a
	DypGkyfFz5j4VEH/4botv2vHXdc67Zp4iFSGJDnIa+Gay/n+f3EhvGYp2iSB3XLquFdgD+4l2GS
	DM/jD6Fsc1iPSegu72tz9LZX93GUJtZx3VY1aE6O64g9mEgfLe2Hj6uCr2xw0dUTE3X1O5bfN6S
	zenNiRR2VF+TuhBgttlKITj3DxN2xxm9fHttI5sIfTKKVW3NxL5+mV9+67LCedIASJOsXQRWRNX
	Zy4gMp3TjzQ==
X-Received: by 2002:a17:907:9448:b0:c41:8e21:4d58 with SMTP id a640c23a62f3a-c5096199393mr579973966b.5.1794733118390;
        Sun, 15 Nov 2026 00:58:38 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v7 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Sun, 15 Nov 2026 10:58:22 +0200
Message-ID: <20261115085826.89641-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
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
index 0000000000000..3f3f3058af52d
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
+        default: 27900
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

