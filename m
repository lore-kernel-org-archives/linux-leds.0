Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA292FF675
	for <linux-leds@vger.kernel.org>; Sun, 23 Aug 2026 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787502916; cv=none; b=c5XcJ/j7a4dbBTrs5LVgPz+sX4mwthAm8pa3h8Cd+1uw4Z6TWklNscHS3UdCUnG0U1MSfCYenTC69LytgetczlGMp9XQU7z/jxaVlack5Vf82pcWYBJ+JZCWIRH3OqIfvmpegnzENkJGIlEc9tIAcOeBPV5yQ7bjHMwL19fPupk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787502916; c=relaxed/simple;
	bh=yOi5wvby6p7MASNrD+JThJXjczShryYeqdw32eBGRQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBtjbypdsnL4TqX8gDJcO6eH4GTcaUfYrjsTcAj9PvHCv1eVwxfh2AHxtuHIxRRazv98uKGOL/Am9O4Hgc5i2tchYloiViZuV8gqrZ2p7h/FQQGb+y+0JT5VV7opzm3gAjlIKEyj6a/fROCxmoyauo/YW2A2M2sIToBXqeqkI1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldk6a4kq; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldk6a4kq"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf52d15d88so21269565ad.2
        for <linux-leds@vger.kernel.org>; Sun, 23 Aug 2026 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787502913; x=1788107713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pd6T48A7aApc+pE+AxMi1CyromQqyIH35NBi1IVtFiI=;
        b=ldk6a4kqTH5yfzQnN8dHFUmGtFbW9Wulmv0kbL6muvHtwfMB6kRFra/TKJtwWWNbTO
         aHBgCaq+4tcPqEfWbruNT2wBUds68qR8JFpBJZzpdsGbQJl7YR3UWH216n/Q0HCHnnR1
         jyg/V5xKjnpf/fsWZ/vyRl6qfukcu8jP6J6BrVqaLORWL5nI5HrWuKYzfr22eZoy9kcC
         pLWxxO5fIGPw5VE5VCwLIzTqNkNvSavvqZqKhAenjkWoW0gGO/+HCK1/oYUIZ0YEYsY/
         MaE+rSrYQsDHfvtI5xD4ww5b3/5Qp0sPyW3qMmQcR5IpN/VhHWFdYzlcotDcL+FZMVCg
         2tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787502913; x=1788107713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pd6T48A7aApc+pE+AxMi1CyromQqyIH35NBi1IVtFiI=;
        b=qh9CMg/WX41Cv+bePI5hIBCTFYbiJZURIzadlKd1rVkIAOLx8MpuhF8K5efAGEnqeE
         K32WhWVAcjRCbITrdQpek+t5WrjJ73eAwgULY18LFDp3X3M9sIs9KvrIefl4GxPX7j0t
         CSByrD7RRBYQ6E0g+gYRlJ/prAK6chTUIni+4iBMYW9facwjKs4i//rBQhcE5cSz7IP/
         Ip0AszPpWi0BZk8b9pc8rl8egYN2LARj5ACcm8ovELK2F1otREGJPMlCcIZ8n4oAT5FP
         7qTOIv/WRBR7GpWJUM/dSP39FDlZRQzGVPsyusqc/YckdD4bGVwegV6BmOdf5TxR4DAr
         xDjQ==
X-Forwarded-Encrypted: i=1; AHgh+RrO6PGqWvKYfd1wusNy9g+Wt1qp3u2Z0c6xqblmcBjq+Z91XAekH9eogi5dA0Yftv2Joig+dyXp5WJp@vger.kernel.org
X-Gm-Message-State: AFuF++nq6Lj5TYsKZkbjFIJ+70yn7L4k83vFRyrz/k3uBI1QUl88FZo0
	c5D/c0ua/QOHzPXkgcudo/7byLqdduHlw6lQlPTS7u1m0dFHH6QS02u8
X-Gm-Gg: AR+sD10kEN6efNCewP/hO047hUU0vJbXba69D2c7pGhB1F537uc0GSCyl6Q3si+IHem
	I6IG2raBbC86oiD53UaPygCabkJKF6lB+c9myhe6S3uJSQDufKIXTnSpe31NGjgcS7rENioz82B
	qymQ2aPAgXM6Q2c07DyaeSIwR078sonur/Y/kDBRfJyKU78+kGTu63wy39hlSDmFwntgbxkjVZX
	X1Fp00hbg/dCKgUTEdrL+Yw4MGoJiZaLpAiECnJt75FgnH/lkuF5WVRXdZXEws3hEi/4IpiQrPz
	L4k+9u03XiEsVYiKYShexnNlo4ns4FXyW1CzI2WCcP9YnF9YQhQ1B4kGbZNWHgW4rIFFDjuqusC
	N114KCDtiClpu39/NLEet1rsbdoGqspyV8TI6iX8a9XTWgv1BwlQaBuQ/zbElGVzDT17vz0XEX4
	xN5zCmqNXGsulEmCBY7Pkkggcd7hsWDB/2zcfqgv85fQ4nDHVQ3dbcL7QDHMHfs5Y1p0GZ+iGDr
	yTWmLLpHaw1OK375L8F8Dk/sWmB21/PVB1UPuOq5WaIhUE23wa1rWmzyu90mbZiie9f4X2DYB7J
	UCj0yBxRBVfrCc6YRvRE
X-Received: by 2002:a17:902:ce0b:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2d64add8343mr416105945ad.7.1787502912795;
        Sun, 23 Aug 2026 09:35:12 -0700 (PDT)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923615asm17514358eec.29.2026.08.23.09.35.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 23 Aug 2026 09:35:12 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ahmad Byagowi <ahmadexp@gmail.com>
Subject: [PATCH v7 1/2] dt-bindings: leds: Add IS32FL3207 controller
Date: Sun, 23 Aug 2026 09:35:08 -0700
Message-ID: <28f5f4a212c8110ce4fbaa97c3c5b7e98ca30157.1787502624.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1787502624.git.ahmadexp@gmail.com>
References: <cover.1787502624.git.ahmadexp@gmail.com>
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
 .../bindings/leds/issi,is32fl3207.yaml        | 285 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 291 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml

diff --git a/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
new file mode 100644
index 000000000000..4d42a62fd467
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
@@ -0,0 +1,285 @@
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
+          the full-scale current derived from issi,riset-ohms and must be high
+          enough to produce a nonzero per-output current-scaling value for the
+          configured RISET resistance.
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
+              exceed the full-scale current derived from issi,riset-ohms and
+              must be high enough to produce a nonzero per-output
+              current-scaling value for the configured RISET resistance.
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
index 747ef98f21e8..dbb2fc536c06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13817,6 +13817,12 @@ S:	Maintained
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

