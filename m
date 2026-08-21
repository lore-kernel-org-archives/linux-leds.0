Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23437490C13
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315859; cv=none; b=XRRvhDbV1r/DRjtLxiiE/u547qhWdyU89FlH+oXs/7BS4nOFgpio7iJR+5xoscsujcRS5awTUvBbz+Eu1G/JqQ4Dj4f94rGW3LCzxqSZgX/w2XUGH3oTD18ptN5XH7BeZ0A51lVABrcvbK/m1qpqnMXd5btK9nKd4u2PIZ9Gw8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315859; c=relaxed/simple;
	bh=fd/UT7AxPRQvjkXClDym0Mq1d/+IXDaxoIQ4lUKy8qE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kv0CCrLrRmE5qAhRjI4pGp7Kysn9L3+0FZs8Btw4X6ZMvXFm9HtzpNmjKhiY9fOiXGkNBY+Y2K6uXEHdVVwz9giJQ7A8TB/5tXsw8cF6bMJknGfwF0/516t0Leosd1spkJhYCRt9mISzFtyJirrGaG9zEP7qs5Y9K/kufgzpsNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rps2IpGD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rps2IpGD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cedda2ce6fso5523075ad.1
        for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315854; x=1787920654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPMLvuSyJKeKr15QpRC8H8+tqS38ya8JdOW5OZvk7k=;
        b=rps2IpGDSLOhg3xBYaYV5XEVw6dtYCb3vqAix2ensjv7WvMoq3L4+qYguzt0CYsA2K
         1HatvHHMrlo7I3Q0TkCAWej9dPLpf5EwGUXu/zcZ+SvBo/LOZw3UhYLaGH43qCbj8xdX
         jTEfh1IR+Fs/YYVJwh1TqTNMHs1jQa99dhLYUtiv5M3YvA2pgE4jAR5EynISPwhc7qtu
         GSPVUCl0duF97h5uNJvRFB9/DyTN/I1EvqNkEl+CDc6kNoX5o+/sCnMmcjZ3jxNSCKc6
         XGEAGp3pCNfabbxLhxTyZ0vxK5uc64g1Ew4+dz95hJAzJrJzXjeuawzy/iQVBSneSLeb
         qUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315854; x=1787920654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPMLvuSyJKeKr15QpRC8H8+tqS38ya8JdOW5OZvk7k=;
        b=U+Q6SEVrVcYMFeQejFVhMSilShamaMkKChXl10NGKSKiLw++8NeGxo3FCqOdWsrPf/
         q23ttjMH293bblB4R7I3Z+KenbItEjJ1n72SgCiBJ4xyiWiLu3XTYTZ6kMQIkHyK8Ns+
         B8aIVr2sEmiN6Q9hHumpgHUNFyT4qTkPbpZVC+p2OHhoSl1aMmTdTo4e77c2K+y/H91I
         UIVW89KEC4Ws+mN7N/QRKjS+2OjnCD1W1MN2pkcqdlNpDDlg/Wv1/HuzC5kIWtShHKRe
         36vB6CRstUHnQpzxbm6KaEIi87opwR9MC0U5mZgFKEjgWTy/tWWGCFkFm7RVx/lT97AG
         qYcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr425EMxH1s52eFs9q67e992t5wZeC6ODcUqxYlweNY6wX5l2duP4JRmLJi1cHYPsPLFUI9x9UZ0ExI@vger.kernel.org
X-Gm-Message-State: AFuF++mjPHm1xCAfjs035Jg40n8s7ll0enke/U3kqnqgR43hWf4g+PMy
	hucbH6S4y4YRv7X36H97byPPMxLFvvZ8CPWm9g5mMIowIPfJ+R9V9pjx
X-Gm-Gg: AR+sD13uOUyN8VFr2rms9NAsWSlA4++P7c3r735taBtCKI8ZFBR6AckIBbWYtOWru1Q
	rlPYCbo4dXTUIOY2LzrlBI897PDRYkEKzjb7gRbBXGT03+nqpvRpjh0X/eKBnH4yfRYZqOFtAMW
	cCJREI11pWKwnG6KXdRgCoXDqllaEkXwu5ghyWn3njXN+I+N2wPfJHEm6ANw+uSwA2aw6CaLujP
	TY7Z9TybtTdw8GrwjASJpkjDox7I+dwBFPrAbqSRjl+2JHgxx7k54aD7XpQnl6t/QiwDKLt14HC
	5Ige4epeXbzA2EPEa4lSE0ZTkrymhfHolWh6oaT0LOPbHks5nAIldLHAQ7P0wKrHS4znA7d5XaE
	nELHBFxP0sJ2jdGTc/57LrDzaKusuDDUl8DcmykBeNSxYIZ5I94OyuJ+4DyAm7xHqZL9V2veeRa
	TxebekOYmFn6ZUKHEQhcPt5K+k1XpGpquzv6xGxaPu8Ht6UaV3pVBwbpQJuQ14kaOFnJLtxZPYm
	GI6x7jw0tg=
X-Received: by 2002:a17:902:ce08:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d64afe9569mr119484575ad.10.1787315854187;
        Fri, 21 Aug 2026 05:37:34 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2401:4900:7fb9:38e6:333a:f3ce:ece1:4458])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d588035sm18057615ad.23.2026.08.21.05.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:37:33 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v2] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
Date: Fri, 21 Aug 2026 18:07:23 +0530
Message-Id: <20260821123723.198286-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,netxbig-leds devicetree binding from legacy
text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:

Changes since v1:
- Use pattenProperties for LED child nodes instead of additionalProperties
- Explicitly list the two optional properties supported by the binding
- Place the top-level required block after child-node definition

Link to v1:https://lore.kernel.org/all/20260820150223.108374-1-challauday369@gmail.com/
---
 .../bindings/leds/lacie,netxbig-leds.yaml     | 144 ++++++++++++++++++
 .../devicetree/bindings/leds/leds-netxbig.txt |  92 -----------
 2 files changed, 144 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
new file mode 100644
index 000000000000..02759ecb32d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,netxbig-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LaCie/Seagate netxbig CPLD LEDs
+
+maintainers:
+  - Simon Guinot <simon.guinot@sequanux.org>
+
+description: |
+  Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seagate
+  boards (Example: 2Big/5Big Network v2, 2Big NAS).
+
+properties:
+  compatible:
+    const: lacie,netxbig-leds
+
+  gpio-ext:
+    description: Phandle for the gpio-ext bus.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  timers:
+    description: |
+      Timer array. Each timer entry is represented by three integers:
+      Mode (gpio-ext bus), delay_on and delay_off.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+patternProperties:
+  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      label:
+        description: |
+          Name for this LED. If omitted, the label is taken from the node name.
+        $ref: /schemas/types.yaml#/definitions/string
+
+      mode-addr:
+        description: Mode register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      mode-val:
+        description: |
+          Mode to value mapping. Each entry is represented by two integers:
+          a mode and the corresponding value on the gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      bright-addr:
+        description: Brightness register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      max-brightness:
+        description: Maximum brightness value.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      linux,default-trigger:
+        description: Trigger assigned to the LED.
+        $ref: /schemas/types.yaml#/definitions/string
+
+    required:
+      - mode-addr
+      - mode-val
+      - bright-addr
+      - max-brightness
+
+required:
+  - compatible
+  - gpio-ext
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-netxbig.h>
+
+    netxbig-leds {
+        compatible = "lacie,netxbig-leds";
+
+        gpio-ext = <&netxbig_gpio_ext>;
+
+        timers = <NETXBIG_LED_TIMER1 500 500
+                  NETXBIG_LED_TIMER2 500 1000>;
+
+        blue-power {
+            label = "netxbig:blue:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 1
+                        NETXBIG_LED_TIMER1 3
+                        NETXBIG_LED_TIMER2 7>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        red-power {
+            label = "netxbig:red:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        blue-sata0 {
+            label = "netxbig:blue:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        red-sata0 {
+            label = "netxbig:red:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        blue-sata1 {
+            label = "netxbig:blue:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        red-sata1 {
+            label = "netxbig:red:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/leds/leds-netxbig.txt b/Documentation/devicetree/bindings/leds/leds-netxbig.txt
deleted file mode 100644
index 5ef92a26d768..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-netxbig.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seagate
-boards (Example: 2Big/5Big Network v2, 2Big NAS).
-
-Required properties:
-- compatible: "lacie,netxbig-leds".
-- gpio-ext: Phandle for the gpio-ext bus.
-
-Optional properties:
-- timers: Timer array. Each timer entry is represented by three integers:
-  Mode (gpio-ext bus), delay_on and delay_off.
-
-Each LED is represented as a sub-node of the netxbig-leds device.
-
-Required sub-node properties:
-- mode-addr: Mode register address on gpio-ext bus.
-- mode-val: Mode to value mapping. Each entry is represented by two integers:
-  A mode and the corresponding value on the gpio-ext bus.
-- bright-addr: Brightness register address on gpio-ext bus.
-- max-brightness: Maximum brightness value.
-
-Optional sub-node properties:
-- label: Name for this LED. If omitted, the label is taken from the node name.
-- linux,default-trigger: Trigger assigned to the LED.
-
-Example:
-
-netxbig-leds {
-	compatible = "lacie,netxbig-leds";
-
-	gpio-ext = &gpio_ext;
-
-	timers = <NETXBIG_LED_TIMER1 500 500
-		  NETXBIG_LED_TIMER2 500 1000>;
-
-	blue-power {
-		label = "netxbig:blue:power";
-		mode-addr = <0>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 1
-			    NETXBIG_LED_TIMER1 3
-			    NETXBIG_LED_TIMER2 7>;
-		bright-addr = <1>;
-		max-brightness = <7>;
-	};
-	red-power {
-		label = "netxbig:red:power";
-		mode-addr = <0>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <1>;
-		max-brightness = <7>;
-	};
-	blue-sata0 {
-		label = "netxbig:blue:sata0";
-		mode-addr = <3>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 7
-			    NETXBIG_LED_SATA 1
-			    NETXBIG_LED_TIMER1 3>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	red-sata0 {
-		label = "netxbig:red:sata0";
-		mode-addr = <3>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	blue-sata1 {
-		label = "netxbig:blue:sata1";
-		mode-addr = <4>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 7
-			    NETXBIG_LED_SATA 1
-			    NETXBIG_LED_TIMER1 3>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	red-sata1 {
-		label = "netxbig:red:sata1";
-		mode-addr = <4>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-};
-- 
2.34.1

