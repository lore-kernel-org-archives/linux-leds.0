Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7114C6507
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404587; cv=none; b=SiKC5mKLqLIZwShfch00AReecZhx/4GAztiywnveRheB3sTL8gBPKkGRHu/35DU789LRjRA5b0WX5wxz8AJiPuQCXgnskxgD8eg2fp3zqoMiO0DzeGfRCWwEZB9Sr5Aaoc8aNvhEp106jY93KEkTmpgjtWKsBT9ACk98YpWeAas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404587; c=relaxed/simple;
	bh=uckZyXVLlKGBcOMrrx1IvRPD9w3WkL3fsgBO4V5Ixp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yid09DrFOYYNk+VqhLDgdJOQjJ8MME9dbbWmSMNKvK+gmlpxHMxM+Ni9/qHrn0AxmVq/rZW/1SbWOq3czE7v3jcZ1UUr2N93me6vZJBT5/raUz8nFsHv5R5loxnVie/zg7oe89IdNxc30fKXPUuVgPSFsS4hj2WNITLLGL1V9gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsFFxPoj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsFFxPoj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso18510685e9.0
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404583; x=1793009383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWZSnVHau6Npi7hsSuIlFMNZUS/p2QupozYmLvTM/rg=;
        b=OsFFxPojFn+sx11Td6WUfDZkMG8RVf4y8u8NUGbT4SRsgdMAp79yIDmPJ8FGT5OzFY
         Iq9uxiUOtMFDkVRQFMh5NlcuVWpofsgz+MF3++z5OVfbtf+bWIMhC4yimHtpoD675RD1
         iZyBpUWI7qaKSE1WWupMvdtxykUp59SKNCplNZkFGMbLHDVvvthZRxPehRc4tBHS2JHJ
         KFbAIvN79Zcw2l6y9ogr2Nm3ErAYYQjquUJi707fRD10ztkujGLHLKAmSl8D1IO4js2A
         OTnGfspvLvHZiRhyj070jhbiSvOL1ldeE6mVRsKt9htHuWwLIIaK6JcbXOCEDLrUgWS7
         N8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404583; x=1793009383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nWZSnVHau6Npi7hsSuIlFMNZUS/p2QupozYmLvTM/rg=;
        b=o7seZHW7/aOhcKvxPzcDTgYDVNZLIn47RTEjP3tjCJw5Fyh+US4Gc8wK277ER4BTBr
         scW0kIOjRHwC20T9pW+CT40wPWhyZDS/M2LcoGFL4qm8zaDWopi+S8zIQf72vSDpdIAm
         CIVEucfcfnPDq1aim4tqUVbvNowvqvz2GztKfc08XInMjnRUDFmgOfauqNRIsNL+Il9D
         h4r1oq8vvqlCUbRoJ4n6gt52U/S4ymGDO9dNIUi2YP1exgY+tSqN5gnwfZa3MNgpPF9G
         Ept8Thshu6IuCSvrkrWIWlEsfaSPtqQapcXmGsYcRXM94TECfWzmkPVflKC72MoMl/F3
         vxjQ==
X-Gm-Message-State: AFq9FYLDhi6IL2C78L6NX2L/xv5cnkafNdTBgwfPboF4q0dffJb07UpD
	tWAR+O4YwZiXJV0AapwGlWk82jK800Ipp8gEjVLR0QhzvWheKVDK/wbk
X-Gm-Gg: AYBFou3/jT7IHwZMvnoKKXgSgGay2hlFjZqOsGhvfk7uzANNfy809NVm63hiynqIfSG
	CwszQoeUNWxNOjGYGQqh3oTJ+VGTIa1+lEYs5fNDOTHjEzH0bickRwsbeSV67y72j3h4/jqd1PX
	zLqPUvK/r50I4qBwcZjZ4dbKinz7SF4iEJDWPn61tJiNo9+Ym2KPTgNHU+kP0QD0/pUr1PvPX6t
	McV9o/0kQEMjec2f7YLrOTkjK+ktqnuc+zB7+n5ryEo0a3Q6UdAGpJ+hqwvO8wVxtBS8KYbht4B
	SpPBX+KpgwS//ave4yZPrmpJdEwlH2RCL4jpnLvHrgVOfy5yWhkhCcQiMnR5Oap6P1vTPmsbW15
	qv3qnh5vMNry+7wm0QttItCWfmSsut13hjnchOTASjSoF7Z3z1xiZe03Mm1EmEw6iazIQSYThkR
	zv+y4PRBseasWST3YBSlJD/4rkK7xugfEz8y7aBnPW1BDkjgJx5KiQdManblI9z0Zv2k+trO+f1
	kOpgqVboBOWfg2stzKp5PNbZMe3Fg==
X-Received: by 2002:a05:600c:3484:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1d7605e04mr153405815e9.14.1792404582625;
        Mon, 19 Oct 2026 03:09:42 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:42 -0700 (PDT)
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
Subject: [PATCH v4 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Date: Mon, 19 Oct 2026 13:09:27 +0300
Message-ID: <20261019100930.110954-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100930.110954-1-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
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

