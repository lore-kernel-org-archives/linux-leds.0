Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795848;
	b=QFs3AQiIy9u3or20p01NMfJ6P7wDvCjWi0ok3d8bjR1pmS8a/69916bJDcvmwekuSrIC
	 GVMq743U3KNo/VL6dYdJX49bcb8EeqLduQRDeMddy3g8VgoQ7Zu9+Ah+DDYytacU/OwA0
	 XkKXKyuMBzreHgLT5mWzXHKLBFLa5KBREWR5RM4XRcDDQwA5P+kTs69uBXxsuO8jfWomO
	 HqUMaV1FJs7tRGi71ImuHAzNx1CfKRX9zW0seldt10jaI4UBDEeW5GCBD2zYsZKORLuO1
	 5i79+MCk0W8/paYDXHMVLzUUux33wfsfj13At4ukrai3vZHLXo9+qagqmpXS6nCdBPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
	b=G11Cj2hrno1FTfxGGR5qg/A+s4hhY4odJOniGi8zJpQWS/ScBSlt4prhuj60+w0j5pBR
	 w6xNAZLzdshgIqCMjWgq7FnBx6D9vHkBo2ZQo+C6xHoF7kymwW49dHCFN7gTy8YON4vKi
	 cUVE6TEWaKq/c9F5gR3+pCbDs7QGJB2PpgtixErzggHwdcSvk0JZwXyqSiQSlIH57Bt8P
	 E0PuJWx01XkMgLcnPQ5hkcvglPyDV2TrchNXOKT2nRDamh5qFZ2zzjncOl5LTrCJT4r97
	 OmKnjkEDqM+J8gVuZ1yOghV84mVWs7yRbh9Ou8nomIjNqMtDN2tDFbFKTCbboSnwRfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da3QX8PX;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DDF606A33A
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 12:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DDF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da3QX8PX
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b001cd92bso290517f8f.2
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 04:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795846; x=1794400646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=Da3QX8PXTku83HXjS5JpLZQXqckDKYkJbgCs4095ujueL7xk3JwGOtm3FVsh+o1vph
         vraZ/41wnUMcyHqO9H4jACP/PpgWADBJTqjRB6CT5oQPHTlzBDpBaZjhGqdTfhnuBLkf
         JFlbbCp6zVwNMQ/P2fUZvixOxa46gCgjGCgzNuLm8aTCjKQuWMKXKVjrjA2aNA3++fTf
         1z3qC8xIRrsdBGrtz41eYsOZSuonwsNDlBtpw1VnajOwulH9F6+f/ek7Y6rN+d6YSOAS
         1h/trqfm4hgiERV0SrHliUsZk+9z4lTK3rqudjeGiN/a91DdC+9uXC3dhd0wfXO4ocrE
         /Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795846; x=1794400646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=Q3hWrSIpIKRpxTbVL056D5ChK1hsW0tonEg/dc6p4e0m2+dkt90a1x1npFAf1oUNfw
         23+X63gv02hpL1GDM2LfLQFtc36e6eK+Kns1I7GBnTULo0Tk+nIGjsfqd8IEeo8BSCDT
         F2KajCMkym69JxPEtwXMfjc3oeLwiTwlMwUo22zuyheWhkBWo9mipldhnTGbJM8hl3R5
         lsCROjgWc0/Lio+MK5FLuIIXWxW/7YSP5geq1CSMB/LAvd+i17nuSZ5upYILg/GrfJ67
         6oKBfP5N/Re6mzPjL59hNcec/4RB7Y+vEzxPimv26CuVp89WI6bM2+ugwXxFaG/Gp2Om
         COfA==
X-Gm-Message-State: APuU4Z/GBYb9yeRwqLFBzFk1u1cA3NT3rlVvhZ8pH7Ig00kZbpA6rcaI
	muWWtirtF3QMtIfpfB/D/fWSWvVLoejpOxZ61Us4VceDqNYDEzb/t7aP
X-Gm-Gg: AYBFou38/iyJtZ0JRt50hgvAplMTkLbTjtP4BUSQrHua7NNM1/6oNAKEt7W1YuJ1KdS
	WZqW9alE06i6F42jNumM6pTo5jkOFRtJpd59LJkJJAaEeKUGskYL+9WWE74rvHXzdmG/4JXU/kE
	kfsXQaGqz9VFT4QPsAXtbncHl5GZ58DxgrAqUyeas3Xpp1jUSCHMZS9B70OzBIlPqtkZCrVH7Ks
	LJmCcd7Mshc0DLQtdS+8Ndr9KR6dM+n1Mpes75CwoMwY3YDKesUZEqMBcZ1fUzxKzMrVlFRQD3M
	qZO1lZSxqtPHI5fxz/YoA66LJD0K29RlPoJ8fmYo2YHcZzVVOf9UF/eKSZTSJZv8ll+5NK7KTsH
	xdLMlg//Ld6N4yZcnaxAAFvyy1BkkprO2xBppBLnU6Nsn4TJsKLQfz3Wo4GqZ+Pj/Qu7YnaxEK8
	KJL31Hkzx7KkIPhI8jjqPU9uPisP7JDwrY+veAnQ/ZL815TXb8G54kj3NGiTt+/TdSOUXzh7XOL
	8j3ne+rlarpI2euVp+tvc7Fppo7iBS7xZQ2ZA/8bIDIWQQ4Mjoamy+yxeM5TlQfB2zwEgxf+uyC
	OrJL2lqXiJbePqYbloHg10uV3RZPZYd5nZfmAs1/KDw/E6+rhw==
X-Received: by 2002:a05:6000:22c4:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-48fbf3c185bmr4984588f8f.21.1793795846185;
        Wed, 04 Nov 2026 04:37:26 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:24 -0800 (PST)
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
Subject: [PATCH v6 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Wed,  4 Nov 2026 14:37:11 +0200
Message-ID: <20261104123714.234634-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
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

