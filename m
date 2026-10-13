Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9515E52F28A
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914990; cv=none; b=n2YstXkETulDa9iiqFKOM/ew5l9Tp6BYsaAtbygySrcnUx2Qms64dMgk3zfWtGmk1+iEdAGqlJJS3zNJpsR5CBLqVEZCHqgD8jlaxqqARBl5qndoJ7sY/FyosWj4jPlwoB480aGMaxBlPejGn+e9n4sUIzv0VaWqyM3k5W+FtA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914990; c=relaxed/simple;
	bh=c8FdsNzX/r+VvGI8eA88a3FNv7vM9GF+GuD03DVxxgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KvGkLUmdio4lfies2y+31K9FUoXCwktbxcWYfpdXbXtLduIdjiPNx39ZkENRzY+Hg2ot8Xxz7e7L282Exvd3HUGEsSuFw66jlaPyq2L0Bj3f01Y/1AVZxeONUQEE+I8WbISRMog5wjOqMFT9lcJoY//GAalCZlvITk0Eqxl7tpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIh7wYZ0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIh7wYZ0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b02a2359aso3084856f8f.0
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 11:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914987; x=1792519787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz+S9WWYS0rGAJFtNukpledNMiYQuQWNPssN/kQCQUY=;
        b=UIh7wYZ0oXXw3g5+6CWkbN2loXAB/48LQ3uDJnvgjng6QC7/TaaYQ81cBpSb2i+y4L
         oMO3N1W6pu6SqhAca+eeYJkMwIwJxkkywR//KNXlxRJpsSkrmq8qKwn2Q8UC2994sfQc
         sADzpC2rRiOg6uMuOJvRlBPTgrD+JtW27ool5YO6uXVJJ5zFo7L1Orrc7RgUDcz8dvdr
         S9yjrIjOB/lqV3mu704+PgGdnfKJNtKxBj+dHFUnE9TyrO+1NZasDt59VuvaPdY+zHxO
         Lmmnpd4dD8f6kqtN2ekYjAb/+TN1mntIaS3F3w/HF8o+lnvnFonbnqtGoj3kfRrCako6
         UtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914987; x=1792519787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tz+S9WWYS0rGAJFtNukpledNMiYQuQWNPssN/kQCQUY=;
        b=rT1UfDRQwovBg8+yIxkqectDgELGlI0VOqjdTV9QM7nayzCgTP+sY+gVn3I8Zs7/i7
         YBAUq0otuBitZWg0fLgHpjhPyV02qPcpvqT+M82ZgpaYXWL9QOWbF/zFfTTTPz96Acow
         lOZebtor094tEuk1t0QUbT6ar7VsJCwv4QtNei7qE5oCpfLlfRrKdfjypG26Vc0RDZMi
         RteBB2s6XXErJHahNd0g+OJERZ0ba5YkLuMDVJ2HBss2Xo3k5P+eJddtSEKJ9Ny7JwZw
         qklmDVD68sxEcmLdm56ltnXr8sJ1lQkv5G9+EpDDjktI3/fUCU+9XuuYY1K+6clBLjpq
         gH1w==
X-Gm-Message-State: AFq9FYICCdAgKFK/cJpalfIkbGJNheUdkoAtU6QsQcJglSd5TwTfZTZS
	V4pFjYVLqOy7BPKD5CE4qFU9ckdQGBGFghR30ucTdSgMTnFXxowksPvU
X-Gm-Gg: AYBFou2JW7UcVyplhShqQnO57kFCBR9q0wOFy3AI61a4fji6k+pbasShiuXAjwvIs/v
	AZLOjFuVND7DLyQi6sKyts3O9/CsPM1dwldYVEICZTYv0dt3ixrdrqnZTUif8hAcYBBZs3Z/BpS
	nPDpnNAYkMu1eXwEnsIQb4uxrjOuK6QNCHdKUtlSGz6DzmP0lJ/Kp3GfOQ2IruZBgdTyr1jkUYK
	jp5y0i2A2G1D0aiI4h4TSD/aAKOzfGvCTN/g9Dt1nGWRIy/uiMn6qVBwplotVvjHUyD6WiJO6Hc
	ePhKAowQwDMZtVvusV7cn90Ks/9pW4Co3VRYjtZK5wIClyC76oudDFMUFJWOIJQc0HfFJg42kFZ
	67oazlEUe6ENpC7YlUBaxcWudAI9+C6jTU1EPMya4piq3ATplGkmkTkX84Y8GILmYl/TECW6mg4
	nPOdUPLIqdtDdUadotjT2sXvuBwPTEx97S7/qFB1jPY7PbCbxcjckJOEwHuH76OtX7VsUKbohkW
	qBdb5nUEaTHVR4s7GU=
X-Received: by 2002:a5d:6a0e:0:b0:48c:6566:9ec5 with SMTP id ffacd0b85a97d-48dbacdeef4mr20658640f8f.16.1791914986751;
        Tue, 13 Oct 2026 11:09:46 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6854498f8f.14.2026.10.13.11.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:09:46 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Date: Tue, 13 Oct 2026 21:09:30 +0300
Message-ID: <20261013180933.487013-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180933.487013-1-clamor95@gmail.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
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

