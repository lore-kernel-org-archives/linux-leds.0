Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B3729BD91;
	Tue, 22 Sep 2026 05:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790053303; cv=none; b=OA3QjZ3D/MxYZ9MhbxNXbj1Y1WQvpmv6soOuY+A9GB0sAIvTiUWTt7fJ/rDHHrGfXrqjjqh7sRujRMDiu1i+HY49UI30Jl+fr4z2PORv/mQ4aclDfbC0G7WECVNHl1t+dvEfRn1npXmH3ZkyxxEyWdUKEIBxEiJmWAC+VC5LPIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790053303; c=relaxed/simple;
	bh=YoOXX5aGMwZPcafG3imeRo5al+861WlcXUNrcECnlpQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=sDvhYCWPlxB6cKRQuWTVs8+sn+F7sL10cGLfd6NU0y0xMpn2cVxvUipXsUnj+LOLJL3kEM6yp2g8n9dhZmhufzLinpcz3Bw6t0lWm3Zf2kg6BbGkt9ikPi+Isa+/VIeAM1mES6PuG1YifuRv04YaAKhGco9OXxnPKzaSdr8YHjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ulEcvzJn; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ulEcvzJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1790053294; bh=UpG9HQLBo46AAjtVXTADz91ACMKaCoGZMDoKwMGC/Z4=;
	h=From:To:Cc:Subject:Date;
	b=ulEcvzJnKv1XKcwkjzrpPmwSkX8iDVW+BB/4LHworxDsG3JMmxFTuulMSIfHrLH6P
	 GHjlLUl54XzO+VYM7jH5c/Lamz4juX+z5QIdL0ZpoUoIqqdiOCS6UdMuIQQYVqqElo
	 U8pYx/dXmdKGd/XXmYVGNzbq+rC6zHBtlznCzYnw=
Received: from localhost.localdomain ([218.84.96.154])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 11A9A70; Tue, 22 Sep 2026 13:00:17 +0800
X-QQ-mid: xmsmtpt1790053217trsngqvb5
Message-ID: <tencent_67B8796B733C275D1EF565D0D2CDB9B48306@qq.com>
X-QQ-XMAILINFO: MMq8nqC7jH0BHMyc3eJ+GmwUFDEFZq7IuzaGmNt/VO4FcMbZdccDAinfqG+mZi
	 C2gt5hAvib5fc031Dr6aXSngiNigkftpGCsrGFnU2A6DGfM9a1xeoTgNhZuFNP9Lf6nmYSdwMOwa
	 tWOYqRJpdVRxNaOMDL3jfACU5xIfogygOV3NvdmYv/mo6+AkEx5JpE2EdM6Ql7L6LYvYyycyUhBi
	 11RfhmDGdsE1z0pQjYo3JUPYVBuRpticxhpea/A0vnqGTKjfIII0bngP4kbM/H8N+ZUi2HUlVAu0
	 QVNgWazFJgb2AcO2s66nFPencfSQK8WSsUm8kiKr+059N6/1N+jIOms2+cvRAiclzWgEE2zJAdkY
	 EVipy/N0Vqa7nTpS1uCcyabYL1Rnfeme5jGTHZv2EONc5yWqlYItOaKKCEuLpq1/L5B0exhBsZDW
	 /XcAWuUS4G2zHiGHkkD6F6d+tbjPAoNapRf8FlJL1tTYBhUOhq8ejSGZ1h7F9LKGCljJBFqQqH6+
	 3tJwxbfU3185FqTLemW1MtkFxcxw0DK4qqXlOR5gkgCjggbvmMNpy/HRQKg3JSA3IpBQNm1jgqPv
	 zBlWS4uvhqvYzIg2yZhsIY3Ym3VdlEW5bPBJT9X5EojMAxEK3ZNfEowwpavLa6JGdUvdNgiZcMAO
	 P2T9ranHcAOX56i8BgZLtOvmQ+0wqSf1kN8qzqHELrbs5DgUj4qh1F1TpO6jok47xi9NE5PKyyXL
	 kOUZjqfEn24z77vOKOD8HH/jEnHXr6fSi31iiJ5yaPB/68zJ6R7j4tqE0CuPil41vXi0HeW8wHkr
	 LHrzA24FBYTF3+dMZ891Klg9ZWbK6miH4yzzpOkNTfto1BRU1Pxu0oEh3a9fjBvGWifqJBFPF+4e
	 rF56IauUfnvaZ5V9NkjxHabtxj9noViv5WWFp6aoxEwrQXU+bFVCXJ9pWWyNvwpVqhDQHgAmodCj
	 iGMExqAW7Xr3kwE57+aNnYuMI078VtGhMLsPiQyyECJVFkXvkjzyicskBcIfm/2EtAipIxnzdNNZ
	 fGUqyEN9ZS/ErzUeHSTGloNsOV63sj9U+6LnqFktlZRaWkHb2t
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: dongsheng liu <2509730023@qq.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Mack <daniel@zonque.org>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: leds: Convert leds-lt3593.txt to yaml format
Date: Tue, 22 Sep 2026 13:00:12 +0800
X-OQ-MSGID: <20260922050012.811-1-2509730023@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert binding doc leds-lt3593.txt to yaml format, so that nodes using
the "lltc,lt3593" compatible are no longer reported by dtbs_check as:

  failed to match any schema with compatible: ['lltc,lt3593']

Additional change:
- reference common.yaml for the LED sub-node properties.
- require the sub-node, matching the driver's check for exactly one child.

The schema was written with the help of an LLM coding assistant, based on
the previous binding text and drivers/leds/leds-lt3593.c. It is validated
with make dt_binding_check, and against the "lltc,lt3593" node in
arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts.

Assisted-by: LLM dtschema yamllint
Signed-off-by: dongsheng liu <2509730023@qq.com>
---
 .../devicetree/bindings/leds/leds-lt3593.txt  | 37 -----------
 .../devicetree/bindings/leds/lltc,lt3593.yaml | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-lt3593.txt
 create mode 100644 Documentation/devicetree/bindings/leds/lltc,lt3593.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-lt3593.txt b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
deleted file mode 100644
index 24eccda..0000000
--- a/Documentation/devicetree/bindings/leds/leds-lt3593.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Bindings for Linear Technologies LT3593 LED controller
-
-Required properties:
-- compatible:		Should be "lltc,lt3593".
-- lltc,ctrl-gpios:	A handle to the GPIO that is connected to the 'CTRL'
-			pin of the chip.
-
-The hardware supports only one LED. The properties of this LED are
-configured in a sub-node in the device node.
-
-Optional sub-node properties:
-- function:		See Documentation/devicetree/bindings/leds/common.txt
-- color:		See Documentation/devicetree/bindings/leds/common.txt
-- label:		A label for the LED. If none is given, the LED will be
-			named "lt3595::" (deprecated)
-- linux,default-trigger: The default trigger for the LED.
-			See Documentation/devicetree/bindings/leds/common.txt
-- default-state:	The initial state of the LED.
-			See Documentation/devicetree/bindings/leds/common.txt
-
-If multiple chips of this type are found in a design, each one needs to
-be handled by its own device node.
-
-Example:
-
-#include <dt-bindings/leds/common.h>
-
-led-controller {
-	compatible = "lltc,lt3593";
-	lltc,ctrl-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
-
-	led {
-		function = LED_FUNCTION_BACKLIGHT;
-		color = <LED_COLOR_ID_WHITE>;
-		default-state = "on";
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/lltc,lt3593.yaml b/Documentation/devicetree/bindings/leds/lltc,lt3593.yaml
new file mode 100644
index 0000000..5c1801e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lltc,lt3593.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lltc,lt3593.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Linear Technology LT3593 LED controller
+
+maintainers:
+  - Daniel Mack <daniel@zonque.org>
+
+description: |
+  The LT3593 is a step-up DC/DC converter designed to drive a single LED
+  string. Its output current is programmed by the number of pulses applied to
+  the CTRL pin, which also acts as the enable input.
+
+  The hardware supports only one LED. The properties of this LED are
+  configured in a sub-node in the device node. If multiple chips of this type
+  are found in a design, each one needs to be handled by its own device node.
+
+properties:
+  compatible:
+    const: lltc,lt3593
+
+  lltc,ctrl-gpios:
+    maxItems: 1
+    description:
+      A handle to the GPIO that is connected to the 'CTRL' pin of the chip.
+
+  led:
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties of the LED driven by the controller.
+
+required:
+  - compatible
+  - lltc,ctrl-gpios
+  - led
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    led-controller {
+        compatible = "lltc,lt3593";
+        pinctrl-names = "default";
+        pinctrl-0 = <&lt3593_pins>;
+        lltc,ctrl-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+
+        led {
+            function = LED_FUNCTION_BACKLIGHT;
+            color = <LED_COLOR_ID_WHITE>;
+            default-state = "on";
+        };
+    };
+
+...
-- 
2.43.0

