Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39215233126
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791225916; cv=none; b=kaYZMSWQUUDuxl7s7Cz9EvcPn5q+zpQe8tXSVLAnD7KBF57yCCuVOOCHOHdzFmiuNeAKucnzJ9G/3cEcpZcGr262pRG+LVxd7rpIT9ne2aL83RV6HFaHmyAR6C5DKzisAC22/+7aKmFqHNo0wAZhfglvHc+0KGFDVvZH0/emIPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791225916; c=relaxed/simple;
	bh=Pa/B/6lzvNosJmOlBb1hGpthqBVdJojogY7Q5t5iEpg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S15Iwft3i8APsEO8lO94zFX0zQa3VpsDg+GCmvI2Xgx3QpcnjIUIhed0O4j/dFBEGX2Ui+emHAfU+TAfvbh5DXEi0wwZ2eSBsvDTz8cRrtsJWewzzx5eWF9oxQ9uN+PjyaWghKm+uhgBtPVFJO3sSXSjDlNCPiKeJCzqjrvYSXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktob5S+q; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktob5S+q"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b6f8b8113so781492eec.0
        for <linux-leds@vger.kernel.org>; Mon, 05 Oct 2026 11:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791225914; x=1791830714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKRGgL1d9laQKntKJ5ZCtPSXyeLDiiH4qMSXoJCCJ0Y=;
        b=ktob5S+qXBoaZjJRjkOZIopPZ/AeuYn4NIJ3BjKMQ6L4z5dhODGmWMNsImwQ7wWhou
         YAsUKB+Yck70JIykFYpLcIOKEaRX84NFcofrulbTcKl7E6Z0pnyGKzuMrOuOoLSxxMSG
         FpNc8Nu28eg6qQT16aWxXB9hMBq0raKXZVmR+6NuIY9obMXwLpdqLy6WWGeIuKnIklHe
         QWNvcBhjeSrNvAZF9XoBQ/FpHJqmoIb5uIvb2dQTGY3K4tflHRPf0oY3CFRK5+wTB+FZ
         KM6kihhAwB3VJJTNYslqoxaiUzY0HbhVZJm5XcBIwQGTNg3ETBqtcp6zTV3X9+xRKVQ/
         9ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791225914; x=1791830714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKRGgL1d9laQKntKJ5ZCtPSXyeLDiiH4qMSXoJCCJ0Y=;
        b=US9FgBGL8syZEdNC+Tma7WAuLhBDdRWzrqHuDUXJKbIzhvkupLcLf0YqsVNvJMT1TY
         xkyP+ETZq6zJs1/124+e6/TC4pN9RTjuNTEGX9mdEJcb644LIznMrV0pmvbT75A8SkN8
         171hyEdUIAj2LA3SH1NQgPNqiL190bZD7lG4mrwi5hrkPZAI9VWNCs/J5CP2Bf1MT1um
         uGfAr9DJF3VX7O0uVpZTV79eV1SKNCPv5sEDhd0XSH17HYJGuRsFVcKx6IShIlXGImbW
         pqN3FPcfFijGzYRRy1sAsvJKovWfhkmkK6SgZPHcp4EOAKBb0MA6nSdWDU+pTCswZMva
         aO+Q==
X-Forwarded-Encrypted: i=1; AKwUvBysM2x0BW1OelbVISVJA9rNMi368ff9Ya9UXvT9tFYnGgbvAx+XX29mSPvoa8KZWs5v7Iv3d61Wwe/B@vger.kernel.org
X-Gm-Message-State: AFuF++lg9BQwngTD4f/1ohJ7ef49tPZOqlG8Ac78ljMLF+8SYwzwYOWf
	BWrB7UuC1K8L3SfWcvTko9Lv+W26M4D1/8yK53fwQ96/waEAIFzTFBot
X-Gm-Gg: AYBFou3OeoYM1QKs4eEPTBPIBo7NozfqRhHyTvo734NLNcUm6zMzP/S6ydtXyeJ5wNI
	INuZy+i5tKEaylXFjD/mPyg0v4shvpj7C+3ZmnNsNYTg7QdEE/nsrUfJIiSpp4sREbuJghsgUiM
	rFMqycr1w+22rOnSeqPVbSDtF4zklXP9iWnUuHPBJ722vtIV4WPgeMSTs7ECcPd/5OD3xchqJ8m
	e/m/UnWcB8fsWC7AVGCsYdCO0u7Ki9GwqfcrAJAFyHfQ6+jhW+rDqgNW8YG7ypuEhfihvfKHMUi
	PInW1q8dcdp6JhtFbroFIQo/S5TB2RynWFPtSPajaz5pNyURi35oYE/LIzXwh+e1yld8fr3+Df2
	cKxvfDEMj776sfo10htIyWALA207BTq5CogJ0lTKXVbjHv6Wez1h6TwaC1me0z/lYnOiYupTwAb
	1QfmKXJnYM9/hB+77jrNofYDO0o+A+vVS1bgGmCOg1pv7MHbAx8wGIkXPtaJj86SDcYqAexlqSb
	rVB/tu27xEMS0JLi6nLqPBC6Uw4
X-Received: by 2002:a05:7301:550e:b0:347:a3d9:dfa3 with SMTP id 5a478bee46e88-351450c21bbmr455348eec.7.1791225913995;
        Mon, 05 Oct 2026 11:45:13 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:bc23:13ce:62d6:5ad0:c521])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2add7sm191248eec.13.2026.10.05.11.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:45:12 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
Date: Tue,  6 Oct 2026 00:14:28 +0530
Message-Id: <20261005184428.251868-1-challauday369@gmail.com>
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
Changes since v3:
- Correct patternProperties to use generic led node names
- Rename example device name to leds
- Drop optional subnode properties

Link to v3:https://lore.kernel.org/all/20260901170358.176103-1-challauday369@gmail.com/

Changes since v2:
- Add reference to led common.yaml
- Drop type for all common properties

Link to v2:https://lore.kernel.org/all/20260821123723.198286-1-challauday369@gmail.com/

Changes since v1:
- Use pattenProperties for LED child nodes instead of additionalProperties
- Explicitly list the two optional properties supported by the binding
- Place the top-level required block after child-node definition

Link to v1:https://lore.kernel.org/all/20260820150223.108374-1-challauday369@gmail.com/
---
 .../bindings/leds/lacie,netxbig-leds.yaml     | 136 ++++++++++++++++++
 .../devicetree/bindings/leds/leds-netxbig.txt |  92 ------------
 2 files changed, 136 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
new file mode 100644
index 000000000000..fe47c12044da
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
@@ -0,0 +1,136 @@
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
+    description:
+      Timer array. Each timer entry is represented by three integers -
+      Mode (gpio-ext bus), delay_on and delay_off.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+patternProperties:
+  "^led-[a-z0-9]+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      mode-addr:
+        description: Mode register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      mode-val:
+        description:
+          Mode to value mapping. Each entry is represented by two integers -
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
+    leds {
+        compatible = "lacie,netxbig-leds";
+
+        gpio-ext = <&netxbig_gpio_ext>;
+
+        timers = <NETXBIG_LED_TIMER1 500 500
+                  NETXBIG_LED_TIMER2 500 1000>;
+
+        led-0 {
+            label = "netxbig:blue:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 1
+                        NETXBIG_LED_TIMER1 3
+                        NETXBIG_LED_TIMER2 7>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        led-1 {
+            label = "netxbig:red:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        led-2 {
+            label = "netxbig:blue:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        led-3 {
+            label = "netxbig:red:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        led-4 {
+            label = "netxbig:blue:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        led-5 {
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

