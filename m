Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1D24AA031
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404263; cv=none; b=QG8hYnH/m1CdDhQQMAZaYOhODXDpq+0yyYduvNE32zKdQG+MVPVSu1a/tspMc77BRjyk0dWmHv8ohD12JCGIedQBmd5cz59xue7TTZAiLgHP/jleK3Ku9C5SAH/iYsezgYB2i5Kx4Sl4/8gx/YPirV0/hW9jwlco4xDrUuCNd1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404263; c=relaxed/simple;
	bh=0ir6EEm9FNQCLp9OUbkjQzJH24SRp6mnaINdn/CT2yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABu64CoXiBNPPm0ypFjbwM+l1mMojdOSkyu8r3Ta1i/4DQGjLJ3q9qxtf/Z74zDebMrbVeuXiKwA5J/VDKFmp+X3+Xf022cMEd7QlZsJHW23l3mqgvyUV0e/OeO3X8RYr9aJrW7HEg2uV4JBrnvaJVN4gRxoV+g3SlzzdCnFrMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rABZifdL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rABZifdL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so25810925e9.0
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404260; x=1793009060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=rABZifdLa7+QGoQG+sPcmcgRrz5Gg5wUX8ktsRm6gpsNYz6j8d+pDrtoIn1AbCBPMj
         bbTDYf8T3zki1HlGBViNsZiOQ8aabJf6cPuQLhfCIy2sWD8e8acRVh/HB2tA1eOpBSOT
         46WYGlVqKyZ2Zhsdr44+RrUY0x3eua+s13bLdZzm3FLZaGBl+vKIBgd9sDfyLpqwt5lY
         sf864dVMyJu5/mByQyFTtclmtTwOW/tR9DJ53ioEvGAVO2nopYubZU87T6QrCSBVkkHu
         wwFLJss/tCxIqn4Teq4kFtAUTu9O+X+WlPuqG6Efungf9wIwPpJ63Okjyih09dojf9Gl
         SGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404260; x=1793009060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=D+jBzdfaLczctxTpfOZtRdA+BOtajOgi2hTOOcQK2iyc7wxlDdW8kYwPmw/IoZPvS8
         u8/X9DcIm0ltoXDg+On1jiJbBWAL051sTD9W7C7tWFGPKuGHHMbSEXxLOcoWTbWjtTc9
         0uHLpKIehLumHLcF7g2pmbEPzwvxbIsSVDDaxkVjAsPBdNQhwKy9++uhuiVK245A+sbP
         dBu6orSmLqZhE7qIgyLKh/pd4uyy5nwqCFg8VrDPVQY8+iS4JCG/fBuktC3MzQgmGUl9
         I9MaOqonVpRzQp7rUsyRHi+lzNn/NewXgg4RVvZiQd6aTBCdLWVCVRWd2pQ7DMzI0xis
         DdCw==
X-Forwarded-Encrypted: i=1; AKwUvBx+6BkbCyaJzK/14yQ+JYJP9adzxbgX1CPOf6El00aLk8CV2KZJS7NLl5xPA3G75R8lkfk05vlIVPNo@vger.kernel.org
X-Gm-Message-State: AFq9FYKM9KvkVnMONfgPMDIm6Yq5J7mtionl2Fr/BI0SjRz++dRQbkH4
	wGup1lXdMOyu6mDFjOIj0gt9xHXRPa5Z4I3NRxjgup+jCj2v7fdn5QyH
X-Gm-Gg: AYBFou1GuKnzhobx6YBJp1KjvI6t9ewpPkpYcccF27bgLGMPjCaCKUMQE+ILJkfm48C
	yxlQSmmCpFtVb3Dunv1Obz51/OLejV8X5CC8pyRyg1RJOMF4j7IT5qyaP9dXcbzSRLc38ekRVch
	9K1VBn+1OV8NbsuUKp2WunawWSXzMVoZxdKpiawuYJf8V7keMomoCXWDfvbfdsLABrwfGOF2SLd
	EEF7zGT94fzKM/8eEzKm/3cn6uilp8UyJzgbfAgvXD+yP9rxZdxW9bew9vUyqSV8VD0EHRojEW2
	A3Pm+8cCgOOjRC+lXONKefqzvAvB88T5jV3sIEHpDKLkt40KqziKl4Vdo7SjT4Gszs647O6ib9z
	jx68rsQ45shEL3G0YZhxNxke5RGHWM009TwkOhLhh0WdMbJG0ancvAE1//ocgszDiPb/VbtfU8w
	6L+xiB5SV9/ZcBc8flJJA2jrFIydzamgsowtG9ZP6p4ADbYwIl/Hj9FLtDDDebB6+aZZ29NIQ2T
	uDcMiXrIlmwl6GwSoM=
X-Received: by 2002:a05:600c:8b28:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a1d7634d5dmr157311995e9.28.1792404259520;
        Mon, 19 Oct 2026 03:04:19 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm177811485e9.5.2026.10.19.03.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:04:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v12 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Mon, 19 Oct 2026 13:04:00 +0300
Message-ID: <20261019100406.103687-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100406.103687-1-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../asus,tf201-ec-pad.yaml                    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
new file mode 100644
index 0000000000000..60b6375864aaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,tf201-ec-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controllers attached to an I2C bus,
+  running a custom ASUS firmware, specific to the ASUS Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    description:
+      The 'pad' suffix is used for the controller within the tablet, while
+      the 'dock' suffix refers to the controller in the mobile dock keyboard.
+    oneOf:
+      - enum:
+          - asus,sl101-ec-dock
+          - asus,tf101-ec-dock
+          - asus,tf201-ec-pad
+          - asus,tf600t-ec-dock
+          - asus,tf600t-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf101g-ec-dock
+              - asus,tf201-ec-dock
+              - asus,tf300t-ec-dock
+              - asus,tf300tg-ec-dock
+              - asus,tf300tl-ec-dock
+              - asus,tf700t-ec-dock
+          - const: asus,tf101-ec-dock
+
+      - items:
+          - enum:
+              - asus,tf300t-ec-pad
+              - asus,tf300tg-ec-pad
+              - asus,tf300tl-ec-pad
+              - asus,tf700t-ec-pad
+          - const: asus,tf201-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf701t-ec-dock
+          - const: asus,tf600t-ec-dock
+
+      - items:
+          - enum:
+              - asus,p1801-t-ec-pad
+              - asus,tf701t-ec-pad
+          - const: asus,tf600t-ec-pad
+
+  reg:
+    description:
+      The ASUS Transformer EC has a main I2C address and an associated
+      DockRAM device, which provides power-related functions for the
+      embedded controller. Both addresses are required for operation.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: ec
+      - const: dockram
+
+  interrupts:
+    maxItems: 1
+
+  request-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: asus,tf600t-ec-dock
+    then:
+      required:
+        - interrupts
+        - request-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@19 {
+        compatible = "asus,tf201-ec-dock", "asus,tf101-ec-dock";
+        reg = <0x19>, <0x1b>;
+        reg-names = "ec", "dockram";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpios = <&gpio 134 GPIO_ACTIVE_LOW>;
+
+        monitored-battery = <&dock_battery>;
+      };
+    };
+...
-- 
2.53.0

