Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A979B3E2772
	for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098383; cv=none; b=cpzwXcSDSKc1ZdoAWekvvUG5mfW+4L3UsrWpuLKs05MBpa9PvmVZX3HCl2HZxHnEk5ox3zxwEm2vyzMhZHhDmi/1hhD+hH6ObQ7cPg7IzuLERBu/sY5vbiWu6WYzd1RhE/rf3wT3Lt3ZtivOO0IYfs5UOHtOahXeqFUKIqAQhCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098383; c=relaxed/simple;
	bh=or+EJ07SOsHtoyrRm94X5M8kiBqJd626zfaT/m/MjG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=COyKXFd3gxTJOSzVS6p0x8dyQvk7KjhHylr/DXvYTBPpIn1xXk8o2JZzFAynpQ8SQeMTFEtNmmJM6X9b9lcdVRlLPTLdNiTjwgl3ai0wAfmAi634fWHWywNeiw7VIBACAK/2zCvSkBZpsqJVmcrmnFccR51CS7aP9FjDB17S00k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhHlK+PN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhHlK+PN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso16412245e9.2
        for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779098375; x=1779703175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuxBA1Jnwii0AQo0AYAcpS9dZCQZKs+YbA2PPOQhDTM=;
        b=MhHlK+PNKlu/c34xaAOmHYeAhOebNMkpHJQtL2f4SKgGigePk/5RE/Qvhzjs7lRJZi
         VMecwnoXqipnrp7G5nKmNz5lWksaYfqybUWvLUBThrkwAgjxUkZCf9eewGLRciqnw7RO
         1DgJ63ygH4zpTpHpzgTuhZC35LzhCqzqVBxcystfJuyBPzUuDVUsa5KllFvX9SFtjyyy
         mjCOZ7VnTfFlvKZf7Atj+gfkhsx75GztCoVozOyfNY4dCXhDJ/yTNLNPk9eBGX2x7jlh
         DlQh8nOrnYVscQwMfuSlbAuyjMrPEB3w5VrSVtZu6gTn04ieUw59sD3XblsvoFPaguSL
         53gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779098375; x=1779703175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CuxBA1Jnwii0AQo0AYAcpS9dZCQZKs+YbA2PPOQhDTM=;
        b=kXBxIgzKKHtCIRfmoL04+dzQfeRiqn2kyIwaHBkXIVYpPX4Nid5F69ScSpGyOVQp54
         8ORPv4ejbxyxLAe3uIjnHUxmZ3nx+Zr4M/47gdQN1yF98vyIQ6rm98bgvkZCpQfwvVW/
         LG4oOuCWRvvEs46+w+BS2vLUK92kb8TtyIV90SIbTY9kG1SFHTYobiiZ3Cbj8RsNJeRN
         JAzY8AN9fxtTyvIzR+ZV4j0eEd9MJ7NEeX6i8uh85tFMoAAinXmiR0Q5EkpUDxxkpfKX
         Xd8loFPovGZV2MnjNxxpLAAaZFocxUY3h3Po4ZEhrBGNdfaB5l1gSYs802Y19AE5Gq7F
         U1Zg==
X-Forwarded-Encrypted: i=1; AFNElJ81GiL9qvJL5nlA0hUwpcwexTz2KgDWW4Am4w8Df79M6CXSir+NqABhL2fHuN7owBh5YeJdxS+qSiSY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+NyO2Q6lJFrV6knwUzSFCU7uzK1aiHnTHXHoiXkrygxg+FDf
	BTyXQ+gitqAMF/yeVQ7pWPSvSHGdq14wGAcYm7Elr42KvChyJwixdCfI
X-Gm-Gg: Acq92OGd5mmyXYs8Y4SYMfQH15bDGdCkPuyqhAbwm1vny8e2MqaSlNhJY2MrPiZYuuW
	DlKlAXYOSS0Cm4P5DH2zF9Cr7ZNCf+yc/riXXSnP2pyDtegnM8a4lxjE11v8teS9l3+RXRuVaok
	r08fUHzUBTvr631Rh2rkJi+7/8sJgCbvmmqgo4aKNQ975I6H7vuuqEjMhQlXeUGLzSpgoGtv9x5
	m4rAr9ygPNH8YMTFUxlRD9DdWS/COYueEdAc6pNUaRG/sSZR7MsmSrdYfxNpOoDtoptQSbmM18c
	TcMZQVxoG+FVz7tNB2+rgwt5OV4EqRQwct+ghelhWP++j4u8bV57hE/WWrW0EbXFfUd/gLi/knf
	GLJ6fE1Ai3sjyJQMuwYa9nFzqF163giWfLnCjho/4ixTu+W8/L2t40DGen7l9z37FtfucSagYSB
	8pI1E6qwsZy7dOaWDZ6sLQe10=
X-Received: by 2002:a05:600c:630a:b0:48f:e249:4094 with SMTP id 5b1f17b1804b1-48fe632663emr252629925e9.18.1779098374859;
        Mon, 18 May 2026 02:59:34 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm102995005e9.7.2026.05.18.02.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:59:34 -0700 (PDT)
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
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v7 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Mon, 18 May 2026 12:59:01 +0300
Message-ID: <20260518095907.36158-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260518095907.36158-1-clamor95@gmail.com>
References: <20260518095907.36158-1-clamor95@gmail.com>
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
index 000000000000..60b6375864aa
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
2.51.0

