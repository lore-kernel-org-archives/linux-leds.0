Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC43B9D8B
	for <linux-leds@vger.kernel.org>; Sun,  4 Oct 2026 16:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132104; cv=none; b=hHhP0N5RY8Z1zmEtCjuf14mozaeCfjFLBpcV4or1yFY0iccYxm1pb8EcUvQYGTwaT61yRlfWbDjtXLKjWXKjZc6VnClrTdFC0YRCThk7hiAt0qll6IIH26obkg0StMgmnuVVMilLsWN78RjAuvdBnB+rjVyF9g9hUoDEa92QVhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132104; c=relaxed/simple;
	bh=MXHa4GE0IO9PDNWvg/1MpKMpHhSvEc5zC0RDNYOZsJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaTHcwZtpyxIeTwsb15NRra4siVOxyNUjlsMWqA6wB1ULM0GhQHY5nhEbvr1Z9gplC2e3Oj32O0g4Ik9dfpS7keC/qjealxrSaQgYCFMaBzm2dcPV0AUOPn3sZpU8xy/ZVrk7POVoDrc9J7DwkFfwnf681c2KT3fn5tBzeumTm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiSpNdSq; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiSpNdSq"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so6495565e9.1
        for <linux-leds@vger.kernel.org>; Sun, 04 Oct 2026 09:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132101; x=1791736901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oRhn0Uw3oG9VGKyBezr/4J0WUv4cf3LeMydSJnIiuw=;
        b=CiSpNdSq0aOGfSI81K0lSgBdKgmXLYF4QliO+Q92MQzg+Wy4T8s2fM0kRpAwB2im0H
         pm2bdgJY4nFxkzt0Ok4xipTgBcCCEiYxx1dJld+5tMiX/3y5RM7IzKEFitDykU0kIMQ4
         S4ejhjovhVsS3eQ7mMXKgOyj3uYCorWX2goB4n3CkXa0aQLCoSw4tmTuJcOqc6fcvcsD
         L+WUYNTg4Nh33kUkHaKnW2thapxbCqPQPh7YUR/AOI2QHnKx935FOa7l29BsUaMGmiWL
         WFQ0L0fjF7W5KlA4hq55PPIdfjwoidjQ5FX4kZkKgEtxiWWORjOGXtUKJ+DXdynYIK3j
         2I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132101; x=1791736901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oRhn0Uw3oG9VGKyBezr/4J0WUv4cf3LeMydSJnIiuw=;
        b=BygHVGhhSWp01Q+stzHMcF4f16cvwMMTEK7meZqIfDVsAWvWE/hTnlDwmnpEIZBLCB
         4sB4i7KO9YLWOtSzcBHYd4AegVQuD5kJM52B90DnUkQajUwyb8kp2T6TzqDCSEJo7CVw
         tmDtnrhe9m93Ef7mhR6DSFriv1bIesKLVz+FdNcIHHCmnK+8O6idiCvY9HgmIhC2LHht
         vXUh5eAiBhao+TZM4Gd2dMfx0dq2cPwX6qoNJsp98olX+8OQja859gvwK/CYUjng5JrA
         7xPCipEpro+mVfKwbKWJr3IeYGvll9266HX7iTal6N7L0ESr1UD6+nQ1fs/JbkOFPVPl
         JHsw==
X-Gm-Message-State: AFuF++mtpilkvZelfBe1N4XF4Zogw7DfeQu6328TSPDkips9roR4yOlq
	5ORN+oG8Q3VSqVUxyQDfIfu2bji8GjdqRpKJHfg0hku+n0mdk5mmWhvQ
X-Gm-Gg: AYBFou3GP2hC4zkF5Cm5PJEhZeSbYO7Xg7t06sOimBrL5l8jq33FXY0pqYugWs1M37/
	1u5hlauD6rj3R83xUJNsRbnHNFhwnaq88YFLsisVNAarV0SycS7yxCjFVW/r1+38YZ8+SxBME1D
	m1FJOXY9xdN9vGf36+ngEItjXZvN1SjViTLqh99T3Sa7RDqLEJTnG07ReStywaQS4rgObveiq8Y
	07m/2qyGrcwWB+B+FvtZDynTZa20inGdxr8r6naHpGWQsmNOJrlrsgnhkRD6lwsvA0RQ8dzAjO6
	c1Z+v1hiv39Bk7155AXtj1a+mexEykrUSzL6OMpq/bOheAKzytUynpd6nk5T2ApZNW1K9thPvDb
	n8wSlw7UHkdTne6xBTqh3LPovkCRVfLKqfHQn0HJrdN3kuUIVWzICnsW9ZO3s9L2CBxRyQJHaRW
	uiABAoiDMtJj78zT9KXRcAKznXdd3w+O09xg4AOiK+9vHU1w5D5weo4tmXcuP4zsmMN6BB+eBqx
	4PGnUArfipoBe8J5qY=
X-Received: by 2002:a05:600c:6085:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a027575983mr125492155e9.7.1791132100715;
        Sun, 04 Oct 2026 09:41:40 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07cdsm18765185f8f.10.2026.10.04.09.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:41:40 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: mfd: Document Skyworks AAT2870
Date: Sun,  4 Oct 2026 19:41:19 +0300
Message-ID: <20261004164121.193514-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004164121.193514-1-clamor95@gmail.com>
References: <20261004164121.193514-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
new file mode 100644
index 0000000000000..014678616076f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
@@ -0,0 +1,127 @@
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
+      max-brightness:
+        default: 255
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
+      "^(ldo-(a|b|c|d))$":
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

