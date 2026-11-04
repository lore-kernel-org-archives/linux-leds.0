Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795188;
	b=4JF/IRJ5fgaIZYIbV0BQ4Q1go3tXzgaS4msjj160vCd+RBvTFK37fjAONFwRaM/GShga
	 G6D6miJ0Bossb/Gg7s7b6TzUYK1bkhC3pyWzEcOZLZlo56/DGhPzBFD4IYJ0H2u7Zmgv8
	 ZOoHcpFykOVElMYRR7EySE8y3bDC9raPZUBVArNKX52TCGsbRSL6AubaoL41waAWYym/v
	 0wOr+QgxWQdaH0BIc6n4ZV+yydECP+nKHRPhZt1n7bFI4zmbwexDgvLD03B/QAZpx1782
	 bgVBSNjlvWA8IG6LpGzhZV8zBwj0xDSE7uD0PA95np4kE5l9qDu9lvzwR55bTLubS2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
	b=bP+lMuGHjFYJXRnEaDIJnAjKMjm0XXbJqkcrJQmOgkCVe0v7oTwgDk6J+wSJash9GGTd
	 EiTMc0pgqecy7FdbTExcnEDbd/P5zVPNnsAolb9V7oIbJRS6yo8MDaGLqnC26pTAPQzID
	 lSRW/4eWaS+aP9VU5qkjtEtZt7nohyo0542X3cRGa5g3IGj92sZJ9+LT9IN+OXuIpkK90
	 5EIgmKWV86elhyv6bAZO+kX/JLtvBVv6GZp4U76Czd/CO+apiKw8+81wG/65q7LGi+WfJ
	 754K5TytXxy7GBlLrwbzzaFys4L1W6R9CdqytPq+ySybNy0BXEF9KN33wbmUStI5EFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqxTgXZC;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A07B606D80F
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 12:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A07B606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqxTgXZC
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so3758395e9.3
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 04:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795186; x=1794399986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=zqxTgXZCedl88xAPuNpOKy5fkDuI/WY5HEZHcMrLocsOyvu65KxpiKziAlKb5ah9B1
         yCl288vMVkvMdiPl5/3Vui4txDSN1utH1vfyc20VNcH/IWtCoFQIjxg/mozXyD4ZhAUs
         Ac8bgLWYI9wAwDxNzSLAtJjWYxxRByaEWfNF/23IFcyXQ2pCnNy/N6B2dE0A4Q8Fa89C
         hBSxJY/4RN5a22kyLdZf4HkmUM9EfC9uu4b9PdkPZ7o0EIvsezP3JiDCy3ccXu6pqYG7
         qCXsNU5nf2+jLQP4XxE8fNz4dp3tGW8L+d+0qRj4W/3AT/+tHGAZOz72gv0JUCErPrqA
         Ehkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795186; x=1794399986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=Bn3CzeT5n7y+P4CJIoqptg5aLxvXN3Ms2V88lGDUAdLzIUVOjfww0993aIo0Ubu+X8
         tKdbgP9+DW3w/Z69ERZ/IeRxgErrICUIiob0LrJ59gTfza/g1s1djF/KZYjFeR2AolCD
         Px0isisF7nnr5kke2w08cVFB+tHayZ0Wgt2h+FZCGcyvsol0iyEtJ22q/bLyElIwX4Kg
         ZVx7j37U5SMyJvKwswvh4HjO00/1ByZ2KWrRNoXAyc5U+sIRpo3r2P04+oZOWbtSC+g1
         XZqNWajP5u6s+s4lLYcgj5MzjDdL67uhHMbuz0aBgygDhQudmj5O7a5w5JXvRypLFyEI
         7pBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdWW3jbLXz7odjnKBXx7+w3XzhbpuGfpTdJxVrqy0wIwEGZpqkuczrp/c4nr+lJpZZnM3DC4uq2cK8@vger.kernel.org
X-Gm-Message-State: APuU4Z/vMSuVxGOLesaFnXxVlU3YwefvayatBJISCrFn9JbPaeSEp8U8
	5qMhYHu3AQ67Ryknxy15SpnVdO0dPjZwMIbCbQk3FYRYZ+u+jpahl1cI
X-Gm-Gg: AYBFou3zWPFUfVHMaXG6RzHGrePyPLC9Yq37H9SzjQ3cwAWJ5LI+0+3Hp4UBeVUbba5
	nqItILVyVxUU/2c47nhnOisV8L9C3nEmlRXwBPXejTG19pyXnokF4BM6I/Wx9TvJG7ApMQxm5lA
	oLrtcsOdhp/1RAVYPDteMYT/YiunpcOOITUUXn38AY1x85ZZZ73TOP8qbD/p64uOtOYZCT65yUD
	iXt1h69GQmFIFH3TEempjopMIu2URV0nPqNkBBa7zASvL8j0zl30iTEnmwhD7OLMXEZNN9ayzLj
	eyNhQELnY4FVH9nwsZe5DilAutZbXnRrZS/g4uIzTaF//vFcRTcLtCJZfh6OOC/AQH+2Krr2lbh
	464e4Kdq54PURPDnyqQJPfsA+i7ETjKasZ5jXAqsOEbkpxodZ5PN93urnmQU5bB4O2jS1PdiDLP
	4GmpQ/kExnIji7o9hyHjimlZJCeQvrmshu4JMXNRoJzPEnh3ATsOi0l6cMbDJquQ7vTNUBY6I9C
	VomzAVl1OeVxw3UcVrLaGYtbqGGDxXycU/Eb1O6oaKD2RK9HIkS+xKBXUZtiBYkxFQZn/rrtGgx
	1oNn9jk4UyOSmblmm2obJHyYLxC0m/vokwUcahukP2XzGr0aDA==
X-Received: by 2002:a05:600c:698d:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4ac185bd1e2mr362326075e9.16.1793795186366;
        Wed, 04 Nov 2026 04:26:26 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43da9825bsm50492415e9.15.2026.11.04.04.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:26:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v13 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Wed,  4 Nov 2026 14:26:00 +0200
Message-ID: <20261104122606.215629-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104122606.215629-1-clamor95@gmail.com>
References: <20261104122606.215629-1-clamor95@gmail.com>
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

