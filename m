Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22765492E2B
	for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588620; cv=none; b=m4a+YNXFEAHn5Dv6zwCkbkdN/If/8ckV2SraobV24s6IybJCpNBxFJ1zn+49NtFs0PlT39WRFk8ymlWNSTcYDw8DJ/2iUbF3HLyUnBndNd4JfHV+KVMoRTaPDPETynsVnxVXykQUkQmLm89CSdfgmq+nw41T/vwA4CQVWnIIbAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588620; c=relaxed/simple;
	bh=fNTKonUy0/FAhs8my66xZF7DW3W7vEBYzduyDViRLv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCZQGcEKHz1I4CD3HCOfmdKLiOOrl/2pzS+0F+Nzxj8ckPt/Bmj7rJYX4VLY9MFVVTXZNbf0/cnERlWtaHfIOFacjQTPrjA7mA+OODMJ2jbTbVbP9h9mm+Pf+VtV3dg+UAcbS41zPhWvDn02ezNWXqY9uAHBffgYno78Fumrf9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrPtMj0X; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrPtMj0X"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffe817151so8108325e9.0
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588617; x=1791193417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=elEzk/snbsv6yNIQrza//d+cx8Ge2QxQ0RhCb2xVBrc=;
        b=RrPtMj0XUH775GnjDf6ILQGuJUsLCd3ewrbjz2ZqB+jpEVMF+QvhkCGjLzVdW0S9iZ
         ulsyUGaslbx+rMVzpr32tRJ9SWP4GsZRwCvQyIFGQSQV4+Pmo/QINIFvK4DPi5O7Qgln
         y9gBJTYNXpDwfjn/9evLZVsSDBysvsIUUYk8NcYzJXt1ET6E7pdOSnP/QdI0FS5THtFz
         ZmezKFXx2PGl5gI6s/k5XDaKZnD8zBES7BKdBYXUFmHFJS0rxPbecPRMLnRo17i4R/2E
         rMTzNEdlXMKaEhXPTpc1HrSixU4zy257maUNCwD3jtGLyvbUhmA1Hla6+K0s35+u8P9m
         8JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588617; x=1791193417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=elEzk/snbsv6yNIQrza//d+cx8Ge2QxQ0RhCb2xVBrc=;
        b=EtGlN0VbjKQwzuZSyTxEDbQx2YuPq40pWhvG7WLPm/k8P3T1Yq8fz+Z0GuxHzHB3tU
         I4LaKFu8zRcYSOj5yrAgOwT5m1kFz/ppBxOVK5N1VBJaPSGNdqBEzVSZSUGjU0rTQG4i
         N/1Z2Lmw3Gc03+O7yuSdiOmsIvT67xOPla+Ie1Y7TKGSCFbvmdFupJcVSE/YcFn60JbU
         NF0YzaXWjo1l0d+exjrVs1XuqDoYfN2bKoWpmqGZ2U3jHhg61ABAjptfwDtVyd0w+D/x
         FpJdNcacQ0dItYTjTf6BWr8A8b9gHEr/wQnLhfvSOBodUkIWCQOLL1d9Vxqh13QBHbRk
         ULig==
X-Forwarded-Encrypted: i=1; AKwUvBz29Hj5mKcElUvjlgPKiK3Hc+meptigKbN5jMj1W2MMuuk/0wz3UHDe5bDeJdNck0S5EjKcXv3SNsju@vger.kernel.org
X-Gm-Message-State: AFuF++lBWIG+MLB13yBewLw1gkrsiqYGKBfpDTlQ8bP5QsFR/qz10UzE
	wyE4RovxwQ+V81Wkn2mj+JOe/EYUqotiUnZQ1e5KSos3cZeNmbGIWXiS
X-Gm-Gg: AYBFou3UPptQqodemWnWJvHwlcGD8Tb/UwamrUHBAxvr1zj/HdqE5yL0FuOTWR1NNwg
	Uw0aBAJA01a9atIX/BC/Ya3xpfgc4xczS5CFPJ7/b3sSABwUDihBTPwLcT/QuO0VEDK4bDLq3v8
	1LzIkGwvZzk7sev/yREsCrVz0W0Ytq3qvQ70dHfyPExiDJM48DPqwTF5WRB5CsywvDfkI/xWSHb
	UhSSgKHLG9O73B3SIRn3LSxX7AoQcOPX19FJU/iKEfbXmg1WgebpxWvxdH/cTfUUBJ/ImzAAojk
	YOeVhJYIoKTEdYYkoudw71S3U6BNDbARq/tc6Zjk1SD6UjKJhw7vZs10oeBCMRtPcUJkFUFZEAx
	N4RTAISqRnU2+/ckxpEAlj47bFY2aa6ONfx2BHrJGCVXnjCsn09jvMwxLOlgFWuX2HNGxJbCUAi
	A34Mi0umInHUNcaEbCRV4m6MD/P0cTWcYgO9FLf2U27WtupUydPQl2avRMxUPX7wGDd1hWubZLR
	kNlvDF4xTHEniT50E2Mp/rCgrNmstR4CpYrD8Vf8FC3
X-Received: by 2002:a05:600c:4ec7:b0:49f:ff6b:bc82 with SMTP id 5b1f17b1804b1-49fff6bc143mr74538605e9.20.1790588617153;
        Mon, 28 Sep 2026 02:43:37 -0700 (PDT)
Received: from rillian-arch.home ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0019057cfsm169401315e9.11.2026.09.28.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:43:36 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rillian Grant <rillian.grant@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: leds: Document TI LM3643 dual LED flash driver
Date: Mon, 28 Sep 2026 10:42:34 +0100
Message-ID: <20260928094302.86966-2-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928094302.86966-1-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
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
 .../devicetree/bindings/leds/ti,lm3643.yaml   | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3643.yaml b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
new file mode 100644
index 000000000000..c212f2345d92
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
@@ -0,0 +1,129 @@
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
+      - flash-max-microamp
+      - led-max-microamp
+      - flash-max-timeout-us
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

