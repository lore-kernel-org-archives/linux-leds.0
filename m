Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5480A314A9E
	for <linux-leds@vger.kernel.org>; Tue, 11 Aug 2026 05:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424571; cv=none; b=P4k2LJPoFcOv98Llc8cyL7Kznvn6inMnTAOQiSUMjhrk39xzwi/16gr1ObS9GwU+2l8Qv0bULhMLiuX6mgGzxHtMS5n5Rkpbg/T+rkwKhR5w6sP3xUOGfszD5k3itkEDCuTV0SsttPGUtAVmPi2ijDEKYQwQ6TO0zebCn5UV+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424571; c=relaxed/simple;
	bh=cgOyPqDoAVmQIdEVzceGAUOAHO3s4QFFGfpc4LKyOz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWtbOjmwY+lRuiDqDQaU0V7w6aoSPP2vxtqdnDZPyvF+nYFBOTpXf3iTUtc1yGZcCTm3X/Ja9Y0JsSpsikfjeapYR+pusDKVUdAeozUrcU5RgZmW4swTzrbMVb2QyQQYgjt9PsYdIOors6byUgURU1Nz0zyGkXNRrnODsExYraE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTgg2tYq; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTgg2tYq"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84a652535dcso1499423b3a.3
        for <linux-leds@vger.kernel.org>; Mon, 10 Aug 2026 22:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786424568; x=1787029368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vzcklR1752px28ASDR7vjX+YItV4G0zo+zCsAv5XG1k=;
        b=OTgg2tYqHiO6uyGwDU67EVKFnU3oUg5KopP5g95V15g0Zmn3Y5g6xOixOSy10eLM3K
         Uchso8Km3vMjJh9gkRzo5GZwmtfVOKOfdRU13LXn3nFgPD23yOGXW0qK0iywVxSmnBcx
         DT7FWE7Ujg1aJxUiccxkSRq0meCruB8nCvvWHZ9Gx0ID5dmn+9g3FC8e3bAxkbj+xB0S
         DgTIHvthW/NXwaRf3vcGUdbNNi9zez4PiTElTmVLVjgHQDe3x8hf1lgvnEnepfsTAeZ2
         V4mOVBaCB962HI6wp3A0IKLzbCN/mucn4FcLCqmE8Pt4bTwI008F3Z+oQr7oJPvOKrZp
         Nqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424568; x=1787029368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vzcklR1752px28ASDR7vjX+YItV4G0zo+zCsAv5XG1k=;
        b=M3p1f/rKCSNS1K76v1FoeTQ0m3gBuif3huORMPatodFHkSYWccQJHc/9dcGhI3yuEO
         nA/KD2z8+aGXq9E3lQvv+76Ug1NMMuSGdpSZOm6Cjxa3en0lkbI3HH5UpZyxgTxkntgC
         b5UMI6poT9amoROadaWx4XVMvl9o6g4xzJTGUuayjJgRqc9jekqBqfFJWDSHK8hFHlFj
         ShfePF+TPybPYGdurlHufYNHXFVShQI7MHp2mr7K4eA6oq0VkGdQtNVwYy5Kea5rTAqz
         2zSnDGA29OXIwUdbaQh41yNBumkMSM5Qjoj2y46YCuXxVIRSYHmt+IGb6MYdx4xjQI06
         r+hg==
X-Forwarded-Encrypted: i=1; AHgh+RokoDzeRTGpFMDviy9AUO1dg0LCFh9dRbUXQMWm3w3osdho7Vp7062RYl/qscCLP8miBOPkIVOE/8Ai@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj2xTmpnhZzKEZRla6zu/ylDB9rxm7bkXYQTmeO8cmTTtQ9bIx
	hLvWewTa/dbxNHNHoTcZRdhEd9SlsBp0FLPyGd8+sl8YQ8bX8anUiYcF
X-Gm-Gg: AR+sD11ANqLKxpvggT+I5RTWFs3B/+wxEI3Pj1fecfhQcBtUdLK0Cy8pOsMIpw7gSRr
	qh1puxpiRHAnUrVS3sEaXQlfsC4G5dmAOOv8dygV/b6eTGhEBsaS9xrwI3hWU5L74dBJCGrCZUb
	GY92vi3AqqqP95uE4tg6N88eCaPdHHZeZBBwFWwaJFe2aOb/DkB9Vd/DCSHU2MxVD2tF72HH8zs
	QJvXY9evzy4WVALZyJTjz2X6ky0nQzyP0aWUvGhwxJw5VhU2EXBM06bZPur7MJjDcwLgZF5LAj+
	u7HZRkhY9j0PtCHJxOdpTw33AatH32KgW2bYc66Yc5/BQsNGzs/1cnKDtS/w98MEXSzdxBY3nCv
	ezZBtO+vFHAHgkrjWzz6FO72EiUh4JeJqqbn331vkXjP9Ii15nsLP7hy+pzc8E1O/oe5BT70WvB
	KCbu3xl/Kg/sTNpN9pG2P5z5Zm4fvucHXVBJs+NzfN+A1F1eckNGeFWeMsyssEuJBSe0S9RUIcS
	1byrr5ExH2HW9rsOHG7IJRvCyoWzmXrynsOqZxPg/s8ZCKdVQ==
X-Received: by 2002:a05:6a21:7008:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3cc2b7a6ae5mr1303294637.2.1786424568459;
        Mon, 10 Aug 2026 22:02:48 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c619cf07dsm660421eec.4.2026.08.10.22.02.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 22:02:47 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v3 1/5] dt-bindings: leds: Add IS32FL3207 controller
Date: Mon, 10 Aug 2026 22:02:40 -0700
Message-ID: <8088c3333f464545297a642816316a090dcd3099.1786423898.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1786423898.git.ahmadexp@gmail.com>
References: <cover.1786423898.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS32FL3207 is an 18-channel constant-current LED controller
with per-output PWM and current scaling.

Describe I2C addressing, power and shutdown controls, RISET, and
individual or multicolor output groupings. Require board current limits
for each output.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 .../bindings/leds/issi,is32fl3207.yaml        | 251 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 257 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml

diff --git a/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
new file mode 100644
index 000000000000..4ee9db964ecc
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
@@ -0,0 +1,251 @@
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
+      maximum output current according to IOUT(MAX) = 76.5 / RISET amperes.
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
+          The controller is reset during initialization, so an existing state
+          cannot be preserved.
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
+  "^multi-led@[0-9a-f]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 15
+        description: |
+          Zero-based lowest-numbered LED output used by the group. Values 0
+          through 15 correspond to OUT1 through OUT16. A group based at
+          channel 15 (OUT16) may include channels 16 and 17 (OUT17 and OUT18).
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
+          The controller is reset during initialization, so an existing state
+          cannot be preserved.
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
+
+    required:
+      - reg
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
+            #size-cells = <0>;
+
+            vcc-supply = <&led_3v3>;
+            enable-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+            issi,riset-ohms = <4700>;
+
+            multi-led@0 {
+                reg = <0>;
+                color = <LED_COLOR_ID_RGB>;
+                function = LED_FUNCTION_STATUS;
+                #address-cells = <1>;
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
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a82b6ec9c567..85e19b1c46cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13822,6 +13822,12 @@ S:	Maintained
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

