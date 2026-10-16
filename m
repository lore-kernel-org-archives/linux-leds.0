Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13652FE36
	for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 16:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168167; cv=none; b=Luot+kPY/K1W2ULNTcEyWTtMuyEZndERJWlXyv/VABbIO4aATDJW0QgUrXHGevEFo/MPA3OEYZNktrvCSRu68hx0OTwaaJwGhmzTDqXRjf7GVAUt8bx+NkqzsLIbiBoavOq3hvFZ84EIO6m2PTHeu2o15E9grXGbD+3pC5LW5jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168167; c=relaxed/simple;
	bh=OxV1RuzyJ3U0pIeECN5+q2tSH4wIzfJ7OS3s+Ly4mTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P0gnjpedX6lZ8eG+dgyjcyFP2aePp5dJu9lMOCuksWBvdLgxWTD99RkWq/qiLmUlRVjOJE9BFowZFCiDOexjgYfpWWve6F6NJ4Z5pmTbmEpSmz4ybhyPv91ZHbGiij1WnPBGqNCSNepGYTZR8P2oecww4j1mPGKUjY0xwTGc0IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMUCZWZw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMUCZWZw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4be28b82so15542f8f.2
        for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168161; x=1792772961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/XhYMGu1EQRHViVghAn6A1D98GsvwIcwrZbeCelmr8=;
        b=EMUCZWZw6yshhCZS3dhk5lGJ8xENGATXGOjfW35kGRHN2uJ38jOmIE0zFAhTk0l1u2
         BygMTOXTB0zDEb37zp/qF+BCtau9lEfaVTkiHAKXSEmqq252HEdpOd6II4JQWd6IJ4wW
         GY1WrVAD7dIcAkBxrPvT0979McL3MEaDoLcpDw2SMFBJzzH9oOuBJEyRO9cVQefUbXxE
         Czh2/DQjFW0KYc0iExBcQsHr1vBUUg5J8gmvq9Ne8Z8S2GrMXPX+ybJ6k+Ss6O8iGMP2
         SPdp5AZCMVtJMbtNpoIUAefmHtToMBYdJZIwkynAOmVBFZC3AbyIw3UWa9a5tWmgIDam
         kOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168161; x=1792772961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/XhYMGu1EQRHViVghAn6A1D98GsvwIcwrZbeCelmr8=;
        b=jmDzqVHeZsQ9bFXTiTLi1bXJIdnxhjGOF6rTtfa5o9Q0+/iGIW9W08vii/WwS5UdNK
         G845d2dId6zv+6d02zVjzVWH7EwbyxrGlCotsq8lHCyWIES8iIIGPMcFn/6kCKYHH92p
         XXgW9/86rK61oqxbKXuznwNu0QPGlTq2o7hTYQDpj049zwD9vXouzu4M9qx0eBfRxNTj
         RZ4hOhSi5hbCr3jWti7aNyQHV+1MHCPfz4NzvqCKWkgNkJiJQZzzIMhRkhEkHW4zQvNy
         RVgOh2zplj9dHuqPkoTVrDXS/xdnJnMx58Wzd1fIsNLyr/wvXu0b/RYH/iOe7/3DC+Ri
         +l5g==
X-Forwarded-Encrypted: i=1; AKwUvBx2SuYWqdYmL2UU+oiLO3NIlQkuj2+/Mf5lc5HOxrxss4Mmd2aSiZdPoynTiHbqSTF6Oqbnj1ZaAgrx@vger.kernel.org
X-Gm-Message-State: AFq9FYI8WJQWxgz+VQv76cR2wGYVvGWWs+lJKkrYp8dlQW5vwRCHgSEz
	cheU+EaMfYLBB/ko443sdKPgbAkx+svWaxmQM260mXz3OFCh+FPP7fof
X-Gm-Gg: AYBFou1//isRf6rPNrMkC7cfdsJE03cTlkB7r6rGNixchPuIEnD/9w42HCPzSHU35Zj
	/ecOhNeXHwtkLABF5t/fCyvsXRC6yOsprYrX62WrykL6c3jizmg4D0jspnTglXPo4FLEh5kaQjN
	wiB7T+EFnMtnDRj2xDAJWyIiLbLXs1tEcK/ws1SnIKVFCbtNq8rmELBz3QpJRrrVjowHsK/2zWw
	2+Vs3P8+++8rgkpSZDbgJXZNL1Npiiqrn7P0zsYPKba9zD28CyOKmZQ4sy0bEh8xSaEEvpnCLjo
	W9oO8YI1NaVzEYVZCkZWPwC2H8DZOpuESsNdGBSCwRmnTfxX1CCwZyk8yuzvDi6mPxovN9xzt8u
	eElH9nTDQoGU0S87OHwKZ3PZnV3HdhKBZDTOt2PxE2ptndp8POmpan8QqK1rBYoRTDrdm2mrmfC
	65ufiTNn7kSUhxeXUKcLAqJqFA+VqCM/KIyFdFN4xNzm+sihYKqppjSrLfz+E3EbctTXCofHZ1a
	pTdD4IkniHn+qmMjfry+0R3RaCzEVe93wTKhQ/DFvI8s3hHQNiuxwv3b7dnNkznyyc/lY7abE25
	Vg==
X-Received: by 2002:a05:6000:4a0a:b0:48d:f14a:9183 with SMTP id ffacd0b85a97d-48e07bbc619mr219403f8f.15.1792168160937;
        Fri, 16 Oct 2026 09:29:20 -0700 (PDT)
Received: from machine.home.arpa ([2a0d:3344:57f6::103c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm9404317f8f.16.2026.10.16.09.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:29:20 -0700 (PDT)
From: Luka Panio <lukapanio@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luka Panio <lukapanio@gmail.com>
Subject: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99703 backlight
Date: Fri, 16 Oct 2026 18:29:11 +0200
Message-ID: <20261016162912.64581-2-lukapanio@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016162912.64581-1-lukapanio@gmail.com>
References: <20261016162912.64581-1-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Awinic AW99703 is a 3-string WLED driver converter with an
integrated boost converter and 11-bit brightness control over I2C,
optionally combined with a PWM input.

Signed-off-by: Luka Panio <lukapanio@gmail.com>
---
 .../leds/backlight/awinic,aw99703.yaml        | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml
new file mode 100644
index 000000000000..62e8cc3118f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/awinic,aw99703.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW99703 WLED Backlight Driver
+
+maintainers:
+  - Luka Panio <lukapanio@gmail.com>
+
+description:
+  The AW99703 is a 3-string WLED driver with an integrated boost converter
+  and 11-bit I2C (optionally PWM) brightness control.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: awinic,aw99703
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to the HWEN pin.
+    maxItems: 1
+
+  awinic,led-strings:
+    description: Number of enabled LED strings, starting with CH1.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 3
+    default: 3
+
+  awinic,iled-max-microamp:
+    description:
+      Full-scale current of each LED string, reached at the maximum
+      brightness code (and 100% PWM duty cycle if PWM dimming is used).
+    minimum: 4800
+    maximum: 29600
+    multipleOf: 800
+    default: 20000
+
+  awinic,ramp-on-time-us:
+    description: Current sink ramp-up time when leaving standby.
+    enum: [512, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000,
+           256000, 512000, 1024000, 2048000, 4096000, 8192000, 16384000]
+    default: 8000
+
+  awinic,ramp-off-time-us:
+    description: Current sink ramp-down time when entering standby.
+    enum: [512, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000,
+           256000, 512000, 1024000, 2048000, 4096000, 8192000, 16384000]
+    default: 8000
+
+  awinic,pwm-trans-time-ms:
+    description:
+      Transition time between brightness levels set by the PWM input,
+      for a change over the full duty cycle range.
+    enum: [2, 4, 8, 16, 32, 64, 128, 256]
+    default: 2
+
+  awinic,i2c-trans-time-ms:
+    description:
+      Fixed transition time between brightness levels set over I2C,
+      independent of the size of the change. When absent the brightness
+      ramps with a fixed slope of 1 us per brightness code instead.
+    enum: [128, 192, 256, 320, 384, 448, 512, 576, 640, 768, 1024, 1280,
+           1536, 2560, 4096]
+
+  awinic,ovp-microvolt:
+    description: Boost over-voltage protection threshold.
+    enum: [17500000, 24000000, 31000000, 38000000, 41500000]
+    default: 38000000
+
+  awinic,ocp-microamp:
+    description: Boost over-current protection threshold.
+    enum: [900000, 1800000, 2700000, 3400000]
+    default: 2700000
+
+  awinic,sw-freq-hz:
+    description: Boost switching frequency.
+    enum: [500000, 1000000]
+    default: 1000000
+
+  awinic,inductor-nanohenry:
+    description: Boost inductor value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [4700, 10000]
+    default: 4700
+
+  awinic,pwm-input:
+    description: Combine the PWM input pin with the I2C brightness.
+    type: boolean
+
+  awinic,exponential-map:
+    description: Use the exponential brightness curve instead of linear.
+    type: boolean
+
+  default-brightness:
+    maximum: 2047
+
+  max-brightness:
+    maximum: 2047
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@36 {
+            compatible = "awinic,aw99703";
+            reg = <0x36>;
+            enable-gpios = <&gpio 7 GPIO_ACTIVE_HIGH>;
+            awinic,led-strings = <2>;
+            awinic,iled-max-microamp = <20000>;
+            awinic,ocp-microamp = <3400000>;
+            awinic,inductor-nanohenry = <10000>;
+        };
+    };
-- 
2.55.0

