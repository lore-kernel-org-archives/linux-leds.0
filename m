Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1CF43B6DB
	for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801186; cv=none; b=MLqY8OwMOYYcu/0hU+5zoqD33S2x6PBb75rcgN5FNZAc0GIlcteCOSFh/gF3l80OTkDIu2muA5QQkq7wHry/JRgMbmrozRm5b9hRvoSNgU5Lx4VuWIukH+3px9B55x43PT0iY+QQphd+GeGZKqUkneXYJkLovN1d4xmETTI9zSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801186; c=relaxed/simple;
	bh=L40lap8bnY8cNJW9mxIUGL/vmblDYxgqq3QuCHt2Y+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHOsnPPf3O9YSS2NikMWnHZygyYNm3ysV6FNW7UrZ+631uUEJRw7xg0KHPIK6A4k6noS38fAjuQMHUIWfh+nJ2i/iat/0Sq1kyIw6wm4qK7GZBJIVfTws3y3qrOyPzNGxPJFAd/4ssp071BUqd81xxktXUtSUC2wvq7P2p+N3/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+ZKRlnm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+ZKRlnm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so302315f8f.2
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784801182; x=1785405982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ux9hmvQYpNrioGxp+5tKSBKeWP1obZYcrlrpcPAFDf0=;
        b=Z+ZKRlnmJ046HFQN79JnAs2JgGg4N9481AI19MZJPCn+GAHynG0mgrDa8ACPxOGeGp
         7YYFxXYNGL27cVIVWw4+mIT/3GBcnEIhVp+2b0wZnFxXC3HYodwjK1fkrJbmgWCZxnOa
         ChMwbpIaL7XWqCG6jgEu+p9iaL3qAHLKzr1ezBSwP8VqSU7SCUwaSDENOURD2gfD6IEE
         IfAOOIY9JHOCIhVNNz0LnJ9gzHSbYR80O7OvyBL4afnE/dpA5lc+5GcSa1PFiFSysMJk
         b1dFUn5OXUT65CGfW/zxF8Mxc/+1McDQS8uQqeV323tqS52N1EI2oZdtXDy57t247KB/
         UbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801182; x=1785405982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ux9hmvQYpNrioGxp+5tKSBKeWP1obZYcrlrpcPAFDf0=;
        b=BKh/qmnk/R0U5PWgYbIDy9dTz7RH/5VVNi+/N/XmP/Ssk4V+lIsKoXe9fFy+CjVQ64
         fewpxp7SDGcD48SvN5oQIUJi6He03Z0b1RCAr3Y4+/+wkQYMGzFxh7eNYjSUyAaTQdoz
         GtlGhbOOn6f7DVCr4M9ny71WFzqI9pBhfMbKN26s9dOHfG4Dm9I1xL5Ream9n5o+WAWl
         aPbrEJ4yi3FYVlfleACZqzgkyGIjBkw7MK+cD/0hs3Kh3FWx/Iun7u8hWNELMR2sr6d1
         mqdHuoZcsYjSliyFM7+J6Yq7VbOh0TDwO8oB5z0TO8xYUba4SYtmo23+TXE+S3y41Lqs
         sw1w==
X-Forwarded-Encrypted: i=1; AHgh+RrQsIioI80lz8SfFbVOVwfpuaqIAObrNhgXpYDbV7jdZ6OcJpLTfJ8Go0yqgjV+fJo5XhIseKYWCXO8@vger.kernel.org
X-Gm-Message-State: AOJu0YzIXs1Uc7Sh6Fvz1QyREoWXpmDuDTNZiY4cA5YIIyQEY9Qn8iYS
	ncooJGVON6yvgRC9Q0GsjqYZNtWmoisL+1nvkcIdijHYm9WOHarGy+NJ
X-Gm-Gg: AR+sD10ATI0sTY1bme2tul2+Yhm4KNO4NIbCIBTFREl6Vr3h4YDEbzS7R6K29LpDeLD
	DbNjfAylgRtmBShfSPi+NWHYLJGGttTJtV39Es2/3BGzjJpzWfyank9K4JQu35rJe7MFhZ3iPrW
	KquyCWl5xHJSmQ503mdZdOCmOrgdw8ZF1j9zYPnjdi6mI61J3skhtLJp1oFj5vqCGaHeM82BM6k
	IBsTDbkmX2JqTargBi1jKPtBz0oAP0XJwCPGdt7CSZNrqryIN3Qqfpmkp+J657/CsXN5dqKNP1b
	wT0IpF6o9uZA/1iwH4iFtj7Hrlxawj7tVmydd4v2lohY5oCyjeCBNq2OTq5JHsX9VqEy5tIzjYF
	wSeMuKisc1jJhNOSq3jzetaQMrd1qFTuk0q9yzaDkl80NYP0jau7DFWCRMeyYf8fYTmvTHMubTU
	7BveOlbK9v8JSoDRHi53VE1tQSlmdwG3K+D4GFHbWVTDAMeX0WhVBkH1A=
X-Received: by 2002:a05:6000:4704:b0:46a:8fab:eb44 with SMTP id ffacd0b85a97d-47f8d710897mr2842693f8f.1.1784801182450;
        Thu, 23 Jul 2026 03:06:22 -0700 (PDT)
Received: from localhost.localdomain ([86.126.27.145])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85b9a60asm14212163f8f.3.2026.07.23.03.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:06:22 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eduard Bostina <egbostina@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Mark Jackson <mpfj@newflow.co.uk>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 3/4] dt-bindings: input: Convert TI TPS65217 power button to DT schema
Date: Thu, 23 Jul 2026 10:06:01 +0000
Message-ID: <20260723100605.628882-4-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723100605.628882-1-egbostina@gmail.com>
References: <20260723100605.628882-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments TPS65217 and TPS65218 Power Button
bindings to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/input/ti,tps65217-pwrbutton.yaml | 42 +++++++++++++++++++
 .../bindings/input/tps65218-pwrbutton.txt     | 30 -------------
 2 files changed, 42 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ti,tps65217-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/tps65218-pwrbutton.txt

diff --git a/Documentation/devicetree/bindings/input/ti,tps65217-pwrbutton.yaml b/Documentation/devicetree/bindings/input/ti,tps65217-pwrbutton.yaml
new file mode 100644
index 000000000000..3526d8b045fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ti,tps65217-pwrbutton.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/ti,tps65217-pwrbutton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TPS65217 and TPS65218 Power Button
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  This module is part of the TPS65217/TPS65218 PMIC. It provides a simple
+  power button event via an interrupt.
+
+properties:
+  compatible:
+    enum:
+      - ti,tps65217-pwrbutton
+      - ti,tps65218-pwrbutton
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-button {
+            compatible = "ti,tps65218-pwrbutton";
+            interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/tps65218-pwrbutton.txt b/Documentation/devicetree/bindings/input/tps65218-pwrbutton.txt
deleted file mode 100644
index 8682ab6d4a50..000000000000
--- a/Documentation/devicetree/bindings/input/tps65218-pwrbutton.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Texas Instruments TPS65217 and TPS65218 power button
-
-This module is part of the TPS65217/TPS65218. For more details about the whole
-TPS65217 chip see Documentation/devicetree/bindings/regulator/tps65217.txt.
-
-This driver provides a simple power button event via an Interrupt.
-
-Required properties:
-- compatible: should be "ti,tps65217-pwrbutton" or "ti,tps65218-pwrbutton"
-
-Required properties:
-- interrupts: should be one of the following
-   - <2>: For controllers compatible with tps65217
-   - <3 IRQ_TYPE_EDGE_BOTH>: For controllers compatible with tps65218
-
-Examples:
-
-&tps {
-	tps65217-pwrbutton {
-		compatible = "ti,tps65217-pwrbutton";
-		interrupts = <2>;
-	};
-};
-
-&tps {
-	power-button {
-		compatible = "ti,tps65218-pwrbutton";
-		interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
-	};
-};
-- 
2.43.0

