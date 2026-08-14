Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78EE3E764F
	for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 23:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786749070; cv=none; b=kkeLutX64jNAx4I2wTB8bbXPSgFsqr0P26R8QB36Atx3HliVxTM5eFysRIU/sBPyeazB2EcaV4z3PuIbgUJCXdM2pFGx+CKo5KTIrX4XQyUoEYBO+J604OjTJk36fooNbcmGfBIpwiueOJYEe/lDEy3qAWieAFS2ZQCCRhN76gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786749070; c=relaxed/simple;
	bh=44ug/C+wAEBpOTrhMYNtqAXfr0HoJRYwJfcphkPhMgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xgavv6uLLu8y+zyvUWjy799FPULY+YnzWvJ0+4B0Um53SpZEx6CHg88PiwVZZiUl6MpD3U2GWtGHTPzNzPqXQ7lqyvyI/UjuWpLZhiUPTPo+h2lfqvF8VktAk9g1yXaS63eZBMAzne59gkMJ48u4CBCE0OoIq2uhg/X3isNao28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtdBbP5v; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtdBbP5v"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceaf8a1265so23322705ad.2
        for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 16:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786749067; x=1787353867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouiR3ivZXFGLAlzqaEsoWP9s70nb+07A9Idd51+C0NY=;
        b=OtdBbP5viyaFBCpnilni49s3Aj0WXt7Tp+O6YA/Ikvy4gu75n4gYFy4bhvtCZDoKcK
         n9CdNMfmOFulC9OGH+/1KboBbpcnMVMeQZwlrvenu03irjqLTLsNYJRicwpAzG44I9s+
         kCN1SCpGwZa7BGmOE/R5bSEpXZl3bkmjJiAph/KqPldCeoLvXNStgbP0VBq5u4gqraCx
         6itlDlOUEbZba/Ii7tMh8rojtVo4ozvhLxCpq3cwS18+VqM0AV9ToLhjoXLS9E08uA8s
         8mjbL19t33u3dEbM7XKi6v3nzRm3+6YMZI0QlfXxY0LKt/m0k4999pSXvpiU1gyebjui
         zLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786749067; x=1787353867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ouiR3ivZXFGLAlzqaEsoWP9s70nb+07A9Idd51+C0NY=;
        b=dlvCMsiyjVxTU7Q6G537vKHlWU2iyDzimyRTu4OSkOCgtr3cS7p58vPbMHt2YUZdyE
         FgmkNGv6II6XaC0w+QdRvv6c/QBz+sAKRhTPaR40wm2tvc61gPlGPzl2DS4GK+Au1iQF
         dAC81W/00RneW8Wjwh1lIYsA9Zw1uNlm0jieaGBwwdAq/cRnfB95xjGokGFhGZTzscH1
         gjgsNDbOCyLAcxTUJ17Na4geJmz+9m4WQVmIfiiNgTgmOR6OMbPRbG38M4Cj5tmAmDfK
         DdtK6498B7f7WcV0by0JvBvvkh1yJmxMi/06D5hZuzvW5DZGzOlpF3ZUja9f/rZWNSOp
         RB8w==
X-Forwarded-Encrypted: i=1; AHgh+RqaTxt4TUY3kfOSQOAJ+TMM+OTtkDGYwkUvtkyPcM1UjaBfU3Pm/6xJRfVBuksOFNHRt1deRmjvns2H@vger.kernel.org
X-Gm-Message-State: AOJu0YzFAiMy7j7excFW/CleboyyfI6LEJHfl04kvL+4LUIUkOmfugL2
	48DYYjTnM6M1MNjU73jGwBToHxJObR+fqi662utasRCTq6/OkDgCAup5
X-Gm-Gg: AR+sD13FF4/awW9PBog1rdsGtEtbsCtuDdjkUVWrjHhn2ZLugiOlMV88WtdnU3sXKdN
	h7c78wJIT8P3wNL4oGugiGyAapobMfCU1Bon3FK54pAjpkYDmnsrIb7PMBVP/uABiFXE7vfjYuF
	vGRJItjwLjltTQczRnxiAsg1jaTlOP4NAuEPB1x0lUw0KuHCxFVBp+3EOZlAxXQ9MmGstmHWS7L
	YlZCKTOrSNkiebF62Oz45cnDmNQC4B9F5sdPBvNLRwLiuL9VL0DNTRNqI1CDAabsIVTO2CW40dK
	2POCoSn9pIvBgZwCQyZbS08aHqiRtKmWjhjFQqtrD6/9e9yIS0Wm/mmH/wcbriQHVl5Xz2PaI7h
	2RaXlgqdE19r7ALYFrQ08zsMI0x5ktUy26rop3XS9XseFT1pU2amjzocOmAVeG02Vhkeqcgch2y
	D+RZeTe3LosbILDvPEvLbzs5oRuBSNvVpJKRxsua93mwy0XeQsc3rDQ0rvBw1OUrX+c2SBe3lfv
	NVi6PNSYV1tp4Ibgg==
X-Received: by 2002:a05:6372:a743:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3cc8f532b1bmr417457637.17.1786749067016;
        Fri, 14 Aug 2026 16:11:07 -0700 (PDT)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1568sm8563607eec.11.2026.08.14.16.11.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 16:11:06 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Nam Tran <trannamatk@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v5 1/7] dt-bindings: leds: Add IS32FL3207 controller
Date: Fri, 14 Aug 2026 16:10:49 -0700
Message-ID: <d5df0bb5c312478279f0d2fd5ec6305e41add5ae.1786747084.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1786746757.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS32FL3207 is an 18-channel constant-current LED controller with
per-output PWM and current scaling.

Describe I2C addressing, power and shutdown controls, RISET, and
individual or multicolor output groupings. Require board current limits
for each output and document their relationship to the RISET-derived full
scale.

Allow dash-suffixed multicolor group names when a group begins at channel
16 or 17, which cannot be represented by the common schema unit-address
form.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 .../bindings/leds/issi,is32fl3207.yaml        | 281 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml

diff --git a/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
new file mode 100644
index 000000000000..2e53aa1e202d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
@@ -0,0 +1,281 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/issi,is32fl3207.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lumissil IS32FL3207 18-channel LED controller
+
+maintainers:
+  - Ahmad Byagowi <ahmadexp@gmail.com>
+
+description: |
+  The IS32FL3207 is an I2C LED controller with 18 individually controlled
+  constant-current outputs. Each output has 8-bit current scaling. PWM
+  brightness control uses the controller's default 8-bit, 62 kHz mode.
+  Outputs may be exposed as individual LEDs or grouped as multicolor LEDs.
+
+  The data sheet is available at:
+    https://www.lumissil.com/assets/pdf/core/IS32FL3207_DS.pdf
+
+properties:
+  compatible:
+    const: issi,is32fl3207
+
+  reg:
+    enum: [0x34, 0x35, 0x36, 0x37]
+
+  vcc-supply:
+    description: Regulator providing power to the VCC pin.
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO connected to SDB, asserted to enable the controller.
+
+  issi,riset-ohms:
+    minimum: 2000
+    maximum: 76500000
+    description: |
+      Resistance in ohms of the external RISET resistor. The resistor sets the
+      full-scale output current according to IOUT(MAX) = 76.5 / RISET amperes.
+      Each LED's led-max-microamp value selects a board-safe peak current no
+      greater than this full scale, using the per-output scaling register.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-9a-f]+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 17
+        description: |
+          Zero-based LED output number. Values 0 through 17 correspond to
+          OUT1 through OUT18.
+
+      led-max-microamp:
+        minimum: 1
+        maximum: 38250
+        description: |
+          Board-safe peak current for this output. The value must not exceed
+          the full-scale current derived from issi,riset-ohms.
+
+      color:
+        oneOf:
+          - minimum: 0
+            maximum: 7
+          - minimum: 10
+            maximum: 14
+
+      max-brightness:
+        minimum: 1
+        maximum: 255
+
+      default-state:
+        description:
+          The driver performs a software reset and clears the PWM state during
+          initialization, so an existing state cannot be preserved.
+        enum: ["on", "off"]
+
+      default-brightness:
+        maximum: 255
+        description: |
+          Brightness used when default-state is "on". This value must not
+          exceed max-brightness when max-brightness is specified.
+
+    anyOf:
+      - required:
+          - function
+      - required:
+          - color
+
+    required:
+      - reg
+      - led-max-microamp
+
+  "^multi-led(@[0-9a-f]|-[0-9]+)?$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 15
+        description: |
+          Optional zero-based lowest-numbered output used by a group named
+          multi-led@N. Values 0 through 15 correspond to OUT1 through OUT16.
+          For a multi-led-N group without reg, the driver derives the lowest
+          output from its component nodes. This form permits groups beginning
+          at channels 16 or 17 while following the common multicolor node-name
+          schema.
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      max-brightness:
+        minimum: 1
+        maximum: 255
+
+      default-state:
+        description:
+          The driver performs a software reset and clears the PWM state during
+          initialization, so an existing state cannot be preserved.
+        enum: ["on", "off"]
+
+      default-brightness:
+        maximum: 255
+        description: |
+          Brightness used when default-state is "on". This value must not
+          exceed max-brightness when max-brightness is specified.
+
+    patternProperties:
+      "^led@[0-9a-f]+$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            minimum: 0
+            maximum: 17
+            description: |
+              Zero-based LED output number. Values 0 through 17 correspond to
+              OUT1 through OUT18.
+
+          led-max-microamp:
+            minimum: 1
+            maximum: 38250
+            description: |
+              Board-safe peak current for this output. The value must not
+              exceed the full-scale current derived from issi,riset-ohms.
+
+          color:
+            oneOf:
+              - minimum: 0
+                maximum: 7
+              - minimum: 10
+                maximum: 14
+
+          max-brightness: false
+
+          default-state: false
+
+          default-brightness: false
+
+          retain-state-shutdown: false
+
+        required:
+          - reg
+          - color
+          - led-max-microamp
+
+    anyOf:
+      - required: [led@0]
+      - required: [led@1]
+      - required: [led@2]
+      - required: [led@3]
+      - required: [led@4]
+      - required: [led@5]
+      - required: [led@6]
+      - required: [led@7]
+      - required: [led@8]
+      - required: [led@9]
+      - required: [led@a]
+      - required: [led@b]
+      - required: [led@c]
+      - required: [led@d]
+      - required: [led@e]
+      - required: [led@f]
+      - required: [led@10]
+      - required: [led@11]
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+required:
+  - compatible
+  - reg
+  - issi,riset-ohms
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@34 {
+            compatible = "issi,is32fl3207";
+            reg = <0x34>;
+            #address-cells = <1>;
+            enable-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+            #size-cells = <0>;
+            vcc-supply = <&led_3v3>;
+            issi,riset-ohms = <4700>;
+
+            multi-led@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                color = <LED_COLOR_ID_RGB>;
+                function = LED_FUNCTION_STATUS;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <8100>;
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <8100>;
+                };
+
+                led@2 {
+                    reg = <2>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <8100>;
+                };
+            };
+
+            multi-led-1 {
+                #address-cells = <1>;
+                color = <LED_COLOR_ID_MULTI>;
+                function = LED_FUNCTION_INDICATOR;
+                #size-cells = <0>;
+
+                led@10 {
+                    reg = <16>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    led-max-microamp = <8100>;
+                };
+
+                led@11 {
+                    reg = <17>;
+                    color = <LED_COLOR_ID_WHITE>;
+                    led-max-microamp = <8100>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 991460050da7..448e7b7be8df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13827,6 +13827,12 @@ S:	Maintained
 F:	Documentation/filesystems/isofs.rst
 F:	fs/isofs/
 
+ISSI IS32FL3207 LED DRIVER
+M:	Ahmad Byagowi <ahmadexp@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
+
 IT87 HARDWARE MONITORING DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.50.1 (Apple Git-155)
